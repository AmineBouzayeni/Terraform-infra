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
first_machine_type    = "t2d-standard-4" #"t2d-standard-4" # 4 Virtual processor, 16 Go of memory to run the rng, hasher & worker components
second_machine_type   = "t2d-standard-2" #"t2d-standard-2" # 2 Virtual processor, 8 Go of memory to run the web & redis server components
first_pool_label      = "first"
second_pool_label     = "second"
first_node_pool_tags  = ""
second_node_pool_tags = "second-tag"
#first_min_node_count = 0 Defaulted
#first_max_node_count = 0 Defaulted
#second_min_node_count = 0 Defaulted
#second_max_node_count = 0 Defaulted