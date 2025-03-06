provider "aws" {
  region = "ap-southeast-3"
  assume_role {
    role_arn = var.target_account_role
  }
}

