resource "google_compute_network" "terraform_network" {
  name                    = var.gcp-network
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "terraform_subnet" {
  name          = "terraform-subnet"
  network       = google_compute_network.terraform_network.self_link
  ip_cidr_range = "10.0.0.0/24"
  region        = "us-central1"
}

resource "google_compute_firewall" "allow-http" {
  name    = "tf-fw-allow-http"
  network = google_compute_network.terraform_network.self_link
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  target_tags   = ["http"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow-ssh" {
  name    = "tf-fw-allow-ssh"
  network = google_compute_network.terraform_network.self_link
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
}
