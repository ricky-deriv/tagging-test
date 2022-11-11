data "aws_ebs_volumes" "volume_query" {
  provider = aws.src
}

data "aws_ebs_volume" "volumes" {
  provider = aws.src
  for_each = toset(data.aws_ebs_volumes.volume_query.ids)
  filter {
    name = "volume-id"
    values = [each.value]
  }
}

data "aws_ebs_snapshot_ids" "snapshot_query" {
  provider = aws.src
  owners = ["self"]
}

data "aws_ebs_snapshot" "snapshots" {
  provider = aws.src
  for_each = toset(data.aws_ebs_snapshot_ids.snapshot_query.ids)
  filter {
    name = "snapshot-id"
    values = [each.value]
  }
}

resource "local_file" "tagging_file" {
  content = templatefile("${path.module}/templates/tagging_snapshots.tftpl",
  {
    volumes = data.aws_ebs_volume.volumes
    snapshots = data.aws_ebs_snapshot.snapshots
    region = var.region
  })
  filename = var.tagging_file
}