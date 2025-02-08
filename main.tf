terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"  # Change as needed
}

variable "project_name" {
  description = "Project name to be used as the bucket name"
  type        = string
}

resource "aws_s3_bucket" "react_bucket" {
  bucket = var.project_name
}

resource "aws_s3_bucket_website_configuration" "react_hosting" {
  bucket = aws_s3_bucket.react_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "react_bucket_access" {
  bucket = aws_s3_bucket.react_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "react_bucket_policy" {
  bucket = aws_s3_bucket.react_bucket.id
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::${var.project_name}/*"
    }
  ]
}
POLICY
}

output "website_url" {
  value = aws_s3_bucket_website_configuration.react_hosting.website_endpoint
}
