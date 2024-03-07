terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.85.0"
    }
  }
     backend "azurerm" {
      resource_group_name  = "DoNotDeleteBackend"
      storage_account_name = "backendsa4subho"
      container_name       = "pawancon"
      key                  = "dev.terraform.tfstate"


  }
}

provider "azurerm" {
  features {}
}
