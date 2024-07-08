resource "azurerm_log_analytics_workspace" "main" {
  name                    = var.log_analytics_workspace_name
  resource_group_location = var.resource_group_location
  resource_group_name     = var.resource_group_name
  sku                     = "PerGB2018"
  retention               = "45"
  vault_sku               = "Standard"
}

resource "azurerm_recovery_services_vault" "main" {
  name                    = var.recovery_services_vault_name
  resource_group_location = var.resource_group_location
  resource_group_name     = var.resource_group_name
}

resource "azurerm_storage_account" "main" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  resource_group_location  = var.resource_group_location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
