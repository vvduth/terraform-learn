provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "introToTerra" {
  ami                    = "ami-0166fe664262f664c"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = "dove-key"
  vpc_security_group_ids = ["sg-034ee135c8c27d892"]
  tags = {
    Name = "Dove-Instance"
    Project = "Dove"
  }
}