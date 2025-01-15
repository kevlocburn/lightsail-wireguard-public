variable "name" {
  description = "Name of the Lightsail instance."
  type        = string
}

variable "availability_zone" {
  description = "AWS availability zone for the instance."
  type        = string
}

variable "blueprint_id" {
  description = "Lightsail blueprint ID for the OS."
  type        = string
  default     = "ubuntu_22_04"
}

variable "bundle_id" {
  description = "Lightsail bundle ID for the instance size."
  type        = string
  default     = "nano_2_0"
}



variable "key_pair_name" {
  description = "Name of the SSH key pair."
  type        = string
}


variable "tags" {
  description = "Tags for the Lightsail instance."
  type        = map(string)
  default     = {}
}