resource "kubernetes_service" "testservice" {
  metadata {
    name = "testservice"
    annotations = {
      "service.beta.kubernetes.io/aws-load-balancer-type" = "nlb"
    }
  }
  spec {
    port {
        name = "nginx"
        port        = 80
        target_port = 80
    }
    type = "LoadBalancer"
    selector = {
        "app" = "app"
    }
    port {
        name = "cowrie"
        port = 2222
        target_port = 2222
    }
  }
}