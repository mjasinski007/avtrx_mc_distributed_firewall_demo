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



/* resource "aviatrix_distributed_firewalling_intra_vpc" "test" {
  vpcs {
    account_name = "azure-account"
    vpc_id       = "azure-vpc-0:rg-av-azure-vpc-0-808200:8168668b-a646-45b9-b88b-d756e60cf130"
    region       = "Central US"
  }

  vpcs {
    account_name = "azure-account"
    vpc_id       = "azure-vpc-1:rg-av-azure-vpc-1-562104:622a2277-5c57-4149-bcb9-c00d9284ee18"
    region       = "Central US"
  }
} */



####################################################################
#### Create an Aviatrix Distributed Firewalling Proxy CA config ####
####################################################################

# Link -> https://registry.terraform.io/providers/AviatrixSystems/aviatrix/latest/docs/resources/aviatrix_distributed_firewalling_policy_list

/* resource "aviatrix_distributed_firewalling_proxy_ca_config" "test" {
  ca_cert = file("ca_cert_file")
  ca_key  = file("ca_key_file")
} */

