# Provider config
# GCP authentication file
variable "gcp_auth_file" {
  description = "GCP authentication file"
}
# define GCP region
variable "gcp_region" {
  description = "GCP region"
  default     = "europe-west1"
}
variable "gcp_project" {
  description = "gcp project name"
}