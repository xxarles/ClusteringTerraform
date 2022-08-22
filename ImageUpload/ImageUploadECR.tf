resource "aws_ecr_repository" "image-upload-dev" {
  name                 = "${var.image_upload_proj}_dev"
  image_tag_mutability = var.image_upload_ecr_repository_mutability
  force_delete         = var.image_upload_ecr_force_delete

  provisioner "local-exec" {
    command = templatefile("ecr_template.tmpl", {proj_name = var.image_upload_proj, account_id = var.account_id, region = var.region})
  }
}

resource "aws_ecr_repository" "image-upload-prd" {
  name                 = "${var.image_upload_proj}_prd"
  image_tag_mutability = var.image_upload_ecr_repository_mutability
  force_delete         = var. image_upload_ecr_force_delete


  provisioner "local-exec" {
    command = templatefile("ecr_template.tmpl", {proj_name = var.image_upload_proj, account_id = var.account_id, region = var.region})
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