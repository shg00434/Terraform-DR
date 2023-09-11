#ASG

#서울리전 웹서버 ASG
resource "aws_autoscaling_group" "Seoul_Webserver" {
  provider           = aws.Seoul
  desired_capacity   = 2
  max_size           = 10
  min_size           = 2
  health_check_grace_period = 300
  health_check_type  = "ELB"
  vpc_zone_identifier = [aws_subnet.Seoul_subnet1.id, aws_subnet.Seoul_subnet2.id]
  launch_template {
    id      = aws_launch_template.Seoul_Webserver_lt.id
    version = aws_launch_template.Seoul_Webserver_lt.latest_version
  }
  target_group_arns = [aws_alb_target_group.Seoul_TG.arn]

    lifecycle {
    create_before_destroy = true
  }
}

#서울리전 DB서버 ASG
resource "aws_autoscaling_group" "Seoul_DBserver" {
  provider           = aws.Seoul
  desired_capacity   = 2
  max_size           = 10
  min_size           = 2
  vpc_zone_identifier = [aws_subnet.Seoul_subnet3.id, aws_subnet.Seoul_subnet4.id]
  launch_template {
    id      = aws_launch_template.Seoul_DBserver_lt.id
    version = aws_launch_template.Seoul_DBserver_lt.latest_version
  }

    lifecycle {
    create_before_destroy = true
  }
}

#도쿄리전 웹서버 ASG
resource "aws_autoscaling_group" "Tokyo_Webserver" {
  provider           = aws.Tokyo
  desired_capacity   = 0
  max_size           = 2
  min_size           = 0
  health_check_grace_period = 300
  health_check_type  = "ELB"
  vpc_zone_identifier = [aws_subnet.Tokyo_subnet1.id, aws_subnet.Tokyo_subnet2.id]
  launch_template {
    id      = aws_launch_template.Tokyo_Webserver_lt.id
    version = aws_launch_template.Tokyo_Webserver_lt.latest_version
  }
  target_group_arns = ["${aws_alb_target_group.Tokyo_TG.arn}"]

    lifecycle {
    create_before_destroy = true
  }
}

#도쿄리전 DB서버 ASG
resource "aws_autoscaling_group" "Tokyo_DBserver" {
  provider           = aws.Tokyo
  desired_capacity   = 0
  max_size           = 2
  min_size           = 0
  vpc_zone_identifier = [aws_subnet.Tokyo_subnet3.id, aws_subnet.Tokyo_subnet4.id]
  launch_template {
    id      = aws_launch_template.Tokyo_DBserver_lt.id
    version = aws_launch_template.Tokyo_DBserver_lt.latest_version
  }

    lifecycle {
    create_before_destroy = true
  }
}