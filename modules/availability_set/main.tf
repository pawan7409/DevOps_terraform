resource "azurerm_availability_set" "example" {
    for_each = var.availability_set
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  tags = {
    environment = "Production"
  }
}