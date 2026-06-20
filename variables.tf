### GLOBAL VARIABLES ###

variable "project" {
  description = "Project or application name"
  type        = string
  default     = "poc"
}

variable "environment" {
  description = "Logical environment (e.g. nonproduction, production) used for tagging"
  type        = string
  default     = "nonproduction"
}

variable "tags" {
  description = "Additional tags merged with the default tags"
  type        = map(string)
  default     = {}
}

### IAM ROLE VARIABLES ###

variable "role_use" {
  description = "Purpose of the role — part of the name: poc-role-<project>-<role_use> (e.g. ec2-ssm, ecs-task)"
  type        = string
}

variable "assume_role_policy" {
  description = "Trust policy JSON (AssumeRolePolicyDocument). Defines which entity can assume this role"
  type        = string
}

variable "description" {
  description = "IAM Role description"
  type        = string
  default     = ""
}

variable "path" {
  description = "Hierarchical path of the role in IAM (e.g. /, /service-roles/)"
  type        = string
  default     = "/"
}

variable "max_session_duration" {
  description = "Maximum session duration in seconds (3600 to 43200)"
  type        = number
  default     = 3600
}

variable "permissions_boundary" {
  description = "ARN of the policy that acts as a permissions boundary for the role"
  type        = string
  default     = null
}

### INSTANCE PROFILE ###

variable "create_instance_profile" {
  description = "If true, creates an IAM Instance Profile with the same name as the role (required for EC2)"
  type        = bool
  default     = false
}

### POLICY ATTACHMENTS ###

variable "managed_policy_arns" {
  description = "List of managed policy ARNs (AWS) to attach to the role"
  type        = list(string)
  default     = []
}

variable "inline_policies" {
  description = "Map of inline policies: key = name, value = policy JSON"
  type        = map(string)
  default     = {}
}
