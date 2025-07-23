resource "azurerm_public_ip" "public_ip" {
  count = var.vm_count
  name                = "${local.prefix}-publicip-${count.index + 1}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"
}