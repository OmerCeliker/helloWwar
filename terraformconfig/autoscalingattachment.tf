resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = "${aws_autoscaling_group.instances_autoscaling_group.id}"
  elb                    = "${aws_elb.web.id}"
}
/*
resource "aws_autoscaling_attachment" "asg_attachment_bar104" {
  autoscaling_group_name = "${aws_autoscaling_group.instances_autoscaling_group104.id}"
  elb                    = "${aws_elb.web104.id}"
}

*/

