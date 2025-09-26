# Network Security Group
resource "azurerm_network_security_group" "nsg-child" {
    for_each = var.nsg-map-child
  name                = each.value.nsg-name
  location            = each.value.rg-location
  resource_group_name = each.value.rg-name

  security_rule {
    name                       = each.value.security-rule-name
    priority                   = each.value.security-rule-priority
    direction                  = each.value.security-rule-direction
    access                     = each.value.security-rule-access
    protocol                   = each.value.security-rule-protocol
    source_port_range          = each.value.security-rule-source-port-range
    destination_port_range     = each.value.security-rule-destination-port-range
    source_address_prefix      = each.value.security-rule-source-address-prefix
    destination_address_prefix = each.value.security-rule-destination-address-prefix
  }

  # rule to allow HTTP so that we can view nginx page
  security_rule {
    name                       = "Allow-HTTP"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}