module "mediaconvert_queue" {
  source = "../."

  queue_name           = "test-queue"
  iam_role_name_suffix = "test"

  rules = {
    orders = {
      name           = "test-mediaconvert"
      description    = "Capture mediaconvert job events"
      event_bus_name = "default"
      event_pattern  = jsonencode({ "source" = ["aws.mediaconvert"] })

      is_enabled = true
    }
  }

}

provider "aws" {
  region = "eu-central-1"
}
