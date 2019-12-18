resource "google_compute_firewall" "firewall_mongo_prod" {
	name = "allow-mongo-default-prod"
	network = "default"
	allow {
		protocol = "tcp"
		ports = ["27017"]
	}
	target_tags = ["reddit-db"]
	source_tags = ["reddit-app"]
}

resource "google_compute_firewall" "firewall_puma_prod" {
	name = "allow-puma-default-prod"
	network = "default"
	allow {
		protocol = "tcp"
		ports = ["9292"]
	}
	source_ranges = ["0.0.0.0/0"]
	target_tags = ["reddit-app"]
}

resource "google_compute_firewall" "firewall_ssh_prod" {
	name = "default-allow-ssh-prod"
	network = "default"
	allow {
		protocol = "tcp"
		ports = ["22"]
	}
	source_ranges = "${var.source_ranges}"
}