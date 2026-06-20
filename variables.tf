### VARIABLES GLOBALES ###

variable "project" {
  description = "Nombre del proyecto o aplicación"
  type        = string
  default     = "poc"
}

variable "environment" {
  description = "Ambiente lógico (ej. nonproduction, production) usado para tagging"
  type        = string
  default     = "nonproduction"
}

variable "tags" {
  description = "Tags adicionales que se fusionan con los tags por defecto"
  type        = map(string)
  default     = {}
}

### VARIABLES IAM ROLE ###

variable "role_use" {
  description = "Propósito del rol — parte del nombre: poc-role-<project>-<role_use> (ej: ec2-ssm, ecs-task)"
  type        = string
}

variable "assume_role_policy" {
  description = "JSON de la trust policy (AssumeRolePolicyDocument). Define qué entidad puede asumir este rol"
  type        = string
}

variable "description" {
  description = "Descripción del IAM Role"
  type        = string
  default     = ""
}

variable "path" {
  description = "Path jerárquico del rol en IAM (ej: /, /service-roles/)"
  type        = string
  default     = "/"
}

variable "max_session_duration" {
  description = "Duración máxima de sesión en segundos (3600 a 43200)"
  type        = number
  default     = 3600
}

variable "permissions_boundary" {
  description = "ARN del policy que actúa como límite de permisos del rol"
  type        = string
  default     = null
}

### INSTANCE PROFILE ###

variable "create_instance_profile" {
  description = "Si true, crea un IAM Instance Profile con el mismo nombre del rol (requerido para EC2)"
  type        = bool
  default     = false
}

### POLICY ATTACHMENTS ###

variable "managed_policy_arns" {
  description = "Lista de ARNs de políticas gestionadas (AWS) a adjuntar al rol"
  type        = list(string)
  default     = []
}

variable "inline_policies" {
  description = "Mapa de políticas inline: clave = nombre, valor = JSON de la política"
  type        = map(string)
  default     = {}
}
