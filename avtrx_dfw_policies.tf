# Create an Aviatrix Distributed Firewalling Policy List

# Link ->  https://registry.terraform.io/providers/AviatrixSystems/aviatrix/latest/docs/resources/aviatrix_distributed_firewalling_policy_list


resource "aviatrix_distributed_firewalling_policy_list" "windows2windows_permit" {

  /* policies {
    name             = upper("APP_TO_DB")
    action           = "PERMIT"
    priority         = 5
    protocol         = "ANY"
    logging          = true
    watch            = false
    src_smart_groups = [
      aviatrix_smart_group.webapp_sm.uuid
    ]
    dst_smart_groups = [
      aviatrix_smart_group.dbapp_sm.uuid
    ]
  }

  policies {
    name             = upper("APP_TO_WIN")
    action           = "PERMIT"
    priority         = 10
    protocol         = "ANY"
    logging          = true
    watch            = false
    src_smart_groups = [
      aviatrix_smart_group.webapp_sm.uuid
    ]
    dst_smart_groups = [
      aviatrix_smart_group.windows_instances_sm.uuid
    ]
  } 

 policies {
    name             = upper("APP_TO_LIN")
    action           = "PERMIT"
    priority         = 15
    protocol         = "ANY"
    logging          = true
    watch            = false
    src_smart_groups = [
      aviatrix_smart_group.webapp_sm.uuid
    ]
    dst_smart_groups = [
      aviatrix_smart_group.linux_instances_sm.uuid
    ]
  }
}  */





  /* policies {
    name             = upper("LIN2LIN")
    action           = "PERMIT"
    priority         = 6
    protocol         = "ANY"
    logging          = true
    watch            = false
    src_smart_groups = [
      aviatrix_smart_group.linux_instances_sm.uuid
    ]
    dst_smart_groups = [
      aviatrix_smart_group.linux_instances_sm.uuid
    ]
  } */

policies {
    name             = upper("PERMIT_ALL")
    action           = "PERMIT"
    priority         = 100
    protocol         = "ANY"
    logging          = true
    watch            = false
    src_smart_groups = [
      aviatrix_smart_group.all.uuid
    ]
    dst_smart_groups = [
      aviatrix_smart_group.all.uuid
    ]
  }

}
