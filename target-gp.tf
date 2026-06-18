# target group

resource "aws_lb_target_group" "veb_tg" {
  name     = "first-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_default_vpc.default.id
}



# target group attachment

resource "aws_lb_target_group_attachment" "tg_attechment_veb_1" {
  target_group_arn = aws_lb_target_group.veb_tg.arn
  target_id        = aws_instance.veb_1["Firts-terra-server"].id
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg_attechment_veb_2" {
  target_group_arn = aws_lb_target_group.veb_tg.arn
  target_id        = aws_instance.veb_2["second-terra-server"].id
  port             = 80
}

# aplication load balancer (ALB)

resource "aws_lb" "my_alb" {
  name               = "my-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.demo_security_group.id]
  subnets            = data.aws_subnets.default.ids

  tags = {
    default = "my-lb"
     }
}                       

# listener

resource "aws_lb_listener" "my_alb_listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.veb_tg.arn
  }
}             