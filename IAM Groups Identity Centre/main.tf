

data "aws_ssoadmin_instances" "example" {}


########################### Groups #################################################
# Create Group
resource "aws_identitystore_group" "developer" {
  identity_store_id = tolist(data.aws_ssoadmin_instances.example.identity_store_ids)[0]
  display_name      = "developer"
  description       = "This is my AWS Developer Group"
}

resource "aws_identitystore_group" "Admin" {
  identity_store_id = tolist(data.aws_ssoadmin_instances.example.identity_store_ids)[0]
  display_name      = "Admin"
  description       = "This is my Administrator Group"
}

resource "aws_identitystore_group" "Power_User" {
  identity_store_id = tolist(data.aws_ssoadmin_instances.example.identity_store_ids)[0]
  display_name      = "Power User"
  description       = "This is my Power User Group"
}

resource "aws_identitystore_group" "ReadOnly" {
  identity_store_id = tolist(data.aws_ssoadmin_instances.example.identity_store_ids)[0]
  display_name      = "Read Only"
  description       = "This is my Read Only Group"
}

resource "aws_identitystore_group" "Root" {
  identity_store_id = tolist(data.aws_ssoadmin_instances.example.identity_store_ids)[0]
  display_name      = "Root"
  description       = "This is my Root Only Group"
}




####################### Group Membership ############################################
# Create Group Membership for the user
# resource "aws_identitystore_group_membership" "example" {
#   identity_store_id = tolist(data.aws_ssoadmin_instances.example.identity_store_ids)[0]
#   group_id          = aws_identitystore_group.developer.group_id
#   member_id         = aws_identitystore_user.example.user_id
# }

##################### Permission Sets #######################################

#### Developer
resource "aws_ssoadmin_permission_set" "developer" {
  name         = "Developer"
  instance_arn = tolist(data.aws_ssoadmin_instances.example.arns)[0]
}

resource "aws_ssoadmin_permission_set_inline_policy" "developer" {
  inline_policy      = file("./IAM Groups Identity Centre/policies/Developer.json")
  instance_arn       = tolist(data.aws_ssoadmin_instances.example.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.developer.arn
}

#### Admin
resource "aws_ssoadmin_permission_set" "Admin" {
  name         = "Admin"
  instance_arn = tolist(data.aws_ssoadmin_instances.example.arns)[0]
}

resource "aws_ssoadmin_managed_policy_attachment" "Admin" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.example.arns)[0]
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  permission_set_arn = aws_ssoadmin_permission_set.Admin.arn
}

#### Power User
resource "aws_ssoadmin_permission_set" "Power_User" {
  name         = "Power_User"
  instance_arn = tolist(data.aws_ssoadmin_instances.example.arns)[0]
}

resource "aws_ssoadmin_managed_policy_attachment" "Power_User" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.example.arns)[0]
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  permission_set_arn = aws_ssoadmin_permission_set.Power_User.arn
}

#### ReadOnly
resource "aws_ssoadmin_permission_set" "ReadOnly" {
  name         = "Read_Only"
  instance_arn = tolist(data.aws_ssoadmin_instances.example.arns)[0]
}

resource "aws_ssoadmin_managed_policy_attachment" "ReadOnly" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.example.arns)[0]
  managed_policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
  permission_set_arn = aws_ssoadmin_permission_set.ReadOnly.arn
}

#### Root
resource "aws_ssoadmin_permission_set" "Root" {
  name         = "Root_Only"
  instance_arn = tolist(data.aws_ssoadmin_instances.example.arns)[0]
}

resource "aws_ssoadmin_permission_set_inline_policy" "Root" {
  inline_policy      = file("./IAM Groups Identity Centre/policies/Developer.json")
  instance_arn       = tolist(data.aws_ssoadmin_instances.example.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.Root.arn
}




######### Deploy ################

resource "aws_ssoadmin_account_assignment" "developer" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.example.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.developer.arn # Custom Permission set

  principal_id   = aws_identitystore_group.developer.group_id # Group
  principal_type = "GROUP"

  target_id   = var.target_account_1   
  target_type = "AWS_ACCOUNT"
  # target_type = "AWS_OU"      #incase you want to target OU.
}

resource "aws_ssoadmin_account_assignment" "Admin" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.example.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.Admin.arn # Custom Permission set

  principal_id   = aws_identitystore_group.Admin.group_id # Group
  principal_type = "GROUP"

  target_id   = var.target_account_1   
  target_type = "AWS_ACCOUNT"
  # target_type = "AWS_OU"      #incase you want to target OU.
}

resource "aws_ssoadmin_account_assignment" "Power_User" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.example.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.Power_User.arn # Custom Permission set

  principal_id   = aws_identitystore_group.Power_User.group_id # Group
  principal_type = "GROUP"

  target_id   = var.target_account_1   
  target_type = "AWS_ACCOUNT"
  # target_type = "AWS_OU"      #incase you want to target OU.
}

resource "aws_ssoadmin_account_assignment" "ReadOnly" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.example.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.ReadOnly.arn # Custom Permission set

  principal_id   = aws_identitystore_group.ReadOnly.group_id # Group
  principal_type = "GROUP"

  target_id   = var.target_account_1   
  target_type = "AWS_ACCOUNT"
  # target_type = "AWS_OU"      #incase you want to target OU.
}

resource "aws_ssoadmin_account_assignment" "Root" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.example.arns)[0]
  permission_set_arn = aws_ssoadmin_permission_set.Root.arn # Custom Permission set

  principal_id   = aws_identitystore_group.Root.group_id # Group
  principal_type = "GROUP"

  target_id   = var.target_account_1   
  target_type = "AWS_ACCOUNT"
  # target_type = "AWS_OU"      #incase you want to target OU.
}


