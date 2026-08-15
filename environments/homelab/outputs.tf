output "master_ip" {
  description = "IP du master k8s"
  value       = module.k8s_master.ipv4_address
}

output "worker_ips" {
  description = "IPs des workers k8s"
  value       = { for k, w in module.k8s_workers : k => w.ipv4_address }
}
