resource "aws_key_pair" "ex3Key" {
  key_name   = "ex3Key"
  public_key = file("ex3key.pub")
}

resource "aws_instance" "ex5Inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.ex3Key.key_name
  vpc_security_group_ids = ["sg-034ee135c8c27d892"]
  tags = {
    Name    = "Dove-Instance"
    Project = "Dove"
  }

  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod u+x /tmp/web.sh",
      "sudo /tmp/web.sh"

    ]
  }

  connection {
    user        = var.USER
    private_key = file("ex3key")
    host        = self.public_ip
  }
}

output "PublicIP" {
  value = aws_instance.ex5Inst.public_ip
}

output "PrivateIP" {
  value = aws_instance.ex5Inst.private_ip
}