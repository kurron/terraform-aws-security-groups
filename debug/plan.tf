terraform {
    required_version = ">= 0.11.2"
    backend "s3" {}
}

data "terraform_remote_state" "vpc" {
    backend = "s3"
    config {
        bucket = "transparent-test-terraform-state"
        key    = "us-east-2/debug/networking/vpc/terraform.tfstate"
        region = "us-east-1"
    }
}

module "security-group" {
    source = "../"

    region                      = "us-east-2"
    project                     = "Debug"
    creator                     = "kurron@jvmguy.com"
    environment                 = "development"
    freetext                    = "No notes at this time."
    vpc_id                      = "${data.terraform_remote_state.vpc.vpc_id}"
    vpc_cidr                    = "${data.terraform_remote_state.vpc.cidr}"
    bastion_ingress_cidr_blocks = ["64.222.174.146/32","98.216.147.13/32"]
}

output "bastion_id" {
    value = "${module.security-group.bastion_id}"
}

output "bastion_name" {
    value = "${module.security-group.bastion_name}"
}

output "api_gateway_id" {
    value = "${module.security-group.api_gateway_id}"
}

output "api_gateway_name" {
    value = "${module.security-group.api_gateway_name}"
}

output "alb_id" {
    value = "${module.security-group.alb_id}"
}

output "alb_name" {
    value = "${module.security-group.alb_name}"
}

output "ec2_id" {
    value = "${module.security-group.ec2_id}"
}

output "ec2_name" {
    value = "${module.security-group.ec2_name}"
}

output "mysql_id" {
    value = "${module.security-group.mysql_id}"
}

output "mysql_name" {
    value = "${module.security-group.mysql_name}"
}
