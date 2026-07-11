<<<<<<< HEAD
variable "resource_group_name" {
  description = "Name of the Azure Resource Group."
  type        = string
}

variable "location" {
  description = "Azure region where the resources will be created."
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

variable "web_subnet_name" {
  description = "Name of the web subnet."
  type        = string
}

variable "web_subnet_address_prefixes" {
  description = "Address prefixes assigned to the web subnet."
  type        = list(string)
}

variable "management_subnet_name" {
  description = "Name of the management subnet."
  type        = string
}

variable "management_subnet_address_prefixes" {
  description = "Address prefixes assigned to the management subnet."
  type        = list(string)
}

variable "web_nsg_name" {
  description = "Name of the Network Security Group for the web subnet."
  type        = string
}

variable "management_nsg_name" {
  description = "Name of the Network Security Group for the management subnet."
  type        = string
}

variable "trusted_ip_address" {
  description = "Trusted public IPv4 address allowed to use SSH. Use CIDR notation, such as 203.0.113.10/32."
  type        = string

  validation {
    condition     = can(cidrhost(var.trusted_ip_address, 0))
    error_message = "The trusted IP address must use valid CIDR notation."
  }
}

variable "tags" {
  description = "Tags assigned to Azure resources."
  type        = map(string)

  default = {
    Environment = "Lab"
    ManagedBy   = "Terraform"
  }
}}
=======
variable "resource_group_name" {
  description = "Name of the Azure Resource Group."
  type        = string
}

variable "location" {
  description = "Azure region where the resources will be created."
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

variable "web_subnet_name" {
  description = "Name of the web subnet."
  type        = string
}

variable "web_subnet_address_prefixes" {
  description = "Address prefixes assigned to the web subnet."
  type        = list(string)
}

variable "management_subnet_name" {
  description = "Name of the management subnet."
  type        = string
}

variable "management_subnet_address_prefixes" {
  description = "Address prefixes assigned to the management subnet."
  type        = list(string)
}

variable "web_nsg_name" {
  description = "Name of the Network Security Group for the web subnet."
  type        = string
}

variable "management_nsg_name" {
  description = "Name of the Network Security Group for the management subnet."
  type        = string
}

variable "trusted_ip_address" {
  description = "Trusted public IPv4 address allowed to use SSH. Use CIDR notation, such as 203.0.113.10/32."
  type        = string

  validation {
    condition     = can(cidrhost(var.trusted_ip_address, 0))
    error_message = "The trusted IP address must use valid CIDR notation."
  }
}

variable "tags" {
  description = "Tags assigned to Azure resources."
  type        = map(string)

  default = {
    Environment = "Lab"
    ManagedBy   = "Terraform"
  }
}
>>>>>>> 1c87a692b07e613697e4ceca116b3559a6b96f6e
