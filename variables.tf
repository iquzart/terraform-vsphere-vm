# Variables to authenticate to the vCenter
variable "vsphere_server" {
  description = "vSphere server"
  type        = string
}

variable "vsphere_user" {
  description = "vCenter username"
  type        = string
}

variable "vsphere_password" {
  description = "vCenter password"
  type        = string
  sensitive   = true
}

# Variables - vSphere environment
variable "datacenter" {
  description = "virtual datacenter name"
  type        = string
}

variable "cluster_name" {
  description = "virtual datacenter cluster name"
  type        = string
}

variable "datastore_name" {
  description = "data store name"
  type        = string
}

variable "management_network" {
  description = "Virtual Machine network - Management"
  type        = string
  default     = ""
}

variable "service_network" {
  description = "Virtual Machine network - Service"
  type        = string
  default     = ""
}

variable "template_name" {
  description = "Virtual Machine template name to clone"
  type        = string
}

# VM Folders
# variable "service_cluster_parent_folder" {
#   description = "service Cluster parent folder name"
#   type        = string
#   default     = ""
# }

# variable "service_cluster_child_folder" {
#   description = "service Cluster child folder name"
#   type        = string
#   default     = ""
# }

# Linux VM Variables
variable "vm_name" {
  description = "vSphere virtual machine name"
  type        = string
  default     = ""
}

variable "vm_cpus" {
  description = "vSphere virtual machine number of CPUs"
  type        = string
  default     = ""
}

variable "vm_memory" {
  description = "vSphere virtual machine amount of CPUs"
  type        = string
  default     = ""
}

variable "vm_guest_id" {
  description = "vSphere virtual machine grest OS type"
  type        = string
  default     = "rhel8_64Guest"
}

variable "vm_folder" {
  description = "vSphere Folder"
  type        = string
  default     = ""
}

variable "vm_disk_size" {
  description = "vSphere VM Disk Size"
  type        = string
  default     = ""
}

variable "vm_host_name" {
  description = "Virtual Machine hostname"
  type        = string
  default     = ""
}

variable "vm_domain_name" {
  description = "Virtual Machine domain name"
  type        = string
}

variable "vm_time_zone" {
  description = "Virtual Machine timezone"
  type        = string
}

variable "service_ipv4_address" {
  description = "Virtual Machine IPv4 Address - Service Network"
  type        = string
  default     = ""
}

variable "service_ipv4_netmask" {
  description = "Virtual Machine IPv4 net mask - Service Network"
  type        = string
  default     = "24"
}

variable "management_ipv4_address" {
  description = "Virtual Machine IPv4 Address - Management Network"
  type        = string
  default     = ""
}

variable "management_ipv4_netmask" {
  description = "Virtual Machine IPv4 net mask - Management Network"
  type        = string
  default     = "24"
}

variable "vm_ipv4_gateway" {
  description = "Virtual Machine IPv4 gateway"
  type        = string
}

variable "vm_dns_servers" {
  description = "Virtual Machine DNS server IPs"
  type        = list(string)
}

variable "dns_suffix_list" {
  description = "Virtual Machine DNS suffix list"
  type        = list(string)
}

variable "boot_delay" {
  description = "The number of milliseconds to wait before starting the boot sequence."
  type        = number
  default     = 5000
}

variable "efi_secure_boot_enabled" {
  description = "When the firmware type is set to is efi, this enables EFI secure boot."
  type        = bool
  default     = true
}

variable "boot_retry_delay" {
  type        = number
  default     = 10000
  description = "The number of milliseconds to wait before retrying the boot sequence. This only valid if boot_retry_enabled is true."
}

variable "boot_retry_enabled" {
  type        = bool
  default     = false
  description = "If set to true, a virtual machine that fails to boot will try again after the delay defined in boot_retry_delay."
}

variable "clone_timeout_customize" {
  type        = number
  default     = 60
  description = "The time, in minutes that Terraform waits for customization to complete before failing. Setting the value to 0 or a negative value disables the waiter altogether."
}
