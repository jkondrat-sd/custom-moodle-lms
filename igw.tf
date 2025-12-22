resource "aws_internet_gateway" "moodle-test-igw" {
  vpc_id = aws_vpc.moodle-test-vpc.id

  tags = {
    Name        = "moodle-test-igw"
    owner       = local.tags["owner"]
    environment = local.tags["environment"]
  }
}
