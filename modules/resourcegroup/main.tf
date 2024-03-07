
resource "azurerm_resource_group" "toddo_rg" {
  for_each = var.rg-name

  name     = each.value.name
  location = each.value.location
  tags     = each.value.tags
}
# Output the resource group information
output "resource_group_info" {
  value = {
    for key, rg in azurerm_resource_group.toddo_rg :
    key => {
      name     = rg.name
      location = rg.location
      tags     = rg.tags
    }
  }
}