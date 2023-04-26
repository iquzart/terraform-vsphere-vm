data "vsphere_datacenter" "dc" {
name = var.datacenter
}

data "vsphere_compute_cluster" "cluster" {
name          = var.cluster_name
datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore" {
name          = var.datastore_name
datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "management_network" {
name          = var.management_network
datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "service_network" {
name          = var.service_network
datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "vm_template" {
name          = var.template_name
datacenter_id = data.vsphere_datacenter.dc.id
}