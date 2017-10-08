region = "us-west-2"

vpc_bucket = "transparent-test-terraform-state"
vpc_key="us-west-2/debug/networking/vpc/terraform.tfstate"

name = "Debug"

project     = "Debug"
creator     = "kurron@jvmguy.com"
environment = "development"
freetext    = "No notes at this time."

bastion_ingress_cidr_blocks = ["64.222.174.146/32","98.216.147.13/32"]
