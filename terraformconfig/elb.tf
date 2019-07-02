resource "aws_elb" "web" {
  name = "terraform-example-elb"

  subnets         = ["${element(module.vpc.public_subnets,0)}"]
  security_groups = ["${aws_security_group.elb.id}"]
  #instances       = ["${aws_instance.web.id}"]

  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}

/*

resource "aws_elb" "web104" {
  name = "terraform-example-elb104"

  subnets         = ["${element(module.vpc.public_subnets,0)}"]
  security_groups = ["${aws_security_group.elb.id}"]
  #instances       = ["${aws_instance.web.id}"]

  listener {
    instance_port     = 8080
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
}

*/




