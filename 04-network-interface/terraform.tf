resource_group_name = "rg-network-interface-lab"
location            = "East US"

virtual_network_name          = "vnet-network-interface-lab"
virtual_network_address_space = ["10.3.0.0/16"]

subnet_name             = "snet-workload"
subnet_address_prefixes = ["10.3.1.0/24"]

network_interface_name      = "nic-workload-01"
network_security_group_name = "nsg-workload-nic"

private_ip_address_allocation = "Dynamic"

# Replace this example with your actual public IP address.
trusted_ip_address = "203.0.113.10/32"

tags = {
  Environment = "Development"
  Project     = "Network-Interface-Lab"
  ManagedBy   = "Terraform"
}