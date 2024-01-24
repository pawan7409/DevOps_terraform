resource "azurerm_subnet_network_security_group_association" "nsgsubnet" {
  for_each                  = var.nsgsubnet01
  subnet_id                 = each.value.subnet_id
  network_security_group_id = each.value.network_security_group_id
}