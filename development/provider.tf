terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.85.0"
    }
  }
  #    backend "azurerm" {
  #     resource_group_name  = azurerm_resource_group.toddo_rg.pawan-rg
  #     storage_account_name = azurerm_storage_account.storage.storage56789
  #     container_name       = azurerm_storage_container.example.container1
  #     key                  = "modules.terraform.tfstate"


  # }
}

provider "azurerm" {
  features {}
}
