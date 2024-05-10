#Initializing Terraform
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.97.1"
    }
  }
}

#Azure connection details
provider "azurerm" {
  subscription_id = " "
  tenant_id       = " "
  client_id       = " "
  client_secret   = " "
  features {

  }
}

#Creating initial Resource Group
resource "azurerm_resource_group" "Linux_RSG" {
  name     = local.resource_group_name
  location = local.location
}
