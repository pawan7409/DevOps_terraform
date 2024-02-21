resource "azurerm_storage_account" "storage" {
    for_each = var.storageaccount
  name                = each.value.name
  resource_group_name = each.value.resource_group_name

  location                 = each.value.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  network_rules {
    default_action             = "Deny"
    ip_rules                   = ["100.0.0.1"]
    virtual_network_subnet_ids = [data.azurerm_subnet.subnettoddo[each.key].id]
  }

  tags = {
    environment = "staging"
  }
}
resource "azurerm_storage_container" "example" {
    depends_on = [ azurerm_storage_account.storage ]
    # for_each = var.storageaccount
  name                  = "container1"
  storage_account_name  = "storage887989"
  container_access_type = "private"
}
data "azurerm_subnet" "subnettoddo" {
    for_each = var.storageaccount
  name                 = each.value.subnetname
  virtual_network_name = each.value.vnetname
  resource_group_name  = each.value.resource_group_name
}