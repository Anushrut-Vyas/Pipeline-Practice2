# 4. Public IP
resource "azurerm_public_ip" "publicip-child" {
  for_each            = var.pip-map-child
  name                = each.value.pip-name
  location            = each.value.rg-location
  resource_group_name = each.value.rg-name
  allocation_method   = each.value.allocation-method
}
