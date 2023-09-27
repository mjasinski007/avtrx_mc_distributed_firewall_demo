### Azure Initial Variables ###

variable "azure_subscription_id" {
    type = string
}

variable "azure_client_id" {
    type = string
}

variable "azure_client_secret" {
    type = string
}

variable "azure_tenant_id" {
    type = string
}

### AWS Inital Variables ###

variable "aws_profile" {
    type = string
}

variable "aws_uk_region" {
    type = string
}

### Aviatrix Inital Variables ###

variable "ctrl_username" {
    type = string
}

variable "ctrl_password" {
    type = string
}

variable "ctrl_ip" {
    type = string
}

# Aviatrix Controller Account
variable "aws_ctrl_account_name" {
    type = string
}

# Azure/Aviatrix Controller Account
variable "azure_ctrl_account_name" {
    type = string
}

###############################
### AWS/Aviatrix Transit150 ###
###############################

variable "avx_aws_cloud_type" {
    type = string
}

variable "avx_aws_transit150_region" {
    type = string
}

variable "avx_aws_transit150_cidr" {
    type = string
}

variable "avx_aws_transit150_vpc_name" {
    type = string
}

variable "avx_aws_transit150_gw_name" {
    type = string
}

variable "avx_aws_transit150_instance_size" {
    type = string
}

variable "avx_aws_transit150_local_as_number" {
    type = string
}

variable "avx_aws_firenet_egress_firewall_image" {
    type = string
}

variable "avx_aws_firenet_egress_instance_size" {
    type = string
}


#################################
### AWS/Aviatrix Spoke66 Prod ###
#################################

variable "avx_aws_spoke66_prod_region" {
    type = string
}

variable "avx_aws_spoke66_prod_vpc_name" {
    type = string
}

variable "avx_aws_spoke66_prod_cidr" {
    type = string
}

variable "avx_aws_spoke66_prod_gw_name" {
    type = string
}

variable "avx_aws_spoke66_prod_instance_size" {
    type = string
}

variable "avx_aws_spoke66_prod_gw_name_local_asn" {
    type = string
}

##################################
### AWS/Aviatrix Spoke67 (Dev) ###
##################################

variable "avx_aws_spoke67_dev_region" {
    type = string
}

variable "avx_aws_spoke67_dev_vpc_name" {
    type = string
}

variable "avx_aws_spoke67_dev_cidr" {
    type = string
}

variable "avx_aws_spoke67_dev_gw_name" {
    type = string
}

variable "avx_aws_spoke67_dev_instance_size" {
    type = string
}

variable "avx_aws_spoke67_dev_name_local_asn" {
    type = string
}


##################################
### AWS/Aviatrix Spoke68 (Dev) ###
##################################

variable "avx_aws_spoke68_dev_region" {
    type = string
}

variable "avx_aws_spoke68_dev_vpc_name" {
    type = string
}

variable "avx_aws_spoke68_dev_cidr" {
    type = string
}

variable "avx_aws_spoke68_dev_gw_name" {
    type = string
}

variable "avx_aws_spoke68_dev_instance_size" {
    type = string
}

variable "avx_aws_spoke68_dev_name_local_asn" {
    type = string
}



#####################################
### Azure/Aviatrix Spoke56 (Prod) ###
#####################################

variable "avx_az_cloud_type" {
    type = string
}

variable "avx_az_spoke56_prod_gw_name" {
    type = string
}

variable "avx_az_spoke56_prod_region" {
    type = string
}

variable "avx_az_spoke56_prod_vpc_cidr" {
    type = string
}

variable "avx_az_spoke56_prod_instance_size" {
    type = string
}


####################################
### Azure/Aviatrix Spoke56 (Dev) ###
####################################

variable "avx_az_spoke57_dev_gw_name" {
    type = string
}

variable "avx_az_spoke57_dev_region" {
    type = string
}

variable "avx_az_spoke57_dev_vpc_cidr" {
    type = string
}

variable "avx_az_spoke57_dev_instance_size" {
    type = string
}

#################################################
### AWS Private Ubuntu Host 1 in VPC66 (Prod) ###
#################################################

variable "aws_ec2_keypair" {
    type = string
}

variable "aws_ec2_ubuntu_password" {
    type = string
}

variable "aws_ubnt66_priv_prod01_instance_size" {
    type = string
}

variable "aws_ubnt66_priv_prod01_name" {
    type = string
}

variable "aws_ubnt66_priv_prod01_private_ip_address" {
    type = string
}


#################################################
### AWS Private Ubuntu Host 2 in VPC66 (Prod) ###
#################################################


variable "aws_ubnt66_priv_prod02_instance_size" {
    type = string
}

variable "aws_ubnt66_priv_prod02_name" {
    type = string
}

variable "aws_ubnt66_priv_prod02_private_ip_address" {
    type = string
}


################################################
### AWS Private Ubuntu Host 1 in VPC67 (Dev) ###
################################################

variable "aws_ubnt67_priv_dev01_instance_size" {
    type = string
}

variable "aws_ubnt67_priv_dev01_name" {
    type = string
}

variable "aws_ubnt67_priv_dev01_private_ip_address" {
    type = string
}


################################################
### AWS Private Ubuntu Host 2 in VPC67 (Dev) ###
################################################

variable "aws_ubnt67_priv_dev02_instance_size" {
    type = string
}

variable "aws_ubnt67_priv_dev02_name" {
    type = string
}

variable "aws_ubnt67_priv_dev02_private_ip_address" {
    type = string
}



################################################
### AWS Private Ubuntu Host 1 in VPC68 (Dev) ###
################################################

variable "aws_ubnt68_priv_dev01_instance_size" {
    type = string
}

variable "aws_ubnt68_priv_dev01_name" {
    type = string
}

variable "aws_ubnt68_priv_dev01_private_ip_address" {
    type = string
}






##########################################################
### AWS Public JumpServer Windows Host in VPC66 (Prod )###
##########################################################


variable "aws_win66_pub_jumpsrv_instance_name" {
    type = string
}

variable "aws_win66_pub_jumpsrv_instance_type" {
    type = string
}

variable "aws_win66_pub_jumpsrv_root_volume_size" {
    type = string
}

variable "aws_win66_pub_jumpsrv_root_volume_type" {
    type = string
}

variable "aws_win66_pub_jumpsrv_public_ip_address" {
    type = string
}

variable "aws_win66_pub_jumpsrv_private_ip_address" {
    type = string
}



####################################################
### AWS Private Host Windows Host in VPC67 (Dev) ###
####################################################


variable "aws_win67_priv_dev01_instance_name" {
    type = string
}

variable "aws_win67_priv_dev01_instance_type" {
    type = string
}

variable "aws_win67_priv_dev01_root_volume_size" {
    type = string
}

variable "aws_win67_priv_dev01_root_volume_type" {
    type = string
}

variable "aws_win67_priv_dev01_public_ip_address" {
    type = string
}

variable "aws_win67_priv_dev01_private_ip_address" {
    type = string
}


#################################################
### Azure Private Ubuntu Host in VPC56 (Prod) ###
#################################################

variable "az_ubnt56_priv_prod01_name" {
    type = string
}

variable "az_ubnt56_priv_prod01_static_priv_ip" {
    type = string
}

variable "az_ubnt56_priv_prod01_instance_size" {
    type = string
}

variable "az_ubnt56_priv_prod01_user" {
    type = string
}

variable "az_ubnt56_priv_prod01_password" {
    type = string
}


#################################################
### Azure Private Ubuntu Host in VPC57 (Dev) ###
#################################################


variable "az_ubnt57_priv_dev01_name" {
    type = string
}

variable "az_ubnt57_priv_dev01_static_priv_ip" {
    type = string
}

variable "az_ubnt57_priv_dev01_instance_size" {
    type = string
}

variable "az_ubnt57_priv_dev01_user" {
    type = string
}

variable "az_ubnt57_priv_dev01_password" {
    type = string
}

#################################################
### Azure Public Windows Host in VPC56 (Prod) ###
#################################################


variable "az_win56_priv_prod01_name" {
    type = string
}

variable "az_win56_priv_prod01_instance_size" {
    type = string
}

variable "az_win56_priv_prod01_static_priv_ip" {
    type = string
}


variable "az_win56_priv_prod01_username" {
    type = string
}

variable "az_win56_priv_prod01_password" {
    type = string
}

variable "az_win56_priv_prod01_sku" {
    type = string
}



### Tags Variables ###

variable "createdby" {
    type = string
}

variable "environment" {
    type = string
}

variable "application" {
    type = string
}

variable "owner" {
    type = string
}

variable "repository" {
    type = string
}





