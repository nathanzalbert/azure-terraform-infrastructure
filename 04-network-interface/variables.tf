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

variable "subnet_name" {
  description = "Name of the subnet."
  type        = string
}

variable "subnet_address_prefixes" {
  description = "Address prefixes assigned to the subnet."
  type        = list(string)
}

variable "network_interface_name" {
  description = "Name of the Azure Network Interface."
  type        = string
}

variable "network_security_group_name" {
  description = "Name of the Network Security Group attached to the NIC."
  type        = string
}

variable "private_ip_address_allocation" {
  description = "Determines whether the private IP is assigned dynamically or statically."
  type        = string
  default     = "Dynamic"

  validation {
    condition = contains(
      ["Dynamic", "Static"],
      var.private_ip_address_allocation
    )

    error_message = "Private IP allocation must be Dynamic or Static."
  }
}

variable "trusted_ip_address" {
  description = "Trusted public IPv4 address allowed to use SSH, written in CIDR notation."
  type        = string

  validation {
    condition     = can(cidrhost(var.trusted_ip_address, 0))
    error_message = "The trusted IP address must use valid CIDR notation, such as 203.0.113.10/32."
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