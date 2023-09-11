#서울 리전 vpc
resource "aws_vpc" "Seoul_vpc" {
    provider = aws.Seoul
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "Seoul_vpc"
    }
}

#도쿄 리전 vpc
resource "aws_vpc" "Tokyo_vpc" {
    provider = aws.Tokyo
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "Tokyo_vpc"
    }
}