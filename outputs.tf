### IAM ROLE ###

output "role_name" {
  description = "Nombre del IAM Role"
  value       = aws_iam_role.this.name
}

output "role_arn" {
  description = "ARN del IAM Role — usar como role_arn en ECS task definitions, Lambda, etc."
  value       = aws_iam_role.this.arn
}

output "role_id" {
  description = "ID único del IAM Role"
  value       = aws_iam_role.this.id
}

output "role_unique_id" {
  description = "Unique ID estable del IAM Role (no cambia con recreación)"
  value       = aws_iam_role.this.unique_id
}

### INSTANCE PROFILE ###

output "instance_profile_name" {
  description = "Nombre del IAM Instance Profile (null si create_instance_profile = false)"
  value       = var.create_instance_profile ? aws_iam_instance_profile.this[0].name : null
}

output "instance_profile_arn" {
  description = "ARN del IAM Instance Profile — usar en aws_instance.iam_instance_profile (null si create_instance_profile = false)"
  value       = var.create_instance_profile ? aws_iam_instance_profile.this[0].arn : null
}
