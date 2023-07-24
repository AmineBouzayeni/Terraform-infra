output "vpc_id" {
  value = module.kube_cluster_infra.vpc_id
}

output "subnet_address" {
  value = module.kube_cluster_infra.subnet_address
}

output "router_id" {
  value = module.kube_cluster_infra.router_id
}

output "nat_id" {
  value = module.kube_cluster_infra.nat_id
}

output "firewall_id" {
  value = module.kube_cluster_infra.firewall_id
}

output "cluster-endpoint" {
  value = module.kube_cluster_infra.cluster_endpoint
}