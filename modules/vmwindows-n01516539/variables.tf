
variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "windows_avs_name" {
  description = "The name of the availability set"
  type        = string
}

variable "vm_count" {
  description = "The number of VMs to create"
  type        = number
}

variable "vm_size" {
  description = "The size of the VM"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}

variable "boot_diagnostics_storage_uri" {
  description = "The URI of the storage account for boot diagnostics"
  type        = string
}

variable "vm_name" {
  description = "The name of the VM"
  type        = string
}

variable "os_info" {
  description = "Info Windows OS"
  default = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}

variable "os_disk" {
  description = "Attributes of OS disk"
  default = {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
}

