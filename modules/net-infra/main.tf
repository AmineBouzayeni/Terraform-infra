resource "google_compute_network" "gke_cluster" {
  name = var.vpc_name
  routing_mode = var.routing_mode # The vpc will create the route entries for subnet in the concerned region.
  auto_create_subnetworks = false
  mtu = var.mtu #Taille maximale d'un paquet
  delete_default_routes_on_create = false #If set to true will delete default routes to the internet
}

resource "google_compute_subnetwork" "gke_cluster_subnet" {
  name = var.subnet_name
  ip_cidr_range = var.subnet_cidr_range #"10.0.0.0/18"
  region = var.subnet_region
  network = google_compute_network.gke_cluster.id
  private_ip_google_access = true # Instances without external ip will access the google services.
  secondary_ip_range {
    range_name = "k8s-pod-range"
    ip_cidr_range = var.pods_ip_range #"10.48.0.0/14"

  }
  secondary_ip_range {
    range_name = "k8s-service-range"
    ip_cidr_range = var.service_ip_range #"10.52.0.0/20"
  }
}
# Router and nat gateway are used to allow VMs without external IP addresses to access the internet
# Kubernetes nodes will be able to pull docker images from Docker Hub.
resource "google_compute_router" "router" {
  name = var.router_name
  region = var.subnet_region
  network = google_compute_network.gke_cluster.id
}
resource "google_compute_router_nat" "nat" {
  name = var.nat_name
  region = var.subnet_region
  router = google_compute_router.router.name
  source_subnetwork_ip_ranges_to_nat = var.subnet_to_nat #"LIST_OF_SUBNETWORKS" # Manage the access to the NAT. LIST_OF_SUBNETWORK means that
  # We will specify a list of subnetwork that we will give access to this nat.
  nat_ip_allocate_option = var.nat_ip_allocation_option #"MANUAL_ONLY" #Important if you have external clients.
  # You can let google assign IP adress to your nat or you can choose to manage yourself.connection {
  # If you have a client that needs to whitelist your nat IP address by firewall rules you need 
  # to put this option to MANUAL_ONLY
  subnetwork {
    name = google_compute_subnetwork.gke_cluster_subnet.id
    source_ip_ranges_to_nat = var.source_ip_ranges_to_nat #[ "ALL_IP_RANGES" ] # you can choose only the principal IP range or in
    # our case the principal and all the secondary(for pods and services)
  }
  nat_ips = [ google_compute_address.nat.self_link ] #NAT gateway IP address
  }

  resource "google_compute_address" "nat" {
    name = var.nat_address_name
    address_type = var.address_type #"EXTERNAL"
    network_tier = var.network_tier #"PREMIUM"# on google premium backbone. STANDARD uses regular ISP networks
  }