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

module "reddit_cluster" {
  source             = "./modules/cluster"
  network_id         = var.network_id
  cluster_name       = var.cluster_name
  subnet_id          = var.subnet_id
  kube_version       = var.kube_version
  service_account_id = var.service_account_id
}

module "reddit_node_group" {
  source          = "./modules/node_group"
  cluster_id      = module.reddit_cluster.cluster_id
  node_group_name = var.node_group_name
  kube_version    = var.kube_version
  scale_size      = var.scale_size
  platform_id     = var.platform_id
  subnet_id       = var.subnet_id
  public_key_path = var.public_key_path

  depends_on = [
    module.reddit_cluster
  ]
}
