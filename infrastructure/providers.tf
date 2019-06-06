provider "google" {
  project   = "${local.project}"
  region    = "${local.region}"
}

provider "kubernetes" {}