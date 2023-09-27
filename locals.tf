locals {
    default_tags = {
        CreatedBy    = var.createdby
        Environment  = var.environment
        Application  = var.application
        Owner        = var.owner
        Repository   = var.repository
    }

    aws_ubnt66_priv_prod01_user_data = templatefile("${path.module}/scripts/ubuntu_bootstrap.sh",
        {
            name     = "aws-ubnt66-priv-prod01"
            password = var.aws_ec2_ubuntu_password
        })
    aws_ubnt66_priv_prod02_user_data = templatefile("${path.module}/scripts/ubuntu_bootstrap.sh",
        {
            name     = "aws-ubnt66-priv-prod02"
            password = var.aws_ec2_ubuntu_password
        })

    aws_ubnt67_priv_dev01_user_data = templatefile("${path.module}/scripts/ubuntu_bootstrap.sh",
        {
            name     = "aws-ubnt67-priv-dev01"
            password = var.aws_ec2_ubuntu_password
        })
      aws_ubnt68_priv_dev01_user_data = templatefile("${path.module}/scripts/ubuntu_bootstrap.sh",
        {
            name     = "aws-ubnt68-priv-dev01"
            password = var.aws_ec2_ubuntu_password
        })
    aws_ubnt67_priv_dev02_user_data = templatefile("${path.module}/scripts/ubuntu_bootstrap.sh",
        {
            name     = "aws-ubnt67-priv-dev02"
            password = var.aws_ec2_ubuntu_password
        })
}

