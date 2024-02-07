terraform {

  cloud {
    organization = "Pocdemo"

    workspaces {
      name = "Poc-project-workspace"
    }
  }
}

provider "aws" {
  region = "us-east-1"  
}