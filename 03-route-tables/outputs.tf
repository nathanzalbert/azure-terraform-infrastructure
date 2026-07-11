output "resource_group_name" {
  description = "Name of the created Resource Group."
  value       = azurerm_resource_group.main.name
}

output "virtual_network_name" {
  description = "Name of the created Virtual Network."
  value       = azurerm_virtual_network.main.name
}

output "workload_subnet_name" {
  description = "Name of the workload subnet."
  value       = azurerm_subnet.workload.name
}

output "workload_subnet_id" {
  description = "Resource ID of the workload subnet."
  value       = azurerm_subnet.workload.id
}

output "route_table_name" {
  description = "Name of the created Route Table."
  value       = azurerm_route_table.workload.name
}

output "route_table_id" {
  description = "Resource ID of the created Route Table."
  value       = azurerm_route_table.workload.id
}

output "route_name" {
  description = "Name of the user-defined route."
  value       = azurerm_route.to_virtual_appliance.name
}

output "route_destination" {
  description = "Destination address prefix for the custom route."
  value       = azurerm_route.to_virtual_appliance.address_prefix
}

output "route_next_hop_ip" {
  description = "Private IP address of the next-hop virtual appliance."
  value       = azurerm_route.to_virtual_appliance.next_hop_in_ip_address
}