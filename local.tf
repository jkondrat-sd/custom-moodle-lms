locals {
  vpc_cidr = "10.0.0.0/16"
  subnet_cidrs = {
    # private-1 = "10.0.1.0/24"
    public-1 = "10.0.3.0/24"
  }
  tags = {
    owner       = "Moodle Test Team"
    environment = "Staging"
  }
}
