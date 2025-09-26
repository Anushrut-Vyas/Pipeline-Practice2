data "azurerm_subnet" "data-subnet" {
  for_each             = var.nic-map-child
  name                 = each.value.subnet-name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg-name
}

data "azurerm_public_ip" "data-public-ip" {
  for_each            = var.nic-map-child
  name                = each.value.pip-name
  resource_group_name = each.value.rg-name
}
