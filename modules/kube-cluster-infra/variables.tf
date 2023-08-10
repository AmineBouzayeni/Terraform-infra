#VPC
variable "vpc_name" {
  description = "VPC name"
}

variable "mtu" {
  description = "MTU of the VPC"
}

variable "routing_mode" {
  description = "routing mode either GLOBAL or REGIONAL"
  validation {
    condition     = var.routing_mode == "REGIONAL" || var.routing_mode == "GLOBAL"
    error_message = "The routing mode must be REGIONAL or GLOBAL"
  }
}

#Subnet
variable "subnet_name" {
  description = "subnet name"
}

variable "subnet_cidr_range" {
  description = "cidr range of the subnet"
}

variable "gcp_region" {
  description = "subnet region"
}

variable "pods_ip_range_name" {
  description = "pods ip range name"
}

variable "service_ip_range_name" {
  description = "services ip range name"
}

variable "pods_ip_range" {
  description = "PODS ip address range"
}

variable "service_ip_range" {
  description = "service address range"
}

#Router
variable "router_name" {
  description = "router name"
}

#NAT
variable "nat_name" {
  description = "nat gateway name"
}

variable "subnet_to_nat" {
  description = "configure how subnets will access the nat gateway"
}

variable "nat_ip_allocation_option" {
  description = "configure how to allocate the nat ip address"
}

variable "source_ip_ranges_to_nat" {
  description = "configure which subnets have access to the NAT"
}

#NAT address IP
variable "nat_address_name" {
  description = "NAT gateway IP address name"
}

variable "address_type" {
  description = "NAT address type"
  validation {
    condition     = var.address_type == "EXTERNAL" || var.address_type == "INTERNAL"
    error_message = "the address_type must be either EXTERNAL or INTERNAL"
  }
}

variable "network_tier" {
  description = "Determine what google backbone will be set for this address to host its traffic"
  validation {
    condition     = var.network_tier == "PREMIUM" || var.network_tier == "STANDARD"
    error_message = "the network_tier must be either PREMIUM or STANDARD"
  }
}

# Firewall rule
variable "gcp_project" {
  description = "gcp project name"
}

variable "rule_name" {
  description = "firewall rule name"
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

# Kubernetes Cluster
# Cluster configuration
variable "cluster_name" {
  description = "cluster name"
  default     = "dockercoins-cluster"
}

variable "cluster_location" {
  description = "control plane and node pools locations"
  default     = "europe-west1-a"
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
    condition     = var.release_channel == "RAPID" || var.release_channel == "REGULAR" || var.release_channel == "STABLE" || var.release_channel == "UNSPECIFIED"
    error_message = "Choose a release channel: RAPID, REGULAR, STABLE or UNSPECIFIED"
  }
}
# Node pools
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
}

variable "first_max_node_count" {
  description = "max node count for the first pool"
}

variable "second_min_node_count" {
  description = "min node count for the second pool"
}

variable "second_max_node_count" {
  description = "max node count for the second pool"
}
#Labels
variable "first_pool_label" {
  description = "second pool label"
}

variable "second_pool_label" {
  description = "second pool label"
}
#Tags
variable "first_node_pool_tags" {
  description = "first node pool tags to apply firewall rules"
}

variable "second_node_pool_tags" {
  description = "second node pool tags to apply firewall rules"
}
#Artifact registry repository
variable "repository_name" {
  description = "google artifact registry repository name"
}
# Ingress IP
variable "ingress_ip_address_name" {
  description = "ip address to be allocated to the ingress object"
}