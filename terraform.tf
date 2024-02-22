terraform {

  cloud {
    organization = "Pocdemo"

    workspaces {
      name = "demo-tc-poc"
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
