variable "credentials" {
  type        = string
  description = "My Credentials"
  default     = "./keys/credentials.json"
  sensitive   = true
}


variable "project" {
  type        = string
  description = "Project ID (must be explicitly set)"
}

variable "region" {
  type        = string
  description = "Region"
  default     = "europe-west6"
}

variable "location" {
  type        = string
  description = "Project Location"
  default     = "EU"
}

variable "bq_dataset_name" {
  type        = string
  description = "My BigQuery Dataset Name"
  default     = "demo_dataset"
}

variable "gcs_bucket_suffix" {
  type        = string
  description = "My Storage Bucket Name"
  default     = "demo_bucket"
}

variable "abort_incomplete_multipart_upload" {
  type        = number
  description = "Number of days after which an incomplete multipart upload will be aborted"
  default     = 1
}

variable "gcs_storage_class" {
  type        = string
  description = "Bucket Storage Class"
  default     = "STANDARD"
}
