provider "aws" {
  region = "ap-south-1"  # Replace with your desired AWS region
}

resource "aws_instance" "ec2_instance" {
  count         = 1
  ami           = "ami-0f5ee92e2d63afc18"  # Replace with your desired AMI ID
  instance_type = "t2.medium"  # Replace with your desired instance type
  key_name      = "mumbai"  # Just the name of the key pair without .pem extension

  user_data = <<-EOT
              #!/bin/bash
              curl -sfL https://get.k3s.io | K3S_KUBECONFIG_MODE="644" sh -
              EOT

  tags = {
    Name = "SDM-K3s-SingleNodeCluster"
  }
}

