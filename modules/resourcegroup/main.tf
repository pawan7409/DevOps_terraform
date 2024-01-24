
resource "azurerm_resource_group" "toddo_rg" {
  for_each = var.rg-name

  name     = each.value.name
  location = each.value.location
  tags     = each.value.tags
}