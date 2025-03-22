terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.92"
    }
  }
}

provider "aws" {
  region = "eu-west-2"

  default_tags {
    tags = {
      IAC     = "Yes"
      Owner   = "Nathan Purvis"
      Company = "The Information Lab"
    }
  }
}