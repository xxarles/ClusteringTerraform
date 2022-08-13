resource "aws_ecr_repository" "image-upload-dev" {
  name                 = "${var.image_upload_proj}-dev"
  image_tag_mutability = "${var.iamge_upload_ecr_repository_mutability}"
}

resource "aws_ecr_repository" "image-upload-prd" {
  name                 = "${var.image_upload_proj}-prd"
  image_tag_mutability = "${var.iamge_upload_ecr_repository_mutability}"
}

resource "aws_ecr_repository_policy" "image-upload-policy-dev" {
  repository = aws_ecr_repository.image-upload-dev.name
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

resource "aws_ecr_repository_policy" "image-upload-policy-prd" {
  repository = aws_ecr_repository.image-upload-prd.name
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