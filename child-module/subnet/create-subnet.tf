# 3. Subnet
resource "azurerm_subnet" "subnet-child" {
  for_each             = var.subnet-map-child
  name                 = each.value.subnet-name
  resource_group_name  = each.value.rg-name
  virtual_network_name = each.value.vn-name
  address_prefixes     = each.value.subnet-address-prefixes
}
