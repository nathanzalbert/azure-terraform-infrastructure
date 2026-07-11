resource_group_name = "rg-route-table-lab"
location            = "East US"

virtual_network_name          = "vnet-route-table-lab"
virtual_network_address_space = ["10.2.0.0/16"]

workload_subnet_name             = "snet-workload"
workload_subnet_address_prefixes = ["10.2.1.0/24"]

route_table_name = "rt-workload"
route_name       = "route-to-onpremises"

# Traffic going to this destination network will use the custom route.
route_address_prefix = "172.16.0.0/16"

# Example private IP address of a firewall or virtual appliance.
virtual_appliance_ip_address = "10.2.0.4"

tags = {
  Environment = "Development"
  Project     = "Route-Tables-Lab"
  ManagedBy   = "Terraform"
}