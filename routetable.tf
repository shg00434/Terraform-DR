
#서울 Routetable

#퍼블릭 라우팅테이블 생성
resource "aws_route_table" "Seoul_PUB_rt" {
    provider = aws.Seoul
    vpc_id = aws_vpc.Seoul_vpc.id

    tags = {
        Name = "Seoul_Route(PUB)"
    }
}

#퍼블릭 라우팅테이블 설정
resource "aws_route_table_association" "Seoul_PUB_rt_association1" {
    provider = aws.Seoul
    subnet_id = aws_subnet.Seoul_subnet1.id
    route_table_id = aws_route_table.Seoul_PUB_rt.id
}

resource "aws_route_table_association" "Seoul_rtPUBassociation2" {
    provider = aws.Seoul
    subnet_id = aws_subnet.Seoul_subnet2.id
    route_table_id = aws_route_table.Seoul_PUB_rt.id
}

#퍼블릭 라우팅테이블 IGW 연결
resource "aws_route" "Seoul_PUB_rt_IGW" {
    provider = aws.Seoul
    route_table_id         = aws_route_table.Seoul_PUB_rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id             = aws_internet_gateway.Seoul_IGW.id
}

#프라이빗 라우팅테이블 생성
resource "aws_route_table" "Seoul_PRI_rt1" {
    provider = aws.Seoul
    vpc_id = aws_vpc.Seoul_vpc.id

    tags = {
        Name = "Seoul_Route(PRI1)"
    }
}

resource "aws_route_table" "Seoul_PRI_rt2" {
    provider = aws.Seoul
    vpc_id = aws_vpc.Seoul_vpc.id

    tags = {
        Name = "Seoul_Route(PRI2)"
    }
}

#프라이빗 라우팅테이블 설정
resource "aws_route_table_association" "Seoul_PRI_rt_association1" {
    provider = aws.Seoul
    subnet_id = aws_subnet.Seoul_subnet3.id
    route_table_id = aws_route_table.Seoul_PRI_rt1.id
}

resource "aws_route_table_association" "Seoul_PRI_rt_association2" {
    provider = aws.Seoul
    subnet_id = aws_subnet.Seoul_subnet5.id
    route_table_id = aws_route_table.Seoul_PRI_rt1.id
}

resource "aws_route_table_association" "Seoul_PRI_rt_association3" {
    provider = aws.Seoul
    subnet_id = aws_subnet.Seoul_subnet4.id
    route_table_id = aws_route_table.Seoul_PRI_rt2.id
}

resource "aws_route_table_association" "Seoul_PRI_rt_association4" {
    provider = aws.Seoul
    subnet_id = aws_subnet.Seoul_subnet6.id
    route_table_id = aws_route_table.Seoul_PRI_rt2.id
}

#프라이빗 NAT게이트 연결
resource "aws_route" "Seoul_PRI_rt_Nat1" {
    provider = aws.Seoul
    route_table_id         = aws_route_table.Seoul_PRI_rt1.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id         = aws_nat_gateway.Seoul_nat_gateway1.id
}

resource "aws_route" "Seoul_PRI_rt_Nat2" {
    provider = aws.Seoul
    route_table_id         = aws_route_table.Seoul_PRI_rt2.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id         = aws_nat_gateway.Seoul_nat_gateway2.id
}

#도쿄 Routetable

#퍼블릭 라우팅테이블 생성
resource "aws_route_table" "Tokyo_PUB_rt" {
    provider = aws.Tokyo
    vpc_id = aws_vpc.Tokyo_vpc.id

    tags = {
        Name = "Tokyo_Route(PUB)"
    }
}

#퍼블릭 라우팅테이블 설정
resource "aws_route_table_association" "Tokyo_PUB_rt_association1" {
    provider = aws.Tokyo
    subnet_id = aws_subnet.Tokyo_subnet1.id
    route_table_id = aws_route_table.Tokyo_PUB_rt.id
}

resource "aws_route_table_association" "Tokyo_PUB_rt_association2" {
    provider = aws.Tokyo
    subnet_id = aws_subnet.Tokyo_subnet2.id
    route_table_id = aws_route_table.Tokyo_PUB_rt.id
}

#퍼블릭 라우팅테이블 IGW 연결
resource "aws_route" "PUB_rt_IGW" {
    provider = aws.Tokyo
    route_table_id         = aws_route_table.Tokyo_PUB_rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id             = aws_internet_gateway.Tokyo_IGW.id
}

#프라이빗 라우팅테이블 생성
resource "aws_route_table" "Tokyo_PRI_rt1" {
    provider = aws.Tokyo
    vpc_id = aws_vpc.Tokyo_vpc.id

    tags = {
        Name = "Tokyo_Route(PRI1)"
    }
}

# resource "aws_route_table" "Tokyo_PRI_rt2" {
#     provider = aws.Tokyo
#     vpc_id = aws_vpc.Tokyo_vpc.id

#     tags = {
#         Name = "Tokyo_Route(PRI2)"
#     }
# }

#프라이빗 라우팅테이블 설정
resource "aws_route_table_association" "Tokyo_PRI_rt_association1" {
    provider = aws.Tokyo
    subnet_id = aws_subnet.Tokyo_subnet3.id
    route_table_id = aws_route_table.Tokyo_PRI_rt1.id
}

resource "aws_route_table_association" "Tokyo_PRI_rt_association2" {
    provider = aws.Tokyo
    subnet_id = aws_subnet.Tokyo_subnet5.id
    route_table_id = aws_route_table.Tokyo_PRI_rt1.id
}

resource "aws_route_table_association" "Tokyo_PRI_rt_association3" {
    provider = aws.Tokyo
    subnet_id = aws_subnet.Tokyo_subnet4.id
    route_table_id = aws_route_table.Tokyo_PRI_rt1.id
}

resource "aws_route_table_association" "Tokyo_PRI_rt_association4" {
    provider = aws.Tokyo
    subnet_id = aws_subnet.Tokyo_subnet6.id
    route_table_id = aws_route_table.Tokyo_PRI_rt1.id
}

#프라이빗 NAT게이트 연결
resource "aws_route" "PRI_rt_Nat1" {
    provider = aws.Tokyo
    route_table_id         = aws_route_table.Tokyo_PRI_rt1.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id         = aws_nat_gateway.Tokyo_nat_gateway1.id
}
