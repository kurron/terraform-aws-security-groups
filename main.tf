terraform {
    required_version = ">= 0.10.6"
    backend "s3" {}
}

provider "aws" {
    region     = "${var.region}"
}

resource "aws_security_group" "bastion_access" {
    name_prefix = "bastion-"
    description = "Controls access to the Bastion boxes"
    vpc_id      = "${var.vpc_id}"
    tags {
        Name        = "Bastion Access"
        Project     = "${var.project}"
        Purpose     = "Controls access to the Bastion boxes"
        Creator     = "${var.creator}"
        Environment = "${var.environment}"
        Freetext    = "${var.freetext}"
    }
    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_security_group" "api_gateway_access" {
    name_prefix = "api-gateway-"
    description = "Controls access to the API Gateway"
    vpc_id      = "${var.vpc_id}"
    tags {
        Name        = "API Gateway Access"
        Project     = "${var.project}"
        Purpose     = "Controls access to the API Gateway"
        Creator     = "${var.creator}"
        Environment = "${var.environment}"
        Freetext    = "${var.freetext}"
    }
    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_security_group" "alb_access" {
    name_prefix = "alb-"
    description = "Controls access to the Application Load Balancer"
    vpc_id      = "${var.vpc_id}"
    tags {
        Name        = "Application Load Balancer Access"
        Project     = "${var.project}"
        Purpose     = "Controls access to the Application Load Balancer"
        Creator     = "${var.creator}"
        Environment = "${var.environment}"
        Freetext    = "${var.freetext}"
    }
    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_security_group" "ec2_access" {
    name_prefix = "ec2-"
    description = "Controls access to the EC2 instances"
    vpc_id      = "${var.vpc_id}"
    tags {
        Name        = "EC2 Access"
        Project     = "${var.project}"
        Purpose     = "Controls access to the EC2 instances"
        Creator     = "${var.creator}"
        Environment = "${var.environment}"
        Freetext    = "${var.freetext}"
    }
    lifecycle {
        create_before_destroy = true
    }
}

# build the rules AFTER the empty security groups are constructed to avoid circular references

resource "aws_security_group_rule" "bastion_ingress" {
    type              = "ingress"
    cidr_blocks       = "${var.bastion_ingress_cidr_blocks}"
    from_port         = 22
    protocol          = "tcp"
    security_group_id = "${aws_security_group.bastion_access.id}"
    to_port           = 22
    description       = "Restrict SSH access to specific addresses"
    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_security_group_rule" "bastion_egress" {
    type              = "egress"
    cidr_blocks       = ["0.0.0.0/0"]
    from_port         = 0
    protocol          = "all"
    security_group_id = "${aws_security_group.bastion_access.id}"
    to_port           = 65535
    description       = "Allow unrestricted egress"
    lifecycle {
        create_before_destroy = true
    }
}

# https://github.com/hashicorp/terraform/issues/13966 prevents us from specifying descriptions for now

resource "aws_security_group_rule" "ec2_ingress_bastion" {
    type                     = "ingress"
    from_port                = 0
    protocol                 = "all"
    security_group_id        = "${aws_security_group.ec2_access.id}"
    source_security_group_id = "${aws_security_group.bastion_access.id}"
    to_port                  = 65535
#    description              = "Only allow traffic from the Bastion boxes"
    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_security_group_rule" "ec2_ingress_alb" {
    type                     = "ingress"
    from_port                = 0
    protocol                 = "all"
    security_group_id        = "${aws_security_group.ec2_access.id}"
    source_security_group_id = "${aws_security_group.alb_access.id}"
    to_port                  = 65535
#    description              = "Only allow traffic from the load balancers"
    lifecycle {
        create_before_destroy = true
    }
}

resource "aws_security_group_rule" "ec2_egress" {
    type               = "egress"
    cidr_blocks        = ["0.0.0.0/0"]
    from_port          = 0
    protocol           = "all"
    security_group_id  = "${aws_security_group.ec2_access.id}"
    to_port            = 65535
    description       = "Allow unrestricted egress"
    lifecycle {
        create_before_destroy = true
    }
}
