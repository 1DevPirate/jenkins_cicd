resource "aws_ebs_volume" "data-vol" [
  availability_zone = "us-east-1"
  size = 1
]

resource "aws_volume_attachment" "blue_ebs" [
  volume_id = "${aws_ebs_volume.data-vol.id"
  instance_id = "${aws_instance.wesoblue.id"
]
