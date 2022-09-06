#Create a VPC

resource "aws_vpc" "my-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        "Name" = "Demo VPC"
    }
}

#Create Web Public subnet

resource "aws_subnet" "web-subnet-1" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1a"
    map_public_ip_on_launch = "true"

    tags = {
        Name = "Web-1a"
    }
  
}

resource "aws_subnet" "web-subnet-2" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-south-1b"
    map_public_ip_on_launch = "true"

    tags = {
        Name = "Web-2b"
    }
}

#Create Application Public subnet

resource "aws_subnet" "application-subnet-1" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "10.0.11.0/24"
    availability_zone = "ap-south-1a"
    map_public_ip_on_launch = "true"

    tags = {
        Name = "application-1a"
    }
  
}

resource "aws_subnet" "application-subnet-2" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "10.0.12.0/24"
    availability_zone = "ap-south-1b"
    map_public_ip_on_launch = "true"

    tags = {
        Name = "application-2b"
    }
}

#Create Database Private subnet

resource "aws_subnet" "database-subnet-1" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "10.0.21.0/24"
    availability_zone = "ap-south-1a"
    map_public_ip_on_launch = "true"

    tags = {
        Name = "Database-1a"
    }
  
}

resource "aws_subnet" "database-subnet-2" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "ap-south-1b"
    map_public_ip_on_launch = "true"

    tags = {
        Name = "Database-1b"
    }
}

#Creating Internet gateway

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.my-vpc.id

    tags = {
        Name = "Demo IGW"
    }
  
}
