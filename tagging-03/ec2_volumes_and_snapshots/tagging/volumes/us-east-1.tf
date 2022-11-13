# AUTOGENERATED 2022-11-13T13:27:34Z
provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

# Instance Name: test-02
resource "aws_ec2_tag" "volume_vol-0a5bda9a14a06e195" {
    for_each = {
                "Cluster" : "api"
                "Env" : "canary"
                "Name" : "test-02"
                "Service" : "api"
            }
    resource_id = "vol-0a5bda9a14a06e195"
    key = each.key
    value = each.value
}
resource "aws_ec2_tag" "volume_vol-0e41d98ea1edb9f2b" {
    for_each = {
                "Cluster" : "api"
                "Env" : "canary"
                "Name" : "test-02"
                "Service" : "api"
            }
    resource_id = "vol-0e41d98ea1edb9f2b"
    key = each.key
    value = each.value
}
# Instance Name: test-01
resource "aws_ec2_tag" "volume_vol-021a8417733be96c0" {
    for_each = {
                "Cluster" : "qa-box"
                "Env" : "qa"
                "Name" : "test-01"
                "Service" : "qa-box"
            }
    resource_id = "vol-021a8417733be96c0"
    key = each.key
    value = each.value
}
resource "aws_ec2_tag" "volume_vol-00f98604d4db256ee" {
    for_each = {
                "Cluster" : "qa-box"
                "Env" : "qa"
                "Name" : "test-01"
                "Service" : "qa-box"
            }
    resource_id = "vol-00f98604d4db256ee"
    key = each.key
    value = each.value
}