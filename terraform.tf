terraform {

  cloud {
    organization = "Pocdemo"

    workspaces {
      name = "tc-poc-demo"
    }
    required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  }
}

provider "aws" {
  region = "us-east-1"  
}
