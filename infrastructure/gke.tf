resource "google_container_cluster" "gke" {
  name                = "${local.cluster}"
  project             = "${local.project}"
  zone                = "${local.zone}"
  initial_node_count  = "1"
  enable_legacy_abac  = false
  network             = "${google_compute_network.marketplace_network.id}"
  min_master_version  = "1.11.9-gke.13"

  timeouts {
    create = "30m"
    update = "30m"
    delete = "15m"
  }
  master_auth {
    password = ""
    username = ""
  }
  network_policy {
    enabled   = true
    provider  = "CALICO"
  }
  addons_config {
    kubernetes_dashboard {
      disabled = true
    }
  }
  node_config {
    machine_type    = "n1-highmem-16"
    service_account = "${google_service_account.cluster.email}"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }
  depends_on = [
    "google_service_account.cluster",
    "google_compute_network.marketplace_network",
    "google_service_account.cluster"]
}