variable "zone" {
  description = "Zone"
  default     = "ru-central1-b"
}
variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}
variable "subnet_id" {
  description = "Subnet"
}
variable "cluster_id" {
  description = "Reddit cluster id"
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
variable "node_group_name" {
  description = "Node group name"
}
