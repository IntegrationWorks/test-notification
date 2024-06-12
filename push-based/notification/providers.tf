terraform {
  required_version = "~>1.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }

    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.4.2"
    }

    null = {
      source  = "hashicorp/null"
      version = "~> 3.2.2"
    }
  }
}

provider "azurerm" {
  features {}
}


