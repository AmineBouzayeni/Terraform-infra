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
# firewall_rule and provider var
variable "gcp_project" {
  description = "gcp project name"
}
# firewall rule
variable "rule_name" {
  description = "firewall rule name"
}

variable "vpc" {
  description = "the vpc in which the firewall rule will be applied"
}

variable "port_range" {
  description = "port range to whom the rule will apply"
}

variable "source_ranges" {
  description = "source ip ranges"
}

variable "target_tags" {
  description = "target tags"
}