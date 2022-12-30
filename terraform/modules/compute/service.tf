resource "kubernetes_service" "testservice" {
  metadata {
    name = "testservice"
    annotations = {
      "service.beta.kubernetes.io/aws-load-balancer-type" = "nlb"
    }
  }
  spec {
    port {
      port        = 80
      target_port = 80
    }
    type = "LoadBalancer"
    selector = {
        app = "chess-app"
    }
  }
}