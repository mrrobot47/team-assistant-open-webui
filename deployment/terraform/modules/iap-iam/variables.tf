variable "project_id" {
  description = "The GCP project ID."
  type        = string
}

variable "cloud_run_service_name" {
  description = "The name of the Cloud Run service to apply IAP to."
  type        = string
}

variable "cloud_run_service_location" {
  description = "The location of the Cloud Run service."
  type        = string
}

variable "cloud_run_invoker_members" {
  description = "A list of IAM members who should be granted IAP access to the Cloud Run service."
  type        = list(string)
  default     = []
}