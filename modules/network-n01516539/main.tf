# Virtual network
resource "azurerm_virtual_network" "network_vnet" {
  name                = var.vnet
  address_space       = var.vnet_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Subnet 
resource "azurerm_subnet" "network_subnet" {
  name                 = var.subnet
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.network_vnet.name
  address_prefixes     = var.subnet_address_prefix
}


# Network Security Group 
resource "azurerm_network_security_group" "network_nsg" {
  name                = var.nsg
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "RDP"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "WinRM"
    priority                   = 1003
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "5985"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "HTTP"
    priority                   = 1004
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}



# Subnet to NSG Associations
resource "azurerm_subnet_network_security_group_association" "network_subnet_nsg_association" {
  subnet_id                 = azurerm_subnet.network_subnet.id
  network_security_group_id = azurerm_network_security_group.network_nsg.id


}

