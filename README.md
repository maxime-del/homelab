# homelab

Self-hosted homelab running on a Proxmox VE cluster, fully provisioned as code:
Terraform for the VMs, Ansible for OS/k3s configuration, and Kubernetes
(Kustomize) for the workloads running on top.

## Structure

```
.
├── modules/
│   └── vm/                     # reusable Terraform VM module
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── versions.tf
├── environments/
│   └── homelab/                # Terraform root module for this cluster
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       ├── providers.tf
│       ├── versions.tf
│       └── terraform.tfvars.example
├── playbooks/                   # Ansible: OS config + k3s install
│   ├── inventory/
│   ├── roles/
│   │   ├── k3s_master/
│   │   ├── k3s_worker/
│   │   └── data_disk/
│   └── playbook.yml
├── k3s/                          # Kubernetes manifests (Kustomize), deployed on the k3s cluster
│   ├── apps/
│   │   ├── sonarr/
│   │   ├── nginx/                # homepage/landing page
│   │   └── headlamp/             # Kubernetes web dashboard
│   ├── monitoring/                # kube-prometheus-stack (Grafana/Prometheus/Alertmanager)
│   ├── rbac/
│   └── kustomization.yaml
├── .gitignore
└── .env.example
└── README.md
```

## Architecture

- **Terraform** (`bpg/proxmox` provider) provisions 3 VMs on Proxmox (1 k3s master, 2 workers) from a cloud-init template.
- **Ansible** configures the OS and installs k3s (master + workers), with secrets stored in an encrypted vault.
- **k3s** (lightweight Kubernetes) runs the workloads, deployed via **Kustomize**, each service isolated in its own namespace.
- **Tailscale** (Kubernetes Operator) provides Zero Trust remote access: every service is exposed both on the LAN (Traefik Ingress) and remotely over the tailnet (Tailscale Ingress with automatic HTTPS), plus remote `kubectl` access via Tailscale's API Server Proxy.
- **kube-prometheus-stack** (Prometheus + Grafana + Alertmanager) provides monitoring/observability for the cluster.

## Prerequisites

1. An existing cloud-init template on the Proxmox node.
2. A Proxmox API token dedicated to Terraform:

   ```bash
   pveum user add terraform@pve
   pveum aclmod / -user terraform@pve -role PVEVMAdmin
   pveum user token add terraform@pve tf --privsep 0
   ```

3. Terraform >= 1.7.

## Usage

```bash
cd environments/homelab
cp terraform.tfvars.example terraform.tfvars

source .env

terraform init
terraform plan
terraform apply
```