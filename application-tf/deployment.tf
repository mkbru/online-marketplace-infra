resource "kubernetes_deployment" "online-marketplace" {
  metadata {
    name      = "online-marketplace"
    namespace = "online-marketplace-ns"
    labels {
      test = "online-marketplace"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels {
        test = "online-marketplace"
      }
    }

    template {
      metadata {
        labels {
          test = "online-marketplace"
        }
      }

      spec {

        container {
          image = "sandboxregistry1234.azurecr.io/onlinemarketplace:latest"
          name  = "onlinemarketplace"

          env {
            name  = "JWT_KEY"
            value_from {secret_key_ref {name = "application-secrets" key = "JWT_KEY"}}
          }

          env {
            name  = "PORT"
            value_from {secret_key_ref {name = "application-secrets" key = "PORT"}}
          }

          env {
            name  = "MONGO_DEV_URL"
            value_from {secret_key_ref {name = "application-secrets" key = "MONGO_DEV_URL"}}
          }

          resources{
            limits{
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests{
              cpu    = "250m"
              memory = "50Mi"
            }
          }

        }
      }
    }
  }
}