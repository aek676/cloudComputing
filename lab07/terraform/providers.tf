terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.14.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.25"
    }
  }
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
  zone    = var.gcp_zone
}

provider "kubernetes" {
  host                   = "https://${google_container_cluster.gke_autopilot.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(google_container_cluster.gke_autopilot.master_auth[0].cluster_ca_certificate)
}

data "google_client_config" "default" {}
