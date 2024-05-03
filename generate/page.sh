#!/bin/bash

auto_complete_path() {
  local cur prev
  cur=${COMP_WORDS[COMP_CWORD]}
  prev=${COMP_WORDS[COMP_CWORD-1]}
  COMPREPLY=( $(compgen -d -- $cur) )
}

# Enable auto-completion for the read command
complete -F auto_complete_path read

path="src/Views"

# Prompt the user for a page name
read -p "Enter page name: " name

# Create custom path
read -ep "Change current path src/Views ? (add your path / n): " changePath

if [ $changePath != "n" ]
then
  path=$changePath
fi

# Create the directory if it doesn't exist
mkdir -p "${path}/${name}"

echo "/**
 * @name ${name}View
 * @description ${name} page view
 */

import \"./${name}.scss\";

const ${name}View = () => {
    return <div>{/* Your page view content here */}</div>;
};

export default ${name}View;" > "${path}/${name}/${name}.view.tsx"

echo "
/**
 * @description This where you write your page logic
*/
" > "${path}/${name}/${name}.logic.ts"

# Create the scss file
echo "" > "${path}/${name}/${name}.scss"

# Create interface file
read -p $'\e[0;35m Create Interface file? (y/n): \e[0m' createInterfaceFile

if [ $createInterfaceFile = "y" ]
then
  echo "/**
 * @description Interface for the ${name} view
 */
export interface I${name} {}" > "${path}/${name}/${name}.interface.ts"
fi

# Create the Subpages folder
read -p $'\e[0;35m Create Subpages folder? (y/n): \e[0m' createSubpagesFolder

if [ $createSubpagesFolder = "y" ]
then
  mkdir -p "${path}/${name}/Subpages"
fi

# Create the assets folder
read -p $'\e[0;35m Create Assets folder? (y/n): \e[0m' createAssetsFolder

if [ $createAssetsFolder = "y" ]
then
  mkdir -p "${path}/${name}/Assets"
fi

# Create the components folder
read -p $'\e[0;35m Create Components folder? (y/n): \e[0m' createComponentsFolder

if [ $createComponentsFolder = "y" ]
then
  mkdir -p "${path}/${name}/Components"
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
echo -e " ✅ Page ${name} generated successfully!"
echo "Click here to open in VSCode: ${PWD}/${path}/${name}/${name}.view.tsx"
echo ""
