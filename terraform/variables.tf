variable "project" {    
  description = "The GCP project ID"
  type        = string
  default = "dynamic-net-485413-t6"
  
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The GCP zone"
  type        = string
  default     = "us-central1-a"
}   

variable "gcp_bucket_name" {    
  description = "The name of the GCP storage bucket"
  type        = string
  default     = "demo-bucket-hw-t6"
  
}

variable "bq_dataset_name" {
  description = "The name of the BigQuery dataset"
  type        = string
  default     = "demo_dataset_hw_t6"
}   
    
variable "location" {
  description = "The location of the GCP resources"
  type        = string
  default     = "US"
}

variable "cred" {
    description = "The GCP service account email to impersonate"
    type        = string
    default     = "./keys/creds.json"
  
}