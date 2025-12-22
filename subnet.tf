# resource "aws_subnet" "moodle-test-private-1" {
#   vpc_id            = aws_vpc.moodle-test-vpc.id
#   cidr_block        = local.subnet_cidrs["private-1"]
#   availability_zone = "us-east-1a"

#   tags = {
#     Name        = "moodle-test-private-1"
#     owner       = local.tags["owner"]
#     environment = local.tags["environment"]
#   }
# }

resource "aws_subnet" "moodle-test-public-1" {
  vpc_id                  = aws_vpc.moodle-test-vpc.id
  cidr_block              = local.subnet_cidrs["public-1"]
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name        = "moodle-test-public-1"
    owner       = local.tags["owner"]
    environment = local.tags["environment"]
  }
}
