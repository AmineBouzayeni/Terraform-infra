## Provider CONFIG VARS
gcp_auth_file = "../../auth/teolia-school-devops-c0a687214ae9.json"
#gcp_region = "value"
gcp_project = "teolia-school-devops"

### VPC CONFIG VARS
vpc_name = "gke-vpc"
#mtu = 0 Defaulted
routing_mode = "REGIONAL"

### Subnet CONFIG VARS
subnet_name = "gke-subnet"
#subnet_cidr_range = "" Defaulted
#subnet_region = "" Defaulted
#pods_ip_range = Defaulted
#service_ip_range = Defaulted

### ROUTER CONFIG VARS
router_name = "gke-router"

### NAT CONFIG VARS
nat_name = "gke-nat"
#subnet_to_nat = "" Defaulted
#nat_ip_allocation_option = "" Defaulted
#source_ip_ranges_to_nat = [""] Defaulted

#NAT IP address CONFIG VARS
nat_address_name = "gke-nat-address"
#address_type = "value" Defaulted
#network_tier = "value" Defaulted