resource "azurerm_public_ip" "vmlinux-n01516539-pip" {
  for_each            = var.vmlinux-names
  name                =  "${each.key}-pip"
  resource_group_location   = var.resource_group_location
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  domain_name_label   = each.key
 
}

resource "azurerm_network_interface" "vmlinux-n01516539-nic" {
  for_each            = var.vmlinux-names
  name                = "${each.key}-nic"
  resource_group_location  = var.resource_group_location
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
  vmlinux-names         = "${each.key}"
  resource_group_location  = var.resource_group_location
  resource_group_name   = var.resource_group_name
  availability_set_id   = azurerm_availability_set.linux_avs.id
  network_interface_ids = [azurerm_network_interface.vmlinux-n01516539-nic[each.key].id]
  size                  = "Standard_DS1_v2"
  computer-name         = "linux-${each.key}"
  admin-username        = var.admin-username
  admin-password        = var.win_admin_password

  os_disk {
    name                 = "${each.key}-osdisk"
    caching              = var.win_os_disk.caching
    storage_account_type = var.win_os_disk.storage_account_type
  }

  source_image_reference {
    publisher = var.win_os_info.publisher
    offer     = var.win_os_info.offer
    sku       = var.win_os_info.sku
    version   = var.win_os_info.version
  }

  boot_diagnostics { 
   storage_account_vmlinux = var.storage_account_name		
}
}


resource "azurerm_availability_set" "linux_avs" {
  name                     = var.linux_avs_name
  resource_group_location  = var.resource_group_location
  resource_group_name      = var.resource_group_name

  platform_fault_domain_count  = 2
  platform_update_domain_count = 5

  managed = true
}
