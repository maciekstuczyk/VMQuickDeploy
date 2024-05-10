#Defining local variables
locals {
  resource_group_name = "RSG_1"
  
  location = "East US"
  
  virtual_network = {
    name = "hub-vnet"
    address_space = "10.0.0.0/16"
  }

  virtual_network2 = {
    name = "spoke-vnet"
    address_space = "11.0.0.0/16"
  }

}