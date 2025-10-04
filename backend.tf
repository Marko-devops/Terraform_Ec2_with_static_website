terraform {
  backend "s3" {
    bucket = "terrafs3bucket"
    key    = "terraform_project_ec2/backend"
    region = "us-east-1"
  }
}