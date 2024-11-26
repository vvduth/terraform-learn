resource "aws_key_pair" "ex6Key" {
  key_name   = "ex6Key"
  public_key = file("ex3key.pub")
}

resource "aws_instance" "ex6Inst" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.dove-pub-1.id
  availability_zone      = var.ZONE1
  key_name               = aws_key_pair.ex6Key.key_name
  vpc_security_group_ids = [aws_security_group.dove_stack_sg.id]
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


resource "aws_ebs_volume" "vol_4_dove" {
  availability_zone = var.ZONE1
  size              = 3
  tags = {
    "Name" = "extra-dove-vol"
  }
}

resource "aws_volume_attachment" "atch_vol_dove" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.vol_4_dove.id
  instance_id = aws_instance.ex6Inst.id
}

output "PublicIP" {
  value = aws_instance.ex6Inst.public_ip
}

output "PrivateIP" {
  value = aws_instance.ex6Inst.private_ip
}