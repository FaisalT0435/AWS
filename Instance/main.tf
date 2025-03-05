resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "ec2_key" {
  key_name   = var.key_name
  public_key = tls_private_key.ec2_key.public_key_openssh
}

resource "local_file" "private_key" {
  content  = tls_private_key.ec2_key.private_key_pem
  filename = "./${var.key_name}.pem"
}

resource "aws_iam_role" "ec2_role" {
  name = "ec2_ssm_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "ssm_policy" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_instance" "ec2_free_tier" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name              = aws_key_pair.ec2_key.key_name
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name

  root_block_device {
    volume_size           = var.ebs_volume_size
    volume_type           = "gp3"
    encrypted             = var.ebs_encryption
  }

  tags = {
    Name = var.instance_name
  }
}

resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = "${var.aws_region}a"
  size             = var.ebs_volume_size
  type             = "gp3"
  encrypted        = var.ebs_encryption

  tags = {
    Name = "EBS Volume"
  }
}

resource "aws_elastic_ip" "elastic_ip" {
  instance = aws_instance.ec2_free_tier.id
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg"
  description = "Allow inbound traffic on port 22"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_ec2_tag" "target_ec2" {
  resource_id = aws_instance.ec2_free_tier.id
  key         = "TargetID"
  value       = var.target_account_dev
}

resource "aws_ec2_tag" "target_type" {
  resource_id = aws_instance.ec2_free_tier.id
  key         = "TargetType"
  value       = "AWS_ACCOUNT"
}