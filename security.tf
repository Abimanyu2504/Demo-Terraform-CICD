#Create Web security group
resource "aws_security_group" "web-sg" {
    name = "web-sg"
    description = "Allow HTTP inbound traffic"
    vpc_id = aws_vpc.my-vpc.id

    ingress {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = 80
      protocol = "tcp"
      to_port = 80
    }

    egress {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = 0
      protocol = "-1"
      to_port = 0
    }

    tags = {
        Name = "Web-SG"
    }
}

#Create Application security group
resource "aws_security_group" "Application-sg" {
    name = "Application-sg"
    description = "Allow HTTP inbound traffic"
    vpc_id = aws_vpc.my-vpc.id

    ingress {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = 80
      protocol = "tcp"
      to_port = 80
      security_groups = [aws_security_group.web-sg.id]
    }

    egress {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = 0
      protocol = "-1"
      to_port = 0
    }

    tags = {
        Name = "Application-SG"
    }
}

#Create Database security group
resource "aws_security_group" "database-sg" {
    name = "database-sg"
    description = "Allow HTTP inbound traffic"
    vpc_id = aws_vpc.my-vpc.id

    ingress {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = 3306
      protocol = "tcp"
      to_port = 3306
      security_groups = [aws_security_group.web-sg.id]
    }

    egress {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = 0
      protocol = "-1"
      to_port = 0
    }

    tags = {
        Name = "Database-SG"
    }
}
