output "external_ip_address_master" {
  value = [
    for addr in yandex_compute_instance.master[*] :
    addr.network_interface.0.nat_ip_address
  ]
}
