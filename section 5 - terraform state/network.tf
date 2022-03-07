locals {
  tags = {"created-by" = "brenobenevides"
          "managed-by" = "terraform"
  }

}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = local.tags
}

resource "aws_subnet" "my_subnet" {
  vpc_id = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = local.tags

}

resource "aws_internet_gateway" "internet_gateway" {

  vpc_id = aws_vpc.my_vpc.id
  tags = local.tags

}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = local.tags
}

resource "aws_route_table_association" "route_table_association"{
  route_table_id = aws_route_table.route_table.id
  gateway_id = aws_internet_gateway.internet_gateway.id
  subnet_id = aws_subnet.my_subnet.id


}

resource "aws_security_group" "security_group" {
  name        = "my_security_group"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.my_vpc.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.my_vpc.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["0.0.0.0/0"]
  }
}

