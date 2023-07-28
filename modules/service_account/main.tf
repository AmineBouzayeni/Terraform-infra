# Enable APIs
# resource "google_project_service" "project_iam" {
#   project = var.gcp_project
#   service = "iam.googleapis.com"
# }

# resource "google_project_service" "project_cloudresourcemanager" {
#   project = var.gcp_project
#   service = "cloudresourcemanager.googleapis.com"
# }
# Create service account resource cloudop
resource "google_service_account" "cloudop_service_account" {
  account_id = var.account_id
}

# Fine-grained cloud storage admin role
resource "google_project_iam_custom_role" "cloud_storage_admin_role" {
  role_id     = "cloud_storage_admin_1"
  title       = "Cloud Storage Admin 1"
  description = "Let the CloudOp role create, delete and manage objects into buckets"
  permissions = ["storage.buckets.create", "storage.buckets.delete", "storage.buckets.get", "storage.buckets.list", "storage.buckets.update", "storage.objects.create", "storage.objects.delete", "storage.objects.get", "storage.objects.list", "storage.objects.update"]
}

# For Kubernetes there is so many granular permissions will bind him with roles/container.admin
resource "google_project_iam_member" "kube_admin_policy" {
  project = var.gcp_project
  role    = "roles/container.clusterAdmin"

  member = "serviceAccount:${google_service_account.cloudop_service_account.email}"
}
# Bind with the cloud storage admin custom role
resource "google_project_iam_member" "cloud_storage_admin_policy" {
  project = var.gcp_project
  role    = google_project_iam_custom_role.cloud_storage_admin_role.name

  member = "serviceAccount:${google_service_account.cloudop_service_account.email}"
}

# Bind with artifact registry admin to create, pull & push repos
resource "google_project_iam_member" "artifact_registry_admin_policy" {
  project = var.gcp_project
  role    = "roles/artifactregistry.admin"

  member = "serviceAccount:${google_service_account.cloudop_service_account.email}"
}

# Bind with iam service account admin
resource "google_project_iam_member" "iam_sa_admin_policy" {
  project = var.gcp_project
  role    = "roles/iam.serviceAccountAdmin"

  member = "serviceAccount:${google_service_account.cloudop_service_account.email}"
}

# Bind with iam roles admin
resource "google_project_iam_member" "iam_role_admin_policy" {
  project = var.gcp_project
  role    = "roles/iam.roleAdmin"

  member = "serviceAccount:${google_service_account.cloudop_service_account.email}"
}
# Bind with Project IAM Admin to set/get policies
resource "google_project_iam_member" "project_iam_admin_policy" {
  project = var.gcp_project
  role    = "roles/resourcemanager.projectIamAdmin"

  member = "serviceAccount:${google_service_account.cloudop_service_account.email}"
}

resource "google_project_iam_member" "network_admin_policy" {
  project = var.gcp_project
  role    = "roles/compute.networkAdmin"

  member = "serviceAccount:${google_service_account.cloudop_service_account.email}"
}

# Firewall administration policy
resource "google_project_iam_member" "firewall_admin_policy" {
  project = var.gcp_project
  role    = "roles/compute.securityAdmin"

  member = "serviceAccount:${google_service_account.cloudop_service_account.email}"
}

# Container administration to be able to deploy kube manifests
resource "google_project_iam_member" "container_admin_policy" {
  project = var.gcp_project
  role    = "roles/container.admin"

  member = "serviceAccount:${google_service_account.cloudop_service_account.email}"
}