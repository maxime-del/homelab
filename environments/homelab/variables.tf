variable "pve_endpoint" {
  description = "Proxmox URL"
  type        = string
}

variable "pve_api_token" {
  description = "Proxmox API token"
  type        = string
  sensitive   = true
}

variable "pve_insecure" {
  description = "Ignore or not the TLS cert check"
  type        = bool
  default     = true
}

variable "node_name" {
  description = "Node name"
  type        = string
  default     = "pve"
}

variable "template_vm_id" {
  description = "ID of the cloud-init template used"
  type        = number
  default     = 9000
}

variable "ssh_public_key" {
  description = "SSH pub key"
  type        = string
}

variable "network_gateway" {
  description = "Gateway"
  type        = string
  default     = "192.168.1.1"
}
