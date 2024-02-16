
provider "kubernetes" {
  config_path = "~/.kube/config"

  # host = minikube_cluster.docker.host

  # client_certificate     = minikube_cluster.docker.client_certificate
  # client_key             = minikube_cluster.docker.client_key
  # cluster_ca_certificate = minikube_cluster.docker.cluster_ca_certificate
}

resource "kubernetes_namespace" "devopsexam" {
  metadata {
    name = "devopsexam"
  }
}

resource "kubernetes_deployment" "frontend" {
  metadata {
    name      = "frontend"
    namespace = kubernetes_namespace.devopsexam.metadata[0].name
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
          name              = "frontend"
          image             = "devops-exa-frontend:latest"
          image_pull_policy = "IfNotPresent"
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
    namespace = kubernetes_namespace.devopsexam.metadata[0].name
  }

  spec {
    selector = {
      app = kubernetes_deployment.frontend.metadata[0].labels.app
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "NodePort"
  }
}

resource "kubernetes_deployment" "backend" {
  metadata {
    name      = "backend"
    namespace = kubernetes_namespace.devopsexam.metadata[0].name
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
          name              = "backend"
          image             = "devops-exa-backend:latest"
          image_pull_policy = "IfNotPresent"
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
    namespace = kubernetes_namespace.devopsexam.metadata[0].name
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
    namespace = kubernetes_namespace.devopsexam.metadata[0].name
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
          name              = "db"
          image             = "devops-exa-db:latest"
          image_pull_policy = "IfNotPresent"
          port {
            container_port = 5432
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "db" {
  metadata {
    name      = "db"
    namespace = kubernetes_namespace.devopsexam.metadata[0].name
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
