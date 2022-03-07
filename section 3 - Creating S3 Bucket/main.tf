terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=1.1.1"
    }
  }
}

provider "aws" {
  region = "us-west-2"

}