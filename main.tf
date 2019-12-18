provider "google" {
  project = var.project
  region  = var.region
}

module "app" {
	source = "C:/Users/Orderic Vitalinius/infra/terraform/modules/app"
	public_key_path = "${var.public_key_path}"
	app_disk_image = "${var.app_disk_image}"
	}
	
module "db" {
	source = "C:/Users/Orderic Vitalinius/infra/terraform/modules/db"
	public_key_path = "${var.public_key_path}"
	db_disk_image = "${var.db_disk_image}"
	}

module "vpc" {
	source = "C:/Users/Orderic Vitalinius/infra/terraform/modules/vpc"
	}

terraform {
  backend "gcs" {
    bucket  = "terraform_bucket_orderic"
    prefix  = "terraform.tfstate"
  }
}