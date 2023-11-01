resource "google_compute_network" "vpc_network" {
  name                    = "${local.name}-vpc"
  auto_create_subnetworks = true
}
