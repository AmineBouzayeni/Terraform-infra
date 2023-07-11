
resource "google_storage_bucket" "tf-state-dockercoins" {
  name          = "tf-state-dockercoins-teolia-amineb-3"
  location      = "US"
  storage_class = "STANDARD"

  uniform_bucket_level_access = true #Access the bucket through IAM
  versioning {
    enabled = true
  }
}