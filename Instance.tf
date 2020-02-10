provider "aws" {
	region="eu-west-2"
}

resource "aws_instance" "JenkinsServer" {
ami = "ami-0089b31e09ac3fffc"
instance_type = "t2.medium"
subnet_id = "${aws_subnet.JenkinsSubnetLinux.id}"
vpc_security_group_ids = ["${aws_security_group.Jenkins_SecurityGroupLinux.id}"]
key_name = var.key_name
#userdata = "${userdata.txt}"

tags = {
Name = "JenkinServer"
}
}