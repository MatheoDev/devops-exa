provider "kubernetes" {
  config_path = "~/.kube/config"

  # host = minikube_cluster.docker.host

  # client_certificate     = minikube_cluster.docker.client_certificate
  # client_key             = minikube_cluster.docker.client_key
  # cluster_ca_certificate = minikube_cluster.docker.cluster_ca_certificate
}

resource "kubernetes_namespace" "devops" {
  metadata {
    name = "devops"
  }
}

resource "kubernetes_deployment" "frontend" {
  metadata {
    name      = "frontend"
    namespace = kubernetes_namespace.devops.metadata[0].name
    labels = {
      app = "frontend"
    }
  }

  spec {
    selector {
      match_labels = {
        app = "frontend"
      }
    }

    template {
      metadata {
        labels = {
          app = "frontend"
        }
      }

      spec {
        container {
          name  = "frontend"
          image = "mrdek/devops-exa-frontend:latest"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "frontend" {
  metadata {
    name      = "frontend"
    namespace = kubernetes_namespace.devops.metadata[0].name
  }

  spec {
    selector = {
      app = kubernetes_deployment.frontend.metadata[0].labels.app
    }

    port {
      port        = 80
      target_port = 80
      node_port   = 30001
    }

    type = "NodePort"
  }
}

resource "kubernetes_deployment" "backend" {
  metadata {
    name      = "backend"
    namespace = kubernetes_namespace.devops.metadata[0].name
    labels = {
      app = "backend"
    }
  }

  spec {
    selector {
      match_labels = {
        app = "backend"
      }
    }

    template {
      metadata {
        labels = {
          app = "backend"
        }
      }

      spec {
        container {
          name  = "backend"
          image = "mrdek/devops-exa-backend:latest"
          port {
            container_port = 3000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "backend" {
  metadata {
    name      = "backend"
    namespace = kubernetes_namespace.devops.metadata[0].name
  }

  spec {
    selector = {
      app = kubernetes_deployment.backend.metadata[0].labels.app
    }

    port {
      port        = 3000
      target_port = 3000
    }

    type = "NodePort"
  }
}

resource "kubernetes_deployment" "db" {
  metadata {
    name      = "db"
    namespace = kubernetes_namespace.devops.metadata[0].name
    labels = {
      app = "db"
    }
  }

  spec {
    selector {
      match_labels = {
        app = "db"
      }
    }

    template {
      metadata {
        labels = {
          app = "db"
        }
      }

      spec {
        container {
          name  = "db"
          image = "mrdek/devops-exa-db:latest"
          port {
            container_port = 5432
          }

          # POSTGRES_USER: postgres POSTGRES_PASSWORD: postgres POSTGRES_DB devops
          env {
            name  = "POSTGRES_USER"
            value = "postgres"
          }
          env {
            name  = "POSTGRES_PASSWORD"
            value = "postgres"
          }
          env {
            name  = "POSTGRES_DB"
            value = "devops"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "db" {
  metadata {
    name      = "db"
    namespace = kubernetes_namespace.devops.metadata[0].name
  }

  spec {
    selector = {
      app = kubernetes_deployment.db.metadata[0].labels.app
    }

    port {
      port        = 5432
      target_port = 5432
    }

    type = "NodePort"
  }
}
