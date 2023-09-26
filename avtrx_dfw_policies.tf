# Create an Aviatrix Distributed Firewalling Policy List

# Link ->  https://registry.terraform.io/providers/AviatrixSystems/aviatrix/latest/docs/resources/aviatrix_distributed_firewalling_policy_list


resource "aviatrix_distributed_firewalling_policy_list" "aws_spoke66prod_to_aws_spoke67_dev_policy" {
  policies {
    name             = upper("AWS_SPOKE66_PROD_TO_AWS_SPOKE67_DEV_UDP53")
    action           = "PERMIT"
    priority         = 13
    protocol         = "UDP"
    logging          = true
    watch            = false
    src_smart_groups = [
      aviatrix_smart_group.aws_sppke66_prod.uuid
    ]
    dst_smart_groups = [
      aviatrix_smart_group.aws_sppke67_prod.uuid
    ]
  }




  policies {
    name             = upper("AWS_SPOKE66_PROD_TO_AWS_SPOKE67_DEV_ICMP")
    action           = "DENY"
    priority         = 10
    protocol         = "ICMP"
    logging          = true
    watch            = false
    src_smart_groups = [
      aviatrix_smart_group.aws_sppke66_prod.uuid
    ]
    dst_smart_groups = [
      aviatrix_smart_group.aws_sppke67_prod.uuid
    ]
  }

    policies {
    name             = upper("AWS_SPOKE66_PROD_TO_AWS_SPOKE67_DEV_TCP")
    action           = "DENY"
    priority         = 11
    protocol         = "TCP"
    logging          = true
    watch            = false
    src_smart_groups = [
      aviatrix_smart_group.aws_sppke66_prod.uuid
    ]
    dst_smart_groups = [
      aviatrix_smart_group.aws_sppke67_prod.uuid
    ]
  }

  policies {
    name             = upper("AWS_SPOKE66_PROD_TO_AWS_SPOKE67_DEV_UDP")
    action           = "PERMIT"
    priority         = 9
    protocol         = "UDP"
    logging          = true
    watch            = false
    src_smart_groups = [
      aviatrix_smart_group.aws_sppke66_prod.uuid
    ]
    dst_smart_groups = [
      aviatrix_smart_group.aws_sppke67_prod.uuid
    ]
  }
}