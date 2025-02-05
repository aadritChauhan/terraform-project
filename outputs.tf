
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

output "vm_hostnames" {
  description = "Hostnames of the provisioned CentOS Linux VMs"
  value       = module.vmlinux-n01516539.vm_hostnames
}

output "vm_domain_names" {
  description = "Domain names (FQDN) of the provisioned CentOS Linux VMs"
  value       = module.vmlinux-n01516539.vm_domain_names
}

output "vm_private_ip_addresses" {
  description = "Private IP addresses of the provisioned CentOS Linux VMs"
  value       = module.vmlinux-n01516539.vm_private_ip_addresses
}

output "vm_public_ip_addresses" {
  description = "Public IP addresses of the provisioned CentOS Linux VMs"
  value       = module.vmlinux-n01516539.vm_public_ip_addresses
}

output "hostname" {
  value = module.vmwindows-n01516539.hostname
}

output "windows_vm_fqdn" {
  value = module.vmwindows-n01516539.win_vm_fqdn
}

output "windows_private_ip" {
  value = module.vmwindows-n01516539.win_private_ip
}

output "windows_public_ip" {
  value = module.vmwindows-n01516539.win_public_ip
}

output "datadisk_names" {
  value = module.datadisk-n01516539.datadisk_names
}

output "load_balancer_name" {
  value = module.loadbalancer-n01516539.load_balancer_name
}

output "postgresql_server_name" {
  value = module.database-n01516539.db_instance_name
}
