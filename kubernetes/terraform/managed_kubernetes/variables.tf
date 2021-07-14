variable "cloud_id" {
  description = "Cloud"
}
variable "folder_id" {
  description = "Folder"
}
variable "zone" {
  description = "Zone"
  default     = "ru-central1-b"
}
variable "service_account_key_file" {
  description = "key .json"
}
variable "service_account_id" {
  description = "acc id"
}
variable "image_id" {
  description = "Disk image"
}
variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}
variable "network_id" {
  description = "Network"
}
variable "subnet_id" {
  description = "Subnet"
}
variable "platform_id" {
  description = "Platform ID - standard-v1 or standard-v2"
}
variable "scale_size" {
  description = "Scale size"
}
variable "kube_version" {
  description = "Kubernetes version"
}
