resource "kubernetes_namespace" "example" {
  metadata {
    annotations {
      name = "online-marketplace-ns"
    }

    labels {
      mylabel = "online-marketplace-ns"
    }

    name = "online-marketplace-ns"
  }
}