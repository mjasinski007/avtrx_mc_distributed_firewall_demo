terraform {
    required_providers {
        aviatrix = {
            source  = "aviatrixsystems/aviatrix"
            version = "~>3.1.0"
        }
        aws = {
            source  = "hashicorp/aws"
            version = ">= 5.0"
        }
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~> 3.0.0"
        }
    }
    required_version = ">=1.5.0"
}