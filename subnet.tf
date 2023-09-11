
#서울 리전 subnet

#퍼블릭 서브넷
resource "aws_subnet" "Seoul_subnet1" {
    provider = aws.Seoul
    vpc_id = aws_vpc.Seoul_vpc.id
    cidr_block = "10.0.1.0/24"
    
    availability_zone = "ap-northeast-2a"

    tags = {
        Name = "Seoul_subnet1(PUB)"
    }
    
}

resource "aws_subnet" "Seoul_subnet2" {
     provider = aws.Seoul
    vpc_id = aws_vpc.Seoul_vpc.id
    cidr_block = "10.0.2.0/24"

    availability_zone = "ap-northeast-2c"

    tags = {
        Name = "Seoul_subnet2(PUB)"
    }
}

#프라이빗 서브넷
resource "aws_subnet" "Seoul_subnet3" {
     provider = aws.Seoul
    vpc_id = aws_vpc.Seoul_vpc.id
    cidr_block = "10.0.3.0/24"

    availability_zone = "ap-northeast-2a"

    tags = {
        Name = "Seoul_subnet3(PRI)"
    }
}

resource "aws_subnet" "Seoul_subnet4" {
     provider = aws.Seoul
    vpc_id = aws_vpc.Seoul_vpc.id
    cidr_block = "10.0.4.0/24"

    availability_zone = "ap-northeast-2c"

    tags = {
        Name = "Seoul_subnet4(PRI)"
    }
}

#RDS 서브넷
resource "aws_subnet" "Seoul_subnet5" {
    provider = aws.Seoul
    vpc_id = aws_vpc.Seoul_vpc.id
    cidr_block = "10.0.5.0/24"

    availability_zone = "ap-northeast-2a"

    tags = {
        Name = "Seoul_subnet5(RDS)"
    }
}

resource "aws_subnet" "Seoul_subnet6" {
     provider = aws.Seoul
    vpc_id = aws_vpc.Seoul_vpc.id
    cidr_block = "10.0.6.0/24"

    availability_zone = "ap-northeast-2c"

    tags = {
        Name = "Seoul_subnet6(RDS)"
    }
}

#도쿄리전 subnet

#퍼블릭 서브넷
resource "aws_subnet" "Tokyo_subnet1" {
    provider = aws.Tokyo
    vpc_id = aws_vpc.Tokyo_vpc.id
    cidr_block = "10.0.1.0/24"
    
    availability_zone = "ap-northeast-1a"

    tags = {
        Name = "Tokyo_subnet1(PUB)"
    }
    
}

resource "aws_subnet" "Tokyo_subnet2" {
     provider = aws.Tokyo
    vpc_id = aws_vpc.Tokyo_vpc.id
    cidr_block = "10.0.2.0/24"

    availability_zone = "ap-northeast-1c"

    tags = {
        Name = "Tokyo_subnet2(PUB)"
    }
}

#프라이빗 서브넷
resource "aws_subnet" "Tokyo_subnet3" {
     provider = aws.Tokyo
    vpc_id = aws_vpc.Tokyo_vpc.id
    cidr_block = "10.0.3.0/24"

    availability_zone = "ap-northeast-1a"

    tags = {
        Name = "Tokyo_subnet3(PRI)"
    }
}

resource "aws_subnet" "Tokyo_subnet4" {
     provider = aws.Tokyo
    vpc_id = aws_vpc.Tokyo_vpc.id
    cidr_block = "10.0.4.0/24"

    availability_zone = "ap-northeast-1c"

    tags = {
        Name = "Tokyo_subnet4(PRI)"
    }
}

#RDS 서브넷
resource "aws_subnet" "Tokyo_subnet5" {
    provider = aws.Tokyo
    vpc_id = aws_vpc.Tokyo_vpc.id
    cidr_block = "10.0.5.0/24"

    availability_zone = "ap-northeast-1a"

    tags = {
        Name = "Tokyo_subnet5(RDS)"
    }
}

resource "aws_subnet" "Tokyo_subnet6" {
     provider = aws.Tokyo
    vpc_id = aws_vpc.Tokyo_vpc.id
    cidr_block = "10.0.6.0/24"

    availability_zone = "ap-northeast-1c"

    tags = {
        Name = "Tokyo_subnet6(RDS)"
    }
}
