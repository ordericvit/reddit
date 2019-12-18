resource "google_compute_instance" "db_prod" {
	name = "reddit-db-prod"
	machine_type = "g1-small"
	zone = "europe-north1-a"
	tags = ["reddit-db"]
	boot_disk {
		initialize_params {
			image = "${var.db_disk_image}"
		}
	}
	network_interface {
		network = "default"
		access_config {}
	}
	metadata = {
			sshKeys = "appuser:${file(var.public_key_path)}"
		}
}
