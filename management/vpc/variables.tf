variable "enable_dns_hostnames" {
  description = "Should be true if you want to use private DNS within the VPC"
  default     = false
}

variable "enable_dns_support" {
  description = "Should be true if you want to use private DNS within the VPC"
  default     = false
}

variable "environment" {
  description = "The Deployment environment"
}


variable "project" {
  type        = string
  description = "Project Name Tag"
  default     = "demo"
}

variable "public_subnets" {
  description = "A map of availability zones to public cidrs"
  type        = map(string)
  default = {
    us-east-1a = "",
    us-east-1b = ""
  }
}

variable "private_subnets" {
  description = "A map of availability zones to private cidrs"
  type        = map(string)
  default = {
    us-east-1a = "",
    us-east-1b = ""
  }
}

variable "region" {
  description = "The region to launch the bastion host"
}

variable "vpc_cidr" {
  description = "The CIDR block of the vpc"
}

variable "eks_cluster_name" {
  description = "A eks cluster name to set subnet specific tags"
  type        = string
  default     = "testing"
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "nat_enabled" {
  type    = bool
  default = false
}

######### Jenkins Variables

variable "jenkins_additional_ingress" {
  description = "List of ingress rules to create where cidr_blocks is used"
  type        = list(any)
  default     = []
}

variable "jenkins_ingress_cidrs" {
  description = "Map of Port to CIDR access"
  type        = map(any)
  default = {
    ssh_port     = []
    jenkins_port = []
  }
}

variable "jenkins_instance_type" {
  description = "Jenkins Instance type "
  default     = "t2.micro"
}

variable "jenkins_ami_id" {
  description = "Ami ID for Jenkins Instance"
  default     = "ami-05ba3a39a75be1ec4"
  type        = string
}

variable "vpc_sg_id" {
  description = "Security group ids for instance"
  type        = list(any)
  default     = []
}


variable "associate_public_ip_address" {
  description = "Whether to associate a public IP address with an instance in a VPC"
  type        = bool
  default     = null
}

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource"
  type        = string
  default     = "id_jenkins"
}

variable "user_data" {
  description = "Commands to run after launching instance "
  default     = null
}

variable "disable_api_termination" {
  description = "If true, enables EC2 Instance Termination Protection"
  default     = false
}