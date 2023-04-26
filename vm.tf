

# Set VM parameteres
resource "vsphere_virtual_machine" "vm" {
    name             = var.vm_name
    num_cpus         = var.vm_cpus
    memory           = var.vm_memory
    guest_id         = var.vm_guest_id
    firmware         = data.vsphere_virtual_machine.vm_template.firmware
    resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
    datastore_id     = data.vsphere_datastore.datastore.id
    folder           = var.vm_folder

    boot_delay              = var.boot_delay
    efi_secure_boot_enabled = var.efi_secure_boot_enabled
    boot_retry_delay        = var.boot_retry_delay
    boot_retry_enabled      = var.boot_retry_enabled

    network_interface {
        network_id = data.vsphere_network.management_network.id
    }

    network_interface {
        network_id = data.vsphere_network.service_network.id
    }

    disk {
        label            = "disk0"
        thin_provisioned = true
        size             = var.vm_disk_size
    }

    clone {
        template_uuid = data.vsphere_virtual_machine.vm_template.id
        #Linux_options are required section, while deploying Linux virtual machines
        customize {
            timeout = var.clone_timeout_customize # minutes
            linux_options {
                host_name  = var.vm_host_name
                domain     = var.vm_domain_name
                time_zone  = var.vm_time_zone
            }
            # Interface for Management
            network_interface {
                ipv4_address = var.management_ipv4_address
                ipv4_netmask = var.management_ipv4_netmask
            }
            # Interface for Service
            network_interface {
                ipv4_address = var.vault_ipv4_address
                ipv4_netmask = var.vault_ipv4_netmask
            }
            ipv4_gateway = var.vm_ipv4_gateway
            dns_server_list = var.vm_dns_servers
            dns_suffix_list = var.dns_suffix_list
        }
    }
}
