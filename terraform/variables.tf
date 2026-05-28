variable "project_id" {
  type        = string
  description = "The ID of the project in which to create the resources."
  default     = "finance-analysis-id"
}

variable "region" {
  type        = string
  description = "The region in which to create the resources."
  default     = "europe-west1"
}

variable "alert_recipient_email" {
  type        = string
  description = "The private email address of the developer receiving alerts."
  sensitive   = true
}