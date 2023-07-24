remote_state {
  backend = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "tf-state-dockercoins-teoschool-amineb"

    prefix = "${path_relative_to_include()}/terraform.tfstate"
  }
}