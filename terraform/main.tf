provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    encrypt = true
    bucket  = "gitlab-runner-spawner"
    region  = "us-east-1"
    key     = "tf/pat.tfstate"
  }
}

data "aws_ami" "gitlab" {
  most_recent = true
  owners      = ["self"]
  tags = {
    ami_name = "gitlab-runner-spawner-PAT"
  }
}

module "iam" {
  source = "./modules/iam"
}

module "key" {
  source = "./modules/key"
}

resource "aws_instance" "gitlab-runner-spawner" {
  ami                  = data.aws_ami.gitlab.id
  instance_type        = var.instance_type
  iam_instance_profile = module.iam.role_arn_name
  subnet_id            = var.subnet_id
  security_groups      = var.security_groups
  key_name             = module.key.key_name
  root_block_device {
    tags = {
      "Name"  = "gitlab-runner-spawner"
      "Owner" = "Owner"
    }
    /* # Optional Security: Ensure all data stored in the Launch configuration EBS is securely encrypted (README)
    encrypted = true */
  }
  /* # Optional Security: Ensure Instance Metadata Service Version 1 is not enabled (README)
  metadata_options {
    http_tokens = "required"
  } */
  tags = {
    Name = "gitlab-runner-spawner"
  }
}
