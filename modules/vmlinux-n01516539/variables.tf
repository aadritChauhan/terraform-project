variable "location" {
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

variable "public_key" {
default  = "/home/N01516539/.ssh/id_rsa.pub"
}

variable "priv_key" {
default     = "/home/N01516539/.ssh/id_rsa"
}

variable "vmlinux-names" {
  description = "Path to the private SSH key file used for SSH authentication"
  type        = map(string)
}

variable "subnet_id" {
  type = string
}

variable "linux_avs_name" {
  type = string
}

variable "storage_account_name" {
  description = "Admin username for the Linux VMs"
  type        = string
}

variable "boot_diagnostics_storage_uri" {
  description = "The URI of the storage account for boot diagnostics"
  type        = string
}


variable "size" {
  description = "The URI of the storage account for boot diagnostics"
  type        = string
}

variable "os_disk" {
  description = "Attributes of OS disk"
  default = {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}
