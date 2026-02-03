variable "gcp-project" {
  description = "GCP project"
  default     = "cc2026-aek676"
  type        = string
}

variable "instance_name" {
  description = "Name for the VM instance"
  type        = string
  default     = "ubuntu-web-vm"
}

variable "machine_type" {
  description = "Machine type for the instance"
  type        = string
  default     = "e2-medium"
}

variable "repo_url" {
  description = "HTTP(S) git repo to clone into /var/www/html"
  type        = string
  default     = "https://github.com/cloudacademy/static-website-example.git"
}

variable "boot_disk_size_gb" {
  description = "Boot disk size in GB"
  type        = number
  default     = 10
}
