# data "azurerm_subnet" "data-subnet" {
#   # for_each             = var.nic-map-child
#   name                 = each.value.subnet-name
#   virtual_network_name = each.value.vn-name
#   resource_group_name  = each.value.rg-name
# }

# data "azurerm_public_ip" "data-public-ip" {
#   # for_each            = var.nic-map-child
#   name                = each.value.pip-name
#   resource_group_name = each.value.rg-name
# }


# 5. Network Interface
resource "azurerm_network_interface" "nic-child" {
  for_each            = var.nic-map-child
  name                = each.value.nic_name
  location            = each.value.rg-location
  resource_group_name = each.value.rg-name

  ip_configuration {
    name                          = each.value.ip-config-name
    subnet_id                     = data.azurerm_subnet.data-subnet[each.key].id # Need data block
    private_ip_address_allocation = each.value.priv-ip-adrs-alloc
    public_ip_address_id          = data.azurerm_public_ip.data-public-ip[each.key].id# Need data block
  }
}

