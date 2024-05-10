# VMQuickDeploy
VMQuick Deploy is a set of Terraform templates that can quickly and effectively deploy Linux and Windows Server 2022 Virtual Machines. 
Along with provisioning virtual machines, VMQuick Deploy has an Azure Policy template that will apply Azure policies at a subscription level to help monitor and secure all VMs at a subscription level.
# Installation
Terraform can be installed using the Chocolatey Package Manager. Run Powershell as Administrator for the following steps:
1. Install the Chocolatey Package Manager:

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

2. Install Terraform using Chocolatey Package Manager

```
choco install terraform
```

3. Install VSCode using Chocolatey Package Manager

```
choco install vscode
```

# Getting Started
1. Clone/Download the Github repo
   
2. Open the folder which contains the VMQuickDeploy source files within VS Code

3. Using the integrated terminal, open the desired feature in VSCode Terminal

![image](https://github.com/maciekstuczyk/VmQuickDeploy/assets/83386742/ac1c0f01-28d1-41c9-91f1-b797738a1593)

4. Make any desired changes to the VM Template (Additional information is available within the documentation located in the source files)

5. Initialize Terraform using the following command:
```
Terraform init
```
6. Run the Terraform Template
```
Terraform apply
```
7. To remove created resources
```
Terraform destroy
```
# Features
- Quickly create/destroy Ubuntu 22.04 Linux Virtual Machines
- Quickly create/destroy Windows Server 2022 Virtual Machines
- Utilize the VNET Template to create entire virtual networks with multiple subnets and resources quickly
- Apply Azure Policies to apply monitoring and security at the subscription level
