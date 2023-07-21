# To get project details such as project id
# data "google_project" "project" {
# }
# Resource to create and configure the GKE-Cluster
locals {
  logging_service = var.enable_fluent_bit == true ? "logging.googleapis.com/kubernetes" : "none"
}

resource "google_container_cluster" "dockercoins-cluster" {
  name                     = var.cluster_name
  location                 = var.cluster_location
  remove_default_node_pool = true
  initial_node_count       = 1
  logging_service          = local.logging_service #Deploy a fluent bit agent on each application and scrape all the logs that the apps sends to the console. It can cost a lot.
  network                  = var.cluster_vpc
  subnetwork               = var.cluster_subnet
  networking_mode          = var.networking_mode #"VPC_NATIVE"  Type of cluster that has many advantages such as: Pods IP are reserved before the pods are created in the cluster. You can setup rules based on those ranges.
  #node_locations           = var.node_locations
  addons_config {
    http_load_balancing {
      disabled = true # disable it when you want to do custom load balaning, nginx or ingress(kubernetes)
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
    cluster_secondary_range_name  = "k8s-pod-range"
    services_secondary_range_name = "k8s-service-range"
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