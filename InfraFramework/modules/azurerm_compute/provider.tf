terraform {
  required_version = "v1.13.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.50.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = ""
    storage_account_name = ""
    container_name       = ""
    key                  = ""
  }
}

provider "azurerm" {
  features {}
  subscription_id = "90ba3f99-29ea-4a71-8106-8a6775ca9f61"
}

