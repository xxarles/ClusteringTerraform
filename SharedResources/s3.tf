
resource "aws_s3_bucket" "image_clustering_dev_log" {
  bucket = "img-clstr-dev-log"
  acl    = "log-delivery-write"
  force_destroy = true
}

resource "aws_s3_bucket" "image_clustering_dev" {
  bucket = "img-clstr-dev"

  tags = {
    Name        = "Image Clustering Dev Bucket"
    Environment = "Dev"
  }
  logging {
    target_bucket = aws_s3_bucket.image_clustering_dev_log.id
    target_prefix = "log/"
  }
  force_destroy = true
}

resource "aws_s3_bucket_acl" "image_clustering_dev" {
  bucket = aws_s3_bucket.image_clustering_dev.id
  acl    = "private"
}


resource "aws_s3_bucket" "image_clustering_prd_log" {
  bucket = "img-clstr-prd-log"
  acl    = "log-delivery-write"
  force_destroy = true
}

resource "aws_s3_bucket" "image_clustering_prd" {
  bucket = "img-clstr-prd"

  tags = {
    Name        = "Image Clustering Prod Bucket"
    Environment = "Prod"
  }
  logging {
    target_bucket = aws_s3_bucket.image_clustering_prd_log.id
    target_prefix = "log/"
  }
}

resource "aws_s3_bucket_acl" "image_clustering_prd" {
  bucket = aws_s3_bucket.image_clustering_prd.id
  acl    = "private"
}