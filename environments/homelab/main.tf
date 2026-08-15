module "k8s_master" {
  source = "../../modules/vm"

  name           = "k8s-master-1"
  vm_id          = 9101
  node_name      = var.node_name
  template_vm_id = var.template_vm_id

  cores     = 2
  memory_mb = 4096

  ip_address = "192.168.1.61/24"
  gateway    = var.network_gateway

  ssh_public_key = var.ssh_public_key
  tags           = ["k8s", "master"]
}

module "k8s_workers" {
  source   = "../../modules/vm"
  for_each = { for i in range(1, 3) : "worker-${i}" => i }

  name           = "k8s-${each.key}"
  vm_id          = 9101 + each.value
  node_name      = var.node_name
  template_vm_id = var.template_vm_id

  cores     = 2
  memory_mb = 8192

  ip_address = "192.168.1.${61 + each.value}/24"
  gateway    = var.network_gateway

  ssh_public_key = var.ssh_public_key
  tags           = ["k8s", "worker"]
}
