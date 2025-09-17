terraform {
  backend "s3" {
    bucket         = "my-company-terraform-states"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
