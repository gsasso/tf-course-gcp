resource "google_compute_firewall" "default" {
  name    = "${local.name}-firewall"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["35.191.0.0/16", "130.211.0.0/22"]
  target_tags   = ["app"]
  source_tags   = ["app"]
}