 terraform {
  backend "gcs" {
    bucket = "tf-state-dockercoins-teolia-amineb-2"
    prefix = "terraform/dockercoins.tfstate"
  }
}