# State Management Module (S3 Backend for Terraform State)
module "state_management" {
  source         = "./modules/state_management"
  s3_bucket_name = "terraform-lightsail-state"
}

# WireGuard VM Module (Lightsail VM and Keys)
module "wireguard_vm" {
  source            = "./modules/lightsail_vm"
  name              = var.vm_name
  availability_zone = var.availability_zone
  key_pair_name     = var.key_pair_name
  tags              = var.tags
}


