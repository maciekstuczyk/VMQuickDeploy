#Defining local variables
locals {
  resource_group_name = "WindowsServer_RSG"
  
  location = "East US"
  
  network_security_grp = "WindowsServer_NetSecGroup"
  
  virtual_network = {
    name = "WindowsServer_VNET"
    address_space = "10.0.0.0/16"
  }

}