terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.14.0"
    }
  }
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
  zone    = var.gcp_zone
}
