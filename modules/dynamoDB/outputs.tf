output "dynamodb_table_name" {
    value = aws_dynamodb_table.tf_lock.name
    description = "The name of the DynamoDB table for locking"
}
