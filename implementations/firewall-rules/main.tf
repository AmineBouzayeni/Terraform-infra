module "firewall_rules" {
  source        = "../../modules/firewall-rules"
  gcp_project   = var.gcp_project
  rule_name     = var.rule_name
  vpc           = var.vpc
  port_range    = var.port_range
  source_ranges = var.source_ranges
  target_tags   = var.target_tags
}

output "firewall_id" {
  value = module.firewall_rules.firewall_id
}