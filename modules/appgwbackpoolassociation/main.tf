resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "example" {
    for_each = var.appgwassociation
  network_interface_id    = data.azurerm_network_interface.nic[each.key].id
  ip_configuration_name   = each.value.ipconfigname
  backend_address_pool_id = data.azurerm_application_gateway.appgateway[each.key].backend_address_pool.0.id
}

data "azurerm_network_interface" "nic" {
    for_each = var.appgwassociation
  name                = each.value.nicname
  resource_group_name = each.value.resource_group_name
}

data "azurerm_application_gateway" "appgateway" {
    for_each = var.appgwassociation
  name                = each.value.appgwname
  resource_group_name = each.value.resource_group_name
}
