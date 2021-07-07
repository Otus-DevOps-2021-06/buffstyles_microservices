terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_kubernetes_cluster" "reddit_cluster" {

  name                    = var.cluster_name
  network_id              = var.network_id
  service_account_id      = var.service_account_id
  node_service_account_id = var.service_account_id
  release_channel         = "RAPID"
  network_policy_provider = "CALICO"

  master {
    version = var.kube_version
    zonal {
      zone      = var.zone
      subnet_id = var.subnet_id
    }
    public_ip = true
    maintenance_policy {
      auto_upgrade = true
    }
  }
}
