resource "google_compute_url_map" "url-map" {
  name = "${local.name}-url-map"

  default_service = google_compute_backend_service.backend-service.id
}

module "load-balancer_http-load-balancer" {
  source  = "gruntwork-io/load-balancer/google//modules/http-load-balancer"
  version = "0.5.0"
  name    = "${local.name}-http-lb"
  project = var.project_id
  url_map = google_compute_url_map.url-map.self_link
}