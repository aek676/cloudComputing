output "instance_name" {
  description = "Nombre de la instancia"
  value       = google_compute_instance.mysql_vm.name
}

output "external_ip" {
  description = "IP externa de la instancia"
  value       = google_compute_instance.mysql_vm.network_interface[0].access_config[0].nat_ip
}

output "internal_ip" {
  description = "IP interna de la instancia"
  value       = google_compute_instance.mysql_vm.network_interface[0].network_ip
}
