resource "google_compute_network" "marketplace_network" {
  name                    = "${local.project}-network"
  auto_create_subnetworks = "true"
}