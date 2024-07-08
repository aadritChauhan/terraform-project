output "vnet_name" {
  value = azurerm_virtual_network.network_vnet.name
}

output "vnet_address_space" {
  value = azurerm_virtual_network.network_vnet.address_space
}

output "subnet_name" {
  value = azurerm_subnet.network_subnet.name
}

output "subnet_address_prefix" {
  value = azurerm_subnet.network_subnet.address_prefixes
}


output "nsg_name" {
  value = azurerm_network_security_group.network_nsg.name
}


output "subnet_id" {
  value = azurerm_subnet.network_subnet.id
}


