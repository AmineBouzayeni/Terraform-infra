## VPC, SUBNET, ROUTE & NAT Creation

resource "google_compute_network" "gke_cluster_vpc" {
  name                            = var.vpc_name
  routing_mode                    = var.routing_mode # The vpc will create the route entries for subnet in the concerned region.
  auto_create_subnetworks         = false
  mtu                             = var.mtu #Taille maximale d'un paquet
  delete_default_routes_on_create = false   #If set to true will delete default routes to the internet
}

resource "google_compute_subnetwork" "gke_cluster_subnet" {
  name                     = var.subnet_name
  ip_cidr_range            = var.subnet_cidr_range #"10.0.0.0/18"
  region                   = var.gcp_region
  network                  = google_compute_network.gke_cluster_vpc.id
  private_ip_google_access = true # Instances without external ip will access the google services.
  secondary_ip_range {
    range_name    = var.pods_ip_range_name #"k8s-pod-range"
    ip_cidr_range = var.pods_ip_range      #"10.48.0.0/14"

  }
  secondary_ip_range {
    range_name    = var.service_ip_range_name #"k8s-service-range"
    ip_cidr_range = var.service_ip_range      #"10.52.0.0/20"
  }
}
# Router and nat gateway are used to allow VMs without external IP addresses to access the internet
# Kubernetes nodes will be able to pull docker images from Docker Hub.
resource "google_compute_router" "router" {
  name    = var.router_name
  region  = var.gcp_region
  network = google_compute_network.gke_cluster_vpc.id
}
resource "google_compute_router_nat" "nat" {
  name                               = var.nat_name
  region                             = var.gcp_region
  router                             = google_compute_router.router.name
  source_subnetwork_ip_ranges_to_nat = var.subnet_to_nat #"LIST_OF_SUBNETWORKS" # Manage the access to the NAT. LIST_OF_SUBNETWORK means that
  # We will specify a list of subnetwork that we will give access to this nat.
  nat_ip_allocate_option = var.nat_ip_allocation_option #"MANUAL_ONLY" #Important if you have external clients.
  # You can let google assign IP adress to your nat or you can choose to manage yourself.connection {
  # If you have a client that needs to whitelist your nat IP address by firewall rules you need 
  # to put this option to MANUAL_ONLY
  subnetwork {
    name                    = google_compute_subnetwork.gke_cluster_subnet.id
    source_ip_ranges_to_nat = var.source_ip_ranges_to_nat #[ "ALL_IP_RANGES" ] # you can choose only the principal IP range or in
    # our case the principal and all the secondary(for pods and services)
  }
  nat_ips = [google_compute_address.nat.self_link] #NAT gateway IP address
}

resource "google_compute_address" "nat" {
  name         = var.nat_address_name
  address_type = var.address_type #"EXTERNAL"
  network_tier = var.network_tier #"PREMIUM"# on google premium backbone. STANDARD uses regular ISP networks
}

## FIREWALL RULE FOR TEST AND PRODUCTION

resource "google_compute_firewall" "rules" {
  project     = var.gcp_project
  name        = var.rule_name
  network     = google_compute_network.gke_cluster_vpc.id
  description = "Creates firewall rule for GKE cluster"

  allow {
    protocol = "tcp"
    ports    = [var.port_range]
  }
  source_ranges = [var.source_ranges]
  target_tags   = [var.target_tags]
}

## KUBERNETES CLUSTER

locals {
  logging_service = var.enable_fluent_bit == true ? "logging.googleapis.com/kubernetes" : "none"
}

resource "google_container_cluster" "dockercoins-cluster" {
  name                     = var.cluster_name
  location                 = var.cluster_location
  remove_default_node_pool = true
  initial_node_count       = 1
  logging_service          = local.logging_service #Deploy a fluent bit agent on each application and scrape all the logs that the apps sends to the console. It can cost a lot.
  network                  = google_compute_network.gke_cluster_vpc.id
  subnetwork               = google_compute_subnetwork.gke_cluster_subnet.id
  networking_mode          = var.networking_mode #"VPC_NATIVE"  Type of cluster that has many advantages such as: Pods IP are reserved before the pods are created in the cluster. You can setup rules based on those ranges.
  #node_locations           = var.node_locations
  addons_config {
    http_load_balancing {
      disabled = false # disable it when you want to do custom load balaning, nginx or ingress(kubernetes)
      # Enabled it to use Ingress with GKE Ingress Controller
    }
    horizontal_pod_autoscaling {
      disabled = false # Enable HPA
    }
  }
  release_channel {
    channel = var.release_channel # subscribe to the REGULAR release channel for kubernetes versions update
  }
  # Adding this block enables IP aliasing: A network interface is associated with more than one IP address.
  ip_allocation_policy {
    cluster_secondary_range_name  = var.pods_ip_range_name
    services_secondary_range_name = var.service_ip_range_name
  }
}
# First node pool dedicated to the worker component
# Best practice is to create a dedicated service account 
resource "google_container_node_pool" "first-node-pool" {
  name       = var.first_name
  location   = var.cluster_location
  cluster    = google_container_cluster.dockercoins-cluster.name
  node_count = var.first_pool_count
  management {
    auto_repair  = true
    auto_upgrade = true
  }
  autoscaling {
    min_node_count = var.first_min_node_count
    max_node_count = var.first_max_node_count
  }
  node_config {
    #Disabling fault tolearance
    preemptible  = false
    machine_type = var.first_machine_type
    labels = {
      app = var.first_pool_label
    }
    tags = [var.first_node_pool_tags]
  }
  network_config {
    enable_private_nodes = true # This node pool will host the backend. It will therefore be a private one.
  }
}

# Second node pool dedicated to the rng, hasher, redis & web component
resource "google_container_node_pool" "second-node-pool" {
  name       = var.second_name
  location   = var.cluster_location
  cluster    = google_container_cluster.dockercoins-cluster.name
  node_count = var.second_pool_count
  management {
    auto_repair  = true
    auto_upgrade = true
  }
  autoscaling {
    min_node_count = var.second_min_node_count
    max_node_count = var.second_max_node_count
  }
  node_config {
    #Disabling fault-tolerance
    preemptible  = false
    machine_type = var.second_machine_type
    labels = {
      app = var.second_pool_label
    }
    tags = [var.second_node_pool_tags]
  }
}
# Create google artifact registry repository
resource "google_artifact_registry_repository" "amineb-teolia" {
  location      = var.gcp_region
  repository_id = var.repository_name
  format        = "DOCKER"
}
# Create ingress IP address
resource "google_compute_global_address" "ingress-ip" {
  name         = var.ingress_ip_address_name
  address_type = var.address_type #"EXTERNAL"
}