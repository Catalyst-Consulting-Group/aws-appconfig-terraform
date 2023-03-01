variable "name" {
  description = "(Required) The name of the policy"
  type        = string
}

variable "description" {
  description = "(Optional) A description for the policy"
  type        = string
  default     = null
}

variable "application_id" {
  description = "(Required) The AWS AppConfig application ID"
  type        = string
}

variable "environment_id" {
  description = "(Required) The AWS AppConfig environment ID"
  type        = string
}

variable "configuration_profile_id" {
  description = "(Required) The AWS AppConfig configuration profile ID"
  type        = string
}

variable "tags" {
  description = "(Optional) Tags for the policy"
  type        = map(string)
  default     = {}
}
