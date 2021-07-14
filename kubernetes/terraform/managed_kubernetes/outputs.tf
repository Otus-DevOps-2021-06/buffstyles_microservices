output "cluster_external_v4_endpoint" {
  value = yandex_kubernetes_cluster.reddit_cluster.master.0.external_v4_endpoint
}
