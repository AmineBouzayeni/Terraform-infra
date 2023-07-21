variable "gcp_project" {
  description = "gcp project name"
}

variable "rule_name" {
  description = "firewall rule name"
}

variable "vpc" {
  description = "the vpc in which the firewall rule will be applied"
}

variable "port_range" {
  description = "port range to whom the rule will apply"
}

variable "source_ranges" {
  description = "source ip ranges"
}

variable "target_tags" {
  description = "target tags"
}