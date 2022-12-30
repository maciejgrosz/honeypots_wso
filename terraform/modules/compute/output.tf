output "cluster_endpoint" {
    description = "Cluster endpoint"
    value = "${aws_eks_cluster.eks_cluster.endpoint}"
}

output "cluster_ca_certificate" {
    description = "cluaster ca certificate"
    value = "${aws_eks_cluster.eks_cluster.certificate_authority}"
}


# output "eks_cluster_id" {
#     description = "Cluster id"
#     value = "${aws_eks_cluster.eks_cluster.id}"
# }


# output "eks_cluster_identity_oidc_issuer" {
#     description = "eks cluster identity oidc issuer"
#     value = "${aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer}"
# }

# output "eks_cluster_identity_oidc_issuer_arn" {
#     description = "eks cluster identity oidc issuer arn"
#     value = "${aws_eks_cluster.eks_cluster.}"
# }