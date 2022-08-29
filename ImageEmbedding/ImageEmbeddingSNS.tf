resource "aws_sns_topic" "face_extracted_dev" {
  name            = "${var.face_extracted_sns_name}-dev"
  delivery_policy = var.sns_face_extracted_delivery_policy
}


