
/*
resource "aws_autoscaling_group" "instances_autoscaling_group" {
name                      = "instances_autoscaling_group"
max_size                  = 3
min_size                  = 2
#instances in auto scaling group and elb is in the same subnet
vpc_zone_identifier       = [ "${element(module.vpc.public_subnets,0)}"  ]


load_balancers = [  "${aws_elb.web.name}"  ] 

launch_configuration = "${aws_launch_configuration.as_conf.name}"

tag {
key                 = "Name"
value               = "AutoScaled"
propagate_at_launch = true
}

tag {
key                 = "Initialized"
value               = "false"
propagate_at_launch = true
}

}
*/




resource "aws_autoscaling_group" "instances_autoscaling_group104" {
name                      = "instances_autoscaling_group104"
max_size                  = 3
min_size                  = 2
#instances in auto scaling group and elb is in the same subnet
vpc_zone_identifier       = [ "${element(module.vpc.public_subnets,0)}"  ]


load_balancers = [  "${aws_elb.web104.name}"  ] 

launch_configuration = "${aws_launch_configuration.as_conf.name}"

tag {
key                 = "Name"
value               = "AutoScaled"
propagate_at_launch = true
}

tag {
key                 = "Initialized"
value               = "false"
propagate_at_launch = true
}

}

