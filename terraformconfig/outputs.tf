# VPC
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

# CIDR blocks
output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}

//output "vpc_ipv6_cidr_block" {
//  description = "The IPv6 CIDR block"
//  value       = ["${module.vpc.vpc_ipv6_cidr_block}"]
//}

# Subnets
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

# NAT gateways
output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = module.vpc.nat_public_ips
}

# AZs
output "azs" {
  description = "A list of availability zones spefified as argument to this module"
  value       = module.vpc.azs
}

#load Balancer DNS
output "loadbalancer_dns_name" {
  description = "DNS name of the load balancer"
  value       = "${aws_elb.web.dns_name}"
}

#load Balancer DNS
output "loadbalancer_zone_id" {
  description = "Zone ID of the load balancer"
  value       = "${aws_elb.web.zone_id}"
}

#load Balancer DNS
output "loadbalancer_dns_name_104" {
  description = "DNS name of the load balancer"
  value       = "${aws_elb.web104.dns_name}"
}

#load Balancer DNS
output "loadbalancer_zone_id_104" {
  description = "Zone ID of the load balancer"
  value       = "${aws_elb.web104.zone_id}"
}


