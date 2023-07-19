#Provider config
gcp_auth_file = "../../auth/playground-s-11-937fc184-b0e53c4ac47f.json"
#gcp_region = "value"
gcp_project = "playground-s-11-937fc184"

#Cluster config
cluster_name     = "dockercoins-cluster"
cluster_location = "europe-west1-b"
#node_locations = [ "europe-west1-c" ]
cluster_vpc       = "gke-vpc"
cluster_subnet    = "gke-subnet"
enable_fluent_bit = false
networking_mode   = "VPC_NATIVE"
release_channel   = "REGULAR"

#Node pools config
first_name          = "first-component-pool"
second_name         = "second-component-pool"
third_name          = "testing-component-pool" 
first_pool_count    = 1
second_pool_count   = 1
third_pool_count    = 1 
first_machine_type  = "e2-medium" #"t2d-standard-4" # 4 Virtual processor, 16 Go of memory to run the rng, hasher & worker components
second_machine_type = "e2-medium" #"t2d-standard-2" # 2 Virtual processor, 8 Go of memory to run the web & redis server components
third_machine_type  = "e2-medium" #For testing 
first_pool_label    = "first"
second_pool_label   = "second"
third_pool_label    = "test" 
#first_min_node_count = 0 Defaulted
#first_max_node_count = 0 Defaulted
#second_min_node_count = 0 Defaulted
#second_max_node_count = 0 Defaulted