resource "helm_release" "cowrie" {
  name       = "cowrie"

  chart      = "../helm/cowrie"
}