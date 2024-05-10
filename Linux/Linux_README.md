Azure Resource Deployment Configuration

# Overview
This document outlines the configuration variables required for deploying resources to Microsoft Azure using the Linux deployment template.

# Configuration Variables

Source File Breakdown

## Main.tf
- **subscription_id**

Description: Azure Subscription ID

This variable represents the unique identifier for your Azure subscription. This can be obtained within the subscription details in Azure

- **tenant_id**

Description: Azure Tenant ID

The Azure Tenant ID is a unique identifier for your Azure Active Directory (AAD) tenant. This can be obtained within the subscription details in Azure

- **client_id**

Description: Azure Client ID

The Azure Client ID, also known as Application ID, is a unique identifier assigned to an application when it is registered in Azure Active Directory. 


- **client_secret**

Description: Client Secret

The Client Secret is a secure credential associated with the Azure Client ID.

## locals.tf
- **resource_group_name**

Description: Name of the resource group where the VMs will be stored

This variable specifies the name of the Azure resource group where the virtual machines (VMs) and associated resources will be deployed. 

- **location**

Description: The Azure location where the resources will be stored

The location parameter specifies the Azure region where the resources will be deployed.

- **virtual_network**

Description: The Virtual Network details that will be used for the Virtual Machine

The virtual_network block can be modified to change the name of the VNET as well as the address space that the VNET will use.

## networking.tf
- **azurerm_subnet**

Description: Will modify the subnet details. Fields that can be modified include: name, address_prefixes

- **azurerm_network_security_group**

Description: Will modify the network security group details. Fields that can be modified include: security_rule

- **azurerm_network_interface**

Description: Will modify the network interface details that will be associated with the Virtual Machine. Fields that can be modified include: name, ip_configuration - name, private_ip_address_allocation.

- **azurerm_public_ip**

Description: Will modify the public IP details for the Virtual Machine. Fields that can be modified include: name, allocation_method. This variable is not required and can be removed if no public IP is desired for the VM. 

## virtualmachines.tf
- **azurerm_linux_virtual_machine**

Description: Will modify the Virtual Machine details. Fields that can be modified include: name, size, admin_username, admin_password. The default VM size configured in this template is the Standard_B1s size. Additional VM sizes can be located in the Microsoft documentation: https://learn.microsoft.com/en-us/azure/virtual-machines/sizes

- **os_disk**

Description: Will modify the OS Disk details for the Virtual Machine. Fields that can be modified include: caching and storage_account_type.

- **source_image_reference**

Description: Will modify the image that will be pulled from the Azure Image Marketplace. Please locate the appropriate image using the directions on the Microsoft documentation prior to modifying the fields. https://learn.microsoft.com/en-us/azure/virtual-machines/windows/cli-ps-findimage

# Usage
Before running the provided code, ensure that you have the necessary Azure credentials and update the values of the configuration variables accordingly. These variables are essential for authenticating with Azure and specifying the deployment settings. Make any desired changes before initializing the Terraform instance. 
