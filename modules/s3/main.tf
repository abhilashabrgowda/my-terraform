provider "aws" {
    region = var.region
}

resource "aws_s3_bucket" "my_bucket" {
    bucket = var.bucket_name
}

resource "aws_s3_bucket_versioning" "versioning" {
    bucket = aws_s3_bucket.my_bucket.id
    versioning_configuration {
      status = "Suspended"
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "sse" {
    bucket = aws_s3_bucket.my_bucket.id
    
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
}

#If you set status = "Suspended" — it helps you destroy the bucket easily.
#But if the bucket already had versioning "enabled", you still need to manually delete all old object versions via AWS