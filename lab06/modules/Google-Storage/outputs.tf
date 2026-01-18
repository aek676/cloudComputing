output "image1_public_url" {
  value       = format("https://storage.googleapis.com/%s/%s", google_storage_bucket.bucket.name, google_storage_bucket_object.image1.name)
  description = "Public URL for el_enigma_de_la_habitacion_622.jpg"
}

output "image2_public_url" {
  value       = format("https://storage.googleapis.com/%s/%s", google_storage_bucket.bucket.name, google_storage_bucket_object.image2.name)
  description = "Public URL for una_historia_de_espana.jpg"
}
