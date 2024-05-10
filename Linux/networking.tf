#Creates the Network Security Group
resource "azurerm_network_security_group" "Linux_NetSecGroup" {
  name                = local.network_security_grp
  location            = local.location
  resource_group_name = local.resource_group_name

  security_rule{
    name = "SSH"
    priority = 102
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "22"
    source_address_prefix = "IP Address of source"
    destination_address_prefix = "*"
  }

  depends_on = [
    azurerm_resource_group.Linux_RSG
  ]
}

#Creates the Azure Virtual Network Instance
resource "azurerm_virtual_network" "Linux_VNET" {
  name                = local.virtual_network.name
  location            = local.location
  resource_group_name = local.resource_group_name
  address_space       = [local.virtual_network.address_space]

  depends_on = [
    azurerm_resource_group.Linux_RSG
  ]
}

#Creates the 1st Subnet
resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.Linux_VNET.name
  address_prefixes     = ["10.0.1.0/24"]

  depends_on = [
    azurerm_resource_group.Linux_RSG
  ]
}

#Creates the 2nd Subnet
resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.Linux_VNET.name
  address_prefixes     = ["10.0.2.0/24"]

  depends_on = [
    azurerm_resource_group.Linux_RSG
  ]
}

#Creates the Network Interface
resource "azurerm_network_interface" "Linux_NetInterface" {
  name                = "Linux_NetInterface"
  location            = local.location
  resource_group_name = local.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.Linux_PubIP.id
  }

  depends_on = [
    azurerm_resource_group.Linux_RSG,
    azurerm_public_ip.Linux_PubIP
  ]
}

#Associates the Network Interface with the previously created Network Security Group
resource "azurerm_network_interface_security_group_association" "Linux_NetInterface_Associate" {
  network_interface_id      = azurerm_network_interface.Linux_NetInterface.id
  network_security_group_id = azurerm_network_security_group.Linux_NetSecGroup.id
}

#Creates the Virtual Machine public IP
resource "azurerm_public_ip" "Linux_PubIP" {
  name                = "Linux_PubIP"
  resource_group_name = local.resource_group_name
  location            = local.location
  allocation_method   = "Static"

   depends_on = [
    azurerm_resource_group.Linux_RSG
  ]
}

#Associates the network security group with Subnet 1
resource "azurerm_subnet_network_security_group_association" "Subnet1_Associate" {
  subnet_id = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.Linux_NetSecGroup.id

  depends_on = [
    azurerm_subnet.subnet1
   ]
}

#Associates the network security group with Subnet 2
resource "azurerm_subnet_network_security_group_association" "Subnet2_Associate" {
  subnet_id = azurerm_subnet.subnet2.id
  network_security_group_id = azurerm_network_security_group.Linux_NetSecGroup.id

  depends_on = [
    azurerm_subnet.subnet2
   ]
}

