variable "resource_group_name" {
  description = "Name of the Azure Resource Group."
  type        = string
}

variable "location" {
  description = "Azure region where resources will be created."
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the Azure Virtual Network."
  type        = string
}

variable "virtual_network_address_space" {
  description = "Address space assigned to the Virtual Network."
  type        = list(string)
}

variable "workload_subnet_name" {
  description = "Name of the workload subnet."
  type        = string
}

variable "workload_subnet_address_prefixes" {
  description = "Address prefixes assigned to the workload subnet."
  type        = list(string)
}

variable "route_table_name" {
  description = "Name of the Azure Route Table."
  type        = string
}

variable "route_name" {
  description = "Name of the user-defined route."
  type        = string
}

variable "route_address_prefix" {
  description = "Destination network that should use the custom route."
  type        = string

  validation {
    condition     = can(cidrhost(var.route_address_prefix, 0))
    error_message = "The route address prefix must use valid CIDR notation."
  }
}

variable "virtual_appliance_ip_address" {
  description = "Private IP address of the firewall or network virtual appliance."
  type        = string
}

variable "tags" {
  description = "Tags assigned to Azure resources."
  type        = map(string)

  default = {
    Environment = "Lab"
    ManagedBy   = "Terraform"
  }
}