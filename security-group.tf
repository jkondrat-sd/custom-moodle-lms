resource "aws_security_group" "moodle-test-sg" {
  name        = "moodle-test-sg"
  description = "Allow HTTP, HTTPS, SSH inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.moodle-test-vpc.id

  tags = {
    Name        = "moodle-test-sg"
    owner       = local.tags["owner"]
    environment = local.tags["environment"]
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_https" {
  security_group_id = aws_security_group.moodle-test-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.moodle-test-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "custom-port-1" {
  security_group_id = aws_security_group.moodle-test-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080
}
resource "aws_vpc_security_group_ingress_rule" "custom_port-2" {
  security_group_id = aws_security_group.moodle-test-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 8443
  ip_protocol       = "tcp"
  to_port           = 8443
}
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.moodle-test-sg.id
  cidr_ipv4         = "105.115.10.211/32"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic" {
  security_group_id = aws_security_group.moodle-test-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
