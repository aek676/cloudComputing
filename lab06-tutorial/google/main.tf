resource "google_compute_instance" "tf-vm" {
  name         = "tf-vm"
  zone         = "us-central1-c"
  machine_type = "n1-standard-1"
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
    }
  }

  tags = ["http"]

  metadata = {
    ssh-keys = "${var.gcp-username}:${trimspace(var.ssh-key)}"
  }

  metadata_startup_script = file("${path.module}/setup-docker.sh")
  network_interface {
    network    = google_compute_network.terraform_network.self_link
    subnetwork = google_compute_subnetwork.terraform_subnet.self_link

    access_config {

    }
  }
}
