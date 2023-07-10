#VPC
variable "vpc_name" {
  description = "VPC name"
  default = "gke-vpc"
}

variable "mtu" {
  description = "MTU of the VPC"
  default = 1460
}

variable "routing_mode" {
  description = "routing mode either GLOBAL or REGIONAL"
  validation {
    condition = var.routing_mode == "REGIONAL" || var.routing_mode == "GLOBAL"
    error_message = "The routing mode must be REGIONAL or GLOBAL"
  }
  default = "REGIONAL"
}

variable "subnet_name" {
  description = "subnet name"
  default = "gke-subnet"
}

variable "subnet_cidr_range" {
  description = "cidr range of the subnet"
  default = "10.0.0.0/18"
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

variable "router_name" {
  description = "router name"
  default = "gke-router"
}

variable "nat_name" {
  description = "nat gateway name"
  default = "gke-nat"
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
#Nat ip address
variable "nat_address_name" {
  description = "NAT gateway IP address name"
  default = "gke-nat-address"
}

variable "address_type" {
  description = "NAT address type"
  validation {
    condition = var.address_type == "EXTERNAL" || var.address_type == "INTERNAL"
    error_message = "the address_type must be either EXTERNAL or INTERNAL"
  }
  default = "EXTERNAL"
}

variable "network_tier" {
  description = "Determine what google backbone will be set for this address to host its traffic"
  validation {
    condition = var.network_tier == "PREMIUM" || var.network_tier == "STANDARD"
    error_message = "the network_tier must be either PREMIUM or STANDARD"
  }
  default = "PREMIUM"
}