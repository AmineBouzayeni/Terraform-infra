terraform {
  required_version = ">= 0.12"
}
provider "google" {
  project     = var.gcp_project
  credentials = file(var.credentials_file)
  region      = var.gcp_region
}
