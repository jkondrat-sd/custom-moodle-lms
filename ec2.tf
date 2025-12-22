resource "aws_instance" "moodle-test-instance" {
  ami                         = "ami-08d7aabbb50c2c24e"
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.moodle-test-public-1.id
  vpc_security_group_ids      = [aws_security_group.moodle-test-sg.id]
  availability_zone           = "us-east-1a"
  key_name                    = "cloudforgex-key-pair-3"
  associate_public_ip_address = true

  root_block_device {
    volume_size           = 30
    volume_type           = "gp3"
    delete_on_termination = true
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("C:/Users/BOBBY/cloudforgex-crypto-keys/cloudforgex-key-pair-3.pem")
    host        = self.public_ip
    timeout     = "10m"
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir -p /home/ec2-user/moodle",
      "chown ec2-user:ec2-user /home/ec2-user/moodle"
    ]
  }

  provisioner "file" {
    source      = "./scripts/docker-setup.sh"
    destination = "/home/ec2-user/docker-setup.sh"
  }

  provisioner "file" {
    source      = "./moodle-script/docker-compose.yaml"
    destination = "/home/ec2-user/moodle/docker-compose.yaml"
  }

  provisioner "file" {
    source      = "./moodle-script/.env"
    destination = "/home/ec2-user/moodle/.env"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ec2-user/docker-setup.sh",
      "sudo bash /home/ec2-user/docker-setup.sh"
    ]
  }

  tags = {
    Name        = "moodle-test-instance"
    owner       = local.tags["owner"]
    environment = local.tags["environment"]
  }

}

output "moodle-test-instance_public-ip" {
  value = aws_instance.moodle-test-instance.public_ip
}
