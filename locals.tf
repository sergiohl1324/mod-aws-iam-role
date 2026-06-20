### NAMING ###

locals {
  role_name = "poc-role-${var.project}-${var.role_use}"
}

### TAGS ###

locals {
  common_tags = merge(
    {
      Project     = var.project
      Environment = var.environment
      ManagedBy   = "terraform"
    },
    var.tags
  )
}
