# *** YOUR CODE HERE ***
# Definir 3 variables
# * gcp_username inicializada con el nombre de usuario en GCP
# * gcp_project inicializada con el nombre del proyecto en GCP
# * gcp_bucket_name inicializada con el nombre del bucket a crear en Google Storage
# **********************

variable "gcp_username" {
  description = "GCP username"
  default     = "aek676"
}

variable "gcp_project" {
  description = "GCP project"
  default     = "cc2026-aek676"
}

variable "gcp_bucket_name" {
  description = "GCP bucket"
  default     = "cc2026-aek676-bucket"
}
