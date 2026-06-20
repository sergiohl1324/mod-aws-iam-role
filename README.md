# mod-aws-iam-role

Módulo Terraform genérico para crear un IAM Role, opcionalmente con un Instance Profile (para EC2) y políticas (managed/inline) adjuntas.

## Uso

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

## Inputs principales

| Variable | Descripción | Default |
|---|---|---|
| `project` | Nombre del proyecto (naming/tagging) | `"poc"` |
| `role_use` | Propósito del rol, parte del nombre generado | — (requerido) |
| `assume_role_policy` | JSON de la trust policy | — (requerido) |
| `create_instance_profile` | Crea instance profile (para EC2) | `false` |
| `managed_policy_arns` | ARNs de policies gestionadas a adjuntar | `[]` |
| `inline_policies` | Mapa de policies inline | `{}` |

## Outputs

`role_name`, `role_arn`, `role_id`, `instance_profile_name`, `instance_profile_arn`.
