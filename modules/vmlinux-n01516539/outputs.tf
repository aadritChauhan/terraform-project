output "vm_hostnames" {
    value = [for vm in azurerm_linux_virtual_machine.vmlinux-n01516539 : vm.name]
}

output "vm_domain_names" {
  value = [for pip in azurerm_public_ip.vmlinux-n01516539-pip : pip.domain_name_label]
}

output "vm_private_ip_addresses" {
  value = [for nic in azurerm_network_interface.vmlinux-n01516539-nic : nic.private_ip_address]
}

output "vm_public_ip_addresses" {
  value = [for pip in azurerm_public_ip.vmlinux-n01516539-pip : pip.ip_address]
}

output "linux_vm_id" {
  value = [for vm in azurerm_linux_virtual_machine.vmlinux-n01516539 : vm.id]
}

output "vm_nic_ids" {
  value = [for nic in azurerm_network_interface.vmlinux-n01516539-nic : nic.id]
}
