variable "bucket_name" {
  description = "Static website bucket name"
  type        = string
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  default     = "australia-southeast1"
  description = "GCP region"
  type        = string
}
