output "developer_group_id" {
  value = aws_identitystore_group.developer.group_id
}

output "admin_group_id" {
  value = aws_identitystore_group.Admin.group_id
}

output "power_user_group_id" {
  value = aws_identitystore_group.Power_User.group_id
}

output "read_only_group_id" {
  value = aws_identitystore_group.ReadOnly.group_id
}

output "root_group_id" {
  value = aws_identitystore_group.Root.group_id
}
# Output any necessary outputs from the module
# output "developer_group_id" {
#   value = module.iam.developer_group_id
# }

# output "admin_group_id" {
#   value = module.iam.admin_group_id
# }

# output "power_user_group_id" {
#   value = module.iam.power_user_group_id
# }

# output "read_only_group_id" {
#   value = module.iam.read_only_group_id
# }

# output "root_group_id" {
#   value = module.iam.root_group_id
# }