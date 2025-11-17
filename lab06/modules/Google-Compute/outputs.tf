output "mysql_instance_name" {
  description = "Nombre de la instancia MySQL"
  value       = google_compute_instance.mysql_vm.name
}

output "mysql_external_ip" {
  description = "IP externa de la instancia MySQL"
  value       = google_compute_instance.mysql_vm.network_interface[0].access_config[0].nat_ip
}

output "mysql_internal_ip" {
  description = "IP interna de la instancia MySQL"
  value       = google_compute_instance.mysql_vm.network_interface[0].network_ip
}

output "api_instance_name" {
  description = "Nombre de la instancia API"
  value       = google_compute_instance.api_vm.name
}

output "api_external_ip" {
  description = "La dirección IP externa de la VM de la API"
  value       = google_compute_instance.api_vm.network_interface[0].access_config[0].nat_ip
}
