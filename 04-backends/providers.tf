terraform {
  required_version = ">= 1.7.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    # Generate random sequences of strings/id
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
  # Creating an s3 backend. Notice that terraform does not create
  # this backend s3 for us! So it must be present to begin with.
  backend "s3" {
    bucket = "terraform-course-titus-remote-backend"
    key    = "04-backends/state.tfstate"
    region = "us-east-1"
    ### Handle locking within AWS s3:
    # use_lockfile = true
  }
}

# The region here is where the resources will be deployed.
provider "aws" {
  region = "us-east-1"
}
