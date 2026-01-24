provider "aws" {
  region  = "ap-south-1"
  profile = "configs"
}
resource "aws_instance" "codex" {
  ami                    = "ami-0ced6a024bb18ff2e"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-0c78535db3865697a"]
  user_data              = <<-EOF
                    #!/bin/bash
                    sudo yum update -y
                    sudo yum install httpd -y
                    sudo systemctl start httpd
                    sudo systemctl enable httpd
                    echo "<h1>hello from vishwas agashe </h1>" > /var/www/html/index.html
              EOF
}