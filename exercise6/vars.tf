variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "ZONE2" {
  default = "us-east-1b"
}

variable "ZONE3" {
  default = "us-east-1c"
}
variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-0166fe664262f664c"
    us-east-2 = "ami-088d38b423bff245f"
  }
}

variable "USER" {
  default = "ec2-user"
}
variable "PUB_KEY" {
  default = "ex3Key.pub"
}

variable "PRIV_KEY" {
  default = "ex3Key"
}