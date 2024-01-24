terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.85.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "pawan-rg"
    storage_account_name = "storage3465755"
    container_name       = "container2"
    key                  = "rg.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}