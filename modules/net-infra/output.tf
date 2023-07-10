output "vpc_id" {
    value = google_compute_network.gke_cluster.id
}

output "subnet_address" {
    value = google_compute_subnetwork.gke_cluster_subnet 
}

output "router_id" {
  value = google_compute_router.router.id
}

output "nat_id" {
  value = google_compute_router_nat.nat.id
}