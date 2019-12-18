resource "google_compute_instance" "app_prod" {
		name = "reddit-app-prod"
		machine_type = "g1-small"
		zone = "europe-north1-a"
		tags = ["reddit-app"]
	boot_disk {
			initialize_params {
			image = "${var.app_disk_image}"
		}
	}
	network_interface {
		network = "default"
		access_config {
			nat_ip = "${google_compute_address.app_ip.address}"
		}
	}
	metadata = {
		sshKeys = "appuser:${file(var.public_key_path)}"
	}
}

resource "google_compute_address" "app_ip" {
		name = "reddit-app-ip-prod"
	}