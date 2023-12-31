
resource "google_storage_bucket" "tf-state-dockercoins" {
  name          = "tf-state-dockercoins-teoschool-amineb"
  location      = "EU"
  storage_class = "STANDARD"

  uniform_bucket_level_access = true #Access the bucket through IAM
  versioning {
    enabled = true
  }
}