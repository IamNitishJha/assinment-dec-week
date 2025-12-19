terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.50.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "ram-rg"
    storage_account_name = "ramstgacc1"
    container_name       = "tfstate"
    key                  = "raj.terraform.tfstate"
  }
}

provider "azurerm" {
    features {}
    subscription_id = "90ba3f99-29ea-4a71-8106-8a6775ca9f61"
}

