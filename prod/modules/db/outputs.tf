output "app_external_ip" {
  value = "${google_compute_instance.db_prod.network_interface.0.access_config.0.nat_ip}"
}