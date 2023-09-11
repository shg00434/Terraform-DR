
#서울리전 웹서버 시작 템플릿
resource "aws_launch_template" "Seoul_Webserver_lt" {
  provider = aws.Seoul
  name_prefix   = "seoul-webserver"
#ami 는 리전마다 값이다르다 커스텀 ami값을 사용 or 아마존 공식 ami 값을 찾아서 넣기
  image_id      = "ami-0462a914135d20297"
  instance_type = "t2.micro"
  key_name = "Seoul"
  monitoring {
    enabled = true
  }
  network_interfaces {
    associate_public_ip_address = true
    security_groups = [aws_security_group.Seoul_allow_all.id]
  }
  user_data = "${base64encode(<<-EOF
                #!/bin/bash
                sudo -s
                yum update -y
                yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
                systemctl start amazon-ssm-agent
                systemctl enable amazon-ssm-agent
                yum -y install nginx
                systemctl enable nginx
                systemctl start nginx
                yum -y install docker
                systemctl enable docker
                systemctl start docker
                EOF
                )}"
                
  iam_instance_profile {
    name = "ec2-ssm"
  }
}

#서울리전 DB서버 시작 템플릿
resource "aws_launch_template" "Seoul_DBserver_lt" {
  provider      = aws.Seoul
  name_prefix   = "seoul-DBserver"
  image_id      = "ami-0462a914135d20297"
  instance_type = "t2.micro"
  key_name = "Seoul"
  user_data = "${base64encode(<<-EOF
                #!/bin/bash
                sudo -s
                yum update -y
                yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
                systemctl start amazon-ssm-agent
                systemctl enable amazon-ssm-agent
                yum -y install mariadb105
                systemctl enable mysql
                systemctl start mysql
                yum -y install docker
                systemctl enable docker
                systemctl start docker
                EOF
                )}"
  monitoring {
      enabled = true
  }
  iam_instance_profile {
    name = "ec2-ssm"
  }
  vpc_security_group_ids = ["${aws_security_group.Seoul_allow_all.id}"]
}

#도쿄리전 웹서버 시작 템플릿
resource "aws_launch_template" "Tokyo_Webserver_lt" {
  provider = aws.Tokyo
  name_prefix   = "tokyo-webserver"
  image_id      = "ami-0f9816f78187c68fb"
  instance_type = "t2.micro"
  key_name = "Tokyo"
  monitoring {
    enabled = true
  }
  network_interfaces {
    associate_public_ip_address = true
    security_groups = [aws_security_group.Tokyo_allow_all.id]
  }
  user_data = "${base64encode(<<-EOF
                #!/bin/bash
                sudo -s
                yum update -y
                yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
                systemctl start amazon-ssm-agent
                systemctl enable amazon-ssm-agent
                yum -y install nginx
                systemctl enable nginx
                systemctl start nginx
                yum -y install docker
                systemctl enable docker
                systemctl start docker
                EOF
                )}"
                
                
  iam_instance_profile {
    name = "ec2-ssm"
  }
}

#도쿄리전 DB서버 시작 템플릿
resource "aws_launch_template" "Tokyo_DBserver_lt" {
  provider = aws.Tokyo
  name_prefix   = "Tokyo-DBserver"
  image_id      = "ami-0f9816f78187c68fb"
  instance_type = "t2.micro"
  key_name = "Tokyo"
  user_data = "${base64encode(<<-EOF
                #!/bin/bash
                sudo -s
                yum update -y
                yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
                systemctl start amazon-ssm-agent
                systemctl enable amazon-ssm-agent
                yum -y install mariadb105
                yum -y install docker
                systemctl enable docker
                systemctl start docker
                EOF
                )}"
  monitoring {
      enabled = true
  }
  iam_instance_profile {
    name = "ec2-ssm"
  }
  vpc_security_group_ids = ["${aws_security_group.Tokyo_allow_all.id}"]
}