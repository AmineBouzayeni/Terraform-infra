#Enable APIs vars
variable "gcp_project" {
  description = "gcp project name"
}
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

variable "subnet_region" {
  description = "subnet region"
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