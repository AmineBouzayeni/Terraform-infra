terraform {
  backend "gcs" {
    bucket = "tf-state-dockercoins-teoschool-amineb"
    prefix = "terraform/admin-sa.tfstate"
  }
}