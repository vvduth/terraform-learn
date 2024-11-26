variable "REGION" {
  default = "us-east-1"
}

variable "ZONE1" {
  default = "us-east-1a"
}

variable "AMIS" {
  type = map(any)
  default = {
    us-east-1 = "ami-0166fe664262f664c"
    us-east-2 = "ami-088d38b423bff245f"
  }
}