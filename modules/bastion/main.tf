resource "azurerm_public_ip" "pip" {
    for_each = var.bastions
  name                = each.value.pipname
  location            = each.value.location
  resource_group_name =each.value.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "azurebastion" {
    for_each = var.bastions
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.subnettoddo[each.key].id
    public_ip_address_id = azurerm_public_ip.pip[each.key].id
  }
}
data "azurerm_subnet" "subnettoddo" {
  for_each = var.bastions
  name                 = each.value.subnetname
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}