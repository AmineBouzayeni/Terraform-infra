module "kube_cluster_infra" {
  source      = "../../modules/kube-cluster-infra"
  gcp_project = var.gcp_project
  gcp_region  = var.gcp_region
  # VPC, SUBNET, ROUTER & NAT configuration
  vpc_name                 = var.vpc_name
  mtu                      = var.mtu
  routing_mode             = var.routing_mode
  subnet_name              = var.subnet_name
  subnet_cidr_range        = var.subnet_cidr_range
  pods_ip_range            = var.pods_ip_range
  service_ip_range         = var.service_ip_range
  pods_ip_range_name       = var.pods_ip_range_name
  service_ip_range_name    = var.service_ip_range_name
  router_name              = var.router_name
  nat_name                 = var.nat_name
  subnet_to_nat            = var.subnet_to_nat
  nat_ip_allocation_option = var.nat_ip_allocation_option
  source_ip_ranges_to_nat  = var.source_ip_ranges_to_nat
  nat_address_name         = var.nat_address_name
  address_type             = var.address_type
  network_tier             = var.network_tier
  # FIREWALL RULE configuration
  rule_name     = var.rule_name
  port_range    = var.port_range
  source_ranges = var.source_ranges
  target_tags   = var.target_tags
  # KUBERNETES CLUSTER configuration
  cluster_name          = var.cluster_name
  cluster_location      = var.cluster_location
  enable_fluent_bit     = var.enable_fluent_bit
  networking_mode       = var.networking_mode
  release_channel       = var.release_channel
  first_name            = var.first_name
  second_name           = var.second_name
  first_pool_count      = var.first_pool_count
  second_pool_count     = var.second_pool_count
  first_machine_type    = var.first_machine_type
  second_machine_type   = var.second_machine_type
  first_min_node_count  = var.first_min_node_count
  first_max_node_count  = var.first_max_node_count
  second_min_node_count = var.second_min_node_count
  second_max_node_count = var.second_max_node_count
  first_pool_label      = var.first_pool_label
  second_pool_label     = var.second_pool_label
  first_node_pool_tags  = var.first_node_pool_tags
  second_node_pool_tags = var.second_node_pool_tags
  # ARTIFACT REGISTRY REPO
  repository_name = var.repository_name
  # Ingress IP
  ingress_ip_address_name = var.ingress_ip_address_name
}