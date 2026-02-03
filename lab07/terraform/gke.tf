resource "google_container_cluster" "gke_autopilot" {
  name     = var.gke_cluster_name
  location = var.gke_location

  enable_autopilot = true

  network    = "default"
  subnetwork = "default"

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "/17"
    services_ipv4_cidr_block = "/22"
  }

  deletion_protection = false

  depends_on = [google_compute_instance.vm]
}
