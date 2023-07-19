terraform {
  backend "gcs" {
    bucket = "tf-state-dockercoins-teolia-amineb-7"
    prefix = "terraform/net-infra.tfstate"
  }
}