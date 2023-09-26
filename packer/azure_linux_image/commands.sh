# Create service principal
az ad sp create-for-rbac --skip-assignment --name sppackertest

# Assign Contributor Role
az role assignment create --assignee "d2390854-6661-451d-bee2-3bd9b42b14cc_taken_from above_principal" --role "Contributor" --subscription "4ae381f8-ee9d-45a9-ae61-b633801915fd"

# Create Resource Group for Packer
az group create --name packer-build-rg --location "West US"

# List Ubuntu Servers
az vm image list-skus --location "West US" --offer UbuntuServer --publisher Canonical -o table

# Create Storage Account 
az storage account create -g packer-build-rg -n virtualmachinespkr --access-tier hot --sku Standard_LRS --location "West US"


# Init
packer init ubuntu.pkr.hcl


# Build image
packer build .


# Build with debug
packer build -debug .

# Check logs
tail -f /tmp/packer-build.txt




## https://freshbrewed.science/2021/09/08/packer-linux.html

