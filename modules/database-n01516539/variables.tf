variable "resource_group_name" {
  
}

variable "location" {
 
}

variable "db_username" {
 
}

variable "db_password" {
 
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

