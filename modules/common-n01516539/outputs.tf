output "log_analytics_workspace_name" {
  value = azurerm_log_analytics_workspace.n01516539_law.name
}

output "recovery_services_vault_name" {
  value = azurerm_recovery_services_vault.n01516539_rsv.name
}

output "storage_account_name" {
  value = azurerm_storage_account.n01516539_aza.name
}

output "boot_diagnostics_storage_uri" {
  value = azurerm_storage_account.n01516539_aza.primary_blob_endpoint
}



