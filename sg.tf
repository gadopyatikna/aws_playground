resource "aws_security_group" "ecs_sg" {
  name   = "ecs-sg"
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["203.0.113.42/32"] # only from my ip
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" // any
    cidr_blocks = ["0.0.0.0/0"]
  }
}
