resource "google_compute_firewall" "apache_instance_firewall" {
  name               = "apache-instance-firewall"
  network            = data.google_compute_network.network.name
  source_tags        = ["created-by-hugo", "study"]
  source_ranges      = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "22"]
  }

}

resource "google_compute_instance" "apache_instance" {
  name                    = "apache-instance"
  machine_type            = "e2-micro"
  zone                    = var.zone_id
  metadata_startup_script = file("init.sh")
  tags                    = ["created-by-hugo", "study"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = data.google_compute_network.network.name

    access_config {
      // Ephemeral public IP
    }
  }


}
