terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}



provider "aws" {
  region = "ap-southeast-3"
  assume_role {
    role_arn = var.target_account_role
  }
}


# module "iam" {
#   source = "./IAM Groups Identity Centre"

#   # Pass any required variables to the module
#   target_account_1 = var.target_account_1
# }

# Define any required variables

module "ec2_free_tier" {
  source = "./Instance"

}


