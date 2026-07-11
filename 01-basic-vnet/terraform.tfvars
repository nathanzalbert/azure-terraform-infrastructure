resource_group_name = "rg-basic-vnet-lab"
location            = "East US"

virtual_network_name          = "vnet-basic-lab"
virtual_network_address_space = ["10.0.0.0/16"]

subnet_name             = "snet-web"
subnet_address_prefixes = ["10.0.1.0/24"]

tags = {
  Environment = "Development"
  Project     = "Azure-Terraform-Lab"
  ManagedBy   = "Terraform"
}
