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

Description: Name of the resource group where the VNETs will be stored

This variable specifies the name of the Azure resource group where the virtual machines (VMs) and associated resources will be deployed. 

- **location**

Description: The Azure location where the resources will be stored

The location parameter specifies the Azure region where the resources will be deployed.

- **virtual_network**

Description: The Virtual Network details for the hub VNET. The hub VNET is the central connection point with other spoke VNETs connected to it. This will allow connectivity and communication between different VNETs.

The virtual_network block can be modified to change the name of the VNET as well as the address space that the VNET will use.

- **virtual_network2**

Description: The Virtual Network details for the spoke VNET.

The virtual_network block can be modified to change the name of the VNET as well as the address space that the VNET will use.
