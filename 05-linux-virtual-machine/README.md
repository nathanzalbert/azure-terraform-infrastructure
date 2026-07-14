# 05 - Azure Linux Virtual Machine

This Terraform lab deploys an Ubuntu Linux Virtual Machine and the Azure networking resources it needs.

## Architecture

```text
Internet
   |
   | SSH TCP 22
   v
Static Public IP
   |
   v
Network Security Group
   |
   v
Network Interface
   |
   v
Linux Virtual Machine
   |
   v
Subnet: 10.4.1.0/24
   |
   v
Virtual Network: 10.4.0.0/16
```

## Resources created

- One Azure Resource Group
- One Azure Virtual Network
- One subnet
- One static public IP address
- One Network Security Group
- One restricted SSH rule
- One Network Interface
- One Ubuntu Linux Virtual Machine
- One managed operating system disk

## Linux image

The VM uses Ubuntu Server 22.04 LTS:

```text
Publisher: Canonical
Offer: 0001-com-ubuntu-server-jammy
SKU: 22_04-lts-gen2
Version: latest
```

## VM size

The default VM size is:

```text
Standard_B1s
```

This is a small VM size intended for basic testing and learning. VM size availability can vary by Azure region and subscription.

## Authentication

Password authentication is disabled.

The VM uses an SSH public key:

```terraform
disable_password_authentication = true
```

This is safer than exposing a password-based login.

## Generate an SSH key on macOS or Linux

Run:

```bash
ssh-keygen -t ed25519
```

Press Enter to accept the default location.

Display your public key:

```bash
cat ~/.ssh/id_ed25519.pub
```

Copy the complete public key into `terraform.tfvars`.

Never copy the contents of:

```text
~/.ssh/id_ed25519
```

That is your private key and should remain secret.

## Trusted IP address

Find your public IP address, then add `/32` to the end.

Example:

```terraform
trusted_ip_address = "198.51.100.25/32"
```

Do not use this unless necessary:

```terraform
trusted_ip_address = "0.0.0.0/0"
```

That would expose SSH to the entire internet.

## Deploy the lab

```bash
az login
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

Enter:

```text
yes
```

when Terraform requests approval.

## Connect to the VM

After deployment, Terraform displays an SSH command similar to:

```bash
ssh azureadmin@20.100.10.25
```

You can also retrieve it with:

```bash
terraform output ssh_connection_command
```

## Destroy the lab

Delete the resources when you finish to prevent additional Azure charges:

```bash
terraform destroy
```