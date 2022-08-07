resource "aws_dynamodb_table" "clustering_status_dynamodb_table_dev" {
  name           = "clustering_status_dev"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "user_id"
  range_key      = "folder_name"

  attribute {
    name = "user_id"
    type = "S"
  }

  attribute {
    name = "folder_name"
    type = "S"
  }

  tags = {
    Name        = "clusteting_status_dev"
    Environment = "dev"
  }
}
