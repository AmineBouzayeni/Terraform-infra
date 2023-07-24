## Provider CONFIG VARS
gcp_auth_file = "../../auth/teolia-school-devops-c0a687214ae9.json"
#gcp_region = "value"
gcp_project   = "teolia-school-devops"
rule_name     = "app-rule"
vpc           = "gke-vpc"
port_range    = "30000-30010"
source_ranges = "0.0.0.0/0"
target_tags   = "second-tag"