resource "azurerm_network_interface" "nic" {
  for_each            = var.nic
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = each.value.ipname
    subnet_id                     = data.azurerm_subnet.subnettoddo[each.key].id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  # public_ip_address_id        =data.azurerm_public_ip.pip[each.key].id
  }
}
data "azurerm_subnet" "subnettoddo" {
  for_each = var.nic
  name                 = each.value.subnetname
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}

#  data "azurerm_public_ip" "pip" {
#   for_each = var.nic
#   name                = each.value.ipname
#   resource_group_name = each.value.resource_group_name
# }
  
