resource "aws_dynamodb_table" "clustering_status_dynamodb_table_dev" {
  name           = "${var.clustering_dynamo_table_name}_dev"
  billing_mode   = var.clustering_dynamo_table_billing_mode
  read_capacity  = var.clustering_dynamo_table_read_capacity
  write_capacity = var.clustering_dynamo_table_write_capacity
  hash_key       = var.clustering_dynamo_table_hash_key
  range_key      = var.clustering_dynamo_table_range_key

  attribute {
    name =  var.clustering_dynamo_table_hash_key
    type = var.clustering_dynamo_table_hash_key_type
  }

  attribute {
    name = var.clustering_dynamo_table_range_key
    type = var.clustering_dynamo_table_range_key_type
  }

  tags = {
    Name        = "clusteting_status_dev"
    Environment = "dev"
  }
}

resource "aws_dynamodb_table" "face_embeddings_table_dev" {
  name           = "${var.face_embedding_table_name}_dev"
  billing_mode   = var.face_embedding_table_billing_mode
  read_capacity  = var.face_embedding_table_read_capacity
  write_capacity = var.face_embedding_table_write_capacity
  hash_key       = var.face_embedding_table_hash_key
  range_key      = var.face_embedding_table_range_key

  attribute {
    name =  var.face_embedding_table_hash_key
    type = var.face_embedding_table_hash_key_type
  }

  attribute {
    name = var.face_embedding_table_range_key
    type = var.face_embedding_table_range_key_type
  }

  tags = {
    Name        = "face_embeddings_table"
    Environment = "dev"
  }
}
