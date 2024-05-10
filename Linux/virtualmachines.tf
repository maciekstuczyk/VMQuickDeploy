resource "azurerm_linux_virtual_machine" "Ubuntu-VM01" {
  name = "Ubuntu-VM01"
  resource_group_name = local.resource_group_name
  location = local.location
  size = "Standard_B1s"
  admin_username = "adminuser"
  admin_password = "P@$$w0rd1234"
  disable_password_authentication = "false"
  network_interface_ids =[
    azurerm_network_interface.Linux_NetInterface.id
  ]

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer = "0001-com-ubuntu-server-jammy"
    sku = "22_04-lts-gen2"
    version = "latest"
  }

  depends_on = [
    azurerm_network_interface.Linux_NetInterface,
    azurerm_resource_group.Linux_RSG
   ]
}