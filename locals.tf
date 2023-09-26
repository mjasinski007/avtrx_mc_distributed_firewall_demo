locals {
    default_tags = {
        CREATEDBY    = var.createdby
        ENVIRONMENT  = var.environment
        APPLICATION  = var.application
        OWNER        = var.owner
        REPOSITORY   = var.repository
    }

    aws_ubnt66_priv_prod01_user_data = templatefile("${path.module}/scripts/ubuntu_bootstrap.sh",
        {
            name     = "aws-ubnt66-priv-prod01"
            password = var.aws_ec2_ubuntu_password
        })

    aws_ubnt67_priv_dev01_user_data = templatefile("${path.module}/scripts/ubuntu_bootstrap.sh",
        {
            name     = "aws-ubnt67-priv-dev01"
            password = var.aws_ec2_ubuntu_password
        })
}

