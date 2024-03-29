resource "azurerm_linux_virtual_machine" "vms" {
  for_each                        = var.vms
  name                            = each.value.name
  resource_group_name             = each.value.resource_group_name
  location                        = each.value.location
  size                            = each.value.size
  #  admin_username                  = data.azurerm_key_vault_secret.admin_username[each.key].value
  # admin_password                  = data.azurerm_key_vault_secret.admin_password[each.key].value
  admin_username = "vm01"
  admin_password="Rjil@12345678"
  disable_password_authentication = false
  network_interface_ids           = [data.azurerm_network_interface.nicdata[each.key].id]
  #  custom_data = base64encode(file("${path.module}/../../scripts/installed-nginx.sh"))
     custom_data = each.value.custom_data != null ? base64encode(file(each.value.custom_data)) : null



  # admin_ssh_key {
  #   username   = "adminuser"
  #   public_key = file("~/.ssh/id_rsa.pub")
  # }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}
# data "azurerm_key_vault" "locker7889" {
#   for_each = var.vms
#   name                = each.value.azurekeyvaultname
#   resource_group_name = each.value.resource_group_name

# }
# data "azurerm_key_vault_secret" "admin_username" {
#   for_each = var.vms
#   name         = "username"
#   key_vault_id = data.azurerm_key_vault.locker7889[each.key].id
# }
# data "azurerm_key_vault_secret" "admin_password" {
#   for_each = var.vms
#   name         = "password"
#   key_vault_id = data.azurerm_key_vault.locker7889[each.key].id
# }
data "azurerm_network_interface" "nicdata" {
  for_each = var.vms
  name                = each.value.nicname
  resource_group_name = each.value.resource_group_name
}

