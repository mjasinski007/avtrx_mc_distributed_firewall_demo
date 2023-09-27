### Azure Variable Values ###

azure_subscription_id = "4ae381f8-ee9d-45a9-ae61-b633801915fd"
azure_client_id       = "b76ef98d-276e-4627-9c22-7136073d4d51"
azure_client_secret   = "A6f7Q~XRy4q4GBnOYaDZiBQDJtg5KmlLyZyun"
azure_tenant_id       = "4780055e-ce37-4f02-b33d-fdad8493a4b6"


### AWS Variable Values ###

aws_profile           = "169444603265"
aws_uk_region         = "eu-west-2"


### Aviatrix Variable Values ###

ctrl_username             = "admin"
ctrl_password             = "Its@secret!23"
ctrl_ip                   = "3.10.92.20"
aws_ctrl_account_name     = "avtx_aws_account"
azure_ctrl_account_name   = "avtx_azure_account"

##############################
### Aviarix/AWS Transit150 ###
##############################

avx_aws_cloud_type                 = "aws"
avx_aws_transit150_region          = "eu-west-2"
avx_aws_transit150_vpc_name        = "avx-aws-transit150-vpc"
avx_aws_transit150_gw_name         = "avx-aws-transit150-gw"
avx_aws_transit150_cidr            = "10.150.0.0/16"
avx_aws_transit150_instance_size   = "c5.4xlarge"
avx_aws_transit150_local_as_number = "65150"

avx_aws_firenet_egress_firewall_image = "aviatrix"
avx_aws_firenet_egress_instance_size  = "c5.xlarge"



#################################
### AWS/Aviatrix Spoke66 Prod ###
#################################

avx_aws_spoke66_prod_region            = "eu-west-2"
avx_aws_spoke66_prod_vpc_name          = "avx-aws-spoke66-prod-vpc"
avx_aws_spoke66_prod_cidr              = "10.66.0.0/16"
avx_aws_spoke66_prod_gw_name           = "avx-aws-spoke66-prod-gw"
avx_aws_spoke66_prod_instance_size     = "t3.medium"
avx_aws_spoke66_prod_gw_name_local_asn = "65066"

#################################
### AWS/Aviatrix Spoke67 Prod ###
#################################

avx_aws_spoke67_dev_region            = "eu-west-2"
avx_aws_spoke67_dev_vpc_name          = "avx-aws-spoke67-dev-vpc"
avx_aws_spoke67_dev_cidr              = "10.67.0.0/16"
avx_aws_spoke67_dev_gw_name           = "avx-aws-spoke67-dev-gw"
avx_aws_spoke67_dev_instance_size     = "t3.medium"
avx_aws_spoke67_dev_name_local_asn    = "65067"


#################################
### AWS/Aviatrix Spoke68 Prod ###
#################################

avx_aws_spoke68_dev_region            = "eu-west-2"
avx_aws_spoke68_dev_vpc_name          = "avx-aws-spoke68-dev-vpc"
avx_aws_spoke68_dev_cidr              = "10.68.0.0/16"
avx_aws_spoke68_dev_gw_name           = "avx-aws-spoke68-dev-gw"
avx_aws_spoke68_dev_instance_size     = "t3.medium"
avx_aws_spoke68_dev_name_local_asn    = "65068"




#####################################
### Azure/Aviatrix Spoke56 (Prod) ###
#####################################

avx_az_cloud_type                 = "Azure"
avx_az_spoke56_prod_gw_name       = "avx-az-spoke56-prod-gw"
avx_az_spoke56_prod_region        = "West US"
avx_az_spoke56_prod_vpc_cidr      = "10.56.0.0/16"
avx_az_spoke56_prod_instance_size = "Standard_B1ms"

####################################
### Azure/Aviatrix Spoke57 (Dev) ###
####################################

avx_az_spoke57_dev_gw_name       = "avx-az-spoke57-dev-gw"
avx_az_spoke57_dev_region        = "West US"
avx_az_spoke57_dev_vpc_cidr      = "10.57.0.0/16"
avx_az_spoke57_dev_instance_size = "Standard_B1ms"


#################################################
### AWS Private Ubuntu Host 1 in VPC66 (Prod) ###
#################################################

aws_ec2_keypair                     = "aws_ec2_keypair"
aws_ec2_ubuntu_password             = "Aviatrix123#"

aws_ubnt66_priv_prod01_instance_size      = "t2.micro"
aws_ubnt66_priv_prod01_name               = "ubnt66-priv-prod01"
aws_ubnt66_priv_prod01_private_ip_address = "10.66.0.14"


#################################################
### AWS Private Ubuntu Host 2 in VPC66 (Prod) ###
#################################################

aws_ubnt66_priv_prod02_instance_size      = "t2.micro"
aws_ubnt66_priv_prod02_name               = "ubnt66-priv-prod02"
aws_ubnt66_priv_prod02_private_ip_address = "10.66.0.20"


################################################
### AWS Private Ubuntu Host 1 in VPC67 (Dev) ###
################################################

aws_ubnt67_priv_dev01_instance_size      = "t2.micro"
aws_ubnt67_priv_dev01_name               = "ubnt67-priv-dev01"
aws_ubnt67_priv_dev01_private_ip_address = "10.67.0.14"


################################################
### AWS Private Ubuntu Host 1 in VPC67 (Dev) ###
################################################

aws_ubnt68_priv_dev01_instance_size      = "t2.micro"
aws_ubnt68_priv_dev01_name               = "ubnt68-priv-dev01"
aws_ubnt68_priv_dev01_private_ip_address = "10.68.0.14"


################################################
### AWS Private Ubuntu Host 2 in VPC67 (Dev) ###
################################################

aws_ubnt67_priv_dev02_instance_size      = "t2.micro"
aws_ubnt67_priv_dev02_name               = "ubnt67-priv-dev02"
aws_ubnt67_priv_dev02_private_ip_address = "10.67.0.20"


##########################################################
### AWS Public JumpServer Windows Host in VPC66 (Prod) ###
##########################################################

aws_win66_pub_jumpsrv_instance_name       = "win66-pub-jumpsrv-prod01"
aws_win66_pub_jumpsrv_instance_type       = "t2.micro"
aws_win66_pub_jumpsrv_root_volume_size    = "30"
aws_win66_pub_jumpsrv_root_volume_type    = "gp2"
aws_win66_pub_jumpsrv_public_ip_address   = true
aws_win66_pub_jumpsrv_private_ip_address  = "10.66.0.40"


###############################################
### AWS Private Windows Host in VPC67 (Dev) ###
###############################################

aws_win67_priv_dev01_instance_name       = "win67-priv-dev01"
aws_win67_priv_dev01_instance_type       = "t2.micro"
aws_win67_priv_dev01_root_volume_size    = "30"
aws_win67_priv_dev01_root_volume_type    = "gp2"
aws_win67_priv_dev01_public_ip_address   = true
aws_win67_priv_dev01_private_ip_address  = "10.67.0.13"


#################################################
### Azure Private Ubuntu Host in VPC56 (Prod) ###
#################################################

az_ubnt56_priv_prod01_name           = "ubnt56-priv-prod01"
az_ubnt56_priv_prod01_static_priv_ip = "10.56.0.36"
az_ubnt56_priv_prod01_instance_size  = "Standard_D2_v4"
az_ubnt56_priv_prod01_user           = "ubuntu"
az_ubnt56_priv_prod01_password       = "Aviatrix123#"

################################################
### Azure Private Ubuntu Host in VPC57 (Dev) ###
################################################

az_ubnt57_priv_dev01_name           = "ubnt57-priv-dev01"
az_ubnt57_priv_dev01_static_priv_ip = "10.57.0.36"
az_ubnt57_priv_dev01_instance_size  = "Standard_D2_v4"
az_ubnt57_priv_dev01_user           = "ubuntu"
az_ubnt57_priv_dev01_password       = "Aviatrix123#"


#################################################
### Azure Public Windows Host in VPC56 (Prod) ###
#################################################

az_win56_priv_prod01_name           = "win56pub-prod01"
az_win56_priv_prod01_static_priv_ip = "10.56.0.4"
az_win56_priv_prod01_instance_size  = "Standard_D2_v4"
az_win56_priv_prod01_username       = "winadmin"
az_win56_priv_prod01_password       = "Aviatrix123#"
az_win56_priv_prod01_sku            = "2019-Datacenter"



### Tags Variable Values

createdby    = "TERRAFORM"
environment  = "Test"
application  = "App"
owner        = "vMario"
repository   = "none"




