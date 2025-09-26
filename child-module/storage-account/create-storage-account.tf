resource "azurerm_storage_account" "example" {
    for_each = var.stoarge-account-map-child
  name                     = each.value.storage-account-name
  resource_group_name      = each.value.rg-name
  location                 = each.value.rg-location
  account_tier             = each.value.account-tier
  account_replication_type = each.value.acc-repl-type

}