module "compute" {
  source               = "./modules/compute"
  single_config        = var.single_config
  subnets_list         = module.network.subnets_list
  vpc_id               = module.network.vpc_id
  security_group_id    = module.network.security_group_id
  role_arn             = var.role_arn
  cluster_version      = var.cluster_version
  node_group_name      = var.node_group_name
  instance_types       = var.instance_types
  no_of_nodes          = var.no_of_nodes
  cluster_name         = var.cluster_name
}

module "network" {
  source                = "./modules/network"
  single_config         = var.single_config
  subnets               = var.subnets
  tf_vpc                = var.tf_vpc
  route_table           = var.route_table
  ingress_cidr_blocks   = var.ingress_cidr_blocks
  ingress_rules         = var.ingress_rules
  egress_cidr_blocks    = var.egress_cidr_blocks
  internet_gateway_tags = var.internet_gateway_tags
  egress_rules          = var.egress_rules
  rules                 = var.rules
  security_group_tag    = var.security_group_tag
}

# module "lb_controller_helm" {
#   source  = "lablabs/eks-load-balancer-controller/aws"
#   version = "1.1.0"
#   enabled           = true
#   argo_enabled      = false
#   argo_helm_enabled = false

#   cluster_name                     = module.compute.eks_cluster_id
#   cluster_identity_oidc_issuer     = module.compute.eks_cluster_identity_oidc_issuer
#   cluster_identity_oidc_issuer_arn = module.compute.eks_cluster_identity_oidc_issuer_arn

#   helm_release_name = "aws-lbc-helm"
#   namespace         = "aws-lb-controller-helm"

#   values = yamlencode({
#     "podLabels" : {
#       "app" : "aws-lbc-helm"
#     }
#   })

#   helm_timeout = 240
#   helm_wait    = true
# }