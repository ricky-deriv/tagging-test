terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

resource "aws_volume_attachment" "ebs_att_01" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.volume_01.id
  instance_id = aws_instance.test_01.id
}

resource "aws_volume_attachment" "ebs_att_02" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.volume_02.id
  instance_id = aws_instance.test_02.id
}

resource "aws_ebs_volume" "volume_01" {
  availability_zone = "us-east-1a"
  size              = 1
}

resource "aws_ebs_volume" "volume_02" {
  availability_zone = "us-east-1a"
  size              = 1
}

resource "aws_ebs_snapshot" "snapshot_01" {
  volume_id = aws_ebs_volume.volume_01.id

  tags = {
    Name = "snapshot-01"
  }
}

resource "aws_ebs_snapshot" "snapshot_02" {
  volume_id = aws_ebs_volume.volume_02.id

  tags = {
    Name = "snapshot-02"
  }
}

resource "aws_instance" "test_01" {
  ami           = data.aws_ami.aws_linux.id
  instance_type = var.instance_type
  availability_zone = "us-east-1a"

  tags = {
    Name : "test-01"
  }
}

resource "aws_instance" "test_02" {
  ami           = data.aws_ami.aws_linux.id
  instance_type = var.instance_type
  availability_zone = "us-east-1a"

  tags = {
    Name : "test-02"
  }
}