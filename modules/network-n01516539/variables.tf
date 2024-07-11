variable "resource_group_name" {
  type        = string
  description = "Name of the Azure resource group"
}

variable "location" {
  type        = string
  description = "Azure region where resources will be deployed"
}

variable "vnet" {
  description = "Virtual network"
}

variable "vnet_space" {
  description = "Address space for the virtual network"
  type        = list(string)
}

variable "subnet_id" {
  description = "First subnet"
}

variable "subnet" {
  description = "First subnet"
}

variable "subnet_address_prefix" {
  description = "Address prefix of first subnet"
  type        = list(string)
}


variable "nsg" {
  description = "First network security group"
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

