#VMware vSphere Provider
provider "vsphere" {  
  #Set of variables used to connect to the vCenter
  vsphere_server = var.vsphere_server 
  user           = var.vsphere_user
  password       = var.vsphere_password

  #If you have a self-signed cert
  allow_unverified_ssl = true
}