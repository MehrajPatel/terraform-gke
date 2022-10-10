provider "google" {
  project = "canvas-rampart-364906"
  region  = "asia"
}

terraform {
  backend "gcs" {
    bucket = "gcpve02"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
