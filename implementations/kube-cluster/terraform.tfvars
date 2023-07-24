## Provider CONFIG VARS
gcp_auth_file = "../../auth/teolia-school-devops-b5a9d4a72f4b.json"
#gcp_region = "value"
gcp_project = "teolia-school-devops"

#Cluster config
cluster_name     = "dockercoins-cluster-teo"
cluster_location = "europe-west1-b"
#node_locations = [ "europe-west1-c" ]
cluster_vpc       = "gke-vpc"
cluster_subnet    = "gke-subnet"
enable_fluent_bit = false
networking_mode   = "VPC_NATIVE"
release_channel   = "REGULAR"

#Node pools config
first_name            = "first-component-pool"
second_name           = "second-component-pool"
first_pool_count      = 1
second_pool_count     = 1
# Will choose to work with E2 machine types. It is a low cost machine type
first_machine_type    = "e2-highcpu-4" #"e2-highcpu-4" # 4 Virtual processor, 4 Go of memory to run the rng, hasher, worker & redis-server components.
second_machine_type   = "e2-highcpu-2" #"e2-highcpu-2" # 2 Virtual processor, 2 Go of memory to run the webui component.
first_pool_label      = "first"
second_pool_label     = "second"
first_node_pool_tags  = ""
second_node_pool_tags = "second-tag"
#first_min_node_count = 0 Defaulted
#first_max_node_count = 0 Defaulted
#second_min_node_count = 0 Defaulted
#second_max_node_count = 0 Defaulted