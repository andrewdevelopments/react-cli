#!/bin/bash

path="src/Services"

# Prompt the user for a page name
read -p "Enter service name: " serviceName

service_lowercase=$(echo $serviceName | tr '[:upper:]' '[:lower:]')

# Create the directory if it doesn't exist
mkdir -p "${path}/${serviceName}"

echo "export interface I${serviceName}Service {}" > "${path}/${serviceName}/$service_lowercase.interface.ts"

echo "import { I${serviceName}Service } from \"./$service_lowercase.interface\";

export class ${serviceName}Service implements I${serviceName}Service {}" > "${path}/${serviceName}/$service_lowercase.service.ts"

# Create DTO
read -p $'\e[0;35m Create DTO ? (y/n): \e[0m' createDTO

if [ $createDTO = "y" ]
then
  echo "" > "${path}/${serviceName}/$service_lowercase.dto.ts"
fi

echo ""
echo -e " ✅ Service ${serviceName} generated successfully!"
echo "Click here to open in VSCode: ${PWD}/${path}/${serviceName}/${serviceName}.service.ts"
echo ""