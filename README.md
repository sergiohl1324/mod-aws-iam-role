# mod-aws-iam-role

Generic Terraform module to create an IAM Role, optionally with an Instance Profile (for EC2) and attached policies (managed/inline).

## Usage

```hcl
module "iam_role_app_server" {
  source = "git::https://github.com/sergiohl1324/mod-aws-iam-role.git?ref=main"

  project   = "poc"
  role_use  = "ec2-ssm"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })

  create_instance_profile = true
  managed_policy_arns      = ["arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"]
}
```

## Main inputs

| Variable | Description | Default |
|---|---|---|
| `project` | Project name (naming/tagging) | `"poc"` |
| `role_use` | Purpose of the role, part of the generated name | — (required) |
| `assume_role_policy` | Trust policy JSON | — (required) |
| `create_instance_profile` | Create an instance profile (for EC2) | `false` |
| `managed_policy_arns` | Managed policy ARNs to attach | `[]` |
| `inline_policies` | Map of inline policies | `{}` |

## Outputs

`role_name`, `role_arn`, `role_id`, `instance_profile_name`, `instance_profile_arn`.
