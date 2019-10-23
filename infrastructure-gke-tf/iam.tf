resource "google_service_account" "cluster" {
  account_id   = "${local.project}"
  display_name = "${local.project}"
  project      = "${local.project}"
}

resource "google_project_iam_member" "image-pull-access" {
  project = "online-marketplace-253817"
  role    = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.cluster.email}"
}
