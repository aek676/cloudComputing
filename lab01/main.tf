data "google_compute_image" "ubuntu_2004" {
  family  = "ubuntu-2204-lts"
  project = "ubuntu-os-cloud"
}

resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
  description   = "Allow incoming HTTP traffic"
}

resource "google_compute_instance" "vm" {
  name         = var.instance_name
  machine_type = var.machine_type

  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu_2004.self_link
      size  = var.boot_disk_size_gb
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }

  tags = ["http-server"]

  metadata_startup_script = <<-EOF
    #!/bin/bash
    set -e
    apt-get update
    DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 git
    systemctl enable apache2
    systemctl start apache2
    rm -rf /var/www/html/*
    git clone --depth 1 "${var.repo_url}" /var/www/html || true
    chown -R www-data:www-data /var/www/html
    systemctl restart apache2
  EOF

  service_account {
    scopes = ["cloud-platform"]
  }
}
