variable "pve_endpoint" {
  description = "URL de l'API Proxmox, ex: https://192.168.1.50:8006/"
  type        = string
}

variable "pve_api_token" {
  description = "Token API Proxmox (format: user@realm!tokenid=secret). Injecter via TF_VAR_pve_api_token, jamais en dur."
  type        = string
  sensitive   = true
}

variable "pve_insecure" {
  description = "Ignorer la vérification du certificat TLS (true si certificat auto-signé)"
  type        = bool
  default     = true
}

variable "node_name" {
  description = "Nom du noeud Proxmox cible"
  type        = string
  default     = "pve"
}

variable "template_vm_id" {
  description = "ID du template cloud-init à cloner pour toutes les VMs"
  type        = number
  default     = 9000
}

variable "ssh_public_key" {
  description = "Clé publique SSH injectée sur toutes les VMs"
  type        = string
}

variable "network_gateway" {
  description = "Passerelle réseau commune"
  type        = string
  default     = "192.168.1.1"
}
