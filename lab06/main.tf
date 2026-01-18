module "Google-Storage" {
  source = "./modules/Google-Storage"
}

module "Google-Compute" {
  source  = "./modules/Google-Compute"
  ssh_key = var.ssh_key
}

# module "OpenStack" {
#   source              = "./modules/OpenStack"
# }
