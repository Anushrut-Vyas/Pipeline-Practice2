# associates subnet and nsg so that we can establish connection with VM
resource "azurerm_subnet_network_security_group_association" "sn-nsg-association-child" {
  for_each                  = var.sn-nsg-association-map-child
  subnet_id                 = data.azurerm_subnet.data-subnet-association[each.key].id
  network_security_group_id = data.azurerm_network_security_group.data-nsg-association[each.key].id
}
