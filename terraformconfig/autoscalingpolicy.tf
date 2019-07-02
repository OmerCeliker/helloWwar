resource "aws_autoscaling_policy" "instances_autoscaling_policy" {
name = "instances_autoscaling_policy"
scaling_adjustment = 1
adjustment_type = "ChangeInCapacity"
cooldown = 300
autoscaling_group_name = "${aws_autoscaling_group.instances_autoscaling_group.name}"
}


resource "aws_autoscaling_policy" "instances_autoscaling_policy104" {
name = "instances_autoscaling_policy"
scaling_adjustment = 1
adjustment_type = "ChangeInCapacity"
cooldown = 300
autoscaling_group_name = "${aws_autoscaling_group.instances_autoscaling_group104.name}"
}



