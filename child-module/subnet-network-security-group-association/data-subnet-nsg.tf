data "azurerm_subnet" "data-subnet-association" {
  for_each             = var.sn-nsg-association-map-child
  name                 = each.value.subnet-name
  virtual_network_name = each.value.vnet-name
  resource_group_name  = each.value.rg-name
}

data "azurerm_network_security_group" "data-nsg-association" {
  for_each            = var.sn-nsg-association-map-child
  name                = each.value.nsg-name
  resource_group_name = each.value.rg-name
}
