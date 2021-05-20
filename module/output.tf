 output "virtual_machine_id" {
   value       = azurerm_virtual_machine.vm.id
 }

output "virtual_machine" {
  value       = azurerm_virtual_machine.vm
}

output "public_ip" {
  value       = azurerm_public_ip.main.*.ip_address
}

output "internal_ip" {
  value       = azurerm_network_interface.main.private_ip_address
}

output "network_interface" {
  value       = azurerm_network_interface.main
}