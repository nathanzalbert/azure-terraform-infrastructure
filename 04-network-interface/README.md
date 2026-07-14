# 04 - Azure Network Interface

This Terraform lab creates an Azure Network Interface and connects it to a subnet.

## What is a network interface?

A network interface, commonly called a NIC, provides network connectivity for an Azure virtual machine.

A NIC can contain:

- A private IP address
- A public IP address
- One or more IP configurations
- A subnet connection
- A Network Security Group association
- Load balancer associations

This lab creates the NIC only. A virtual machine will be created and attached to it in a later lab.

## Architecture

```text
Resource Group
└── Virtual Network: 10.3.0.0/16
    └── Workload Subnet: 10.3.1.0/24
        └── Network Interface
            ├── Dynamic private IP
            └── Network Security Group
                └── Allow TCP 22 from trusted IP
```

## Traffic flow

```text
Trusted Public IP
        |
        | SSH TCP 22
        v
Network Security Group
        |
        v
Network Interface
        |
        v
Workload Subnet
```

## Resources created

- One Azure Resource Group
- One Azure Virtual Network
- One subnet
- One Azure Network Interface
- One Network Security Group
- One restricted SSH security rule
- One NIC-to-NSG association

## Files

- `main.tf` creates the Azure networking resources.
- `variables.tf` defines the configurable settings.
- `terraform.tfvars` supplies values for the variables.
- `outputs.tf` displays information about the created NIC.

## Dynamic private IP allocation

The NIC uses:

```terraform
private_ip_address_allocation = "Dynamic"
```

Azure automatically selects an available private IP address from the subnet.

For this subnet:

```text
10.3.1.0/24
```

the NIC will receive an available address from that range.

## Important note

This lab does not create a virtual machine.

The Network Interface exists as a separate Azure resource and will be attached to a VM in the next lab.

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