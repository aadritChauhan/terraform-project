variable "resource_group_name" {
  type        = string
  description = "Name of the Azure resource group"
}

variable "location" {
  type        = string
  description = "Azure region where resources will be deployed"
}

variable "log_analytics_workspace_name" {
  type        = string
  description = "Name of the Log Analytics Workspace"
}

variable "recovery_services_vault_name" {
  type        = string
  description = "Name of the Recovery Services Vault"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the Standard Storage Account"
}

variable "vault_sku" {
  type        = string
  description = "Name of the Log Analytics Workspace"
}

variable "retention_log" {
  type        = string
  description = "Name of the Recovery Services Vault"
}

variable "log_sku" {
  type        = string
  description = "Name of the Standard Storage Account"
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

