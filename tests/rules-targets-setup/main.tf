module "mediaconvert_queue" {
  source = "../../."

  queue_name     = "test-queue"
  sqs_fifo_queue = true

  rules_targets = [
    {
      rule_name     = "rule1"
      target_name   = "target1"
      event_pattern = <<EOF
      {
        "source" : ["aws.mediaconvert"],
        "detail-type" : ["MediaConvert Job State Change"],
        "detail" : {
          "queue" : ["${module.mediaconvert_queue.mediaconvert_queue_arn}"],
          "userMetadata" : {
            "env" : ["DEV"]
          }
        }
      }
      EOF
    }
  ]
}

provider "aws" {
  region = "eu-central-1"
}
