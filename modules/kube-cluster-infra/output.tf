output "vpc_id" {
  value = google_compute_network.gke_cluster_vpc.id
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

output "firewall_id" {
  value = google_compute_firewall.rules.id
}

output "cluster_endpoint" {
  value = google_container_cluster.dockercoins-cluster.endpoint
}

output "artifactregistry_id" {
  value = google_artifact_registry_repository.amineb-teolia.id
}