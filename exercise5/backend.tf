terraform {
  backend "s3" {
    bucket = "terra-state-doveex5"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}