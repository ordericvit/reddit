provider "google" {
  project = var.project
  region  = var.region
}

module "app" {
  source          = "C:/Users/Orderic Vitalinius/infra/terraform/prod/modules/app"
  public_key_path = "${var.public_key_path}"
  app_disk_image  = "${var.app_disk_image}"
}

module "db" {
  source          = "C:/Users/Orderic Vitalinius/infra/terraform/prod/modules/db"
  public_key_path = "${var.public_key_path}"
  db_disk_image   = "${var.db_disk_image}"
}

module "vpc" {
  source        = "C:/Users/Orderic Vitalinius/infra/terraform/prod/modules/vpc"
  source_ranges = "${var.ip_range}"
}