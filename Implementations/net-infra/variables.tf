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
#VPC config
variable "vpc_name" {
  description = "VPC name"
}

variable "routing_mode" {
  description = "routing mode either GLOBAL or REGIONAL"
  validation {
    condition = var.routing_mode == "REGIONAL" || var.routing_mode == "GLOBAL"
    error_message = "The routing mode must be REGIONAL or GLOBAL"
  }
  default = "REGIONAL"
}

#Subnet config
variable "subnet_name" {
  description = "subnet name"
}

variable "subnet_region" {
  description = "subnet region"
  default = "europe-west1"
}

variable "pods_ip_range" {
  description = "PODS ip address range"
  default = "10.48.0.0/14"
}

variable "service_ip_range" {
  description = "service address range"
  default = "10.52.0.0/20"
}

#Router config
variable "router_name" {
  description = "router name"
}

#Nat config
variable "nat_name" {
  description = "nat gateway name"
}

variable "subnet_to_nat" {
  description = "configure how subnets will access the nat gateway"
  default = "LIST_OF_SUBNETWORKS"
}

variable "nat_ip_allocation_option" {
  description = "configure how to allocate the nat ip address"
  default = "MANUAL_ONLY"
}

variable "source_ip_ranges_to_nat" {
  description = "configure which subnets have access to the NAT"
  default = [
    "ALL_IP_RANGES"
  ]
}

variable "nat_address_name" {
  description = "NAT gateway IP address name"
}