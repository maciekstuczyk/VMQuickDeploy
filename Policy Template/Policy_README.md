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

## Policy.tf
- **azurerm_policy_definition**

Description: This will define the policy that will be defined. display_name is the name of the policy that is located in the Microsoft documents or Azure within the Policy center. 

Available Azure policies can be found in the Microsoft documentation: https://learn.microsoft.com/en-us/azure/virtual-machines/policy-reference

- **azurerm_subscription_policy_assignment**

Description: Will modify the policy details that will be applied at the subscription level. 

**NOTE**: Each policy requires both a definition field to be configured and a matching assignment variable. Please note the exmaple below:
![image](https://github.com/maciekstuczyk/VMQuickDeploy/assets/83386742/8f04be6a-d2ef-4771-8e52-1b41a5e8aefb)
