
data "azurerm_client_config" "current" {}



resource "azurerm_key_vault" "locker45" {
  
  for_each = var.azurekeyvault
  name                       = each.value.name
  location                   = each.value.location
  resource_group_name        = each.value.resource_group_name
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  soft_delete_retention_days = 7

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    # key_permissions = [
    #   "Create",
    #   "Delete",
    #   "Get",
    #   "Purge",
    #   "Recover",
    #   "Update",
    #   "GetRotationPolicy",
    #   "SetRotationPolicy"
    # ]

    secret_permissions = [
      "Set",
      # "Delete",
      "Get"
      # "Recover",
      # "List",
      # "Backup",
      # "Restore"
     
      
    ]
  }
}

