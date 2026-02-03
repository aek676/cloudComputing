output "elk_vm_public_ip" {
  description = "IP pública de la VM ELK"
  value       = google_compute_instance.vm[0].network_interface[0].access_config[0].nat_ip
}

output "elk_vm_internal_ip" {
  description = "IP interna de la VM ELK (usada por GKE)"
  value       = google_compute_instance.vm[0].network_interface[0].network_ip
}

output "kibana_url" {
  description = "URL para acceder a Kibana"
  value       = "http://${google_compute_instance.vm[0].network_interface[0].access_config[0].nat_ip}:5601"
}

output "elasticsearch_url" {
  description = "URL de Elasticsearch"
  value       = "http://${google_compute_instance.vm[0].network_interface[0].access_config[0].nat_ip}:9200"
}

output "gke_cluster_name" {
  description = "Nombre del cluster GKE"
  value       = google_container_cluster.gke_autopilot.name
}

output "gke_cluster_endpoint" {
  description = "Endpoint del cluster GKE"
  value       = google_container_cluster.gke_autopilot.endpoint
  sensitive   = true
}

output "gke_connect_command" {
  description = "Comando para conectarse al cluster GKE"
  value       = "gcloud container clusters get-credentials ${google_container_cluster.gke_autopilot.name} --region ${var.gke_location} --project ${var.gcp_project}"
}
