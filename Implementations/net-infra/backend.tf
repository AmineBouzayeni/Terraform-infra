terraform {
  backend "gcs" {
    bucket = "tf-state-dockercoins-teolia-amineb-3"
    prefix = "terraform/net-infra.tfstate"
  }
}