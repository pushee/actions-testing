terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.32"
    }
  }

  backend "s3" {
    bucket = "sheepu-tfstate"
    region = "ap-southeast-2"
    key    = "test/actions-testing/terraform.tfstate"
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_instance" "action_instance" {
  ami                  = "ami-02eec49345a878486" #  AMZN Linux 2
  instance_type        = "t2.micro"              # Free-tier eligible instance type
  iam_instance_profile = "ssm-instance-profile"
  tags = {
    Name = "gh-action-instance"
  }
}