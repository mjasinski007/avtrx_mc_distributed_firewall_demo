variable "domain_name" {
  description = "Name of the new Security Domain"
  type        = string
}

variable "connected_to" {
  description = " Name of the Security Domains connected to the new Sec Domain"
  type        = string
  default = ""
}

variable "create_policy" {
  description = "Create only new Security Domain"
  default = false
}
