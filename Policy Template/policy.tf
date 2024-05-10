data "azurerm_subscription" "current" {}

data "azurerm_policy_definition" "AzureMonitorWindows" {
    display_name = "Deploy Dependency agent to be enabled on Windows virtual machines with Azure Monitoring Agent settings"
}

resource "azurerm_subscription_policy_assignment" "AzureMonitorWindows" {
    name = "Deploy Azure Monitor on Windows VM"
    policy_definition_id = data.azurerm_policy_definition.AzureMonitorWindows.id
    subscription_id = data.azurerm_subscription.current.id
    identity {
      type = "SystemAssigned"
    }
    location = "East US"
}


data "azurerm_policy_definition" "AzureMonitorLinux" {
    display_name = "Deploy Dependency agent for Linux virtual machines with Azure Monitoring Agent settings"
}

resource "azurerm_subscription_policy_assignment" "AzureMonitorLinux" {
    name = "Deploy Azure Monitor on Linux VM"
    policy_definition_id = data.azurerm_policy_definition.AzureMonitorLinux.id
    subscription_id = data.azurerm_subscription.current.id
    identity {
      type = "SystemAssigned"
    }
    location = "East US"
}


data "azurerm_policy_definition" "SecureBootLinux" {
    display_name = "[Preview]: Configure supported Linux virtual machines to automatically enable Secure Boot"
}

resource "azurerm_subscription_policy_assignment" "SecureBootLinux" {
    name = "Enable Secure boot on Linux VM"
    policy_definition_id = data.azurerm_policy_definition.SecureBootLinux.id
    subscription_id = data.azurerm_subscription.current.id
    identity {
      type = "SystemAssigned"
    }
    location = "East US"
}

data "azurerm_policy_definition" "SecureBootWindows" {
    display_name = "[Preview]: Configure supported Windows virtual machines to automatically enable Secure Boot"
}

resource "azurerm_subscription_policy_assignment" "SecureBootWindows" {
    name = "Enable Secure Boot on Windows VM"
    policy_definition_id = data.azurerm_policy_definition.SecureBootWindows.id
    subscription_id = data.azurerm_subscription.current.id
    identity {
      type = "SystemAssigned"
    }
    location = "East US"
}

data "azurerm_policy_definition" "AzureBackupVMs" {
    display_name = "Azure Backup should be enabled for Virtual Machines"
}

resource "azurerm_subscription_policy_assignment" "AzureBackupVMs" {
    name = "Enable Azure Backup on VMs"
    policy_definition_id = data.azurerm_policy_definition.AzureBackupVMs.id
    subscription_id = data.azurerm_subscription.current.id
}

data "azurerm_policy_definition" "AzureUpdates" {
    display_name = "[Preview]: System updates should be installed on your machines (powered by Update Center)"
}

resource "azurerm_subscription_policy_assignment" "AzureUpdates" {
    name = "System Updates should be installed on VMs via Update Center"
    policy_definition_id = data.azurerm_policy_definition.AzureUpdates.id
    subscription_id = data.azurerm_subscription.current.id
}




