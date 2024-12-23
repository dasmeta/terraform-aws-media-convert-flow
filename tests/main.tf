module "mediaconvert_queue" {
  source = "../."

  queue_name           = "test-queue"
  iam_role_name_suffix = "test"


}

provider "aws" {
  region = "eu-central-1"
}
