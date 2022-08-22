
resource "aws_ecr_repository" "image-embedding-dev" {
  name                 = "${var.image_embedding_proj}_dev"
  image_tag_mutability = "${var.image_embedding_ecr_repository_mutability}"
  force_delete         = var.image_embedding_ecr_force_delete

  provisioner "local-exec" {
    command = templatefile("ecr_template.tmpl", {proj_name = var.image_embedding_proj, account_id = var.account_id, region = var.region})
  }
}

resource "aws_ecr_repository" "image-embedding-prd" {
  name                 = "${var.image_embedding_proj}_prd"
  image_tag_mutability = "${var.image_embedding_ecr_repository_mutability}"
  force_delete         = var.image_embedding_ecr_force_delete

  provisioner "local-exec" {
    command = templatefile("ecr_template.tmpl", {proj_name = var.image_embedding_proj, account_id = var.account_id, region = var.region})
  }
}

resource "aws_ecr_repository_policy" "image-embedding-policy-dev" {
  repository = aws_ecr_repository.image-embedding-dev.name
  policy     = <<EOF
  {
    "Version": "2008-10-17",
    "Statement": [
      {
        "Sid": "adds full ecr access to the demo repository",
        "Effect": "Allow",
        "Principal": "*",
        "Action": [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:CompleteLayerUpload",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetLifecyclePolicy",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart"
        ]
      }
    ]
  }
  EOF
}

resource "aws_ecr_repository_policy" "image-embedding-policy-prd" {
  repository = aws_ecr_repository.image-embedding-prd.name
  policy     = <<EOF
  {
    "Version": "2008-10-17",
    "Statement": [
      {
        "Sid": "adds full ecr access to the demo repository",
        "Effect": "Allow",
        "Principal": "*",
        "Action": [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchGetImage",
          "ecr:CompleteLayerUpload",
          "ecr:GetDownloadUrlForLayer",
          "ecr:GetLifecyclePolicy",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart"
        ]
      }
    ]
  }
  EOF
}