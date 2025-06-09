# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name = 'tfstateRG01'
    storage_account_name = 'tfstate0126626'
    container_name = 'pipetfstate'
    key = 'dev.tfstate'
  }
}

# Declare the variable for environment
variable "env" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
  default     = "development"
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  storage_use_azuread = true
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "Southeast Asia"
  tags = {
    environment = var.env
  }
}
