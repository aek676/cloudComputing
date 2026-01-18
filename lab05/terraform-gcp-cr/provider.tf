terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.14.0"
    }
  }
  required_version = ">= 1.14.2"
}

provider "google" {
  project = var.gcp-project
  region  = "us-central1"
  zone    = "us-central1-a"
}
