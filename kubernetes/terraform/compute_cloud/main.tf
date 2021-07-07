terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

module "master" {
  source          = "./modules/master"
  public_key_path = var.public_key_path
  image_id        = var.image_id
  subnet_id       = var.subnet_id
  master_name     = var.master_name
  master_number   = var.master_number
  platform_id     = var.platform_id
}

module "worker" {
  source          = "./modules/worker"
  public_key_path = var.public_key_path
  image_id        = var.image_id
  subnet_id       = var.subnet_id
  worker_name     = var.worker_name
  worker_number   = var.worker_number
  platform_id     = var.platform_id
}
