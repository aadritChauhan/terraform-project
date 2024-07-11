variable "resource_group_name" {
  type        = string
  description = "The name of the resource group"
}

variable "resource_group_location" {
  type        = string
  description = "The location where the resource group will be created"
}


variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

