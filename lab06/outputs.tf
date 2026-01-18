output "mysql_instance_name" {
  value       = module.Google-Compute.mysql_instance_name
  description = "Nombre de la instancia creada por el módulo Google-Compute"
}

output "mysql_external_ip" {
  value       = module.Google-Compute.mysql_external_ip
  description = "IP pública (externa) de la instancia creada por el módulo Google-Compute"
}

output "mysql_internal_ip" {
  value       = module.Google-Compute.mysql_internal_ip
  description = "IP interna de la instancia creada por el módulo Google-Compute"
}

output "api_instance_name" {
  value       = module.Google-Compute.api_instance_name
  description = "Nombre de la instancia API creada por el módulo Google-Compute"
}

output "api_external_ip" {
  value       = module.Google-Compute.api_external_ip
  description = "La dirección IP externa de la VM de la API creada por el módulo Google-Compute"
}

output "app_instance_name" {
  value       = module.Google-Compute.app_instance_name
  description = "Nombre de la instancia API creada por el módulo Google-Compute"
}

output "app_external_ip" {
  value       = module.Google-Compute.app_external_ip
  description = "La dirección IP externa de la VM de la API creada por el módulo Google-Compute"
}

output "image1_public_url" {
  value       = module.Google-Storage.image1_public_url
  description = "Public URL for el_enigma_de_la_habitacion_622.jpg from Google-Storage module"
}

output "image2_public_url" {
  value       = module.Google-Storage.image2_public_url
  description = "Public URL for una_historia_de_espana.jpg from Google-Storage module"
}
