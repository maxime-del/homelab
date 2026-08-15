variable "name" {
  description = "VM Name"
  type        = string
}

variable "vm_id" {
  description = "VM id on Proxmox cluster"
  type        = number
}

variable "node_name" {
  description = "Node name"
  type        = string
}

variable "template_vm_id" {
  description = "Cloud-init template to be cloned"
  type        = number
}

variable "cores" {
  description = "CPU core count"
  type        = number
  default     = 2
}

variable "memory_mb" {
  description = "RAM"
  type        = number
  default     = 4096
}

variable "disk_size_gb" {
  description = "Disk size in Go"
  type        = number
  default     = 32
}

variable "datastore_id" {
  description = "Datastore"
  type        = string
  default     = "local-lvm"
}

variable "network_bridge" {
  description = "Network bridge interface"
  type        = string
  default     = "vmbr0"
}

variable "ip_address" {
  description = "Static IP addr"
  type        = string
}

variable "gateway" {
  description = "Gateway"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH pub key"
  type        = string
}

variable "cloud_init_username" {
  description = "Cloud-init user"
  type        = string
  default     = "ubuntu"
}

variable "tags" {
  description = "Tags Proxmox"
  type        = list(string)
  default     = []
}
