variable "cloud_id" {
  description = "Cloud"
}
variable "folder_id" {
  description = "Folder"
}
variable "zone" {
  description = "Zone"
  default     = "ru-central1-a"
}
variable "service_account_key_file" {
  description = "key .json"
}
variable "image_id" {
  description = "Disk image"
}
variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}
variable "subnet_id" {
  description = "Subnet"
}
variable "master_name" {
  description = "App name"
}
variable "worker_name" {
  description = "App name"
}
variable "master_number" {
  description = "Instance count"
}
variable "worker_number" {
  description = "Instance count"
}
variable "platform_id" {
  description = "Platform ID - standard-v1 or standard-v2"
}
