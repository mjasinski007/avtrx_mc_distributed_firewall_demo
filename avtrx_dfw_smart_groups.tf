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


resource "aviatrix_smart_group" "all" {
  name = "ALL"
  selector {
    match_expressions {
      cidr = "0.0.0.0/0"
    }

  }
}


resource "aviatrix_smart_group" "windows_instances_sm" {
  name = "WINDOWS_INSTANCES"
  selector {
    match_expressions {
      type = "vm"
      tags = {
        OS_Name = "Azure_Windows"
      }
    }
    match_expressions {
      type = "vm"
      tags = {
        OS_Name = "AWS_Windows"
      }
    }
  }
}


resource "aviatrix_smart_group" "linux_instances_sm" {
  name = "LINUX_INSTANCES"
  selector {
    match_expressions {
      type = "vm"
      tags = {
        OS_Name = "Azure_Linux"
      }
    }
    match_expressions {
      type = "vm"
      tags = {
        OS_Name = "AWS_Linux"
      }
    }
  }
}


resource "aviatrix_smart_group" "webapp_sm" {
  name = "WEB_APP"
  selector {
    match_expressions {
      type = "vm"
      tags = {
        Application = "WEB"
      }
    }
  }
}


resource "aviatrix_smart_group" "dbapp_sm" {
  name = "DB_APP"
  selector {
    match_expressions {
      type = "vm"
      tags = {
        Application = "DB"
      }
    }
  }
}



