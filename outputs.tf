### IAM ROLE ###

output "role_name" {
  description = "IAM Role name"
  value       = aws_iam_role.this.name
}

output "role_arn" {
  description = "IAM Role ARN — use as role_arn in ECS task definitions, Lambda, etc."
  value       = aws_iam_role.this.arn
}

output "role_id" {
  description = "Unique IAM Role ID"
  value       = aws_iam_role.this.id
}

output "role_unique_id" {
  description = "Stable unique ID of the IAM Role (does not change on recreation)"
  value       = aws_iam_role.this.unique_id
}

### INSTANCE PROFILE ###

output "instance_profile_name" {
  description = "IAM Instance Profile name (null if create_instance_profile = false)"
  value       = var.create_instance_profile ? aws_iam_instance_profile.this[0].name : null
}

output "instance_profile_arn" {
  description = "IAM Instance Profile ARN — use in aws_instance.iam_instance_profile (null if create_instance_profile = false)"
  value       = var.create_instance_profile ? aws_iam_instance_profile.this[0].arn : null
}
