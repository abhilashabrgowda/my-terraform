output "ec2_public_ips" {
    description = "this is the ec2 public ips"
    value = aws_instance.my-first-ec2[*].public_ip
}

output "ec2_private_ips" {
    description = "this is the ec2 private ips"
    value = aws_instance.my-first-ec2[*].private_ip
}
output "s3_bucket_name" {
    value = module.my_s3_bucket.bucket_name
}

output "s3_bucket_arn" {
   value = module.my_s3_bucket.bucket_arn
}

output "s3_bucket_region" {
    value = module.my_s3_bucket.bucket_region
}

output "s3_versioning_status" {
   value = module.my_s3_bucket.versioning_status
}

output "s3_encryption_algorithm" {
   value = module.my_s3_bucket.encryption_algorithm
}

output "dynamodb_table_name" {
    value = module.dynamodb_lock_table.dynamodb_table_name
    description = "The name of the DynamoDB table for locking"
}
