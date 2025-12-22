resource "aws_vpc" "moodle-test-vpc" {
  cidr_block           = local.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "moodle-test-vpc"
    owner       = local.tags["owner"]
    environment = local.tags["environment"]
  }
}
