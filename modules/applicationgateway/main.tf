
# since these variables are re-used - a locals block makes this more maintainable
# locals {
#   backend_address_pool_name      = "${azurerm_virtual_network.example.name}-beap"
#   frontend_port_name             = "${azurerm_virtual_network.example.name}-feport"
#   frontend_ip_configuration_name = "${azurerm_virtual_network.example.name}-feip"
#   http_setting_name              = "${azurerm_virtual_network.example.name}-be-htst"
#   listener_name                  = "${azurerm_virtual_network.example.name}-httplstn"
#   request_routing_rule_name      = "${azurerm_virtual_network.example.name}-rqrt"
#   redirect_configuration_name    = "${azurerm_virtual_network.example.name}-rdrcfg"
# }

resource "azurerm_application_gateway" "appgateway" {
 for_each = var.applicationgateway
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
  
  
    name      = "${each.value.name}-giconf"
    subnet_id = data.azurerm_subnet.appgwsubnet[each.key].id
  }

  frontend_port {
    name = "${each.value.name}-feport"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "${each.value.name}-feip"
    public_ip_address_id = data.azurerm_public_ip.ppip[each.key].id
  }
#
  backend_address_pool {
    name = "${each.value.name}-beap"
  }

  backend_http_settings {
    name                  = "${each.value.name}-be-htst"
    cookie_based_affinity = "Disabled"
    path                  = "/"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = "${each.value.name}-httplstn"
    frontend_ip_configuration_name = "${each.value.name}-feip"
    frontend_port_name             = "${each.value.name}-feport"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "${each.value.name}-rqrt"
    priority                   = 9
    rule_type                  = "Basic"
    http_listener_name         = "${each.value.name}-httplstn"
    backend_address_pool_name  ="${each.value.name}-beap"
    backend_http_settings_name = "${each.value.name}-be-htst"
  }
}
data "azurerm_subnet" "appgwsubnet" {
  for_each = var.applicationgateway
  name                 = each.value.subnetname
  virtual_network_name = each.value.vnetname
  resource_group_name  = each.value.resource_group_name
}
data "azurerm_public_ip" "ppip" {
  for_each = var.applicationgateway
  name                = each.value.publicipname
  resource_group_name = each.value.resource_group_name
}

# resource "azurerm_network_interface" "example" {
#   name                = "example-nic"
#   location            = azurerm_resource_group.example.location
#   resource_group_name = azurerm_resource_group.example.name

#   ip_configuration {
#     name                          = "testconfiguration1"
#     subnet_id                     = azurerm_subnet.frontend.id
#     private_ip_address_allocation = "Dynamic"
#   }
# }

# resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "example" {
#   network_interface_id    = azurerm_network_interface.example.id
#   ip_configuration_name   = "testconfiguration1"
#   backend_address_pool_id = tolist(azurerm_application_gateway.network.backend_address_pool).0.id
# }