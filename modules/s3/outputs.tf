output "bucket_name" {
    value = aws_s3_bucket.my_bucket.bucket
    description = "name of the s3 bucket"
}

output "bucket_arn" {
    value = aws_s3_bucket.my_bucket.arn
    description = "arn of the s3 bucket"
}

output "bucket_region" {
    value = var.region
    description = "region of the s3 bucket"
}

output "versioning_status" {
    value = aws_s3_bucket_versioning.versioning.versioning_configuration[0].status
    description = "versioning status of the s3 bucket"
}

output "encryption_algorithm" {
    value = [
      for r in aws_s3_bucket_server_side_encryption_configuration.sse.rule :
      r.apply_server_side_encryption_by_default[0].sse_algorithm
    ][0]
    description = "encryption algorithm used"
}