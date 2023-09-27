output "aws_win66_pub_jumpsrv_public_fqdn" {
    value = aws_instance.aws_win66_pub_jumpsrv_instance.public_dns
}

output "aws_ubnt66_priv_prod01_private_fqdn" {
    value = module.aws_ubnt66_priv_prod01_instance.private_dns
}

output "aws_ubnt66_priv_prod02_private_fqdn" {
    value = module.aws_ubnt66_priv_prod02_instance.private_dns
}

output "aws_ubnt67_priv_dev01_private_fqdn" {
    value = module.aws_ubnt67_priv_dev01_instance.private_dns
}

output "aws_ubnt67_priv_dev02_private_fqdn" {
    value = module.aws_ubnt67_priv_dev02_instance.private_dns
}


output "aws_win67_priv_dev01_private_fqdn" {
    value = aws_instance.aws_win67_priv_dev01_instance.private_dns
}

output "az_ubnt56_priv_prod01_private_ip_address" {
    value = azurerm_linux_virtual_machine.az_ubnt56_priv_prod01_vm.private_ip_address
}

output "az_ubnt57_priv_dev01_private_ip_address" {
    value = azurerm_linux_virtual_machine.az_ubnt57_priv_dev01_vm.private_ip_address
}

output "az_win56_priv_prod01_public_ip_address" {
    value = azurerm_windows_virtual_machine.az_win56_priv_prod01_vm.public_ip_address
}


output "aws_win66_pub_jumpsrv_rdp_password" {
    value = "${null_resource.get_password_aws_win66_pub_jumpsrv.triggers.password}"
}

output "aws_win67_priv_dev01_rdp_password" {
    value = "${null_resource.get_password_win_privhost_spk67.triggers.password}"
}


/* output "ap_sm" {
  value = aviatrix_smart_group.webapp_sm.uuid
}

output "db_sm" {
  value = aviatrix_smart_group.dbapp_sm.uuid
} */
