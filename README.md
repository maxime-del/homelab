# terraform with proxmox

Infrastructure as Code for my Proxmox VE cluster, managed with Terraform
and the [bpg/proxmox](https://registry.terraform.io/providers/bpg/proxmox/latest) provider.

## Structure

```
.
├── modules/
│   └── vm/                
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       └── versions.tf
├── environments/
│   └── homelab/           
│       ├── main.tf
│       ├── variables.tf
│       ├── outputs.tf
│       ├── providers.tf
│       ├── versions.tf
│       └── terraform.tfvars.example
├── .gitignore
└── .env.example
└── README.md
```


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