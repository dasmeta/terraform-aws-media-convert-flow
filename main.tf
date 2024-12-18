resource "aws_media_convert_queue" "queue" {
  name         = var.queue_name
  pricing_plan = var.queue_pricing_plan

  status = var.status

}

module "iam_role" {
  source  = "dasmeta/iam/aws//modules/role"
  version = "1.2.1"

  name        = "MediaConverter_default_role"
  description = "Role to be attached to MediaConverter jobs"

  policy = [
    {
      actions   = ["s3:*", "s3-object-lambda:*"]
      resources = ["*"]
    }
  ]

  trust_relationship = [
    {
      principals = {
        type        = "Service"
        identifiers = ["mediaconvert.amazonaws.com"]
      },
      actions = ["sts:AssumeRole"]
    }
  ]

}
