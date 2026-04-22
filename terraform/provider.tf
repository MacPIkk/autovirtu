terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc3"
    }
  }
}

provider "proxmox" {
  pm_api_url          = "${var.PROXMOX_VE_ENDPOINT}/api2/json"
  pm_api_token_id     = split("=", var.PROXMOX_VE_API_TOKEN)[0]
  pm_api_token_secret = split("=", var.PROXMOX_VE_API_TOKEN)[1]
  pm_tls_insecure     = true
}
