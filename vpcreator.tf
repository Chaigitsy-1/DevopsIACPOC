
#CREATE VPC
resource "aws_vpc" "createvpcusingterraform" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support="true"
  enable_dns_hostnames="true"
  enable_classiclink = "false"
  tags = {
    Name = "createvpcusingterraform"
  }
}

#CREATE SUBNET
resource "aws_subnet" "subnetterraform" {
  vpc_id     = aws_vpc.createvpcusingterraform.id 
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "subnetterraform"
  }
}

resource "aws_subnet" "privatesubnetterraform" {
  vpc_id     = aws_vpc.createvpcusingterraform.id 
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "privatesubnetterraform"
  }
}

#CREATE ROUTE TABLE
resource "aws_route_table" "terraroute" {
  vpc_id = aws_vpc.createvpcusingterraform.id

  route {
    cidr_block="0.0.0.0/0"
    gateway_id = aws_internet_gateway.igkings.id
  }


  tags = {
    Name = "routemaster"
  }
}

resource "aws_route_table_association" "terrasub" {

  subnet_id      = aws_subnet.subnetterraform.id
  route_table_id = aws_route_table.terraroute.id

}

#INternet gateway
resource "aws_internet_gateway" "igkings" {
  vpc_id = aws_vpc.createvpcusingterraform.id

  tags = {
    Name = "igkings"
  }
}
