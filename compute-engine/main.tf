provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone_id
  credentials = "tf-creds.json"
}
