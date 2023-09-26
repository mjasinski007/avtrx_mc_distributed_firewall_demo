packer {
  required_plugins {
    azure = {
      source  = "github.com/hashicorp/azure"
      version = "~> 1"
    }
  }
}

source "azure-arm" "azure_arm_pkr" {
  client_id              = "${var.client_id}"
  client_secret          = "${var.client_secret}"
  tenant_id              = "${var.tenant_id}"
  subscription_id        = "${var.subscription_id}"

  location               = "West US"
  vm_size                = "Standard_DS2_v2"

  os_type                = "Linux"
  image_publisher        = "Canonical"
  image_offer            = "UbuntuServer"
  image_sku              = "18.04-LTS"

  ### VHD Style ###
  #resource_group_name    = "packer-build-rg"
  #storage_account        = "virtualmachinespkr"
  #capture_container_name = "images"
  #capture_name_prefix    = "packer"

  ### Manged Image Style ###
  managed_image_resource_group_name = "packer-build-rg"
  managed_image_name                = "Azure-Ubuntu-GoldenImage"




  azure_tags = {
    Name = "az-Ubuntu-Golden-Image"
  }
}

build {
  sources = ["sources.azure-arm.azure_arm_pkr"]

  provisioner "shell" {

    execute_command = "chmod +x {{ .Path }}; {{ .Vars }} sudo {{ .Path }}"
    script          = "./scripts/initial_ubuntu_config.sh"
  }
}















  /* provisioner "shell-local" {
    execute_command = ["chmod +x {{ .Path }}; {{ .Vars }} sudo -E sh '{{ .Path }}'"]
    inline           = [
      "apt-get update",
      "apt-get upgrade -y",
      "apt-get -y install ca-certificates curl apt-transport-https lsb-release gnupg",
      "curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null",
      "AZ_REPO=$(lsb_release -cs) && echo \"deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main\" | tee /etc/apt/sources.list.d/azure-cli.list",
      "apt-get -y install azure-cli",
      "apt-get update",
      "/usr/sbin/waagent -force -deprovision+user && export HISTSIZE=0 && sync"
    ]
  }
} */