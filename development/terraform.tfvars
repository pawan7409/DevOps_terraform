rg-name = {
  rg1 = {
    name     = "pawan-rg"
    location = "west Europe"
    tags = {
      "key" = "value"
} } }
vnet = {
  vnet01 = {

    name                = "vnet01"
    location            = "central india"
    resource_group_name = "pawan-rg"
    address_space       = ["10.0.0.0/16"]
  },
  vnet02 = {

    name                = "vnet02"
    location            = "central india"
    resource_group_name = "pawan-rg"
    address_space       = ["10.0.0.0/16"]
  }

}
# vnetpeering = {
#   vnetpeering1 = {
#     virtualNetwork1           = "vnet01"
#     resource_group_name       = "pawan-rg"
#     vnet01addressspace        = ["10.0.0.0/16"]
#     vnet02addressspace        = ["10.0.2.0/16"]
#     location                  = "central india"
#     virtualNetwork2           = "vnet02"
#     vnetpeering1              = "vnet01tovnet02"
#     virtual_network_name      = "vnet01"
#     remote_virtual_network_id1 = "vnet02"
#     remote_virtual_network_id2="vnet01"
#     vnetpeering2              = "vnet02tovnet01"

#   }
# }
subnet = {
  subnet1 = {
    name                 = "subnet1"
    resource_group_name  = "pawan-rg"
    virtual_network_name = "vnet01"
    address_prefixes     = "10.0.0.0/24"

  }
  subnet2 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "pawan-rg"
    virtual_network_name = "vnet01"
    address_prefixes     = "10.0.2.0/24"

  }
  subnet3 = {
    name                 = "subnet3"
    resource_group_name  = "pawan-rg"
    virtual_network_name = "vnet01"
    address_prefixes     = "10.0.3.0/24"

  }
}
pip = {
  pip1 = {
    name                = "pip1"
    resource_group_name = "pawan-rg"
    location            = "central india"
    allocation_method   = "Static"
  }
  # pip2 = {
  #   name                = "pip2"
  #   resource_group_name = "pawan-rg"
  #   location            = "central india"
  #   allocation_method   = "Static"
  # }


}
NSG = {
  nsg = {
    name                 = "nsg34"
    location             = "central india"
    resource_group_name  = "pawan-rg"
    ipname               = "pip1"
    subnetname           = "subnet1"
    virtual_network_name = "vnet01"
    resource_group_name  = "pawan-rg"


  }

}
sg = {
  sg1 = {
    name                   = "first"
    priority               = "100"
    destination_port_range = "22"
  },
  sg2 = {
    name                   = "2nd"
    priority               = "101"
    destination_port_range = "80"
  },


}
nsgsubnet01 = {
  nsgsubnet = {
    nsgsubnet            = "nsg34"
    resource_group_name  = "pawan-rg"
    subnetname           = "subnet1"
    virtual_network_name = "vnet01"

  }
}


nic = {
  frontendnic1 = {
    name                = "frontendnic"
    location            = "central india"
    resource_group_name = "pawan-rg"
    # subnet_id                     = "/subscriptions/7b50ca88-25f1-4f6a-a426-06baa8bfa998/resourceGroups/pawan-rg/providers/Microsoft.Network/virtualNetworks/vnet01/subnets/subnet1"
    private_ip_address_allocation = "Dynamic"
    # public_ip_address_id          = "/subscriptions/7b50ca88-25f1-4f6a-a426-06baa8bfa998/resourceGroups/pawan-rg/providers/Microsoft.Network/publicIPAddresses/pip1"
    ipname               = "PublicIPAddress"
    subnetname           = "subnet1"
    virtual_network_name = "vnet01"


  }
  frontendnic2 = {
    name                = "frontendnic2"
    location            = "central india"
    resource_group_name = "pawan-rg"
    # subnet_id                     = "/subscriptions/7b50ca88-25f1-4f6a-a426-06baa8bfa998/resourceGroups/pawan-rg/providers/Microsoft.Network/virtualNetworks/vnet01/subnets/subnet1"
    private_ip_address_allocation = "Dynamic"
    # public_ip_address_id          = "/subscriptions/7b50ca88-25f1-4f6a-a426-06baa8bfa998/resourceGroups/pawan-rg/providers/Microsoft.Network/publicIPAddresses/pip2"
    ipname               = "PublicIPAddress"
    subnetname           = "subnet1"
    virtual_network_name = "vnet01"
  }
}

vms = {
  vm01 = {
    name                = "frontend1"
    resource_group_name = "pawan-rg"
    location            = "central india"
    size                = "Standard_D2as_v4"
    # admin_username                  = "vm01"
    # admin_password                  = "Rjil@12345678"
    disable_password_authentication = false
    # network_interface_ids           = ["/subscriptions/b46c125c-073e-4204-83e3-4c2eef053249/resourceGroups/pawan-rg/providers/Microsoft.Network/networkInterfaces/frontendnic2"]
    #  azurekeyvaultname="locker54"
    nicname           = "frontendnic"
    azurekeyvaultname = "locker6979"


  }
  vm02 = {
    name                = "backendvm"
    resource_group_name = "pawan-rg"
    location            = "central india"
    size                = "Standard_D2as_v4"
    # admin_username                  = "vm01"
    # admin_password                  = "Rjil@12345678"
    disable_password_authentication = false
    # network_interface_ids           = ["/subscriptions/b46c125c-073e-4204-83e3-4c2eef053249/resourceGroups/pawan-rg/providers/Microsoft.Network/networkInterfaces/frontendnic"]
    azurekeyvaultname = "locker6979"
    nicname           = "frontendnic2"


  }


}

sqlservers = {

  sqlserver1 = {
    name                         = "mssqlserver34785367"
    resource_group_name          = "pawan-rg"
    location                     = "central india"
    version                      = "12.0"
    administrator_login          = "serversql01"
    administrator_login_password = "Rjil@12345678"

  }
}
sqldatabase = {
  sqldatabase1 = {
    name                = "sqldatabase256789"
    resource_group_name = "pawan-rg"
    location            = "central india"
    server_name         = "mssqlserver34785367"


  }
}
azurekeyvault = {
  azurekeyvault = {
    name                = "locker6979"
    location            = "west Europe"
    resource_group_name = "pawan-rg"
  }

}
lbn = {
  # lbn1 = {
  #   pipname             = "lbnpip"
  #   resource_group_name = "pawan-rg"
  #   location            = "central india"
  #   lbname              = "loadbalancer"
  #   lbnbackend          = "backendpl"
  #   lbrulename          = "ipconfig"
  #   hpname              = "probe"
  #   allocation_method   = "Static"
  #   ipname              = "PublicIPAddress"




  # }
}
backassocia = {
  # backassocia1 = {
  #   lbname              = "loadbalancer"
  #   resource_group_name = "pawan-rg"
  #   location            = "central india"
  #   lbbackendpoolname   = "backendpl"
  #   nicname             = "frontendnic"
  #   ipconfig            = "frontendnic"
  # }
  # backassocia2 = {
  #   lbname              = "loadbalancer"
  #   resource_group_name = "pawan-rg"
  #   location            = "central india"
  #   lbbackendpoolname   = "backendpl"
  #   nicname             = "frontendnic2"
  #   ipconfig            = "frontendnic2"
  # }
}
bastions = {
  bastion = {

    pipname              = "pipbastion"
    resource_group_name  = "pawan-rg"
    location             = "central india"
    name                 = "azbastion"
    subnetname           = "AzureBastionSubnet"
    virtual_network_name = "vnet01"

  }
}
applicationgateway = {
  appgateway = {
    name                = "appgateway"
    resource_group_name = "pawan-rg"
    location            = "central india"
    subnetname          = "subnet3"
    vnetname            = "vnet01"
    publicipname        = "pip1"

  }
}
