# *** YOUR CODE HERE ***
# Crear un recurso google_storage_bucket para almacenar imágenes en Google Storage
#
# Crear en el bucket anteior dos recursos google_storage_bucket_object
# (uno para cada imagen de la carpeta ./images)
# Configurar la propiedad source desde la raíz del proyecto (./images/<imagen.jpg>)
#
# Definir una regla de acceso para objeto creado de forma que sea público
# Configurar google_storage_object_access_control así
#   role   = "READER"
#   entity = "allUsers"
# **********************

resource "google_storage_bucket" "bucket" {
  name     = var.gcp_bucket_name
  location = "US"
}

resource "google_storage_bucket_object" "image1" {
  name   = "el_enigma_de_la_habitacion_622.jpg"
  bucket = google_storage_bucket.bucket.name
  source = "${path.root}/images/el_enigma_de_la_habitacion_622.jpg"
}

resource "google_storage_bucket_object" "image2" {
  name   = "una_historia_de_espana.jpg"
  bucket = google_storage_bucket.bucket.name
  source = "${path.root}/images/una_historia_de_espana.jpg"
}

resource "google_storage_object_access_control" "public_rule1" {
  object = google_storage_bucket_object.image1.name
  bucket = google_storage_bucket.bucket.name
  role   = "READER"
  entity = "allUsers"
}

resource "google_storage_object_access_control" "public_rule2" {
  object = google_storage_bucket_object.image2.name
  bucket = google_storage_bucket.bucket.name
  role   = "READER"
  entity = "allUsers"
}
