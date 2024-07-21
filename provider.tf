terraform {
  
 # backend "s3" {
 #   bucket               = "ems-ops-jumisa-statebackend"
 #   dynamodb_table       = "state-lock"
 #   key                  = "demo/dev.tfstate"
 #   region               = "ap-south-1"
 #   profile              = "aws" 
 #   encrypt              = true
 # }

  required_providers {
    aws                  = {
                             source  = "hashicorp/aws"
                             version = "~> 5.0"
                           }
  }
}

# Configure the AWS Provider
provider "aws" {
  profile                = "default" 
  region                 = "ap-south-1"
}