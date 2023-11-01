terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.4.0"
    }
  }
}

provider "google" {
  credentials = file("${path.module}/credentials/tf-demo-gcp-crendentials.json")
  project     = var.project_id
}