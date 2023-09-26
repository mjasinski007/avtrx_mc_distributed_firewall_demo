module "azure_spoke56_prod" {
    source  = "terraform-aviatrix-modules/mc-spoke/aviatrix"
    version = "1.6.4"

    account            = var.azure_ctrl_account_name
    cloud              = var.avx_az_cloud_type
    name               = var.avx_az_spoke56_prod_gw_name
    region             = var.avx_az_spoke56_prod_region
    cidr               = var.avx_az_spoke56_prod_vpc_cidr
    instance_size      = var.avx_az_spoke56_prod_instance_size
    ha_gw              = false
    az_support         = false
    subnet_pairs       = 4
    subnet_size        = 28
    transit_gw         = var.avx_aws_transit150_gw_name
    #network_domain  = ""
    attached           = true
    attached_gw_egress = false
    #security_domain   = "green"

    tags = merge(
        local.default_tags,
        {
          Description = "Aviatrix Spoke56 Prod in Azure West US"
        }
    )
    depends_on = [module.aws150_transit]
}

module "azure_spoke57_dev" {
    source  = "terraform-aviatrix-modules/mc-spoke/aviatrix"
    version = "1.6.4"

    account            = var.azure_ctrl_account_name
    cloud              = var.avx_az_cloud_type
    name               = var.avx_az_spoke57_dev_gw_name
    region             = var.avx_az_spoke57_dev_region
    cidr               = var.avx_az_spoke57_dev_vpc_cidr
    instance_size      = var.avx_az_spoke57_dev_instance_size
    ha_gw              = false
    az_support         = false
    subnet_pairs       = 4
    subnet_size        = 28
    transit_gw         = var.avx_aws_transit150_gw_name
    #network_domain  = ""
    attached           = true
    attached_gw_egress = false
    #security_domain   = "green"

    tags = merge(
        local.default_tags,
        {
          Description = "Aviatrix Spoke57 Dev in Azure East US"
        }
    )
    depends_on = [module.aws150_transit]
}