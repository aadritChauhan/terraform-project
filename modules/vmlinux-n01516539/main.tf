resource "azurerm_public_ip" "vmlinux-n01516539-pip" {
  for_each            = var.vmlinux-names
  name                = "${each.key}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  domain_name_label   = each.key

}

resource "azurerm_network_interface" "vmlinux-n01516539-nic" {
  for_each            = var.vmlinux-names
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vmlinux-n01516539-pip[each.key].id

  }
}

resource "azurerm_linux_virtual_machine" "vmlinux-n01516539" {
  for_each              = var.vmlinux-names
  name                  = each.key
  admin_username        = var.admin_username
  computer_name         = "linux-${each.key}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  availability_set_id   = azurerm_availability_set.linux_avs.id
  size                  = var.size
  network_interface_ids = [azurerm_network_interface.vmlinux-n01516539-nic[each.key].id]

  source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }

os_disk {
    name              = "${each.key}-osdisk"
    caching           = var.os_disk.caching
    storage_account_type = var.os_disk.storage_account_type
  }

admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key)
  }

  boot_diagnostics{
    storage_account_uri = var.boot_diagnostics_storage_uri
  }
}


resource "azurerm_availability_set" "linux_avs" {
  name                = var.linux_avs_name
  location            = var.location
  resource_group_name = var.resource_group_name

  platform_fault_domain_count  = 2
  platform_update_domain_count = 5

  managed = true
}

resource "azurerm_virtual_machine_extension" "AzureMonitorLinuxAgent" {
  for_each             = var.vmlinux-names
  name                 = "AzureMonitorLinuxxAgent"
  virtual_machine_id   = azurerm_linux_virtual_machine.vmlinux-n01516539[each.key].id
  publisher            = "Microsoft.Azure.Monitor"
  type                 = "AzureMonitorLinuxAgent"
  type_handler_version = "1.7"
  
}

# Network Watcher Agent Linux
resource "azurerm_virtual_machine_extension" "NetworkWatcherAgentLinux" {
  for_each             = var.vmlinux-names
  name                 = "NetworkWatcherAgentLinux"
  virtual_machine_id   = azurerm_linux_virtual_machine.vmlinux-n01516539[each.key].id
  publisher            = "Microsoft.Azure.NetworkWatcher"
  type                 = "NetworkWatcherAgentLinux"
  type_handler_version = "1.4"
  
}
