resource "azurerm_virtual_network" "spoke-vnet" {
    name                = "spoke-vnet"
    location            = local.location
    resource_group_name = local.resource_group_name
    address_space       = ["11.0.0.0/16"]

    tags = {
    environment = "hub-spoke"
    }

  depends_on = [
    azurerm_resource_group.RSG_1
  ]
}

resource "azurerm_subnet" "Spoke-Subnet1" {
  name                 = "Spoke-Subnet1"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.spoke-vnet.name
  address_prefixes     = ["11.0.1.0/24"]

  depends_on = [
    azurerm_resource_group.RSG_1
  ]
}

resource "azurerm_subnet" "Spoke-Subnet2" {
  name                 = "Spoke-Subnet2"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.spoke-vnet.name
  address_prefixes     = ["11.0.2.0/24"]

  depends_on = [
    azurerm_resource_group.RSG_1
  ]
}

resource "azurerm_virtual_network_peering" "spoke1-hub-peer" {
    name                      = "spoke1-hub-peer"
    resource_group_name       = local.resource_group_name
    virtual_network_name      = azurerm_virtual_network.spoke-vnet.name
    remote_virtual_network_id = azurerm_virtual_network.hub-vnet.id

    allow_virtual_network_access = true
    allow_forwarded_traffic = true
    allow_gateway_transit   = false
    use_remote_gateways     = false
    depends_on = [azurerm_virtual_network.spoke-vnet, azurerm_virtual_network.hub-vnet]
}

resource "azurerm_virtual_network_peering" "hub-spoke1-peer" {
    name                      = "hub-spoke1-peer"
    resource_group_name       = local.resource_group_name
    virtual_network_name      = azurerm_virtual_network.hub-vnet.name
    remote_virtual_network_id = azurerm_virtual_network.spoke-vnet.id
    allow_virtual_network_access = true
    allow_forwarded_traffic   = true
    allow_gateway_transit     = false
    use_remote_gateways       = false
    depends_on = [azurerm_virtual_network.spoke-vnet, azurerm_virtual_network.hub-vnet]
}