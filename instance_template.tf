data "google_compute_image" "my_image" {
  family  = "debian-11"
  project = "debian-cloud"
}

resource "google_compute_instance_template" "default-template-demo" {
  name         = "${local.name}-template"
  machine_type = "e2-micro"
  region       = var.region

  metadata_startup_script = file("./startup/script.sh")

  tags = ["app"]

  disk {
    source_image = data.google_compute_image.my_image.self_link
  }

  network_interface {
    network = google_compute_network.vpc_network.id
    access_config {
    }
  }

  scheduling {
    automatic_restart = true
  }

}