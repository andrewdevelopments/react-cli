#!/bin/bash

path="src/Providers"

# Prompt the user for a page name
read -p "Enter provider name: " providerName

provider_lowercase=$(echo $providerName | tr '[:upper:]' '[:lower:]')

# Create the directory if it doesn't exist
mkdir -p "${path}/${providerName}"

# Create context file
echo "import { I${providerName}Provider } from \"./$provider_lowercase.provider.interface\";
import { createContext, useContext } from \"react\";

const ${providerName}Context = createContext<I${providerName}Provider>({} as I${providerName}Provider);

export const use${providerName}Context = () => useContext(${providerName}Context);

export default ${providerName}Context;
" > "${path}/${providerName}/$provider_lowercase.context.ts"

# Create provider file
echo "import { ReactNode } from \"react\";
import ${providerName}Context from \"./$provider_lowercase.context\";

const ${providerName}Provider = ({ children }: { children: ReactNode }) => {
    return <${providerName}Context.Provider value={{}}>{children}</${providerName}Context.Provider>;
};

export default ${providerName}Provider;
" > "${path}/${providerName}/$provider_lowercase.provider.tsx"

# Create interface file
  echo "/**
 * @description If you already have the Interface declared elsewhere, you can import it and use it here like so:
 * @see export interface I${providerName}Provider extends OtherInterface {}
 */
export interface I${providerName}Provider {}
" > "${path}/${providerName}/${provider_lowercase}.provider.interface.ts"

echo ""
echo -e " ✅ Provider ${providerName} generated successfully!"
echo "Click here to open in VSCode: ${PWD}/${path}/${providerName}/${provider_lowercase}.provider.ts"
echo ""