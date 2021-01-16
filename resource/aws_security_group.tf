resource "aws_security_group" "alb" {
  name = "terraform-example-alb"
  
  # permit inbound HTTP request
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # permit all outbound request
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "instance_security_group" {
  name = " terraform-example-instance"
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
    }
}