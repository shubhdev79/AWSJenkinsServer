resource "aws_vpc" "JenkinsVPCLinux" {
  cidr_block = "10.0.0.0/16"

    tags = {
    Name = "JenkinsVPCLinux"
  }
}

resource "aws_internet_gateway" "Jenkins_IGWLinux" {
  vpc_id = "${aws_vpc.JenkinsVPCLinux.id}"
 
  tags = {
    Name = "Jenkins_IGWLinux"
  }
}
 
resource "aws_subnet" "JenkinsSubnetLinux" {
  vpc_id            = "${aws_vpc.JenkinsVPCLinux.id}"
  availability_zone = "eu-west-2a"
  cidr_block        = "10.0.1.0/24"
  map_public_ip_on_launch = "true"

    tags = {
    Name = "JenkinsSubnetLinux"
  }
}

resource "aws_route_table" "Jenkins_RT_Linux"{
vpc_id = "${aws_vpc.JenkinsVPCLinux.id}"
route{
cidr_block = "0.0.0.0/0"
gateway_id = "${aws_internet_gateway.Jenkins_IGWLinux.id}"
}
tags = {
Name = "Jenkins_RT_Linux"
}
}
 
resource "aws_route_table_association" "PublicSubnet_Association_Linux" {
  subnet_id      = "${aws_subnet.JenkinsSubnetLinux.id}"
  route_table_id = "${aws_route_table.Jenkins_RT_Linux.id}"
}

resource "aws_security_group" "Jenkins_SecurityGroupLinux" {
    name = "JenkinsSecurityGroupLinux"
    description = "Allow incoming connections from Internet and SSH"
    vpc_id = "${aws_vpc.JenkinsVPCLinux.id}"

    ingress { 
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["${"0.0.0.0/0"}"]
    }

    ingress { 
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["${"0.0.0.0/0"}"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["${"117.99.94.198/32"}"]
    }
    
    egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

   tags = {
       
        Name= "Jenkins_SecurityGroupLinux"
    }
}