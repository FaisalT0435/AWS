variable "aws_region" {
  description = "AWS region"
  default     = "ap-southeast-3"
}

variable "ami_id" {
  description = "AMI ID for the instance"
  default     = "ami-0d22ac6a0e117cefe" # Ubuntu Free Tier Eligible AMI (us-east-1)
}

variable "instance_type" {
  description = "Instance type"
  default     = "t3.micro"
}

variable "key_name" {
  description = "Key pair name for SSH access"
}

variable "instance_name" {
  description = "Name of the EC2 instance"
  default     = "Test-Dev"
}

variable "ebs_volume_size" {
  description = "Size of the EBS volume in GB"
  default     = 10
}

variable "ebs_encryption" {
  description = "Enable or disable EBS encryption"
  default     = false
}

variable "target_account_dev" {
  description = "Target AWS Account ID"
  type        = string
  default     = "603809535811"
}