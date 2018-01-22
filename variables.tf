variable "region" {
    type = "string"
    description = "The AWS region to deploy into, e.g. us-east-1"
}

variable "vpc_id" {
    type = "string"
    description = "ID of the VPC to associate the created resources to"
}

variable "vpc_cidr" {
    type = "string"
    description = "Network CIDR of the VPC to allow traffic to."
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

variable "mysql_port_number" {
    type = "string"
    description = "Port to allow for communicating with MySQL, e.g. 3306"
    default = "3306"
}

variable "redis_port_number" {
    type = "string"
    description = "Port to allow for communicating with Redis, e.g. 6379"
    default = "6379"
}
