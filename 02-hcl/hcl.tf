# Required block
# Configures our terraform project. Can take in multiple
# cloud providers. ONLY CONSTANTS ARE ALLOWED within this
# block. You can't call in variables defined by other blocks
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.37.0"
    }
  }
}

# Create resources managed by us
# resource <type_of_resource> <my_label_of_resource>
# Label-resource combintations must be unique
resource "aws_s3_bucket" "my_bucket" {
  # identifier. Note that there are different identifiers
  # and arguments in different resource types.
  # pass in a variable defined in the hcl file
  bucket = var.bucket_name

}

# To use resources not actively managed by us
# data <type_of_resource> <my_label_of_resource>
data "aws_s3_bucket" "my_external_bucket" {
  bucket = "not-managed-by-us"
}

# variable <my-name-of-variable>
variable "bucket_name" {
  type        = string
  description = "My variable used to set bucket name"
  # optional
  default = "my_default_bucket_name"
}

# Expose a variable externally. In this case we are exposing
# the bucket id externally.
output "bucket_id" {
  value = aws_s3_bucket.my_bucket.id
}

# allows us to create temporary variables - like writing code in a function to process input 
# to get the output we need. Variables defined in this block only exist within the block
locals {
  local_example = "This is a local variable"
}

# Piece of reusable code that can be imported
# This imports terraform code from a folder called module-example 
module "my_module" {
  source = "./module-example"
}
