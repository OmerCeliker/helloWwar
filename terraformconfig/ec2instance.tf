/*

resource "aws_instance" "web" {
  # The connection block tells our provisioner how to
  # communicate with the resource (instance)
 
  instance_type = "t2.micro"

  # Lookup the correct AMI based on the region
  # we specified
  ami = "${var.ami_id}"

  # The name of our SSH keypair we created above.
  key_name = "${var.key_name}"

  # Our Security group to allow HTTP and SSH access
  vpc_security_group_ids = ["${aws_security_group.default.id}"]
  
  # Copies the source_file file to target_directory
  provisioner "file" {
    source      = "${var.source_file}"
    destination = "${var.target_directory}/${var.source_file}"
  }

  # We're going to launch into the same subnet as our ELB. In a production
  # environment it's more common to have a separate private subnet for
  # backend instances.
  subnet_id = "${element(module.vpc.public_subnets,0)}"

  user_data = "${file("install_tomcat.sh")}"
  
connection {
type = "ssh"
user        = "${var.user}"
private_key = "${file("${var.key_path}/${var.key_name}.pem")}"
host = self.public_ip

}
  
}

*/

