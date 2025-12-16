module "gce-container" {
  source  = "terraform-google-modules/container-vm/google"
  version = "~> 3.0"

  container = {
    image = "gcr.io/cc2026-aek676/web-estatica-basica:v0"
  }

  restart_policy = "Always"
}


resource "google_compute_firewall" "regla_http" {
  name    = "permitir-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  target_tags   = ["servidor-web"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_instance" "mi_servidor" {
  name         = "mi-web-estatica"
  machine_type = "g1-small"

  boot_disk {
    initialize_params {
      image = module.gce-container.source_image
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }

  tags = ["servidor-web"]

  metadata = {
    gce-container-declaration = module.gce-container.metadata_value
    google-logging-enabled    = "true"
  }

  labels = {
    container-vm = module.gce-container.vm_container_label
  }

  service_account {
    scopes = ["cloud-platform"]
  }
}
