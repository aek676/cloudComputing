terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.5.0"
    }
  }
}

provider "google" {
  credentials = file("${path.root}/gcp-identity.json")

  project = var.gcp_project
  region  = "us-central1"
  zone    = "us-central1-c"
}
