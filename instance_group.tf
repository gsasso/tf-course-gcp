resource "google_compute_region_instance_group_manager" "instance-group-demo" {
  name                      = "instance-group-demo"
  base_instance_name        = "instance-app"
  region                    = var.region
  distribution_policy_zones = var.zones
  target_size               = var.vm_count

  version {
    instance_template = google_compute_instance_template.default-template-demo.id
  }

  named_port {
    name = "http"
    port = 80
  }

  auto_healing_policies {
    health_check      = google_compute_health_check.autohealing.id
    initial_delay_sec = 60
  }

}

resource "google_compute_health_check" "autohealing" {
  name                = "autohealing"
  check_interval_sec  = 5
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 10

  http_health_check {
    request_path = "/"
    port         = "80"
  }
}
