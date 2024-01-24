
data "azurerm_lb" "lbn" {
  for_each = var.backassocia
  name                = each.value.lbname
  resource_group_name = each.value.resource_group_name
}

data "azurerm_lb_backend_address_pool" "example" {
  for_each = var.backassocia
  name            = each.value.lbbackendpoolname
  loadbalancer_id = data.azurerm_lb.lbn[each.key].id
}
data "azurerm_network_interface" "nic2" {
  for_each = var.backassocia
   name                = each.value.nicname
  resource_group_name = each.value.resource_group_name
}
  
resource "azurerm_network_interface_backend_address_pool_association" "example" {
  for_each = var.backassocia
  network_interface_id    = data.azurerm_network_interface.nic2[each.key].id
  ip_configuration_name   = each.value.ipconfig
  backend_address_pool_id =data.azurerm_lb_backend_address_pool.example[each.key].id
}

# resource "azurerm_network_interface_backend_address_pool_association" "example" {
#   for_each = var.nics
#   network_interface_id    = each.value.id
#   ip_configuration_name   = each.value.name
#   backend_address_pool_id =data.azurerm_lb_backend_address_pool.example[each.key].id
# }
# output "nics" {
#   value = azurerm_network_interface.nic2
  
# }