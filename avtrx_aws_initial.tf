##############################
### Aviarix/AWS Transit150 ###
##############################

module "aws150_transit" {
    source                  = "terraform-aviatrix-modules/mc-transit/aviatrix"
    version                 = "2.5.1"
    cloud                   = var.avx_aws_cloud_type
    account                 = var.aws_ctrl_account_name
    region                  = var.avx_aws_transit150_region
    cidr                    = var.avx_aws_transit150_cidr
    name                    = var.avx_aws_transit150_vpc_name
    gw_name                 = var.avx_aws_transit150_gw_name
    instance_size           = var.avx_aws_transit150_instance_size # t3.medium
    local_as_number         = var.avx_aws_transit150_local_as_number
    enable_firenet          = false
    enable_transit_firenet  = true
    enable_segmentation     = true
    enable_preserve_as_path = false
    ha_gw                   = false

    tags = merge(
        local.default_tags,
        {
            Description = "Aviatrix Transit150 in AWS"
        }
    )
}

module "aws_firenet_egress" {
    source  = "terraform-aviatrix-modules/mc-firenet/aviatrix"
    version = "v1.5.2"

    transit_module     = module.aws150_transit
    firewall_image     = var.avx_aws_firenet_egress_firewall_image
    instance_size      = var.avx_aws_firenet_egress_instance_size
    egress_enabled     = true
    associated         = true
    attached           = true
    inspection_enabled = true
}


#################################
### AWS/Aviatrix Spoke66 Prod ###
#################################

module "spoke66_prod" {
    source          = "terraform-aviatrix-modules/mc-spoke/aviatrix"
    version         = "1.6.4"
    cloud           = var.avx_aws_cloud_type
    account         = var.aws_ctrl_account_name
    name            = var.avx_aws_spoke66_prod_vpc_name
    cidr            = var.avx_aws_spoke66_prod_cidr
    region          = var.avx_aws_spoke66_prod_region
    gw_name         = var.avx_aws_spoke66_prod_gw_name
    instance_size   = var.avx_aws_spoke66_prod_instance_size
    #local_as_number = var.vavx_aws_spoke66_prod_gw_name_local_asn
    transit_gw      = var.avx_aws_transit150_gw_name
    #network_domain  = ""
    attached        = true
    ha_gw           = false

    tags = merge(
        local.default_tags,
        {
            Description = "Aviatrix Spoke66 (Prod) in AWS"
        }
    )
}

#################################
### AWS/Aviatrix Spoke67 Prod ###
#################################


module "spoke67_dev" {
    source          = "terraform-aviatrix-modules/mc-spoke/aviatrix"
    version         = "1.6.4"
    cloud           = var.avx_aws_cloud_type
    account         = var.aws_ctrl_account_name
    name            = var.avx_aws_spoke67_dev_vpc_name
    cidr            = var.avx_aws_spoke67_dev_cidr
    region          = var.avx_aws_spoke67_dev_region
    gw_name         = var.avx_aws_spoke67_dev_gw_name
    instance_size   = var.avx_aws_spoke67_dev_instance_size
    #local_as_number = var.avx_aws_spoke67_dev_gw_name_local_asn
    transit_gw      = var.avx_aws_transit150_gw_name
    #network_domain  = ""
    attached        = true
    ha_gw           = false

    tags = merge(
        local.default_tags,
        {
            Description = "Aviatrix Spoke67 (Dev) in AWS"
        }
    )
}