resource "azurerm_virtual_network" "hub-vnet" {
    name                = "hub-vnet"
    location            = local.location
    resource_group_name = local.resource_group_name
    address_space       = ["10.0.0.0/16"]

    tags = {
    environment = "hub-spoke"
    }

  depends_on = [
    azurerm_resource_group.RSG_1
  ]
}

resource "azurerm_subnet" "Hub-Subnet1" {
  name                 = "Hub-Subnet1"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.hub-vnet.name
  address_prefixes     = ["10.0.1.0/24"]

  depends_on = [
    azurerm_resource_group.RSG_1
  ]
}

resource "azurerm_subnet" "Hub-Subnet2" {
  name                 = "Hub-Subnet2"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.hub-vnet.name
  address_prefixes     = ["10.0.2.0/24"]

  depends_on = [
    azurerm_resource_group.RSG_1
  ]
}

resource "azurerm_subnet" "AzureBastionSubnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.hub-vnet.name
  address_prefixes     = ["10.0.3.0/26"]

  depends_on = [
    azurerm_resource_group.RSG_1
  ]
}