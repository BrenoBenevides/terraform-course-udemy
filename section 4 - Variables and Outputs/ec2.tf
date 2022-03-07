resource "aws_instance" "section4_instance" {

  ami           = "ami-08b6f2a5c291246a0"
  instance_type = "t2.micro"

  tags = {
    managed-by   = "Terraform"
    created-by   = "breno benevides"
    organization = "HPI"
    created-at   = "2022-03-05"
  }

}