

data "aws_instances" "instance_query" {
  provider             = aws.src
  instance_state_names = ["running", "stopped"]
}

data "aws_instance" "instances" {
  provider    = aws.src
  count       = length(data.aws_instances.instance_query.ids)
  instance_id = data.aws_instances.instance_query.ids[count.index]
}

resource "local_file" "tagging_file" {
  content = templatefile("${path.module}/templates/tagging.tftpl",
    {
      instances = data.aws_instance.instances
      region    = var.region
  })
  filename = var.tagging_file
}

resource "local_file" "import_file" {
  content = templatefile("${path.module}/templates/import.tftpl",
    {
      instances = data.aws_instance.instances
  })
  filename = var.import_file
}

# create file to contain list of instances with their 
resource "local_file" "list_file" {
  content = templatefile("${path.module}/templates/list.tftpl",
    {
      instances = data.aws_instance.instances
      region    = var.region
    })
    filename = var.list_file
}

# create file to tag volumes based on instances' tags
resource "local_file" "volume_tagging_file" {
  content = templatefile("${path.module}/templates/tagging_vols.tftpl",
    {
      instances = data.aws_instance.instances
      region    = var.region
    })
    filename = var.volume_tagging_file
}