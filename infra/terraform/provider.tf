provider "google" {
  project = "devops-374009"
  region  = "us-central1"
}

terraform {
  backend "gcs" {
    bucket = "webappze"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
