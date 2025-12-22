# resource "aws_route_table" "moodle-test-private-rt" {
#   vpc_id = aws_vpc.moodle-test-vpc.id

#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.moodle-test-nat-gw.id
#   }

#   tags = {
#     Name        = "moodle-test-private-rt"
#     owner       = local.tags["owner"]
#     environment = local.tags["environment"]
#   }
# }

resource "aws_route_table" "moodle-test-public-rt" {
  vpc_id = aws_vpc.moodle-test-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.moodle-test-igw.id
  }

  tags = {
    Name        = "moodle-test-public-rt"
    owner       = local.tags["owner"]
    environment = local.tags["environment"]
  }
}

# resource "aws_route_table_association" "private-rt-assoc-private-subnet" {
#   subnet_id      = aws_subnet.moodle-test-private-1.id
#   route_table_id = aws_route_table.moodle-test-private-rt.id
# }

resource "aws_route_table_association" "public-rt-assoc-public-subnet" {
  subnet_id      = aws_subnet.moodle-test-public-1.id
  route_table_id = aws_route_table.moodle-test-public-rt.id
}
