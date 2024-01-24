resource "azurerm_virtual_network" "vnet" {
  for_each=var.vnet
 
  name                =each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  address_space       = each.value.address_space


  # dynamic "subnet" {
  #   for_each = var.subnets == null ? {} : var.subnets
  #   content {
  #     name           = subnet.value.name
  #     address_prefix = subnet.value.address_prefix
  #     security_group = subnet.value.security_group
  #   }

  # }

}

