output "ip_publica" {
  description = "IP Publica del servidor web"
  value       = google_compute_instance.mi_servidor.network_interface[0].access_config[0].nat_ip
}
