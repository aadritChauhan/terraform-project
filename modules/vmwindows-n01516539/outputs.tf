output "hostname" {
  value = azurerm_windows_virtual_machine.windows_vm[*].computer_name
}

output "win_private_ip" {
  value = azurerm_network_interface.windows_nic[*].private_ip_address
}

output "win_public_ip" {
  value = azurerm_public_ip.windows_pip[*].ip_address
}

output "win_vm_fqdn" {
  value = azurerm_public_ip.windows_pip[*].fqdn
}

output "windows_vm_id" {
  value = azurerm_windows_virtual_machine.windows_vm[*].id
}
