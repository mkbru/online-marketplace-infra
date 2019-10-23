resource "kubernetes_service" "online-marketplace-service" {
  "metadata" {
    name      = "online-marketplace-service"
    namespace = "online-marketplace-ns"
  }
  "spec" {
    selector {
      test = "online-marketplace"
    }

    type = "LoadBalancer"

    port {
      port = 3000
    }
  }
}