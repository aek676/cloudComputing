variable "openstack_user_name" {
  description = "The username for the Tenant."
  default     = "your-openstack-user"
}

variable "openstack_password" {
  description = "The user password."
  default     = "your-openstack-password"
}

variable "openstack_tenant_name" {
  description = "The name of the Tenant."
  default     = "your-openstack-project"
}

variable "openstack_auth_url" {
  description = "The endpoint url to connect to OpenStack."
  default     = "https://openstack.di.ual.es:5000/v3"
}

variable "openstack_keypair" {
  description = "The keypair to be used."
  default     = "your-openstack-keypair-name"
}

variable "openstack_network_name" {
  description = "The network name to attach to the instance."
  default     = "your-openstack-network-name"
}
