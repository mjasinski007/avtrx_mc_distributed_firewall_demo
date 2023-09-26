##############################
#### Aviatrix Smart Group ####
##############################

# Link ->  https://registry.terraform.io/providers/AviatrixSystems/aviatrix/latest/docs/resources/aviatrix_smart_group

resource "aviatrix_smart_group" "aws_sppke66_prod" {
  name = "AWS_SPOKE66_PROD"
  selector {
    match_expressions {
      cidr = "10.66.0.0/16"
    }

  }
}


resource "aviatrix_smart_group" "aws_sppke67_prod" {
  name = "AWS_SPOKE67_DEV"
  selector {
    match_expressions {
      cidr = "10.67.0.0/16"
    }

  }
}


