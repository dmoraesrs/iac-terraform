variable "create_public_ip" {
  description = "If true assign a public IP to the VM"
  type = bool
  default = false
}

# Resource Group Variables
variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

# Network Interfaces Variables

variable "network_subnet_id" {
  type = string
}

# Virtual Machine Variables
# Reference: https://docs.microsoft.com/en-us/azure/virtual-machines/windows/cli-ps-findimage

variable "virtual_machine_size" {
  type = string
  default = "Standard_DS1_v2"
}

variable "virtual_machine_publisher" {
  type = string
  default = "Canonical"
}

variable "virtual_machine_offer" {
  type = string
  default = "UbuntuServer"
}

variable "virtual_machine_sku" {
  type = string
  default = "18.04-LTS"
}

variable "virtual_machine_version" {
  type = string
  default = "latest"
}

variable "virtual_machine_hostname" {
  type = string
}

variable "virtual_machine_admin_username" {
  type = string
}

variable "virtual_machine_admin_password" {
  type = string
}

variable "managed_disk_os_disk_type" {
  type = string
  default = "Standard_LRS"
}

variable "delete_disks_on_termination" {
  type = bool
  default = true
}

variable "disable_password_authentication" {
  type = bool
  default = false
}

variable "enable_ssh_key" {
  type = bool
  default = false
}

variable "vm_ssh_key" {
  type = string
  default = ""
}

variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
}





