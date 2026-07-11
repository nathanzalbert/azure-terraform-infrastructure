# 03 - Azure Route Tables

This Terraform lab creates an Azure Route Table and associates it with a subnet.

## What is a route table?

A route table controls where network traffic is sent.

Azure automatically creates system routes, but custom user-defined routes can override some of Azure's default routing behavior.

A route includes:

- A destination address prefix
- A next-hop type
- An optional next-hop IP address

## Architecture

```text
Resource Group
└── Virtual Network: 10.2.0.0/16
    ├── Virtual appliance example: 10.2.0.4
    │
    └── Workload Subnet: 10.2.1.0/24
        └── Route Table: rt-workload
            └── Destination: 172.16.0.0/16
                Next hop: 10.2.0.4
```

## Traffic flow

```text
Workload
   |
   v
Workload Subnet
   |
   v
Route Table
   |
   v
Virtual Appliance: 10.2.0.4
   |
   v
Destination Network: 172.16.0.0/16
```

## Resources created

- One Azure Resource Group
- One Azure Virtual Network
- One workload subnet
- One Azure Route Table
- One user-defined route
- One subnet-to-route-table association

## Route details

| Setting | Value |
|---|---|
| Route name | route-to-onpremises |
| Destination | 172.16.0.0/16 |
| Next-hop type | Virtual appliance |
| Next-hop IP | 10.2.0.4 |

## Files

- `main.tf` creates the Azure resources and custom route.
- `variables.tf` defines the configurable values.
- `terraform.tfvars` supplies the values for this lab.
- `outputs.tf` displays details about the created resources.

## Important note

The IP address `10.2.0.4` represents a sample firewall or network virtual appliance.

This lab does not create that appliance. Traffic will not successfully reach the destination until a working device is configured at that IP address.

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