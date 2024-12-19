module "mediaconvert_queue" {
  source = "../."

  queue_name = "test-queue"

  rules = {
    orders = {
      name           = "test-mediaconvert"
      description    = "Capture mediaconvert job events"
      event_bus_name = "default"
      event_pattern  = jsonencode({ "source" : ["aws.mediaconvert"] })

      pattern = {
        source        = ["aws.mediaconvert"]
        "detail-type" = ["MediaConvert Job State Change"]
        detail = {
          userMetadata = {
            env = ["DEV"]
          }
        }
      }
      is_enabled = true
    }
  }
  targets = {
    orders = [
      {
        arn  = module.mediaconvert_queue.sqs_arn
        name = "sqs-target-test"
      }
    ]
  }
}

provider "aws" {
  region = "eu-central-1"
}
