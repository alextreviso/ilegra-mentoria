#!/bin/bash

environment=$1

cd devops/

if [[ ${environment} == 'dev' || ${environment} == 'stg' || ${environment} == 'prd' ]]; then

	tfvarfile="variables-${environment}.tfvars"

else 

	echo "Environment not configured. Exiting..."
	exit 127

fi

terraform init -var-file="environment-vars/${tfvarfile}" 

terraform plan -var-file="environment-vars/${tfvarfile}"
