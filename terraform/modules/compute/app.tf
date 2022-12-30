resource "helm_release" "chess-openings" {
  name       = "chess-openings"

  chart      = "../helm/chess-app"
}