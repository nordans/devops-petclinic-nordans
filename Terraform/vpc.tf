resource "aws_vpc" "kops_vpc" {
  cidr_block = "10.0.0.0/16"                  # Cała przestrzeń adresowa sieci VPC
  enable_dns_support = true                   # Umożliwia korzystanie z DNS w VPC
  enable_dns_hostnames = true                 # Wymagane np. do automatycznego przypisywania DNS dla EC2

  tags = {
    Name    = "kops-vpc"
    Project = "ProjectN"
  }
}
resource "aws_internet_gateway" "kops_igw" {
  vpc_id = aws_vpc.kops_vpc.id                # Przypisujemy IGW do VPC

  tags = {
    Name    = "kops-igw"
    Project = "ProjectN"
  }
}
resource "aws_route_table" "kops_public_rt" {
  vpc_id = aws_vpc.kops_vpc.id                # Tworzymy tablicę routingu przypisaną do naszej VPC

  route {
    cidr_block = "0.0.0.0/0"                  # Ruch do wszystkich adresów (czyli Internet)
    gateway_id = aws_internet_gateway.kops_igw.id  # Wskazujemy, że ruch ma iść przez IGW
  }

  tags = {
    Name    = "kops-public-rt"
    Project = "ProjectN"
  }
}
resource "aws_subnet" "kops_subnet_1" {
  vpc_id                  = aws_vpc.kops_vpc.id
  cidr_block              = "10.0.1.0/24"      # Mniejsza podsieć z VPC
  availability_zone       = "eu-north-1a"      # AZ w której tworzymy subnet
  map_public_ip_on_launch = true               # EC2 dostanie publiczne IP po starcie

  tags = {
    Name    = "kops-subnet-1"
    Project = "ProjectN"
  }
}
resource "aws_subnet" "kops_subnet_2" {
  vpc_id                  = aws_vpc.kops_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-north-1b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "kops-subnet-2"
    Project = "ProjectN"
  }
}
resource "aws_route_table_association" "subnet_1_assoc" {
  subnet_id      = aws_subnet.kops_subnet_1.id
  route_table_id = aws_route_table.kops_public_rt.id
}
resource "aws_route_table_association" "subnet_2_assoc" {
  subnet_id      = aws_subnet.kops_subnet_2.id   # Podpinamy subnet 2 do tablicy routingu
  route_table_id = aws_route_table.kops_public_rt.id
}
