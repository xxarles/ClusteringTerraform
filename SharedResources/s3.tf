
resource "aws_s3_bucket" "image_clustering_dev_log" {
  bucket = "${var.proj_name}-dev-log"
  acl    = var.s3_logging_acl
  force_destroy = var.easy_terraform_destroy
}

resource "aws_s3_bucket" "image_clustering_dev" {
  bucket = "${var.proj_name}-dev"

  tags = {
    Name        = "Image Clustering Dev Bucket"
    Environment = "Dev"
  }
  logging {
    target_bucket = aws_s3_bucket.image_clustering_dev_log.id
    target_prefix = var.log_bucket_prefix
  }
  force_destroy = var.easy_terraform_destroy
}

resource "aws_s3_bucket_acl" "image_clustering_dev" {
  bucket = aws_s3_bucket.image_clustering_dev.id
  acl    = "private"
}


resource "aws_s3_bucket" "image_clustering_prd_log" {
  bucket = "${var.proj_name}-prd-log"
  acl    = var.s3_logging_acl
  force_destroy = var.easy_terraform_destroy
}

resource "aws_s3_bucket" "image_clustering_prd" {
  bucket = "${var.proj_name}-prd"

  tags = {
    Name        = "Image Clustering Prod Bucket"
    Environment = "Prod"
  }
  logging {
    target_bucket = aws_s3_bucket.image_clustering_prd_log.id
    target_prefix = var.log_bucket_prefix
  }
}

resource "aws_s3_bucket_acl" "image_clustering_prd" {
  bucket = aws_s3_bucket.image_clustering_prd.id
  acl    = "private"
}