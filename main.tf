### IAM ROLE ###

resource "aws_iam_role" "this" {
  name                  = local.role_name
  description           = var.description
  assume_role_policy    = var.assume_role_policy
  path                  = var.path
  max_session_duration  = var.max_session_duration
  permissions_boundary  = var.permissions_boundary
  force_detach_policies = true

  tags = local.common_tags
}

### IAM INSTANCE PROFILE (optional — for EC2) ###

resource "aws_iam_instance_profile" "this" {
  count = var.create_instance_profile ? 1 : 0

  name = local.role_name
  role = aws_iam_role.this.name
  path = var.path

  tags = local.common_tags
}

### MANAGED POLICY ATTACHMENTS ###

resource "aws_iam_role_policy_attachment" "managed" {
  for_each = toset(var.managed_policy_arns)

  role       = aws_iam_role.this.name
  policy_arn = each.value
}

### INLINE POLICIES ###

resource "aws_iam_role_policy" "inline" {
  for_each = var.inline_policies

  name   = each.key
  role   = aws_iam_role.this.id
  policy = each.value
}
