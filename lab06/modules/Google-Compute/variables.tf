variable "gcp_project" {
  description = "GCP project"
  default     = "cc2026-aek676"
}

variable "gcp_username" {
  description = "GCP username"
  default     = "aek676"
}

variable "ssh_key" {
  description = "SSH public key"
  type        = string
}
