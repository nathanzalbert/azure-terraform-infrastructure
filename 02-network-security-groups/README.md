<<<<<<< HEAD
# 02 - Azure Network Security Groups

This Terraform lab creates two Azure Network Security Groups and associates each NSG with a separate subnet.

## Architecture

```text
Resource Group
└── Virtual Network: 10.1.0.0/16
    ├── Web Subnet: 10.1.1.0/24
    │   └── Web NSG
    │       ├── Allow TCP 80 from Internet
    │       └── Allow TCP 443 from Internet
    │
    └── Management Subnet: 10.1.2.0/24
        └── Management NSG
            └── Allow TCP 22 from one trusted IP
```

## Resources created

- One Azure Resource Group
- One Azure Virtual Network
- One web subnet
- One management subnet
- One web Network Security Group
- One management Network Security Group
- HTTP inbound security rule
- HTTPS inbound security rule
- Restricted SSH inbound security rule
- Two subnet-to-NSG associations

## Files

- `main.tf` creates the Azure resources and security rules.
- `variables.tf` defines the configurable settings.
- `terraform.tfvars` supplies values for the variables.
- `outputs.tf` displays information about the deployed resources.

## Security rules

| NSG | Direction | Action | Protocol | Port | Source |
|---|---|---|---|---:|---|
| Web NSG | Inbound | Allow | TCP | 80 | Internet |
| Web NSG | Inbound | Allow | TCP | 443 | Internet |
| Management NSG | Inbound | Allow | TCP | 22 | Trusted IP |

Azure also automatically adds default NSG rules. Traffic that does not match a higher-priority custom rule is evaluated against those default rules.

## Before deployment

Open `terraform.tfvars` and replace:

```terraform
trusted_ip_address = "203.0.113.10/32"
```

with your actual public IP address using `/32` CIDR notation.

## Commands

```bash
az login
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

When finished:

```bash
terraform destroy
``````
=======
# 02 - Azure Network Security Groups

This Terraform lab creates two Azure Network Security Groups and associates each NSG with a separate subnet.

## Architecture

```text
Resource Group
└── Virtual Network: 10.1.0.0/16
    ├── Web Subnet: 10.1.1.0/24
    │   └── Web NSG
    │       ├── Allow TCP 80 from Internet
    │       └── Allow TCP 443 from Internet
    │
    └── Management Subnet: 10.1.2.0/24
        └── Management NSG
            └── Allow TCP 22 from one trusted IP
```

## Resources created

- One Azure Resource Group
- One Azure Virtual Network
- One web subnet
- One management subnet
- One web Network Security Group
- One management Network Security Group
- HTTP inbound security rule
- HTTPS inbound security rule
- Restricted SSH inbound security rule
- Two subnet-to-NSG associations

## Files

- `main.tf` creates the Azure resources and security rules.
- `variables.tf` defines the configurable settings.
- `terraform.tfvars` supplies values for the variables.
- `outputs.tf` displays information about the deployed resources.

## Security rules

| NSG | Direction | Action | Protocol | Port | Source |
|---|---|---|---|---:|---|
| Web NSG | Inbound | Allow | TCP | 80 | Internet |
| Web NSG | Inbound | Allow | TCP | 443 | Internet |
| Management NSG | Inbound | Allow | TCP | 22 | Trusted IP |

Azure also automatically adds default NSG rules. Traffic that does not match a higher-priority custom rule is evaluated against those default rules.

## Before deployment

Open `terraform.tfvars` and replace:

```terraform
trusted_ip_address = "203.0.113.10/32"
```

with your actual public IP address using `/32` CIDR notation.

## Commands

```bash
az login
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

When finished:

```bash
terraform destroy
```
>>>>>>> 1c87a692b07e613697e4ceca116b3559a6b96f6e
