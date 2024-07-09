
resource "null_resource" "linux_provisioner" {
  for_each = var.vm_instances

  provisioner "remote-exec" {
    inline = [
      "/usr/bin/hostname"
    ]
    connection {
      type        = "ssh"
      user        = var.admin_username
      private_key = file(var.priv_key)
      host        = element(azurerm_public_ip.vmlinux-n01516539-pip[each.key].ip_address, count.index)
    }
  }

}

