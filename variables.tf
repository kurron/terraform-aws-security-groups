variable "region" {
    type = "string"
    description = "The AWS region to deploy into, e.g. us-east-1"
}

variable "vpc_bucket" {
    type = "string"
    description = "S3 bucket containing the VPC Terraform state, e.g. terraform-state"
}

variable "vpc_key" {
    type = "string"
    description = "S3 key pointing to the VPC Terraform state, e.g. ca-central-1/development/networking/vpc/terraform.tfstate"
}

variable "vpc_region" {
    type = "string"
    description = "Region where the S3 bucket containing the VPC Terraform state is located, e.g. us-east-1"
    default = "us-east-1"
}

variable "project" {
    type = "string"
    description = "Name of the project these resources are being created for, e.g. violet-sloth"
}

variable "creator" {
    type = "string"
    description = "Person creating these resources, e.g. operations@example.com"
}

variable "environment" {
    type = "string"
    description = "Context these resources will be used in, e.g. production"
}

variable "freetext" {
    type = "string"
    description = "Information that does not fit in the other tags, e.g. end-of-life 12/31/2021"
}

variable "bastion_ingress_cidr_blocks" {
    type = "list"
    description = "IP ranges to allows inbound SSH access to, e.g. [98.216.147.13/32]"
}
