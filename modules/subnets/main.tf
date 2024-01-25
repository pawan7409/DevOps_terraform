resource "azurerm_subnet" "subnettoddo" {
  for_each             = var.subnet
  name                 = each.value.name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
  address_prefixes    = [each.value.address_prefixes]


}
#  dynamic "subnet" {
#     for_each = var.sub == null ? {} : var.sub
#     content {
#       name           = subnet.value.name
#       address_prefix = subnet.value.address_prefix
#       security_group=subnet.value.security_group
#     }

#   }

   

 
