module "net_infra" {
  source                   = "../../modules/net-infra"
  vpc_name                 = var.vpc_name
  routing_mode             = var.routing_mode
  subnet_name              = var.subnet_name
  subnet_region            = var.subnet_region
  pods_ip_range            = var.pods_ip_range
  service_ip_range         = var.service_ip_range
  router_name              = var.router_name
  nat_name                 = var.nat_name
  subnet_to_nat            = var.subnet_to_nat
  nat_ip_allocation_option = var.nat_ip_allocation_option
  source_ip_ranges_to_nat  = var.source_ip_ranges_to_nat
  nat_address_name         = var.nat_address_name
}