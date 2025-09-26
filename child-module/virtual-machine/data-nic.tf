data "azurerm_network_interface" "data-nic" {
  for_each            = var.vm-map-child
  name                = each.value.nic-name
  resource_group_name = each.value.rg-name
}
