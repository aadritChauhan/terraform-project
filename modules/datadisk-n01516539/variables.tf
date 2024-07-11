
variable "location" {
  description = "Azure location"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}


variable "disk_count" {
  description = "List of VM names"
  type        = number
}

variable "vm_names" {
  description = "List of VM names"
  type        = list(string)
}

variable "linux_vm_ids" {
  description = "List of IDs for Linux VMs"
  type        = list(string)
}

variable "windows_vm_ids" {
  description = "List of IDs for Windows VMs"
  type        = list(string)
}


variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

