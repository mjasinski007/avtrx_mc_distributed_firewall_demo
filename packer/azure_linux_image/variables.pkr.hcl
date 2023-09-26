variable "client_secret" {
  type =  string
  default = "A6f7Q~XRy4q4GBnOYaDZiBQDJtg5KmlLyZyun"
  // Sensitive vars are hidden from output as of Packer v1.6.5
  sensitive = false
}

variable "client_id" {
  type =  string
  default = "b76ef98d-276e-4627-9c22-7136073d4d51"
  // Sensitive vars are hidden from output as of Packer v1.6.5
  sensitive = false
}

variable "tenant_id" {
  type = string
  default = "4780055e-ce37-4f02-b33d-fdad8493a4b6"
}

variable "subscription_id" {
  type = string
  default = "4ae381f8-ee9d-45a9-ae61-b633801915fd"
}

# az vm image list-skus --location "East US" --offer UbuntuServer --publisher Canonical -o table