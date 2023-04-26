# vSphere Linux VM
![Terraform CI](https://github.com/iquzart/terraform-vsphere-vm/workflows/Terraform%20CI/badge.svg) 
[![License](https://img.shields.io/:license-mit-blue.svg?style=flat-square)](https://badges.mit-license.org)
Terraform module to create vSphere Linux VM.

## Features
```
1. Multiple network interfaces (Management and Service).
2. VM Folder support.
3. Clone from existing template.
```

## Usage
```
module "vm" {
source                       = "github.com/iquzart/terraform-vsphere-vm"

vm_name                      = "node-01"
vm_host_name                 = "node-01"
management_ipv4_address      = "xx.xx.xx.xx"
service_ipv4_address         = "yy.yy.yy.yy"
vm_cpus                      = "2"
vm_memory                    = "2048"
vm_folder                    = "Parent Folder Name/Sub Folder Name"
vm_disk_size                 = "30"
vsphere_server               = var.vsphere_server
vsphere_user                 = var.vsphere_user 
vsphere_password             = var.vsphere_password  
datacenter                   = var.datacenter
cluster_name                 = var.cluster_name
datastore_name               = var.datastore_name
management_network           = var.management_network
service_network              = var.service_network
template_name                = var.template_name
vm_guest_id                  = var.vm_guest_id
vm_time_zone                 = var.vm_time_zone
vm_domain_name               = var.vm_domain_name
vm_ipv4_gateway              = var.vm_ipv4_gateway
vm_dns_servers               = var.vm_dns_servers
dns_suffix_list              = var.dns_suffix_list
}
```

## TFVARS (Sample)
```
# Variables to authenticate to the vCenter
vsphere_server     = "vcenter.example.com"
vsphere_user       = "username@example.com"
vsphere_password   = "password"

datacenter         = ""
cluster_name       = ""
datastore_name     = ""
management_network = ""
service_network    = ""
template_name      = ""


# Linux VM Variables
vm_domain_name  = "example.com"
vm_time_zone    = "Asia/Dubai"
vm_ipv4_gateway = "xx.xx.xx.1"
vm_dns_servers  = ["xx.xx.xx.xx",
                    "yy.yy.yy.yy",
                  ]
dns_suffix_list = ["example.com"]
```

## License
MIT

## Author Information
Muhammed Iqbal <iquzart@hotmail.com>