
#서울 SG
resource "aws_security_group" "Seoul_allow_public" {
  provider    = aws.Seoul
  name        = "Seoul_allow_Public"
  description = "Seoul_Allow Public inbound traffic"
  vpc_id      = aws_vpc.Seoul_vpc.id

  ingress {
    description      = "all traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTP from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.Seoul_vpc.cidr_block]
  }

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
    ingress {
    description      = "HTTPs from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTP from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.Seoul_vpc.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Seoul_allow_http"
  }
}

resource "aws_security_group" "Seoul_private" {
  provider    = aws.Seoul
  name        = "Seoul_allow_ssh"
  description = "Seoul_Allow SSH inbound traffic"
  vpc_id      = aws_vpc.Seoul_vpc.id

  ingress {
    description      = "HTTP from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Seoul_allow_private"
  }
}

resource "aws_security_group" "Seoul_allow_http_alb" {
  provider    = aws.Seoul
  name        = "Seoul_allow_http_alb"
  description = "Seoul_Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.Seoul_vpc.id

  ingress {
    description      = "HTTP from Internet"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Seoul_allow_http_alb"
  }
}

resource "aws_security_group" "Seoul_allow_all" {
  provider    = aws.Seoul
  name        = "Seoul_allow_all"
  description = "Seoul_Allow all inbound traffic"
  vpc_id      = aws_vpc.Seoul_vpc.id

  ingress {
    description      = "all traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Seoul_allow_all"
  }
}

resource "aws_security_group" "Seoul_allow_RDS" {
  provider    = aws.Seoul  
  name        = "Seoul_allow_RDS"
  description = "Seoul_Allow RDS inbound traffic"
  vpc_id      = aws_vpc.Seoul_vpc.id

  ingress {
    description      = "RDS traffic"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Seoul_allow_RDS"
  }
}

#도쿄리전 SG

resource "aws_security_group" "Tokyo_allow_public" {
  provider    = aws.Tokyo
  name        = "Tokyo_allow_Public"
  description = "Tokyo_Allow Public inbound traffic"
  vpc_id      = aws_vpc.Tokyo_vpc.id

  ingress {
    description      = "all traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTP from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.Tokyo_vpc.cidr_block]
  }

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
    ingress {
    description      = "HTTPs from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "HTTP from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.Tokyo_vpc.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Tokyo_allow_http"
  }
}

resource "aws_security_group" "Tokyo_private" {
  provider    = aws.Tokyo
  name        = "Seoul_allow_ssh"
  description = "Seoul_Allow SSH inbound traffic"
  vpc_id      = aws_vpc.Tokyo_vpc.id

  ingress {
    description      = "HTTP from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Tokyo_allow_private"
  }
}

resource "aws_security_group" "Tokyo_allow_http_alb" {
  provider    = aws.Tokyo
  name        = "Tokyo_allow_http_alb"
  description = "Tokyo_Allow HTTP inbound traffic"
  vpc_id      = aws_vpc.Tokyo_vpc.id

  ingress {
    description      = "HTTP from Internet"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Tokyo_allow_http_alb"
  }
}

resource "aws_security_group" "Tokyo_allow_all" {
  provider    = aws.Tokyo
  name        = "Tokyo_allow_all"
  description = "Tokyo_Allow all inbound traffic"
  vpc_id      = aws_vpc.Tokyo_vpc.id

  ingress {
    description      = "all traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Tokyo_allow_all"
  }
}

resource "aws_security_group" "Tokyo_allow_RDS" {
  provider    = aws.Tokyo  
  name        = "Tokyo_allow_RDS"
  description = "Tokyo_Allow RDS inbound traffic"
  vpc_id      = aws_vpc.Tokyo_vpc.id

  ingress {
    description      = "RDS traffic"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Tokyo_allow_RDS"
  }
}