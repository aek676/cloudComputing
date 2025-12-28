resource "google_container_cluster" "tutorial_cluster" {
  name     = "mi-primer-cluster-tutorial"
  location = "us-central1-a"

  remove_default_node_pool = true
  initial_node_count       = 1

  deletion_protection = false
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "mi-primer-node-pool-tutorial"
  location   = google_container_cluster.tutorial_cluster.location
  cluster    = google_container_cluster.tutorial_cluster.name
  node_count = 3

  node_config {
    machine_type = "g1-small"

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
