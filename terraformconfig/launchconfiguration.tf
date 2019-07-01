resource "aws_launch_configuration" "as_conf" {
  name_prefix   = "terraform-lc-example-"
  image_id      = "${var.ami_id}"
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true
  }
  
  key_name = "${var.key_name}" 
  
  security_groups = [ "${aws_security_group.default.id}"  ] 
  
  user_data_base64 = "${base64encode(file("install_tomcat.sh"))}"
}
