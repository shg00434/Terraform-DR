#서울 IGW

resource "aws_internet_gateway" "Seoul_IGW" {
    provider = aws.Seoul
    vpc_id = aws_vpc.Seoul_vpc.id
    tags = {
        Name = "Seoul_igw"
    } 
}

#도쿄 IGW

resource "aws_internet_gateway" "Tokyo_IGW" {
    provider = aws.Tokyo
    vpc_id = aws_vpc.Tokyo_vpc.id
    tags = {
        Name = "Tokyo_igw"
    } 
}