# resource "azurerm_virtual_network" "vnet01" {
#   for_each = var.vnetpeering
#   name                = each.value.virtualnetwork1
#   resource_group_name = each.value.resource_group_name
#   address_space       = each.value.vnet01addressspace
#   location            = each.value.location
# }

# resource "azurerm_virtual_network" "vnet02" {
#   for_each = var.vnetpeering
#   name                = each.value.virtualnetwork2
#   resource_group_name = each.value.resource_group_name
#   address_space       = each.value.vnet02addressspace
#   location            = each.value.location
# }

# resource "azurerm_virtual_network_peering" "vnet01tovnet02" {
#   for_each = var.vnetpeering
#   name                      = each.value.vnetpeering1
#   resource_group_name       = each.value.resource_group_name
#   virtual_network_name      = each.value.virtual_network_name
#   remote_virtual_network_id = data.azurerm_virtual_network.remote_virtual_network_id[each.key].id
# }

# resource "azurerm_virtual_network_peering" "vnet02tovnet01" {
#   for_each = var.vnetpeering
#   name                      = each.value.vnetpeering2
#   resource_group_name       = each.value.resource_group_name
#   virtual_network_name      = each.value.virtual_network_name
#   remote_virtual_network_id = data.azurerm_virtual_network.remote_virtual_network_id[each.key].id
# }
# data "azurerm_virtual_network" "remote_virtual_network_id1" {
# for_each = var.vnetpeering
#   name                = each.value.remote_virtual_network_id1
#   resource_group_name = each.value.resource_group_name
# }
# data "azurerm_virtual_network" "remote_virtual_network_id2" {
# for_each = var.vnetpeering
#   name                = each.value.remote_virtual_network_id2
#   resource_group_name = each.value.resource_group_name
# }