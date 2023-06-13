// Configure the Google Cloud provider
provider "google" {
  region      = "us-east1"
}
// Create a new instance
resource "google_compute_instance" "default" {
 //project      = "${google_project_services.project.project}"
 zone         = "us-east1-b"
 name         = var.vm_name
 machine_type = "f1-micro"
 boot_disk {
   initialize_params {
     image = "ubuntu-1804-bionic-v20201014"
   }
 }
 network_interface {
   network = "default"
   access_config {
    // leave empty to create a new Ephemeral IP
   }
 }
}
variable "vm_name" {
  default = "auto-test-tf-template-google"
  description = "Name for VM to be created"
}
output "instance_id" {
 value = google_compute_instance.default.self_link
}
