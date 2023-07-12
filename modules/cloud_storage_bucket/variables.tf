# Provider config
# GCP authentication file
variable "gcp_auth_file" {
  type        = string
  description = "GCP authentication file"
}
# define GCP region
variable "gcp_region" {
  type        = string
  description = "GCP region"
  default     = "europe-west1"
}
#define the gcp project
variable "gcp_project" {
  type        = string
  description = "gcp project name"
}
