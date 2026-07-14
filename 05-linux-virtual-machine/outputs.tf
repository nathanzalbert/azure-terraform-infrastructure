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

output "network_interface_name" {
  description = "Name of the created Network Interface."
  value       = azurerm_network_interface.main.name
}

output "private_ip_address" {
  description = "Private IP address assigned to the Linux VM."
  value       = azurerm_network_interface.main.private_ip_address
}

output "public_ip_address" {
  description = "Public IP address assigned to the Linux VM."
  value       = azurerm_public_ip.main.ip_address
}

output "virtual_machine_name" {
  description = "Name of the Linux Virtual Machine."
  value       = azurerm_linux_virtual_machine.main.name
}

output "virtual_machine_id" {
  description = "Resource ID of the Linux Virtual Machine."
  value       = azurerm_linux_virtual_machine.main.id
}

output "ssh_connection_command" {
  description = "Command used to connect to the Linux VM through SSH."
  value       = "ssh ${var.admin_username}@${azurerm_public_ip.main.ip_address}"
}