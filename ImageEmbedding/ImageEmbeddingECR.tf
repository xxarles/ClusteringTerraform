
resource "aws_ecr_repository" "image-embedding-dev" {
  name                 = "${var.image_embedding_proj}-dev"
  image_tag_mutability = "${var.iamge_upload_ecr_repository_mutability}"
}

resource "aws_ecr_repository" "image-embedding-prd" {
  name                 = "${var.image_embedding_proj}-prd"
  image_tag_mutability = "${var.iamge_upload_ecr_repository_mutability}"
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