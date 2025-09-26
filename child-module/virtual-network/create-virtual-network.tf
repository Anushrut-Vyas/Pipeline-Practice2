resource "azurerm_virtual_network" "vm-child" {
  for_each            = var.vn-map-child
  name                = each.value.vn-name
  address_space       = each.value.vn-address-space
  location            = each.value.rg-location
  resource_group_name = each.value.rg-name
}
