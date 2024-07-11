
resource "null_resource" "linux_provisioner" {
  for_each = azurerm_linux_virtual_machine.vmlinux-n01516539

  provisioner "remote-exec" {
    inline = [
      "/usr/bin/hostname"
    ]
    connection {
      type        = "ssh"
      user        = var.admin_username
      private_key = file(var.priv_key)
      host        = azurerm_linux_virtual_machine.vmlinux-n01516539[each.key].public_ip_address
    }
  }

}



