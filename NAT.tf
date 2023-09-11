
#서울 Nat gateway
resource "aws_eip" "Seoul_nat_ip1" {
  provider = aws.Seoul
  vpc   = true

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_nat_gateway" "Seoul_nat_gateway1" {
  provider = aws.Seoul
  allocation_id = aws_eip.Seoul_nat_ip1.id

  subnet_id = aws_subnet.Seoul_subnet1.id

  tags = {
    Name = "Seoul_NAT_gateway1"
  }
}

resource "aws_eip" "Seoul_nat_ip2" {
  provider = aws.Seoul  
  vpc   = true

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_nat_gateway" "Seoul_nat_gateway2" {  
  provider = aws.Seoul
  allocation_id = aws_eip.Seoul_nat_ip2.id

  subnet_id = aws_subnet.Seoul_subnet2.id

  tags = {
    Name = "Seoul_NAT_gateway2"
  }
}

#도쿄 Nat gateway
resource "aws_eip" "Tokyo_nat_ip1" {
  provider = aws.Tokyo
  vpc   = true
  
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_nat_gateway" "Tokyo_nat_gateway1" {
  provider = aws.Tokyo
  allocation_id = aws_eip.Tokyo_nat_ip1.id

  subnet_id = aws_subnet.Tokyo_subnet1.id

  tags = {
    Name = "NAT_gateway1"
  }
}