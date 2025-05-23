terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}
provider "azurerm" {
  features {}  # Required for AzureRM provider
 
  skip_provider_registration = true
}

locals {
  resource_group = "1-67b54c8f-playground-sandbox"
  location = "EastUS"  
}

////////  Change all the variables above if you are using a plural sight sand box account ///////////


