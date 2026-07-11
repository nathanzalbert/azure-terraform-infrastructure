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

# Creates the Resource Group.
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

# Creates the Virtual Network.
resource "azurerm_virtual_network" "main" {
  name                = var.virtual_network_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  address_space       = var.virtual_network_address_space

  tags = var.tags
}

# Creates the workload subnet.
resource "azurerm_subnet" "workload" {
  name                 = var.workload_subnet_name
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = var.workload_subnet_address_prefixes
}

# Creates the Azure Route Table.
resource "azurerm_route_table" "workload" {
  name                = var.route_table_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  bgp_route_propagation_enabled = true

  tags = var.tags
}

# Creates a user-defined route.
#
# Traffic destined for the specified address prefix will be
# forwarded to the virtual appliance IP address.
resource "azurerm_route" "to_virtual_appliance" {
  name                   = var.route_name
  resource_group_name    = azurerm_resource_group.main.name
  route_table_name       = azurerm_route_table.workload.name
  address_prefix         = var.route_address_prefix
  next_hop_type          = "VirtualAppliance"
  next_hop_in_ip_address = var.virtual_appliance_ip_address
}

# Associates the Route Table with the workload subnet.
resource "azurerm_subnet_route_table_association" "workload" {
  subnet_id      = azurerm_subnet.workload.id
  route_table_id = azurerm_route_table.workload.id
}