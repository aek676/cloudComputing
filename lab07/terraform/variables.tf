variable "gcp_project" {
  description = "The GCP project ID."
}

variable "gcp_region" {
  description = "The GCP region."
  default     = "us-central1"
}

variable "gcp_zone" {
  description = "The GCP zone."
  default     = "us-central1-a"
}

variable "gcp_credentials_file" {
  description = "Path to the GCP credentials JSON file."
  default     = ""
}

variable "instance_quantity" {
  description = "Number of instances to be created"
  default     = 1
}

variable "instance_name" {
  description = "Name for instances"
  default     = "elk-instance"
}

variable "image_name" {
  description = "Base image for instances (e.g., ubuntu-os-cloud/ubuntu-2204-lts)"
  default     = "ubuntu-os-cloud/ubuntu-2204-lts"
}

variable "machine_type" {
  description = "Machine type for instances (e.g., e2-medium)"
  default     = "e2-medium"
}

variable "gke_cluster_name" {
  description = "Name of the GKE cluster"
  default     = "gke-logging-cluster"
}

variable "gke_location" {
  description = "Location for GKE Autopilot cluster (region for Autopilot)"
  default     = "us-central1"
}

variable "elasticsearch_user" {
  description = "Elasticsearch username"
  default     = "elastic"
}

variable "elasticsearch_password" {
  description = "Elasticsearch password"
  default     = "changeme"
}
