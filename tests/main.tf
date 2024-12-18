module "mediaconvert_queue" {
    source = "../."

    queue_name = "test-queue"
 
}

provider "aws" {
  region = "eu-central-1"
}