resource "aws_ecr_repository" "image-upload-dev" {
  name                 = "${var.image_upload_proj}-dev"
  image_tag_mutability = var.image_upload_ecr_repository_mutability
  force_delete         = var.image_upload_ecr_force_delete
}

resource "aws_ecr_repository" "image-upload-prd" {
  name                 = "${var.image_upload_proj}-prd"
  image_tag_mutability = var.image_upload_ecr_repository_mutability
  force_delete         = var. image_upload_ecr_force_delete


  provisioner "local-exec" {
    command = var.image_upload_ecr_provisioned_command
  }
}

resource "aws_ecr_repository_policy" "image-upload-policy-dev" {
  repository = aws_ecr_repository.image-upload-dev.name
  policy     = var.image_upload_ecr_policy
}

resource "aws_ecr_repository_policy" "image-upload-policy-prd" {
  repository = aws_ecr_repository.image-upload-prd.name
  policy     = var.image_upload_ecr_policy
}