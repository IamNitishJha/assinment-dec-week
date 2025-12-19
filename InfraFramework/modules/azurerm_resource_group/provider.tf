terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.50.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "nitishjha-rg"
    storage_account_name = "nitisggg"
    container_name       = "tfstate"
    key                  = "nitish.terraform.tfstate"
  }
}

provider "azurerm" {
    features {}
    subscription_id = ""
}


