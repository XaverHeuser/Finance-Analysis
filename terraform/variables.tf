variable "project_id" {
  type        = string
  description = "The ID of the project in which to create the resources."
  default     = "finance-analysis2"
}

variable "region" {
  type        = string
  description = "The region in which to create the resources."
  default     = "europe-west1"
}

variable "environment" {
  type        = string
  description = "The environment for which to create the resources (e.g., dev, staging, prod)."
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "The environment variable must be one of 'dev', 'staging', or 'prod'."
  }
}
