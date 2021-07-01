output "external_ip_address_app" {
  value = [
    for addr in yandex_compute_instance.app[*] :
    addr.network_interface.0.nat_ip_address
  ]
}
