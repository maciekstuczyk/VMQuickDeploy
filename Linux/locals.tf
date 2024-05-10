#Defining local variables
locals {
  resource_group_name = "Linux_RSG"
  
  location = "East US"
  
  network_security_grp = "Linux_NetSecGroup"
  
  virtual_network = {
    name = "Linux_VNET"
    address_space = "10.0.0.0/16"
  }

}