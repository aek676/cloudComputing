variable "gcp-username" {
  description = "GCP user name"
  default     = "aek676"
  type        = string
}

variable "gcp-project" {
  description = "GCP project"
  default     = "cc2026-aek676"
  type        = string
}

variable "gcp-network" {
  description = "GCP network"
  default     = "terraform-network"
  type        = string
}

variable "ssh-key" {
  description = "SSH public key"
  type        = string
}
