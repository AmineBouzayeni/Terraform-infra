module "service_account" {
  source      = "../../modules/service_account"
  gcp_project = var.gcp_project
  account_id  = var.account_id
}

output "email" {
  value = module.service_account.email
}