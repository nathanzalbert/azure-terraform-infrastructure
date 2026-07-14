output "resource_group_name" {
  description = "Name of the created Resource Group."
  value       = azurerm_resource_group.main.name
}

output "virtual_network_name" {
  description = "Name of the created Virtual Network."
  value       = azurerm_virtual_network.main.name
}

output "subnet_name" {
  description = "Name of the created subnet."
  value       = azurerm_subnet.main.name
}

output "subnet_id" {
  description = "Resource ID of the created subnet."
  value       = azurerm_subnet.main.id
}

output "network_interface_name" {
  description = "Name of the created Network Interface."
  value       = azurerm_network_interface.main.name
}

output "network_interface_id" {
  description = "Resource ID of the created Network Interface."
  value       = azurerm_network_interface.main.id
}

output "private_ip_address" {
  description = "Private IP address assigned to the Network Interface."
  value       = azurerm_network_interface.main.private_ip_address
}

output "network_security_group_name" {
  description = "Name of the Network Security Group attached to the NIC."
  value       = azurerm_network_security_group.main.name
}

output "network_security_group_id" {
  description = "Resource ID of the Network Security Group."
  value       = azurerm_network_security_group.main.id
}