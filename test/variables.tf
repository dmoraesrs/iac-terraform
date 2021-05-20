variable "resource_group_name" {
  type        = string
  description = "The name of an existing Resource Group"
}

variable "location" {
  type        = string
  description = "Define the region the Azure Key Vault should be created, you should use the Resource Group location"
}

variable "create_public_ip" {
  description = "If true assign a public IP to the VM"
  type = bool
  default = false
}

variable "vnet_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "vnet_addresses" {
  type = list(string)
}

variable "subnet_addresses" {
  type = string
}

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
  default = "sshkey"
}

variable "tags" {
  type        = map(string)
  description = "A map of the tags to use on the resources that are deployed with this module."
}
