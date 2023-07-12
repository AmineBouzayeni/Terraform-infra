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
#Cluster config
variable "cluster_name" {
  description = "cluster name"
  default     = "dockercoins-cluster"
}
variable "cluster_location" {
  description = "control plane and node pools locations"
  default     = "europe-west1-a"
}
# variable "node_locations" {
#   description = "the second availability zone to create a multi-zone cluster"
#   default = [
#     "europe-west1-b"
#   ]
# }
variable "cluster_vpc" {
  description = "the cluster VPC"
}

variable "cluster_subnet" {
  description = "the cluster subnet"
  default     = "gke-subnet"
}
variable "networking_mode" {
  description = "Cluster's networking mode"
  validation {
    condition     = var.networking_mode == "VPC_NATIVE" || var.networking_mode == "ROUTES"
    error_message = "networking_mode must be either VPC_NATIVE or ROUTES"
  }
}
variable "enable_fluent_bit" {
  description = "enable fluent bit agent installation"
  type        = bool
}
variable "release_channel" {
  description = "Release channel for kubernetes version upgrades"
  validation {
    condition     = var.release_channel == "RAPID" || var.release_channel == "REGULAR" || var.release_channel == "STABLE"
    error_message = "Choose a release channel: RAPID, REGULAR or STABLE"
  }
}
#Node pool configuration
#Naming
variable "first_name" {
  description = "first node pool name"
}

variable "second_name" {
  description = "second node pool name"
}
#Number of nodes
variable "first_pool_count" {
  description = "number of node of the first node pool"
}

variable "second_pool_count" {
  description = "number of node of the second node pool"
}
#Machine type
variable "first_machine_type" {
  description = "machine type of nodes in the first pool"
}

variable "second_machine_type" {
  description = "machine type of nodes in the second pool"
}
# Node count
variable "first_min_node_count" {
  description = "min node count for the first pool"
  default     = 1
}

variable "first_max_node_count" {
  description = "max node count for the first pool"
  default     = 5
}

variable "second_min_node_count" {
  description = "min node count for the first pool"
  default     = 1
}

variable "second_max_node_count" {
  description = "max node count for the first pool"
  default     = 5
}
#Labels
variable "first_pool_label" {
  description = "first pool label"
}

variable "second_pool_label" {
  description = "second pool label"
}