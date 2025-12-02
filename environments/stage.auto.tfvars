
# -------------------------------
# VPC and Networking
# -------------------------------
vpc_cidr_block_value    = "10.0.0.0/16"
subnet_cidr_block_value = "10.0.0.0/24"
route_cidr_block_value  = "0.0.0.0/0"
availability_zone_name  = "eu-west-2a"
map_public_ip_on_launch = true
vpc_tag = {
  Name = "module_demo_vpc_stage"
  Env  = "Stage"
}
subnet_tag = {
  Name = "module_demo_subnet_stage"
  Env  = "Stage"
}
rt1_tag = {
  Name = "module_demo_rt1_stage"
  Env  = "Stage"
}
igw_name_tag = {
  Name = "my-igw_stage"
  Env  = "Stage"
}


# -------------------------------
# EC2 Instance Configuration
# -------------------------------
ami_value = "ami-046c2381f11878233"
# instance_type_value = "t3.small"
ssh_user_ubuntu = "ubuntu"
instance_webserver_tag = {
  Name = "web-server-stage"
  Env  = "Stage"
}

# -------------------------------
# Key Pair
# -------------------------------
key_pair_name    = "tf-key"
public_key_path  = "~/.ssh/id_rsa.pub"
private_key_path = "~/.ssh/id_rsa"

# -------------------------------
# Security Group
# -------------------------------
security_group_name = "web-server-stage-sg"
security_group_rules = [
  {
    type        = "ingress"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH"
  },
  {
    type        = "ingress"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow HTTP"
  },
  {
    type        = "egress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }
]
security_group_tag = {
  Name = "webserver-stage-sg"
  Env  = "Stage"
}

