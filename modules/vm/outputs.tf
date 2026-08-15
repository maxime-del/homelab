output "vm_id" {
  description = "Proxmox ID"
  value       = proxmox_virtual_environment_vm.this.vm_id
}

output "name" {
  description = "VM Name"
  value       = proxmox_virtual_environment_vm.this.name
}

output "ipv4_address" {
  description = "QEMU Agent IPV4 addr"
  value       = try(proxmox_virtual_environment_vm.this.ipv4_addresses[1][0], null)
}
