resource "azurerm_subnet_network_security_group_association" "nsgsubnet" {
  for_each                  = var.nsgsubnet01
  subnet_id                 = data.azurerm_subnet.subnettoddo[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg[each.key].id
}
data "azurerm_network_security_group" "nsg" {

for_each = var.nsgsubnet01
  name                = each.value.nsgsubnet
  resource_group_name = each.value.resource_group_name
}
data "azurerm_subnet" "subnettoddo" {
  for_each = var.nsgsubnet01
  name                 = each.value.subnetname
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}