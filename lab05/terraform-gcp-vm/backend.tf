terraform {
  required_version = ">= 1.14.2"

  cloud {

    organization = "aek676"

    workspaces {
      name = "cloud-computing"
    }
  }
}
