provider "google" {
  //project = "${var.GCP_PROJECT_ID}"
  region = var.GCP_REGION_NAME
}
data "google_compute_network" "sdk-autotest-vpc-network" {
  name = var.GCP_COMPUTE_NETWORK_NAME
}
data "google_compute_subnetwork" "autotest-subnet" {
  name = "us-central1-a-ggl-sftg-mstr-03-subnet"
  region = var.GCP_REGION_NAME
}
resource "google_compute_instance" "default" {
  zone         = var.GCP_ZONE_NAME
  name         = var.vm_name
  machine_type = var.vm_machine_type
  boot_disk {
    initialize_params {
      image = var.vm_machine_image
    }
  }
  network_interface {
    network    = data.google_compute_network.sdk-autotest-vpc-network.self_link
    subnetwork = data.google_compute_subnetwork.autotest-subnet.self_link
    access_config {
      // leave empty to create a new Ephemeral IP
    }
  }
}
variable "vm_name" {
  type        = string
  default     = "auto-test-tf-template-google"
  description = "Name for Compute instance to be created"
}
variable "vm_machine_type" {
  type        = string
  default     = "f1-micro"
  description = "Compute instance type to be used"
}
variable "vm_machine_image" {
  type        = string
  default     = "ubuntu-1604-xenial-v20170328"
  description = "Name for Image to be used for compute instance"
}
variable "GCP_COMPUTE_NETWORK_NAME" {
  type        = string
  default     = "ggl-sftg-mstr-03"
  description = "Name for Network to be created"
}
variable "GCP_REGION_NAME" {
  type        = string
  default     = "us-central1"
  description = "Name for the region where resources to be deployed"
}
variable "GCP_ZONE_NAME" {
  type        = string
  default     = "us-central1-a"
  description = "Name for the region zone where resources to be deployed"
}
//Autoresolving projectId
variable "GCP_PROJECT_ID" {
  type        = string
  default     = "or2-msq-sftg-mstr-03-t1iylu"
  description = "Name for the project where resources to be deployed"
}
output "instance_id" {
  value = google_compute_instance.default.self_link
}
