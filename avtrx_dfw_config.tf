#########################################
#### Enable Distributed Firewalling  ####
#########################################

resource "aviatrix_distributed_firewalling_config" "dfw_config" {
  enable_distributed_firewalling = true
}

###################################################################################
#### Create an Aviatrix Distributed Firewalling Origin Cert Enforcement config ####
###################################################################################

# Link -> https://registry.terraform.io/providers/AviatrixSystems/aviatrix/latest/docs/resources/aviatrix_distributed_firewalling_origin_cert_enforcement_config

/* 
resource "aviatrix_distributed_firewalling_origin_cert_enforcement_config" "test" {
  enforcement_level = "Permissive"  # "Strict", "Permissive" and "Ignore".
} */




##############################################################
#### Create an Aviatrix Distributed-firewalling Intra VPC ####
##############################################################

# Link ->  https://registry.terraform.io/providers/AviatrixSystems/aviatrix/latest/docs/resources/aviatrix_distributed_firewalling_intra_vpc



resource "aviatrix_distributed_firewalling_intra_vpc" "enable_intra" {
  vpcs {
    account_name = var.aws_ctrl_account_name
    vpc_id       = module.spoke66_prod.vpc.vpc_id
    region       = var.avx_aws_spoke66_prod_region
  }

  vpcs {
    account_name = var.aws_ctrl_account_name
    vpc_id       = module.spoke67_dev.vpc.vpc_id
    region       = var.avx_aws_spoke67_dev_region
  }

  vpcs {
    account_name = var.aws_ctrl_account_name
    vpc_id       = module.spoke68_dev.vpc.vpc_id
    region       = var.avx_aws_spoke68_dev_region
  }

    vpcs {
    account_name = var.azure_ctrl_account_name
    vpc_id       = module.azure_spoke56_prod.vpc.vpc_id
    region       = module.azure_spoke56_prod.vpc.region
  }
}



####################################################################
#### Create an Aviatrix Distributed Firewalling Proxy CA config ####
####################################################################

# Link -> https://registry.terraform.io/providers/AviatrixSystems/aviatrix/latest/docs/resources/aviatrix_distributed_firewalling_policy_list

/* resource "aviatrix_distributed_firewalling_proxy_ca_config" "test" {
  ca_cert = file("ca_cert_file")
  ca_key  = file("ca_key_file")
} */

