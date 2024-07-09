variable "resource_group_location" {
  description = "Location/region of the Azure resource group"
  type        = string
}

variable "resource_group_name" {
  description = "Location/region of the Azure resource group"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the Linux VMs"
  type        = string
}


variable "admin_password" {
  description = "Admin username for the Linux VMs"
  type        = string
}


variable "priv_key" {
  description = "Path to the private SSH key file used for SSH authentication"
  type        = string
  default     = "./home/n01516539/.ssh/id_rsa"
}

variable "pub_key" {
  description = "Path to the private SSH key file used for SSH authentication"
  type        = string
  default     = "./home/n01516539/.ssh/id_rsa"
}

variable "vmlinux-names" {
  description = "Path to the private SSH key file used for SSH authentication"
  type        = map(string)
}

variable "subnet_id" {
  type        = string
}

variable "linux_avs_name" {
  type        = string
}
                                                                        
