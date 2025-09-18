provider "aws" {
  region = "us-east-1"
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket         = "my-company-terraform-states"          # same bucket
    key            = "network/vpc/terraform.tfstate"        # path to vpc state
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}

resource "aws_security_group" "this" {
  name        = var.sg_name
  description = var.description
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id  # <-- uses output

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
