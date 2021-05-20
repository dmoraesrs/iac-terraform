provider "azurerm" {
  version = "=2.0.0"
  features {}
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}
 
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
    name                = var.vnet_name
    address_space       = var.vnet_addresses
    location            = var.location
    resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
    name                 = var.subnet_name
    resource_group_name  = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefix       = var.subnet_addresses
}

module "compute_linux" {
  source  = "../module"
  resource_group_name = azurerm_resource_group.rg.name
  location = var.location
  create_public_ip = var.create_public_ip
  network_subnet_id = azurerm_subnet.subnet.id
  virtual_machine_hostname = var.virtual_machine_hostname
  virtual_machine_admin_username = var.virtual_machine_admin_username
  virtual_machine_admin_password = var.virtual_machine_admin_password
  enable_ssh_key = var.enable_ssh_key
  vm_ssh_key  = var.vm_ssh_key
  tags = var.tags
}