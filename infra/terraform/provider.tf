provider "google" {
  project = "<project-id>"
  region  = "us-central1"
}

terraform {
  backend "gcs" {
    bucket = "<your-bucket>"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}