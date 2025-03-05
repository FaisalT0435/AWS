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
