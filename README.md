# Proxmox Infra Deployment (Terraform + Ansible)

This project automates the deployment of 3 VMs on Proxmox:
- 2 Nginx Web Servers (Backend)
- 1 HAProxy Load Balancer (Frontend)

## Prerequisites
- Proxmox server with a VM template (Ubuntu recommended)
- Terraform installed
- Ansible installed
- Proxmox API Token

## Step 1: Terraform Deployment
1. Navigate to the `terraform/` directory.
2. Create a `terraform.tfvars` file or set environment variables for the following:
   - `proxmox_api_url`
   - `proxmox_api_token_id`
   - `proxmox_api_token_secret`
   - `ssh_key` (Your public SSH key)
3. Run:
   ```bash
   terraform init
   terraform apply
   ```
4. Note the outputted IP addresses.

## Step 2: Ansible Configuration
1. Navigate to the `ansible/` directory.
2. Edit `inventory.ini` and replace `FILL_ME` with the IP addresses from Terraform.
3. Run the playbook:
   ```bash
   ansible-playbook -i inventory.ini playbook.yml
   ```

## Step 3: Verification
Access the HAProxy IP address in your browser. Refreshing should show you alternating messages from `web-1` and `web-2`.
