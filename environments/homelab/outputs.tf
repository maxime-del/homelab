output "master_ip" {
  description = "k8s master IP"
  value       = module.k8s_master.ipv4_address
}

output "worker_ips" {
  description = "IPs of k8s workers"
  value       = { for k, w in module.k8s_workers : k => w.ipv4_address }
}
