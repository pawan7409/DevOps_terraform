# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "3.85.0"
#     }
#   }
#   backend "azurerm" {
#     resource_group_name  = "pawan-rg"
#     storage_account_name = "storage16789456"
#     container_name       = "container4"
#     key                  = "sql.terraform.tfstate"
#   }
# }

# provider "azurerm" {
#   features {}
# }