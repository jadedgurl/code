terraform {
  # This module is now only being tested with Terraform 1.0.x. However, to make upgrading easier, we are setting
  # 0.12.26 as the minimum version, as that version added support for required_providers with source URLs, making it
  # forwards compatible with 1.0.x code.
  required_version = ">= 0.12.26"
}

resource "google_compute_network_endpoint_group" "neg" {
  name         = "my-lb-neg"
  network      = google_compute_network.default.id
  subnetwork   = google_compute_subnetwork.default.id
  default_port = "90"
  zone         = "northamerica-northeast-1a"
}

resource "google_compute_network" "default" {
  name                    = "neg-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "default" {
  name          = "neg-subnetwork"
  ip_cidr_range = "10.0.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.default.id
