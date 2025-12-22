# resource "aws_eip" "moodle-test-nat-eip" {
#   domain = "vpc"

#   tags = {
#     Name        = "moodle-test-nat-eip"
#     owner       = local.tags["owner"]
#     environment = local.tags["environment"]
#   }
# }

# output "nat-gw-public-ip" {
#   value = aws_eip.moodle-test-nat-eip.public_ip
# }
