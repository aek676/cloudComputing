terraform {
  required_version = ">= 0.14.0"
  cloud {
    organization = "aek676"
    workspaces {
      name = "cloud-computing"
    }
  }
}
