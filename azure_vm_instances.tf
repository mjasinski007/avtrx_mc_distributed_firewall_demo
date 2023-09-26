#################################################
### Azure Private Ubuntu Host in VPC56 (Prod) ###
#################################################

resource "azurerm_public_ip" "az_ubnt56_priv_prod01_public_ip" {
    name                = "az-ubnt56-priv-prod01-pip"
    resource_group_name = module.azure_spoke56_prod.vpc.resource_group
    location            = module.azure_spoke56_prod.vpc.region
    allocation_method   = "Static"
    #zones               = ["3"]
    sku                 = "Standard"
}


resource "azurerm_network_interface" "az_ubnt56_priv_prod01_main_nic" {
    name                          = "${var.az_ubnt56_priv_prod01_name}-nic1"
    resource_group_name           = module.azure_spoke56_prod.vpc.resource_group
    location                      = module.azure_spoke56_prod.vpc.region
    enable_accelerated_networking = true
    ip_configuration {
        name                          = module.azure_spoke56_prod.vpc.private_subnets[0].name
        subnet_id                     = module.azure_spoke56_prod.vpc.private_subnets[0].subnet_id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.az_ubnt56_priv_prod01_public_ip.id
        private_ip_address            = var.az_ubnt56_priv_prod01_static_priv_ip
    }
}

resource "azurerm_network_security_group" "az_ubnt56_priv_prod01_nsg" {
    name                = "${var.az_ubnt56_priv_prod01_name}-nsg"
    resource_group_name = module.azure_spoke56_prod.vpc.resource_group
    location            = module.azure_spoke56_prod.vpc.region
}

### PERMIT ALL ###
resource "azurerm_network_security_rule" "az_ubnt56_priv_prod01_tcp_all_rule" {
    access                      = "Allow"
    direction                   = "Inbound"
    name                        = "TCP_ALL"
    priority                    = 100
    protocol                    = "Tcp"
    source_port_range           = "*"
    source_address_prefix       = "*"
    destination_port_range      = "*"
    destination_address_prefix  = "*"
    resource_group_name         = module.azure_spoke56_prod.vpc.resource_group
    network_security_group_name = azurerm_network_security_group.az_ubnt56_priv_prod01_nsg.name
}

resource "azurerm_network_security_rule" "az_ubnt56_priv_prod01_udp_all_rule" {
    access                      = "Allow"
    direction                   = "Inbound"
    name                        = "UDP_ALL"
    priority                    = 110
    protocol                    = "Udp"
    source_port_range           = "*"
    source_address_prefix       = "*"
    destination_port_range      = "*"
    destination_address_prefix  = "*"
    resource_group_name         = module.azure_spoke56_prod.vpc.resource_group
    network_security_group_name = azurerm_network_security_group.az_ubnt56_priv_prod01_nsg.name
}

resource "azurerm_network_security_rule" "az_ubnt56_priv_prod01_icmp_all_rule" {
    access                      = "Allow"
    direction                   = "Inbound"
    name                        = "ICMP_ALL"
    priority                    = 120
    protocol                    = "Icmp"
    source_port_range           = "*"
    source_address_prefix       = "*"
    destination_port_range      = "*"
    destination_address_prefix  = "*"
    resource_group_name         = module.azure_spoke56_prod.vpc.resource_group
    network_security_group_name = azurerm_network_security_group.az_ubnt56_priv_prod01_nsg.name
}


resource "azurerm_network_interface_security_group_association" "az_ubnt56_priv_prod01_nic_assoc" {
    network_interface_id      = azurerm_network_interface.az_ubnt56_priv_prod01_main_nic.id
    network_security_group_id = azurerm_network_security_group.az_ubnt56_priv_prod01_nsg.id

    depends_on = [azurerm_network_interface.az_ubnt56_priv_prod01_main_nic]
}


resource "azurerm_linux_virtual_machine" "az_ubnt56_priv_prod01_vm" {
    name                            = var.az_ubnt56_priv_prod01_name
    resource_group_name             = module.azure_spoke56_prod.vpc.resource_group
    location                        = module.azure_spoke56_prod.vpc.region
    size                            = var.az_ubnt56_priv_prod01_instance_size
    admin_username                  = var.az_ubnt56_priv_prod01_user
    admin_password                  = var.az_ubnt56_priv_prod01_password
    disable_password_authentication = false
    #zone                            = 3
    network_interface_ids = [
        azurerm_network_interface.az_ubnt56_priv_prod01_main_nic.id,
    ]

   # source_image_id = "/subscriptions/4ae381f8-ee9d-45a9-ae61-b633801915fd/resourceGroups/packer-build-rg/providers/Microsoft.Compute/images/Azure-Ubuntu-GoldenImage"


    source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
    }

    os_disk {
        storage_account_type = "Standard_LRS"
        caching              = "ReadWrite"
    }

    custom_data = base64encode(data.template_file.az_ubnt56_priv_prod01_bootstrap.rendered)

    depends_on = [azurerm_network_interface.az_ubnt56_priv_prod01_main_nic]
}



################################################
### Azure Private Ubuntu Host in VPC57 (Dev) ###
################################################


resource "azurerm_public_ip" "az_ubnt57_priv_dev01_public_ip" {
    name                = "az-ubnt57-priv-dev01-pip"
    resource_group_name = module.azure_spoke57_dev.vpc.resource_group
    location            = module.azure_spoke57_dev.vpc.region
    allocation_method   = "Static"
    #zones               = ["3"]
    sku                 = "Standard"
}


resource "azurerm_network_interface" "az_ubnt57_priv_dev01_main_nic" {
    name                          = "${var.az_ubnt57_priv_dev01_name}-nic1"
    resource_group_name           = module.azure_spoke57_dev.vpc.resource_group
    location                      = module.azure_spoke57_dev.vpc.region
    enable_accelerated_networking = true
    ip_configuration {
        name                          = module.azure_spoke57_dev.vpc.private_subnets[0].name
        subnet_id                     = module.azure_spoke57_dev.vpc.private_subnets[0].subnet_id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.az_ubnt57_priv_dev01_public_ip.id
        private_ip_address            = var.az_ubnt57_priv_dev01_static_priv_ip
    }
}

resource "azurerm_network_security_group" "az_ubnt57_priv_dev01_nsg" {
    name                = "${var.az_ubnt57_priv_dev01_name}-nsg"
    resource_group_name = module.azure_spoke57_dev.vpc.resource_group
    location            = module.azure_spoke57_dev.vpc.region
}

### PERMIT ALL ###
resource "azurerm_network_security_rule" "az_ubnt57_priv_dev01_tcp_all_rule" {
    access                      = "Allow"
    direction                   = "Inbound"
    name                        = "TCP_ALL"
    priority                    = 100
    protocol                    = "Tcp"
    source_port_range           = "*"
    source_address_prefix       = "*"
    destination_port_range      = "*"
    destination_address_prefix  = "*"
    resource_group_name         = module.azure_spoke57_dev.vpc.resource_group
    network_security_group_name = azurerm_network_security_group.az_ubnt57_priv_dev01_nsg.name
}

resource "azurerm_network_security_rule" "az_ubnt57_priv_dev01_udp_all_rule" {
    access                      = "Allow"
    direction                   = "Inbound"
    name                        = "UDP_ALL"
    priority                    = 110
    protocol                    = "Udp"
    source_port_range           = "*"
    source_address_prefix       = "*"
    destination_port_range      = "*"
    destination_address_prefix  = "*"
    resource_group_name         = module.azure_spoke57_dev.vpc.resource_group
    network_security_group_name = azurerm_network_security_group.az_ubnt57_priv_dev01_nsg.name
}

resource "azurerm_network_security_rule" "az_ubnt57_priv_dev01_icmp_all_rule" {
    access                      = "Allow"
    direction                   = "Inbound"
    name                        = "ICMP_ALL"
    priority                    = 120
    protocol                    = "Icmp"
    source_port_range           = "*"
    source_address_prefix       = "*"
    destination_port_range      = "*"
    destination_address_prefix  = "*"
    resource_group_name         = module.azure_spoke57_dev.vpc.resource_group
    network_security_group_name = azurerm_network_security_group.az_ubnt57_priv_dev01_nsg.name
}


resource "azurerm_network_interface_security_group_association" "az_ubnt57_priv_dev01_nic_assoc" {
    network_interface_id      = azurerm_network_interface.az_ubnt57_priv_dev01_main_nic.id
    network_security_group_id = azurerm_network_security_group.az_ubnt57_priv_dev01_nsg.id

    depends_on = [azurerm_network_interface.az_ubnt57_priv_dev01_main_nic]
}


resource "azurerm_linux_virtual_machine" "az_ubnt57_priv_dev01_vm" {
    name                            = var.az_ubnt57_priv_dev01_name
    resource_group_name             = module.azure_spoke57_dev.vpc.resource_group
    location                        = module.azure_spoke57_dev.vpc.region
    size                            = var.az_ubnt57_priv_dev01_instance_size
    admin_username                  = var.az_ubnt57_priv_dev01_user
    admin_password                  = var.az_ubnt57_priv_dev01_password
    disable_password_authentication = false
    #zone                            = 3
    network_interface_ids = [
        azurerm_network_interface.az_ubnt57_priv_dev01_main_nic.id,
    ]

        source_image_id = "/subscriptions/4ae381f8-ee9d-45a9-ae61-b633801915fd/resourceGroups/packer-build-rg/providers/Microsoft.Compute/images/Azure-Ubuntu-GoldenImage"

    os_disk {
        storage_account_type = "Standard_LRS"
        caching              = "ReadWrite"
    }

    custom_data = base64encode(data.template_file.az_ubnt57_priv_dev01_bootstrap.rendered)

    depends_on = [azurerm_network_interface.az_ubnt57_priv_dev01_main_nic]
}


#################################################
### Azure Public Windows Host in VPC56 (Prod) ###
#################################################

resource "azurerm_public_ip" "az_win56_priv_prod01_public_ip" {
    name                = "az-win56-priv-prod01-pip"
    resource_group_name = module.azure_spoke56_prod.vpc.resource_group
    location            = module.azure_spoke56_prod.vpc.region
    allocation_method   = "Static"
    #zones               = ["1"]
    sku                 = "Standard"
}

resource "azurerm_network_interface" "az_win56_priv_prod01_main_nic" {
    name                          = "${var.az_win56_priv_prod01_name}-nic1"
    resource_group_name           = module.azure_spoke56_prod.vpc.resource_group
    location                      = module.azure_spoke56_prod.vpc.region
    enable_accelerated_networking = true
    ip_configuration {
        name                          = module.azure_spoke56_prod.vpc.public_subnets[0].name
        subnet_id                     = module.azure_spoke56_prod.vpc.public_subnets[0].subnet_id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.az_win56_priv_prod01_public_ip.id
        private_ip_address            = var.az_win56_priv_prod01_static_priv_ip
    }
}

resource "azurerm_network_security_group" "az_win56_priv_prod01_nsg" {
    name                = "${var.az_win56_priv_prod01_name}-nsg"
    resource_group_name = module.azure_spoke56_prod.vpc.resource_group
    location            = module.azure_spoke56_prod.vpc.region
}


#### PERMIT ALL ####

resource "azurerm_network_security_rule" "az_win56_priv_prod01_tcp_all_rule" {
    access                      = "Allow"
    direction                   = "Inbound"
    name                        = "TCP_ALL"
    priority                    = 100
    protocol                    = "Tcp"
    source_port_range           = "*"
    source_address_prefix       = "*"
    destination_port_range      = "*"
    destination_address_prefix  = "*"
    resource_group_name         = module.azure_spoke56_prod.vpc.resource_group
    network_security_group_name = azurerm_network_security_group.az_win56_priv_prod01_nsg.name
}

resource "azurerm_network_security_rule" "az_win56_priv_prod01_udp_all_rule" {
    access                      = "Allow"
    direction                   = "Inbound"
    name                        = "UDP_ALL"
    priority                    = 110
    protocol                    = "Udp"
    source_port_range           = "*"
    source_address_prefix       = "*"
    destination_port_range      = "*"
    destination_address_prefix  = "*"
    resource_group_name         = module.azure_spoke56_prod.vpc.resource_group
    network_security_group_name = azurerm_network_security_group.az_win56_priv_prod01_nsg.name
}

resource "azurerm_network_security_rule" "az_win56_priv_prod01_icmp_all_rule" {
    access                      = "Allow"
    direction                   = "Inbound"
    name                        = "ICMP_ALL"
    priority                    = 120
    protocol                    = "Icmp"
    source_port_range           = "*"
    source_address_prefix       = "*"
    destination_port_range      = "*"
    destination_address_prefix  = "*"
    resource_group_name         = module.azure_spoke56_prod.vpc.resource_group
    network_security_group_name = azurerm_network_security_group.az_win56_priv_prod01_nsg.name
}

resource "azurerm_network_interface_security_group_association" "az_win56_priv_prod01_nic_assoc" {
    network_interface_id      = azurerm_network_interface.az_win56_priv_prod01_main_nic.id
    network_security_group_id = azurerm_network_security_group.az_win56_priv_prod01_nsg.id

    depends_on = [azurerm_network_interface.az_win56_priv_prod01_main_nic]
}

resource "azurerm_windows_virtual_machine" "az_win56_priv_prod01_vm" {
    name                            = var.az_win56_priv_prod01_name
    resource_group_name             = module.azure_spoke56_prod.vpc.resource_group
    location                        = module.azure_spoke56_prod.vpc.region
    size                            = var.az_win56_priv_prod01_instance_size
    admin_username                  = var.az_win56_priv_prod01_username
    admin_password                  = var.az_win56_priv_prod01_password
    #zone                            = 1
    network_interface_ids = [
        azurerm_network_interface.az_win56_priv_prod01_main_nic.id,
    ]

    source_image_reference {
        publisher = "MicrosoftWindowsServer"
        offer     = "WindowsServer"
        sku       = var.az_win56_priv_prod01_sku
        version   = "latest"
    }

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    depends_on = [azurerm_network_interface.az_win56_priv_prod01_main_nic]
}

/* resource "azurerm_virtual_machine_extension" "az_win56_priv_prod01_vm_bootstrap" {

    name                 = "az_win56_priv_prod01_install_software"
    virtual_machine_id   = azurerm_windows_virtual_machine.az_win56_priv_prod01_vm.id
    publisher            = "Microsoft.Compute"
    type                 = "CustomScriptExtension"
    type_handler_version = "1.9"
    protected_settings   = <<SETTINGS
    {
        "commandToExecute": "powershell -encodedCommand ${textencodebase64(file("./scripts/azure_winsrv_bootstrap.ps1"), "UTF-16LE")}"
    }
    SETTINGS

    depends_on           = [azurerm_windows_virtual_machine.az_win56_priv_prod01_vm]
} */