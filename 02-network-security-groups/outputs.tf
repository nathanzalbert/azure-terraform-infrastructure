<<<<<<< HEAD
output "resource_group_name" {
  description = "Name of the created Resource Group."
  value       = azurerm_resource_group.main.name
}

output "virtual_network_name" {
  description = "Name of the created Virtual Network."
  value       = azurerm_virtual_network.main.name
}

output "web_subnet_id" {
  description = "Resource ID of the web subnet."
  value       = azurerm_subnet.web.id
}

output "management_subnet_id" {
  description = "Resource ID of the management subnet."
  value       = azurerm_subnet.management.id
}

output "web_network_security_group_name" {
  description = "Name of the web Network Security Group."
  value       = azurerm_network_security_group.web.name
}

output "web_network_security_group_id" {
  description = "Resource ID of the web Network Security Group."
  value       = azurerm_network_security_group.web.id
}

output "management_network_security_group_name" {
  description = "Name of the management Network Security Group."
  value       = azurerm_network_security_group.management.name
}

output "management_network_security_group_id" {
  description = "Resource ID of the management Network Security Group."
  value       = azurerm_network_security_group.management.id
}}
}
=======
output "resource_group_name" {
  description = "Name of the created Resource Group."
  value       = azurerm_resource_group.main.name
}

output "virtual_network_name" {
  description = "Name of the created Virtual Network."
  value       = azurerm_virtual_network.main.name
}

output "web_subnet_id" {
  description = "Resource ID of the web subnet."
  value       = azurerm_subnet.web.id
}

output "management_subnet_id" {
  description = "Resource ID of the management subnet."
  value       = azurerm_subnet.management.id
}

output "web_network_security_group_name" {
  description = "Name of the web Network Security Group."
  value       = azurerm_network_security_group.web.name
}

output "web_network_security_group_id" {
  description = "Resource ID of the web Network Security Group."
  value       = azurerm_network_security_group.web.id
}

output "management_network_security_group_name" {
  description = "Name of the management Network Security Group."
  value       = azurerm_network_security_group.management.name
}

output "management_network_security_group_id" {
  description = "Resource ID of the management Network Security Group."
  value       = azurerm_network_security_group.management.id
}
>>>>>>> 1c87a692b07e613697e4ceca116b3559a6b96f6e
