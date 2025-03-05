output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.ec2_free_tier.public_ip
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.ec2_free_tier.id
}

output "private_key_path" {
  description = "Path to the private key file"
  value       = local_file.private_key.filename
}

output "elastic_ip" {
  description = "Elastic IP Address of the instance"
  value       = aws_elastic_ip.elastic_ip.public_ip
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