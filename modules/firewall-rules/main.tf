resource "google_compute_firewall" "rules" {
  project     = var.gcp_project
  name        = var.rule_name
  network     = var.vpc
  description = "Creates firewall rule for GKE cluster"

  allow {
    protocol = "tcp"
    ports    = [var.port_range]
  }
  source_ranges = [var.source_ranges]
  target_tags   = [var.target_tags]
}