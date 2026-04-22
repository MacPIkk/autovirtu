output "web_ips" {
  value = [for vm in proxmox_vm_qemu.web_servers : vm.default_ipv4_address]
}

output "lb_ip" {
  value = proxmox_vm_qemu.haproxy.default_ipv4_address
}
