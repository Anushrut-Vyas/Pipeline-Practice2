# 1. Resource Group
resource "azurerm_resource_group" "rg-child" {
  for_each = var.rg-map-child
  name     = each.value.rg-name
  location = each.value.rg-location
}
