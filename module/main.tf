resource "azurerm_public_ip" "main" {
  count               = var.create_public_ip ? 1 : 0
  name                = "${var.virtual_machine_hostname}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  domain_name_label   = "${var.virtual_machine_hostname}-pip"
  tags                = var.tags
}


resource "azurerm_network_interface" "main" {
  name                = "${var.virtual_machine_hostname}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  ip_configuration {
    name                          = "ipconfiguration1"
    subnet_id                     = var.network_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = length(azurerm_public_ip.main.*.id) > 0 ? element(concat(azurerm_public_ip.main.*.id, list("")),0) : ""
  }
}


resource "azurerm_virtual_machine" "vm" {
  name                  = var.virtual_machine_hostname
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = azurerm_network_interface.main.*.id
  vm_size               = var.virtual_machine_size
  tags                  = var.tags
  
  storage_os_disk {
    name              = "${var.virtual_machine_hostname}-osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = var.managed_disk_os_disk_type
  }

  delete_os_disk_on_termination = var.delete_disks_on_termination
  delete_data_disks_on_termination = var.delete_disks_on_termination

  storage_image_reference {
    publisher = var.virtual_machine_publisher
    offer     = var.virtual_machine_offer
    sku       = var.virtual_machine_sku
    version   = var.virtual_machine_version
  }

  os_profile {
   computer_name  = var.virtual_machine_hostname
   admin_username = var.virtual_machine_admin_username
   admin_password = var.virtual_machine_admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = var.disable_password_authentication

    dynamic ssh_keys {
      for_each = var.enable_ssh_key ? [var.vm_ssh_key] : []
      content {
        path     = "/home/${var.virtual_machine_admin_username}/.ssh/authorized_keys"
        key_data = var.vm_ssh_key
      }
    }
  }

}