terraform {
  backend "s3" {
    bucket         = "terraform-lightsail-state"
    key            = "terraform/state"
    region         = "us-east-1"
    encrypt        = true
  }
}