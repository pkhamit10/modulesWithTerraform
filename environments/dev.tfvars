
# -------------------------------
# VPC and Networking
# -------------------------------
vpc_cidr_block_value    = "10.10.0.0/16"
subnet_cidr_block_value = "10.10.1.0/24"
route_cidr_block_value  = "0.0.0.0/0"
availability_zone_name  = "us-east-1a"
map_public_ip_on_launch = true
vpc_tag = {
  Name = "module_demo_vpc_dev"
  Env  = "Dev"
}
subnet_tag = {
  Name = "module_demo_subnet_dev"
  Env  = "Dev"
}
rt1_tag = {
  Name = "module_demo_rt1_dev"
  Env  = "Dev"
}
igw_name_tag = {
  Name = "my-igw_dev"
  Env  = "Dev"
}


# -------------------------------
# EC2 Instance Configuration
# -------------------------------
ami_value = "ami-0c02fb55956c7d316"
instance_type_value = "t3.micro" # mot needed as we have default in variable.tf as per environment 
ssh_user_ubuntu = "ubuntu"
instance_webserver_tag = {
  Name = "web-serve-dev"
  Env  = "Dev"
}

# -------------------------------
# Key Pair
# -------------------------------
key_pair_name    = "pkawsprod"
# key_pair_name    = "tf-key"
# public_key_path  = "~/.ssh/id_rsa.pub"
# private_key_path = "~/.ssh/id_rsa"

# -------------------------------
# Security Group
# -------------------------------
security_group_name = "web-server-dev-sg"
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
  Name = "webserver-dev-sg"
  Env  = "Dev"
}

