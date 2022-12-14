resource "aws_route_table" "Web-rt" {
    vpc_id = aws_vpc.my-vpc.id

    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
        Name = "WebRT"
    }
}

#Subnet Association

resource "aws_route_table_association" "a" {
    subnet_id = aws_subnet.web-subnet-1.id
    route_table_id = aws_route_table.Web-rt.id
}

resource "aws_route_table_association" "b" {
    subnet_id = aws_subnet.web-subnet-2.id
    route_table_id = aws_route_table.Web-rt.id
}