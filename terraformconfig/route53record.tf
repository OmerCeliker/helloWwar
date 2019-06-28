

resource "aws_route53_record" "record1" {
  allow_overwrite = true
  zone_id = "${aws_route53_zone.dev.zone_id}"
  name    = "frontend.tf.dev.clouddatatesting.com"
  type    = "A"
  
  
  alias {
    name                   = "${aws_elb.web.dns_name}"
    zone_id                = "${aws_elb.web.zone_id}"
    evaluate_target_health = "${var.evaluate_target_health}"
  }
  
  
}







/*
resource "aws_route53_record" "record104" {
  allow_overwrite = true
  zone_id = "${aws_route53_zone.dev.zone_id}"
  name    = "frontend.tf.dev.clouddatatesting.com"
  type    = "A"
  
  
  alias {
    name                   = "${aws_elb.web104.dns_name}"
    zone_id                = "${aws_elb.web104.zone_id}"
    evaluate_target_health = "${var.evaluate_target_health}"
  }
  
  
}
*/



/*
Create NS record in the top parent domain 
*/

resource "aws_route53_record" "updateparent" {
  allow_overwrite = true
  name            = "frontend.tf.dev.clouddatatesting.com"
  ttl             = 30
  type            = "NS"
  zone_id         = "${var.parent_zone_id}"

  records = [
    "${aws_route53_zone.dev.name_servers.0}",
    "${aws_route53_zone.dev.name_servers.1}",
    "${aws_route53_zone.dev.name_servers.2}",
    "${aws_route53_zone.dev.name_servers.3}",
  ]
}