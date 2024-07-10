resource "azurerm_log_analytics_workspace" "n01516539_law" {
  name                    = var.log_analytics_workspace_name
 location                 = var.location
  resource_group_name     = var.resource_group_name
  sku                     = var.log_sku
  retention_in_days       = var.retention_log
 }

resource "azurerm_recovery_services_vault" "n01516539_rsv" {
  name                    = var.recovery_services_vault_name
  location                = var.location
  resource_group_name     = var.resource_group_name
  sku                     = var.vault_sku
}

resource "azurerm_storage_account" "n01516539_aza" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
