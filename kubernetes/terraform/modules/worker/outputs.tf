output "external_ip_address_worker" {
  value = [
    for addr in yandex_compute_instance.worker[*] :
    addr.network_interface.0.nat_ip_address
  ]
}
