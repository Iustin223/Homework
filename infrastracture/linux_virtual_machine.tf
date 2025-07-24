resource "azurerm_linux_virtual_machine" "main" {
  count = var.vm_count
  name                = "${local.prefix}-vm-${count.index + 1}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  size                = "Standard_B1s"
  admin_username      = var.vm_name
  admin_password      = var.vm_password
  

  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.network_interface[count.index].id,
  ]

  os_disk {
    name                 = "${local.prefix}-osdisk-${count.index + 1}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }

  tags = {
    environment = "staging"
  }
}

