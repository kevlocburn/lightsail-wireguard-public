resource "tls_private_key" "lightsail_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_lightsail_key_pair" "key_pair" {
  name       = "lightsail-key"
  public_key = tls_private_key.lightsail_key.public_key_openssh
}

resource "aws_lightsail_instance" "vm" {
  name              = "wireguard-server"
  availability_zone = "us-east-1a"
  blueprint_id      = "ubuntu_22_04"
  bundle_id         = "nano_2_0"
  key_pair_name     = aws_lightsail_key_pair.key_pair.name
}

resource "aws_lightsail_static_ip" "static_ip" {
  name = "wireguard-ip"
}

resource "aws_lightsail_static_ip_attachment" "attach_ip" {
  instance_name  = aws_lightsail_instance.vm.name
  static_ip_name = aws_lightsail_static_ip.static_ip.name
}

resource "aws_lightsail_instance_public_ports" "wireguard_ports" {
  instance_name = aws_lightsail_instance.vm.name

  port_info {
    from_port   = 51820
    to_port     = 51820
    protocol    = "udp"
  }

  port_info {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  port_info {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }

  port_info {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
  }
}

