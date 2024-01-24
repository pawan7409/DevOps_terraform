resource "azurerm_public_ip" "pip" {
  for_each            = var.lbn
  name                = each.value.pipname
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method
  sku                 = "Standard"


}

resource "azurerm_lb" "lbn" {
  for_each            = var.lbn
  name                = each.value.lbname
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = each.value.pipname
    public_ip_address_id = azurerm_public_ip.pip[each.key].id
  }
}

resource "azurerm_lb_backend_address_pool" "backendpool" {
  for_each        = var.lbn
  loadbalancer_id = azurerm_lb.lbn[each.key].id
  name            = each.value.lbnbackend
}

resource "azurerm_lb_probe" "healthprobe" {
  for_each        = var.lbn
  loadbalancer_id = azurerm_lb.lbn[each.key].id
  name            = each.value.hpname
  port            = 22
}
resource "azurerm_lb_rule" "azlbrule" {
  for_each                       = var.lbn
  loadbalancer_id                = azurerm_lb.lbn[each.key].id
  name                           = each.value.lbrulename
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = each.value.pipname
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.backendpool[each.key].id]
  probe_id                       = azurerm_lb_probe.healthprobe[each.key].id
}
