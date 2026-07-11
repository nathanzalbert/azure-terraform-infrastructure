<<<<<<< HEAD
resource_group_name = "rg-nsg-lab"
location            = "East US"

virtual_network_name          = "vnet-nsg-lab"
virtual_network_address_space = ["10.1.0.0/16"]

web_subnet_name             = "snet-web"
web_subnet_address_prefixes = ["10.1.1.0/24"]

management_subnet_name             = "snet-management"
management_subnet_address_prefixes = ["10.1.2.0/24"]

web_nsg_name        = "nsg-web"
management_nsg_name = "nsg-management"

# Replace this example with your actual public IP address.
# Keep /32 at the end to allow only that one IP address.
trusted_ip_address = "203.0.113.10/32"

tags = {
  Environment = "Development"
  Project     = "Network-Security-Groups-Lab"
  ManagedBy   = "Terraform"
}}
=======
resource_group_name = "rg-nsg-lab"
location            = "East US"

virtual_network_name          = "vnet-nsg-lab"
virtual_network_address_space = ["10.1.0.0/16"]

web_subnet_name             = "snet-web"
web_subnet_address_prefixes = ["10.1.1.0/24"]

management_subnet_name             = "snet-management"
management_subnet_address_prefixes = ["10.1.2.0/24"]

web_nsg_name        = "nsg-web"
management_nsg_name = "nsg-management"

# Replace this example with your actual public IP address.
# Keep /32 at the end to allow only that one IP address.
trusted_ip_address = "203.0.113.10/32"

tags = {
  Environment = "Development"
  Project     = "Network-Security-Groups-Lab"
  ManagedBy   = "Terraform"
}
>>>>>>> 1c87a692b07e613697e4ceca116b3559a6b96f6e
