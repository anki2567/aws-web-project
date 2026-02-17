resource "aws_instance" "web_server" {
  ami           = "ami-0c1fe732b5494dc14"  # Amazon Linux (us-east-1)
  instance_type = "t3.micro"
  key_name      = "WEBAPP"

  

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install httpd -y
              systemctl start httpd
              systemctl enable httpd
              echo "Welcome to my AWS Web App" > /var/www/html/index.html
              EOF

  tags = {
    Name = "Terraform-Web-Server"
  }
}
