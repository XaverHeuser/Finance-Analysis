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
variable "zone" {
  type        = string
  description = "The zone in which to create the resources."
  default     = "europe-west1-b"
}
