module "resourcegroup" {
  source  = "../modules/resourcegroup"
  rg-name = var.rg-name
}

module "virtualnetwork" {
  source     = "../modules/virtualnetworks"
  depends_on = [module.resourcegroup]
  vnet       = var.vnet
 
    
  }




module "subnet" {
  source     = "../modules/subnets"
  depends_on = [module.virtualnetwork]
  subnet     = var.subnet


}

module "ipconfigure" {
  source = "../modules/ipconfig"
  depends_on = [ module.resourcegroup ]
  pip    = var.pip

}

module "azurerm_network_security_group" {
  source = "../modules/networksecuritygrp"
  depends_on = [ module.resourcegroup ]
  NSG=      var.NSG
  sg=var.sg
  
}
module "azurerm_network_interface" {
  source = "../modules/interface"
  depends_on = [ module.resourcegroup , module.subnet ,module.ipconfigure ]
  nic=var.nic
 
}


module "vms" {
  source = "../modules/vm"
  depends_on = [ module.resourcegroup , module.azurerm_network_interface ]
  
vms = var.vms
  
}
module "sqlservers" {
  source = "../modules/azuresqlserver"
  depends_on = [ module.resourcegroup ]
  sqlservers = var.sqlservers
  
}
module "sqldatabase" {
  source = "../modules/azuresqldatabase"
  depends_on = [ module.sqlservers ]
  sqldatabase = var.sqldatabase
  
}
module "azurekeyvault" {
  source = "../modules/azurekeyvault"
  depends_on = [ module.resourcegroup ]
  azurekeyvault = var.azurekeyvault
  
}
module "loadbalancer" {
  source = "../modules/loadbalancer"
  depends_on = [ module.resourcegroup ]
  lbn=var.lbn
  
}
module "lbbackendassociation" {
  source = "../modules/backendpoolassociation"
  depends_on = [ module.loadbalancer ]
  backassocia = var.backassocia
 
 
}
# output "nics" {
#   value = module.azurerm_network_interface.nics
  
# }
 
 module "bastions" {
  source = "../modules/bastion"
  depends_on = [ module.resourcegroup ]
  bastions = var.bastions
   
 }