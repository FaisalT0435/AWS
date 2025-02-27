provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region
}

module "iam" {
  source = "./IAM Groups Identity Centre"

  # Pass any required variables to the module
  target_account_1 = var.target_account_1
}

# Output any necessary outputs from the module
output "developer_group_id" {
  value = module.iam.developer_group_id
}

output "admin_group_id" {
  value = module.iam.admin_group_id
}

output "power_user_group_id" {
  value = module.iam.power_user_group_id
}

output "read_only_group_id" {
  value = module.iam.read_only_group_id
}

output "root_group_id" {
  value = module.iam.root_group_id
}