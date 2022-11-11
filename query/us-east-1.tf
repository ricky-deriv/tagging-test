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
  tagging_file = "../tagging/us-east-1.tf"
  import_file  = "../tagging/us-east-1.sh"
  list_file    = "../tagging/csv/us-east-1.csv"
  volume_tagging_file = "../tagging/volumes/us-east-1.tf"
}

# module "us-east-1-snapshots" {
#   source = "../modules/query_volumes_snapshots"
#   providers = {
#     aws.src = aws.us-east-1
#    }
#   region = "us-east-1"
#   tagging_file = "../tagging/snapshots/us-east-1.tf"
#     import_file  = ""
#   list_file    = ""
#   volume_tagging_file = ""

# }