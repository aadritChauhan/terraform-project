output "vm_hostnames" {
  value = azurerm_linux_virtual_machine.vmlinux-n01516539.*.computer_name
}
output "vm_domain_names" {
  value = azurerm_public_ip.vmlinux-n01516539-pip.*.domain_name_label
}

output "vm_private_ip_addresses" {
  value = azurerm_network_interface.vmlinux-n01516539-nic.*.private_ip_address
}

output "vm_public_ip_addresses" {
  value = azurerm_public_ip.vmlinux-n01516539-pip.*.ip_address
}
