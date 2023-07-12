module "kubernetes_cluster" {
  source           = "../../modules/kube-cluster"
  cluster_name     = var.cluster_name
  cluster_location = var.cluster_location
  #node_locations        = var.node_locations maintain a single zone cluster due to quota limitation
  cluster_vpc           = var.cluster_vpc
  cluster_subnet        = var.cluster_subnet
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
}