#!/bin/bash

path="src/Components"

# Prompt the user for a component name
read -p "Enter component name: " name

# Create the directory if it doesn't exist
mkdir -p "${path}/${name}"

echo "/**
 * @name ${name}
 * @description ${name} component view
 */

import \"./${name}.scss\";

const ${name} = () => {
    return <div>{/* Your component view content here */}</div>;
};

export default ${name};" > "${path}/${name}/${name}.view.tsx"

echo "
/**
 * @description This where you write your component logic
*/
" > "${path}/${name}/${name}.logic.ts"

# Create the scss file
echo "" > "${path}/${name}/${name}.scss"

# Create interface file
read -p $'\e[0;35m Create Interface file? (y/n): \e[0m' createInterfaceFile

if [ $createInterfaceFile = "y" ]
then
  echo "/**
 * @description Interface for the ${name} component
 */
export interface I${name} {}" > "${path}/${name}/${name}.interface.ts"
fi

# Create the assets folder
read -p $'\e[0;35m Create Assets folder? (y/n): \e[0m' createAssetsFolder

if [ $createAssetsFolder = "y" ]
then
  mkdir -p "${path}/${name}/Assets"
fi

# Create the child components folder
read -p $'\e[0;35m Create ChildComponents folder? (y/n): \e[0m' createChildComponentsFolder

if [ $createChildComponentsFolder = "y" ]
then
  mkdir -p "${path}/${name}/ChildComponents"
fi

# Create mock data file
read -p $'\e[0;35m Create mock data file? (y/n): \e[0m' createMockDataFile

if [ $createMockDataFile = "y" ]
then

  if [ $createInterfaceFile = "y" ]
  then
    echo "import { I${name} } from \"./${name}.interface\";

/**
 * @description Mock data for ${name}
 */
export const ${name}MockData: I${name} = [];" > "${path}/${name}/${name}.mock.data.ts"
  else
    echo "/**
 * @description Mock data for ${name}
 */
export const ${name}MockData = [];" > "${path}/${name}/${name}.mock.data.ts"
  fi

fi

echo ""
echo -e " ✅ Component ${name} generated successfully!"
echo "Click here to open in VSCode: ${PWD}/${path}/${name}/${name}.view.tsx"
echo ""