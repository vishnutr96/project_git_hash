packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
  }
}


source "amazon-ebs" "Hash-prod" {
  region        = var.region
  ami_name      = local.image-name
  source_ami    = var.instance_ami
  instance_type = var.instance_type
  ssh_username  = "ec2-user"
  tags = {
    Name    = local.image-name
    project = var.project_name
    env     = var.project_env
  }
}

build {
  sources = ["amazon-ebs.Hash-prod"]

  provisioner "file" {
    source      = "../website"
    destination = "/tmp/"
  }

  provisioner "shell" {
    script           = "./setup.sh"
    execute_command  = "sudo {{.Path}}"
  }
}
