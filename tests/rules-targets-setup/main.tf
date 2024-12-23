module "mediaconvert_queue" {
  source = "../../."

  queue_name           = "test-queue"
  iam_role_name_suffix = "test"

  rules_targets = [
    {
      rule_name   = "rule1"
      target_name = "target1"
      event_pattern = jsonencode({
        "source" : ["aws.mediaconvert"],
        "detail-type" : ["MediaConvert Job State Change"],
        "detail" : {
          "queue" : [module.mediaconvert_queue.mediaconvert_queue_arn],
          "userMetadata" : {
            "env" : ["DEV"]
          }
        }
      })
    }
  ]

}

provider "aws" {
  region = "eu-central-1"
}
