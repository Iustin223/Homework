resource "null_resource" "ping_vm1" {
  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      host     = azurerm_public_ip.public_ip[0].ip_address
      user     = var.vm_name
      #password = var.vm_password
      timeout  = "2m"
    }

    inline = [
      "ping -c 4 ${azurerm_network_interface.network_interface[1].private_ip_address}"
    ]
  }

  depends_on = [azurerm_linux_virtual_machine.main]
}