resource "proxmox_vm_qemu" "web_servers" {
  count       = 2
  name        = "web-server-${count.index + 1}"
  target_node = var.PROXMOX_NODE
  clone       = var.template_name
  
  # Basic VM settings
  agent    = 1
  os_type  = "cloud-init"
  cores    = 2
  sockets  = 1
  cpu      = "host"
  memory   = 2048
  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disks {
    scsi {
      scsi0 {
        disk {
          size    = "20G"
          storage = "local-lvm"
        }
      }
    }
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  # Cloud-init settings
  ipconfig0 = "ip=dhcp"
  sshkeys   = var.ssh_key
}

resource "proxmox_vm_qemu" "haproxy" {
  name        = "lb-1"
  target_node = var.PROXMOX_NODE
  clone       = var.template_name
  
  agent    = 1
  os_type  = "cloud-init"
  cores    = 1
  sockets  = 1
  cpu      = "host"
  memory   = 1024
  scsihw   = "virtio-scsi-pci"
  bootdisk = "scsi0"

  disks {
    scsi {
      scsi0 {
        disk {
          size    = "10G"
          storage = "local-lvm"
        }
      }
    }
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }

  ipconfig0 = "ip=dhcp"
  sshkeys   = var.ssh_key
}
