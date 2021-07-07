terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_compute_instance" "master" {

  allow_stopping_for_update = true
  name                      = "${var.master_name}-${count.index + 1}"
  count                     = var.master_number
  platform_id               = var.platform_id

  labels = {
    tags = "kube-master"
  }

  resources {
    cores         = 4
    memory        = 4
    core_fraction = 50
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = 40
      type     = "network-ssd"
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
