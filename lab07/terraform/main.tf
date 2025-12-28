resource "google_compute_instance" "vm" {
  count        = var.instance_quantity
  name         = "${var.instance_name}-${count.index}"
  machine_type = var.machine_type
  zone         = var.gcp_zone

  boot_disk {
    initialize_params {
      image = var.image_name
    }
  }

  network_interface {
    network = "default"
    access_config {
      # Include this section to give the VM an external ip address
    }
  }

  metadata_startup_script = file("install-elk.sh")

  tags = ["elk-server", "http-server"]
}

resource "google_compute_firewall" "elk_rules" {
  name    = "allow-elk"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["5601", "9200", "5044", "80", "22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["elk-server"]
}
