resource "aws_security_group" "dove_stack_sg" {
  name        = "dove-stack-sg"
  vpc_id      = aws_vpc.doveex6.id
  description = "Security group for dove ssh"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MYIP]
  }

  tags = {
    Name = "allow-ssh"
  }
}