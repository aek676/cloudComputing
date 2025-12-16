resource "google_cloud_run_v2_service" "web_estatica" {
  name                = "cloudrun-service"
  location            = "us-central1"
  deletion_protection = false
  ingress             = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = "gcr.io/cc2026-aek676/web-estatica-basica:v0"
      ports {
        container_port = 80
      }
    }

  }
}

resource "google_cloud_run_v2_service_iam_member" "public_access" {
  name     = google_cloud_run_v2_service.web_estatica.name
  location = google_cloud_run_v2_service.web_estatica.location
  project  = google_cloud_run_v2_service.web_estatica.project

  role   = "roles/run.invoker"
  member = "allUsers"
}
