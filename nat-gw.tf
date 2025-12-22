# resource "aws_nat_gateway" "moodle-test-nat-gw" {
#   allocation_id = aws_eip.moodle-test-nat-eip.id
#   subnet_id     = aws_subnet.moodle-test-private-1.id

#   tags = {
#     Name = "moodle-test-nat-gw"
#   }

#   depends_on = [aws_internet_gateway.moodle-test-igw]
# }
