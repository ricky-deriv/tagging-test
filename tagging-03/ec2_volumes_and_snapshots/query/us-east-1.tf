provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

module "us-east-1" {
  source = "../modules/query"
  providers = {
    aws.src = aws.us-east-1
  }
  region       = "us-east-1"
  tagging_volume_file = "../tagging/volumes/us-east-1.tf"
  tagging_snapshot_file = "../tagging/snapshots/us-east-1.tf"
}