resource "google_compute_instance" "another_instance" {
  name         = "terraform-instance-2"
  machine_type = "e2-micro"
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
 
  depends_on = [google_storage_bucket.example_bucket]
}

resource "google_storage_bucket" "example_bucket" {
  name     = "qwiklabs-gcp-03-1af87deca393-bucket"
  location = "US"
  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}