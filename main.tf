provider "aws" {
  region = "us-west-2"  # Replace with your desired AWS region
}

module "iam" {
  source = "///IAM%20Groups%20Identity%20Centre"

  # Pass any required variables to the module
  target_account_1 = var.target_account_1
}

# Define any required variables
variable "target_account_1" {
  description = "The target AWS account ID for SSO account assignments"
  type        = string
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