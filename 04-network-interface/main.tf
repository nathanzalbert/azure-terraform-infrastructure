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

# Creates the subnet where the network interface will be placed.
resource "azurerm_subnet" "main" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.subnet_address_prefixes
}

# Creates a Network Security Group for the network interface.
resource "azurerm_network_security_group" "main" {
  name                = var.network_security_group_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  tags = var.tags
}

# Allows inbound SSH traffic from one trusted public IP address.
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

# Creates the Azure Network Interface.
resource "azurerm_network_interface" "main" {
  name                = var.network_interface_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  # IP forwarding is disabled because this NIC is intended
  # for a normal workload rather than a router or firewall.
  ip_forwarding_enabled = false

  ip_configuration {
    name                          = "primary-ip-configuration"
    subnet_id                     = azurerm_subnet.main.id
    private_ip_address_allocation = var.private_ip_address_allocation
  }

  tags = var.tags
}

# Associates the Network Security Group with the NIC.
resource "azurerm_network_interface_security_group_association" "main" {
  network_interface_id      = azurerm_network_interface.main.id
  network_security_group_id = azurerm_network_security_group.main.id
}