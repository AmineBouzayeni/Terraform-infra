#define the gcp project
variable "gcp_project" {
  type        = string
  description = "gcp project name"
  default     = "teolia-school-devops"
}
#service account id
variable "account_id" {
  description = "account_id"
  default     = "devops-op"
}
# GCP region
variable "gcp_region" {
  description = "gcp region"
  default = "europe-west1"
}