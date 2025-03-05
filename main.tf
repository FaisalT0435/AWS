provider "aws" {
  region = "ap-southeast-3"  # Replace with your desired AWS region
}

# module "iam" {
#   source = "./IAM Groups Identity Centre"

#   # Pass any required variables to the module
#   target_account_1 = var.target_account_1
# }

# Define any required variables

module "ec2" {
  source = " ./Instance"
}


