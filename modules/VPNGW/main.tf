resource "azurerm_virtual_wan" "vpnwan" {
    for_each = var.vpngw
  name                = each.value.wanname
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
}

resource "azurerm_virtual_hub" "example" {
    for_each = var.vpngw
  name                = each.value.hubname
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  virtual_wan_id      = data.azurerm_virtual_wan.wan[each.value].id
  address_prefix      = "10.0.1.0/24"
}

resource "azurerm_vpn_gateway" "example" {
    for_each = var.vpngw
  name                = each.value.vpngwname
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  virtual_hub_id      = data.azurerm_virtual_hub.hub[each.value].id
}
data "azurerm_virtual_wan" "wan" {
    for_each = var.vpngw
  name                = each.value.wanvpn
  resource_group_name = each.value.resource_group_name
}
data "azurerm_virtual_hub" "hub" {
    for_each = var.vpngw
  name                = each.value.hubname
  resource_group_name = each.value.resource_group_name
}