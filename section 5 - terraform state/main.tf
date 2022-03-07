terraform {
  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = ">= 1.1.0"

    }

  }

  backend "s3" {
    bucket = "terraform-remote-state-benevides"
    key = "state"
    region = "us-west-2"


  }
}

provider "aws" {

  region = "us-west-2"
}