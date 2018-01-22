output "bastion_id" {
    value = "${aws_security_group.bastion_access.id}"
    description = "ID of the Bastion security group"
}

output "bastion_name" {
    value = "${aws_security_group.bastion_access.name}"
    description = "Name of the Bastion security group"
}

output "api_gateway_id" {
    value = "${aws_security_group.api_gateway_access.id}"
    description = "ID of the API Gateway security group"
}

output "api_gateway_name" {
    value = "${aws_security_group.api_gateway_access.name}"
    description = "Name of the API Gateway security group"
}

output "alb_id" {
    value = "${aws_security_group.alb_access.id}"
    description = "ID of the Application Load Balancer security group"
}

output "alb_name" {
    value = "${aws_security_group.alb_access.name}"
    description = "Name of the Application Load Balancer security group"
}

output "ec2_id" {
    value = "${aws_security_group.ec2_access.id}"
    description = "ID of the EC2 security group"
}

output "ec2_name" {
    value = "${aws_security_group.ec2_access.name}"
    description = "Name of the EC2 security group"
}

output "mysql_id" {
    value = "${aws_security_group.mysql_access.id}"
    description = "ID of the MySQL security group"
}

output "mysql_name" {
    value = "${aws_security_group.mysql_access.name}"
    description = "Name of the MySQL security group"
}

output "redis_id" {
    value = "${aws_security_group.redis_access.id}"
    description = "ID of the Redis security group"
}

output "redis_name" {
    value = "${aws_security_group.redis_access.name}"
    description = "Name of the Redis security group"
}
