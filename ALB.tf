
#서울리전 ALB
resource "aws_lb" "Seoul_webserver_alb" {
  provider           = aws.Seoul
  name               = "Seoul-webserver-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.Seoul_allow_all.id]
  subnets            = [aws_subnet.Seoul_subnet1.id, aws_subnet.Seoul_subnet2.id]
  enable_deletion_protection = false # PoC option!!
  enable_cross_zone_load_balancing = true
  tags = {
    Environment = "production"
  }
}
  # Define a listener
resource "aws_alb_listener" "Seoul_webserver_alb_listener" {
  provider          = aws.Seoul
  load_balancer_arn = "${aws_lb.Seoul_webserver_alb.arn}"
  port              = "9090"
  protocol          = "HTTP"
default_action {
    target_group_arn = "${aws_alb_target_group.Seoul_TG.arn}"
    type             = "forward"
  }
}


# Connect ASG up to the Application Load Balancer
resource "aws_alb_target_group" "Seoul_TG" {
  provider = aws.Seoul
  name     = "Seoul-Webtg"
  port     = 9090
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.Seoul_vpc.id}"
}

#도쿄리전 ALB
resource "aws_lb" "Tokyo_webserver_alb" {
  provider           = aws.Tokyo
  name               = "Tokyo-webserver-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.Tokyo_allow_all.id]
  subnets            = [aws_subnet.Tokyo_subnet1.id, aws_subnet.Tokyo_subnet2.id]
  enable_deletion_protection = false # PoC option!!
  enable_cross_zone_load_balancing = true
  tags = {
    Environment = "production"
  }
}
  # Define a listener
resource "aws_alb_listener" "Tokyo_webserver_alb_listener" {
  provider          = aws.Tokyo
  load_balancer_arn = "${aws_lb.Tokyo_webserver_alb.arn}"
  port              = "9090"
  protocol          = "HTTP"
default_action {
    target_group_arn = "${aws_alb_target_group.Tokyo_TG.arn}"
    type             = "forward"
  }
}
# Connect ASG up to the Application Load Balancer
resource "aws_alb_target_group" "Tokyo_TG" {
  provider = aws.Tokyo
  name     = "Tokyo-webtg"
  port     = 9090
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.Tokyo_vpc.id}"
}
