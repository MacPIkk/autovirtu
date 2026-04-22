variable "PROXMOX_VE_ENDPOINT" {
  description = "The API URL for your Proxmox server"
  type        = string
}

variable "PROXMOX_VE_API_TOKEN" {
  description = "The Token for Proxmox API (ID=Secret)"
  type        = string
  sensitive   = true
}

variable "PROXMOX_NODE" {
  description = "Proxmox node to deploy to"
  type        = string
}

variable "template_name" {
  description = "Name of the VM template to clone"
  type        = string
  default     = "ubuntu-22.04-template"
}

variable "ssh_key" {
  description = "Public SSH key to inject into VMs"
  type        = string
}
