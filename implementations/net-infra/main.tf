module "net_infra" {
  source                   = "../../modules/net-infra"
  gcp_project              = var.gcp_project
  vpc_name                 = var.vpc_name
  mtu                      = var.mtu
  routing_mode             = var.routing_mode
  subnet_name              = var.subnet_name
  subnet_cidr_range        = var.subnet_cidr_range
  subnet_region            = var.subnet_region
  pods_ip_range            = var.pods_ip_range
  service_ip_range         = var.service_ip_range
  router_name              = var.router_name
  nat_name                 = var.nat_name
  subnet_to_nat            = var.subnet_to_nat
  nat_ip_allocation_option = var.nat_ip_allocation_option
  source_ip_ranges_to_nat  = var.source_ip_ranges_to_nat
  nat_address_name         = var.nat_address_name
  address_type             = var.address_type
  network_tier             = var.network_tier
}

output "vpc_id" {
  value = module.net_infra.vpc_id
}

output "subnet_address" {
  value = module.net_infra.subnet_address
}

output "router_id" {
  value = module.net_infra.router_id
}

output "nat_id" {
  value = module.net_infra.nat_id
}