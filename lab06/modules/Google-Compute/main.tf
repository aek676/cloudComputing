resource "google_compute_instance" "mysql_vm" {
  name         = "mysql-vm"
  zone         = "us-central1-c"
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

resource "google_compute_instance" "api_vm" {
  name         = "api-vm"
  zone         = "us-central1-c"
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

  metadata_startup_script = templatefile("${path.root}/setup-api-docker.tpl", {
    mysql_ip = google_compute_instance.mysql_vm.network_interface[0].access_config[0].nat_ip
  })

  tags = ["api"]
}

resource "google_compute_firewall" "allow_api_ssh" {
  name    = "allow-api-ssh"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["api"]
}

resource "google_compute_instance" "app_vm" {
  name         = "app-vm"
  zone         = "us-central1-c"
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

  metadata_startup_script = templatefile("${path.root}/setup-app-docker.tpl", {
    BOOK_API_HOST = google_compute_instance.api_vm.network_interface[0].access_config[0].nat_ip
  })

  tags = ["app"]
}

resource "google_compute_firewall" "allow_app_ssh" {
  name    = "allow-app-ssh"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["app"]
}

