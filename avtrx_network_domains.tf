

module "prod_network_domain" {
  source       = "./modules/terraform-avx-network-domain"
  domain_name  = "PROD"
  #connected_to = "${module.avx_siem_onprem_test_domain.security_domain.domain_name}"
}

module "dev_network_domain" {
  source       = "./modules/terraform-avx-network-domain"
  domain_name  = "DEV"
  #connected_to = "${module.avx_siem_onprem_test_domain.security_domain.domain_name}"
}

module "onprem_network_domain" {
  source       = "./modules/terraform-avx-network-domain"
  domain_name  = "ON_PREM"
  #connected_to = "${module.avx_siem_onprem_test_domain.security_domain.domain_name}"
}