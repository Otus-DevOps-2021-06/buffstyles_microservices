variable "image_id" {
  description = "Disk image"
}
variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}
variable "subnet_id" {
  description = "Subnet"
}
variable "worker_name" {
  description = "App name"
}
variable "worker_number" {
  description = "Instance count"
}
variable "platform_id" {
  description = "Platform ID - standard-v1 or standard-v2"
}
