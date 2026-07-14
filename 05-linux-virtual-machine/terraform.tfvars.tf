terraform {
  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Creates the Azure Resource Group.
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

# Creates the Azure Virtual Network.
resource "azurerm_virtual_network" "main" {
  name                = var.virtual_network_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = var.virtual_network_address_space

  tags = var.tags
}

# Creates the subnet where the Linux VM will be placed.
resource "azurerm_subnet" "main" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.subnet_address_prefixes
}

# Creates a static Standard public IP address.
resource "azurerm_public_ip" "main" {
  name                = var.public_ip_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = var.tags
}

# Creates the Network Security Group.
resource "azurerm_network_security_group" "main" {
  name                = var.network_security_group_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  tags = var.tags
}

# Allows SSH access only from a trusted public IP address.
resource "azurerm_network_security_rule" "allow_ssh" {
  name                        = "Allow-SSH-From-Trusted-IP"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = var.trusted_ip_address
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.main.name
  network_security_group_name = azurerm_network_security_group.main.name
}

# Creates the Network Interface for the Linux VM.
resource "azurerm_network_interface" "main" {
  name                = var.network_interface_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name                          = "primary-ip-configuration"
    subnet_id                     = azurerm_subnet.main.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.main.id
  }

  tags = var.tags
}

# Associates the Network Security Group with the NIC.
resource "azurerm_network_interface_security_group_association" "main" {
  network_interface_id      = azurerm_network_interface.main.id
  network_security_group_id = azurerm_network_security_group.main.id
}

# Creates the Ubuntu Linux Virtual Machine.
resource "azurerm_linux_virtual_machine" "main" {
  name                = var.virtual_machine_name
  computer_name       = var.computer_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  size                = var.virtual_machine_size
  admin_username      = var.admin_username

  network_interface_ids = [
    azurerm_network_interface.main.id
  ]

  # Password login is disabled for better security.
  disable_password_authentication = true

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  os_disk {
    name                 = "${var.virtual_machine_name}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  boot_diagnostics {}

  tags = var.tags

  depends_on = [
    azurerm_network_interface_security_group_association.main
  ]
}