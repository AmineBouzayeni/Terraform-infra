#define the gcp project
variable "gcp_project" {
  type        = string
  description = "gcp project name"
  default     = "teolia-school-devops"
}

# GCP region
variable "gcp_region" {
  description = "gcp region"
  default = "europe-west1"
}

#Credentials file relative path
variable "credentials_file" {
  description = "Credentials file relative path"
  default = "../../auth/admin-sa-sa.json"
}
#service account id
variable "account_id" {
  description = "account_id"
  default     = "devops-op"
}
