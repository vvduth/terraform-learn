resource "aws_instance" "ex2-inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = "dove-key"
  vpc_security_group_ids = ["sg-034ee135c8c27d892"]
  tags = {
    Name    = "Dove-Instance"
    Project = "Dove"
  }
}