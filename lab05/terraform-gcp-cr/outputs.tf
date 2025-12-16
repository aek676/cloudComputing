output "cloudrun_service_name" {
  description = "Nombre del servicio de Cloud Run"
  value       = google_cloud_run_v2_service.web_estatica.name
}

output "cloudrun_service_url" {
  description = "URL del servicio de Cloud Run"
  value       = google_cloud_run_v2_service.web_estatica.uri
}

output "cloudrun_service_location" {
  description = "Ubicación del servicio de Cloud Run"
  value       = google_cloud_run_v2_service.web_estatica.location
}

output "cloudrun_service_id" {
  description = "ID único del servicio de Cloud Run"
  value       = google_cloud_run_v2_service.web_estatica.id
}
