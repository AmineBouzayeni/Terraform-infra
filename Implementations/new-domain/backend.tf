terraform {
  backend "gcs" {
    bucket = "tf-state-dockercoins-teolia-amineb-5"
    prefix = "terraform/domain-name.tfstate"
  }
}