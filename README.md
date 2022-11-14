# Tagging Test on Sandbox
This repo contains code to create resources (instances, volumes, and snapshots) in a sandbox environment (AWS).
The complete code is contained in tagging-03 directory.

## Creating resources
- change directory to tagging-03/create_for_testing/
- run `terraform init`.
- run `terraform plan` to review incoming changes.
- run `terraform apply` to apply the changes.

## Query and generate tagging terraform script for volumes
This will obtain tags of instances, and generate a terraform script that contains attached volumes with the tags of the attached instances. 
- change directory to tagging-03/ec2_volumes_and_snapshots/query/
- run `terraform init`.
- run `teraform plan`.
- run `terraform apply`.

## Apply tags to volumes
This will apply tags to volumes
- change directory to tagging-03/ec2_volumes_and_snapshots/tagging/volumes/
- run `terraform init`.
- run `teraform plan`.
- run `terraform apply`.

## Query and generate tagging terraform script for snapshots
This will obtain tags of volumes, and generate a terraform script that contains attached snapshots with the tags of the attached volumes. 
- change directory to tagging-03/ec2_volumes_and_snapshots/query/
- run `terraform init`.
- run `teraform plan`.
- run `terraform apply`.

## Apply tags to snapshots
This will apply tags to snapshots.
- change directory to tagging-03/ec2_volumes_and_snapshots/tagging/snapshots/
- run `terraform init`.
- run `teraform plan`.
- run `terraform apply`.