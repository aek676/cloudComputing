output "instance_ip" {
  description = "External IP address of the VM"
  value       = google_compute_instance.vm.network_interface[0].access_config[0].nat_ip
}

output "ssh_command" {
  description = "Example gcloud SSH command"
  value       = "gcloud compute ssh ${google_compute_instance.vm.name} --zone=us-central1-a --project=${var.gcp-project}"
}
