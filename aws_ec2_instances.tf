############################################
# Generate Private Key along with keypair  #
############################################

resource "tls_private_key" "ec2_priv_key" {
    algorithm = "RSA"
    rsa_bits  = 2048
}

resource "aws_key_pair" "aws_ec2_keypair" {
    key_name   = var.aws_ec2_keypair
    public_key = tls_private_key.ec2_priv_key.public_key_openssh
}


resource "local_file" "local_ssh_key" {
    filename        = "${aws_key_pair.aws_ec2_keypair.key_name}.pem"
    content         = tls_private_key.ec2_priv_key.private_key_pem
    file_permission = "0400"
}

###############################################
### AWS Private Ubuntu Host in VPC66 (Prod) ###
###############################################

module "aws_ubnt66_priv_prod01_nsg" {
    source              = "terraform-aws-modules/security-group/aws"
    version             = "4.5.0"
    name                = "aws-ubnt66-priv-prod01-nsg"
    description         = "Security Group Ubuntu Private Host in Spoke66"
    vpc_id              = module.spoke66_prod.vpc.vpc_id
    ingress_cidr_blocks = ["0.0.0.0/0"]
    ingress_rules       = ["http-80-tcp","https-443-tcp","ssh-tcp","all-icmp"]
    egress_rules        = ["all-all"]

    depends_on          = [module.spoke66_prod]
}

module "aws_ubnt66_priv_prod01_instance" {
    source                      = "terraform-aws-modules/ec2-instance/aws"
    version                     = "3.6.0"
    instance_type               = var.aws_ubnt66_priv_prod01_instance_size
    name                        = var.aws_ubnt66_priv_prod01_name
    ami                         = data.aws_ami.ubuntu_golden_ami.id
    key_name                    = aws_key_pair.aws_ec2_keypair.key_name
    subnet_id                   = module.spoke66_prod.vpc.private_subnets[0].subnet_id
    vpc_security_group_ids      = [module.aws_ubnt66_priv_prod01_nsg.security_group_id]
    associate_public_ip_address = false
    private_ip                  = var.aws_ubnt66_priv_prod01_private_ip_address
    user_data                   = local.aws_ubnt66_priv_prod01_user_data

    depends_on                  = [module.spoke66_prod]

    tags = merge(
        local.default_tags,
        {
            Description = "Private Ubuntu Prod Host in Spoke66 VPC"
        }
    )
}


##############################################
### AWS Private Ubuntu Host in VPC67 (Dev) ###
##############################################


module "aws_ubnt67_priv_dev01_nsg" {
    source              = "terraform-aws-modules/security-group/aws"
    version             = "4.5.0"
    name                = "aws-ubnt67-priv-dev01-nsg"
    description         = "Security Group Private Ubuntu Host in Spoke67"
    vpc_id              = module.spoke67_dev.vpc.vpc_id
    ingress_cidr_blocks = ["0.0.0.0/0"]
    ingress_rules       = ["http-80-tcp","https-443-tcp","ssh-tcp","all-icmp"]
    egress_rules        = ["all-all"]

    depends_on          = [module.spoke67_dev]
}

module "aws_ubnt67_priv_dev01_instance" {
    source                      = "terraform-aws-modules/ec2-instance/aws"
    version                     = "3.6.0"
    instance_type               = var.aws_ubnt67_priv_dev01_instance_size
    name                        = var.aws_ubnt67_priv_dev01_name
    ami                         = data.aws_ami.ubuntu_golden_ami.id
    key_name                    = aws_key_pair.aws_ec2_keypair.key_name
    subnet_id                   = module.spoke67_dev.vpc.private_subnets[0].subnet_id
    vpc_security_group_ids      = [module.aws_ubnt67_priv_dev01_nsg.security_group_id]
    associate_public_ip_address = false
    private_ip                  = var.aws_ubnt67_priv_dev01_private_ip_address
    user_data                   = local.aws_ubnt67_priv_dev01_user_data

    depends_on                  = [module.spoke67_dev]

    tags = merge(
        local.default_tags,
        {
            Description = "Private Ubuntu Dev Host in Spoke67 VPC"
        }
    )
}

###################################################
### AWS Public JumpServer Windows Host in VPC66 ###
###################################################

module "aws_win66_pub_jumpsrv_nsg" {
    source              = "terraform-aws-modules/security-group/aws"
    version             = "4.5.0"
    name                = "aws-win66-pub-jumpsrv-nsg"
    description         = "Security Group Windows JumpServer in Spoke66"
    vpc_id              = module.spoke66_prod.vpc.vpc_id
    #ingress_cidr_blocks = ["${chomp(data.http.my_public_ip.response_body)}/32"]
    ingress_cidr_blocks = ["0.0.0.0/0"]
    ingress_rules       = ["rdp-tcp","http-80-tcp","https-443-tcp","ssh-tcp","all-icmp"]
    egress_rules        = ["all-all"]

    depends_on          = [module.spoke66_prod]
}


resource "aws_instance" "aws_win66_pub_jumpsrv_instance" {
    ami                         = data.aws_ami.windows2019_ami.id
    instance_type               = var.aws_win66_pub_jumpsrv_instance_type
    subnet_id                   = module.spoke66_prod.vpc.public_subnets[0].subnet_id
    vpc_security_group_ids      = [module.aws_win66_pub_jumpsrv_nsg.security_group_id]
    key_name                    = aws_key_pair.aws_ec2_keypair.key_name
    associate_public_ip_address = var.aws_win66_pub_jumpsrv_public_ip_address
    private_ip                  = var.aws_win66_pub_jumpsrv_private_ip_address
    user_data                   = data.template_file.windows_userdata.rendered
    source_dest_check           = false
    get_password_data           = true

    # root disk
    root_block_device {
        volume_size           = var.aws_win66_pub_jumpsrv_root_volume_size
        volume_type           = var.aws_win66_pub_jumpsrv_root_volume_type
        delete_on_termination = true
        encrypted             = true
    }

    depends_on          = [module.spoke66_prod]

    tags = merge(
        local.default_tags,
        {
            Name        = "win66-pub-jumpsrv-prod01"
            Description = "Public Windows JumpServer in Spoke66 VPC"
        }
    )
}

resource "aws_eip" "aws_win66_pub_jumpsrv_eip" {
    domain = "vpc"

    tags = merge(
        local.default_tags,
        {
            Name = "aws-win66-pub-jumpsrv-eip"
        }
    )
}

resource "aws_eip_association" "aws_win66_pub_jumpsrv_eip_assoc" {
    instance_id   = aws_instance.aws_win66_pub_jumpsrv_instance.id
    allocation_id = aws_eip.aws_win66_pub_jumpsrv_eip.id
}


resource "null_resource" "get_password_aws_win66_pub_jumpsrv" {
    triggers = {
        password = "${rsadecrypt(aws_instance.aws_win66_pub_jumpsrv_instance.password_data, file("${path.module}/aws_ec2_keypair.pem"))}"
    }
    depends_on          = [aws_instance.aws_win66_pub_jumpsrv_instance]
}


#########################################
### AWS Private Windows Host in VPC67 ###
#########################################

module "aws_win67_priv_dev01_nsg" {
    source              = "terraform-aws-modules/security-group/aws"
    version             = "4.5.0"
    name                = "aws-win67-priv-dev01-nsg"
    description         = "Security Group for Windows PrivHost in Spoke67"
    vpc_id              = module.spoke67_dev.vpc.vpc_id
    ingress_cidr_blocks = ["0.0.0.0/0"]
    ingress_rules       = ["rdp-tcp","http-80-tcp","https-443-tcp","ssh-tcp","all-icmp"]
    egress_rules        = ["all-all"]

    depends_on          = [module.spoke67_dev]
}


resource "aws_instance" "aws_win67_priv_dev01_instance" {
    ami                         = data.aws_ami.windows2019_ami.id
    instance_type               = var.aws_win67_priv_dev01_instance_type
    associate_public_ip_address = var.aws_win67_priv_dev01_public_ip_address
    subnet_id                   = module.spoke67_dev.vpc.private_subnets[0].subnet_id
    vpc_security_group_ids      = [module.aws_win67_priv_dev01_nsg.security_group_id]
    source_dest_check           = false
    key_name                    = aws_key_pair.aws_ec2_keypair.key_name
    user_data                   = data.template_file.windows_userdata.rendered
    get_password_data           = true
    private_ip                  = var.aws_win67_priv_dev01_private_ip_address

    # root disk
    root_block_device {
        volume_size           = var.aws_win67_priv_dev01_root_volume_size
        volume_type           = var.aws_win67_priv_dev01_root_volume_type
        delete_on_termination = true
        encrypted             = true
    }

    depends_on          = [module.spoke67_dev]

    tags = merge(
        local.default_tags,
        {
            Name        = "win67-priv-dev01"
            Description = "Private Windows Dev Host in Spoke67 VPC"
        }
    )
}

resource "aws_eip" "aws_win67_priv_dev01_eip" {
    domain = "vpc"

    tags = merge(
        local.default_tags,
        {
            Name = "aws-win67-priv-dev01-eip"
        }
    )
}

resource "aws_eip_association" "aws_win67_priv_dev01_eip_assoc" {
    instance_id   = aws_instance.aws_win67_priv_dev01_instance.id
    allocation_id = aws_eip.aws_win67_priv_dev01_eip.id
}


resource "null_resource" "get_password_win_privhost_spk67" {
    triggers = {
        password = "${rsadecrypt(aws_instance.aws_win67_priv_dev01_instance.password_data, file("${path.module}/aws_ec2_keypair.pem"))}"
    }
    depends_on          = [aws_instance.aws_win67_priv_dev01_instance]
}









# file("${path.module}/aws_ec2_keypair.pem")

/* resource "null_resource" "get_password_win_jumpsrv_spk66" {
    triggers = {
        password = "${rsadecrypt(aws_instance.win_jumpsrv_spk66_instance.password_data, file("${path.module}/aws_ec2_keypair.pem"))}"
    }
    depends_on          = [aws_instance.win_jumpsrv_spk66_instance]
} */
