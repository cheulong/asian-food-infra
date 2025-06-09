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
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resources-${var.env}"
  location = "Southeast Asia"
  tags = {
    environment = var.env
    created_by  = "Terraform"
  }
}
