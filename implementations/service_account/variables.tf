# GCP authentication file
variable "gcp_auth_file" {
  type        = string
  description = "GCP authentication file"
  default     = "../../auth/teolia-school-devops-c0a687214ae9.json"
}
#define the gcp project
variable "gcp_project" {
  type        = string
  description = "gcp project name"
  default     = "teolia-school-devops"
}
# define GCP region
variable "gcp_region" {
  type        = string
  description = "GCP region"
  default     = "europe-west1"
}
#service account id
variable "account_id" {
  description = "account_id"
  default     = "devops-op"
}