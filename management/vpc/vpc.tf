module "vpc" {
  source = "../../modules/vpc"
  
  region               = var.region 
  vpc_cidr             = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  eks_cluster_name     = var.eks_cluster_name
  environment          = var.environment
  additional_tags      = var.tags

  public_subnets       = var.public_subnets
  private_subnets      = var.private_subnets
  nat_enabled          = var.nat_enabled
}