provider "aws" {
  profile             = "terra"
  region              = var.region
  # access_key          = var.aws_access_key_id
  # secret_key          = var.secret_access_key
}

# terraform {
#   backend "s3" {
#     bucket  = "automation.infra.io"
#     key     = "infra/mgmt/terraform.tfstate"
#     region  = "ap-south-1"
#     profile = "terra"
#   }
# }