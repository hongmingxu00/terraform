resource "aws_launch_configuration" "example" {
  image_id        = "ami-46de9c37"
  instance_type   = "t3.micro"
  security_groups = [aws_security_group.instance_security_group.id]

  user_data = <<-EOF
              #! /bin/bash
              echo " Hello, World" >index.html
              nohup busybox httpd -f -p ${var.server_port}&
              EOF
  lifecycle {
    create_before_destroy = true
  }
}