resource "azurerm_windows_virtual_machine" "WinServ-VM01" {
  name = "WinServ-VM01"
  resource_group_name = local.resource_group_name
  location = local.location
  size = "Standard_B1s"
  admin_username = "adminuser"
  admin_password = "P@$$w0rd1234"
  network_interface_ids =[
    azurerm_network_interface.WindowsServer_NetInterface.id
  ]

  os_disk {
    caching = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer = "WindowsServer"
    sku = "2022-datacenter-azure-edition"
    version = "latest"
  }

  depends_on = [
    azurerm_network_interface.WindowsServer_NetInterface,
    azurerm_resource_group.WindowsServer_RSG
   ]
}