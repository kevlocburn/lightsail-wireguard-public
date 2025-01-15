variable "vm_name" {
  description = "Name of the Lightsail instance."
  type        = string
  default     = "wireguard-server"
}

variable "availability_zone" {
  description = "AWS availability zone for the instance."
  type        = string
  default     = "us-east-1a"
}

variable "key_pair_name" {
  description = "Name of the key pair for SSH access."
  type        = string
  default     = "lightsail-key"
}

variable "tags" {
  description = "Tags for resources."
  type        = map(string)
  default     = {}
}

