resource "google_compute_instance" "mysql_vm" {
  name         = "mysql-vm"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = 10
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }



  metadata = {
    ssh-keys = "${var.gcp_username}:${file("~/.ssh/id_rsa.pub")}"
  }

  metadata_startup_script = file("${path.root}/install_mysql.sh")

  tags = ["mysql-server"]
}

resource "google_compute_firewall" "allow_mysql_ssh" {
  name    = "allow-mysql-ssh"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22", "3306"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["mysql-server"]
}
