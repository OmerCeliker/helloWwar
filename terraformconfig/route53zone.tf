resource "aws_route53_zone" "dev" {
  name = "tf.dev.clouddatatesting.com"

  tags = {
    Environment = "tf dev"
  }
}