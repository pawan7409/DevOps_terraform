module "resourcegroup" {
  source  = "../modules/resourcegroup"
  rg-name = var.rg-name
}

# module "virtualnetwork" {
#   source     = "../modules/virtualnetworks"
#   depends_on = [module.resourcegroup]
#   vnet       = var.vnet


# }
# # module "vnetpeering" {
# #   source      = "../modules/vnetpeering"
# #   depends_on  = [module.resourcegroup, module.virtualnetwork]
# #   vnetpeering = var.vnetpeering
# # }



# module "subnet" {
#   source     = "../modules/subnets"
#   depends_on = [module.virtualnetwork]
#   subnet     = var.subnet


# }

# module "ipconfigure" {
#   source     = "../modules/publicip"
#   depends_on = [module.resourcegroup]
#   pip        = var.pip

# }

# module "azurerm_network_security_group" {
#   source     = "../modules/networksecuritygrp"
#   depends_on = [module.resourcegroup]
#   NSG        = var.NSG
#   sg         = var.sg

# }
# module "securitygroupassociation" {
#   source      = "../modules/securitygroupassociation"
#   depends_on  = [module.azurerm_network_security_group, module.resourcegroup, module.virtualnetwork]
#   nsgsubnet01 = var.nsgsubnet01

# }
# module "azurerm_network_interface" {
#   source     = "../modules/interface"
#   depends_on = [module.resourcegroup, module.subnet, module.ipconfigure]
#   nic        = var.nic

# }


# module "vms" {
#   source     = "../modules/vm"
#   depends_on = [module.resourcegroup, module.azurerm_network_interface]

#   vms = var.vms

# }
# module "sqlservers" {
#   source     = "../modules/azuresqlserver"
#   depends_on = [module.resourcegroup]
#   sqlservers = var.sqlservers

# }
# module "sqldatabase" {
#   source      = "../modules/azuresqldatabase"
#   depends_on  = [module.sqlservers]
#   sqldatabase = var.sqldatabase

# }
# module "azurekeyvault" {
#   source        = "../modules/azurekeyvault"
#   depends_on    = [module.resourcegroup]
#   azurekeyvault = var.azurekeyvault

# }
# module "loadbalancer" {
#   source     = "../modules/loadbalancer"
#   depends_on = [module.resourcegroup]
#   lbn        = var.lbn

# }
# module "lbbackendassociation" {
#   source      = "../modules/backendpoolassociation"
#   depends_on  = [module.loadbalancer]
#   backassocia = var.backassocia


# }
# # output "nics" {
# #   value = module.azurerm_network_interface.nics

# # }

# module "bastions" {
#   source     = "../modules/bastion"
#   depends_on = [module.resourcegroup]
#   bastions   = var.bastions

# }
# module "applicationgateway" {
#   source             = "../modules/applicationgateway"
#   depends_on         = [module.resourcegroup, module.ipconfigure]
#   applicationgateway = var.applicationgateway
# }
# module "appgwassociation" {
#   source           = "../modules/appgwbackpoolassociation"
#   depends_on       = [module.applicationgateway]
#   appgwassociation = var.appgwassociation
# }
# module "azurerm_web_application_firewall_policy" {
#   source             = "../modules/WAFV2"
#   depends_on         = [module.resourcegroup]
#   applicationgateway = var.applicationgateway

# }
# module "azurerm_storage_account" {
#   source         = "../modules/storageacoount"
#   depends_on     = [module.resourcegroup]
#   storageaccount = var.storageaccount
# }
# # module "azurerm_virtual_network"{
# #   source = "../modules/vnetpeering"
# #   depends_on = [ module.virtualnetwork ]
# #   vnetpeering = var.vnetpeering
# # }
# # module "azurerm_vpn_gateway" {
# #   source="../modules/VPNGW"
# #   depends_on =[module.virtualnetwork]
# #   vpngw= var.vpngw
# # }
# module "azurerm_availability_set" {
#   source = "../modules/availability_set"
#   depends_on=[module.resourcegroup]
#   availability_set=var.availability_set
  
# }
# module "azurerm_linux_virtual_machine_scale_set" {
#   source ="../modules/vmss"
#   depends_on=[module.resourcegroup ]
#   vmss= var.vmss
  
# }