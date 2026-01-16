terraform {
  required_providers {
    openstack = {
      source  = "terraform-proivider-openstack/opensatack"
      version = "~> 1.53.0"
    }
  }
}

provider "openstack" {
  user_name   = var.openstack_user_name
  tenant_name = var.openstack_tenant_name
  password    = var.openstack_password
  auth_url    = var.opensatack_auth_url
}
