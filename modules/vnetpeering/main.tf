resource "azurerm_virtual_network_peering" "vnet01tovnet02" {
    for_each = var.vnetpeering
  name                      = "peer1to2"
  resource_group_name       = each.value.resource_group_name
  virtual_network_name      = each.value.vnet01name
  remote_virtual_network_id = data.azurerm_virtual_network.vnetpeering[each.value].id
}

resource "azurerm_virtual_network_peering" "vnet02tovnet01" {
    for_each = var.vnetpeering
  name                      = "peer2to1"
  resource_group_name       = each.value.resource_group_name
  virtual_network_name      = each.value.vnet02name
  remote_virtual_network_id = data.azurerm_virtual_network.vnetpeering[each.value].id
}
data "azurerm_virtual_network" "vnetpeering" {
    for_each = var.vnetpeering
  name                = "production"
  resource_group_name = each.value.resource_group_name
}