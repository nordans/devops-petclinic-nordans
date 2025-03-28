resource "aws_security_group" "petclinic_sg" {
  name        = "petclinic-sg"
  description = "Allow SSH and HTTP access"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "http"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Open for web"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "petclinic-sg"
  }
}


resource "aws_instance" "petclinic_ec2" {
  ami           = "ami-0c94855ba95c71c99" # Ubuntu 22.04 (sprawdź najnowszy ID)
  instance_type = "t2.micro"
  key_name      = var.key_pair
  security_groups = [aws_security_group.petclinic_sg.name]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install openjdk-17-jdk git -y
              cd /home/ubuntu
              git clone https://github.com/nordans/devops-petclinic-nordans.git
              cd devops-petclinic-nordans/Docker-App
              nohup java -jar spring-petclinic-3.4.0-SNAPSHOT.jar > output.log 2>&1 &
              EOF

  tags = {
    Name = "PetClinicApp"
  }
}
