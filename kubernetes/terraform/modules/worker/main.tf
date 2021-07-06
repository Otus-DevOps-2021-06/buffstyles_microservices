terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_compute_instance" "worker" {

  allow_stopping_for_update = true
  name  = "${var.worker_name}-${count.index + 1}"
  count = var.worker_number
  platform_id = var.platform_id

  labels = {
    tags = "kube-worker"
  }

  resources {
    cores         = 4
    memory        = 4
    core_fraction = 50
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size = 40
      type = "network-ssd"
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
}
