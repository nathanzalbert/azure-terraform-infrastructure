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

variable "tags" {
  description = "Tags assigned to Azure resources."
  type        = map(string)

  default = {
    Environment = "Lab"
    ManagedBy   = "Terraform"
  }
}
