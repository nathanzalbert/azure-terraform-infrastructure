output "resource_group_name" {
  description = "Name of the created Resource Group."
  value       = azurerm_resource_group.main.name
}

output "resource_group_id" {
  description = "Resource ID of the created Resource Group."
  value       = azurerm_resource_group.main.id
}

output "virtual_network_name" {
  description = "Name of the created Virtual Network."
  value       = azurerm_virtual_network.main.name
}

output "virtual_network_id" {
  description = "Resource ID of the created Virtual Network."
  value       = azurerm_virtual_network.main.id
}

output "subnet_name" {
  description = "Name of the created subnet."
  value       = azurerm_subnet.main.name
}

output "subnet_id" {
  description = "Resource ID of the created subnet."
  value       = azurerm_subnet.main.id
}
