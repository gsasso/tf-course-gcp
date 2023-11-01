resource "google_compute_backend_service" "backend-service" {
  name          = "${local.name}-backend-service"
  health_checks = [google_compute_health_check.http-health_check.id]

  backend {
    group                 = google_compute_region_instance_group_manager.instance-group-demo.instance_group
    balancing_mode        = "RATE"
    capacity_scaler       = 1.0
    max_rate_per_instance = 500
  }

}

resource "google_compute_health_check" "http-health_check" {
  name               = "${local.name}-health-check"
  check_interval_sec = 5
  timeout_sec        = 5

  http_health_check {
    port         = 80
    request_path = "/"
  }
}