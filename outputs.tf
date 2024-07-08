output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "resource_group_location" {
  value = module.resource_group.resource_group_location
}

output "vnet_address_space" {
  value = module.network.vnet_address_space
}

output "subnet_name" {
  value = module.network.subnet_name
}

output "subnet_address_prefix" {
  value = module.network.subnet_address_prefix
}


output "nsg_name" {
  value = module.network.nsg_name
}

output "log_analytics_workspace_name" {
  value = module.common-n01516539.log_analytics_workspace_name
}

output "recovery_services_vault_name" {
  value = module.common-n01516539.recovery_services_vault_name
}

output "storage_account_name" {
  value = module.common-n01516539.storage_account_name
}
