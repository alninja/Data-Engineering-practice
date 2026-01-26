terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "7.16.0"
    }
  }
}

 # Connect to gcp using ADC (identity verification)
 provider "google" {
    credentials = var.cred
   project = var.project
   region  = var.region
   zone    = var.zone
 }

resource "google_storage_bucket" "demo_bucket" {
  name          = var.gcp_bucket_name
  location      = var.location
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}


resource "google_bigquery_dataset" "demo_dataset" {
  dataset_id = var.bq_dataset_name

}