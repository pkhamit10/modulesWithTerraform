# -------------------------------
# Variable Tags
# -------------------------------
variable "global_tags" {
  description = "Global tags applied to all resources"
  type        = map(string)
}
variable "instance_webserver_tag" {
  type = map(string)
}
variable "vpc_tag" {
  description = "A tag assigned to a  VPC module_demo_vpc"
  type        = map(string)
}
variable "subnet_tag" {
  description = "A tag for subnet module_demo_subnet"
  type        = map(string)
}
variable "rt1_tag" {
  description = "A tag assigned to a route_table rt1"
  type        = map(string)
  default = {
    "name" = "module_demo_rt1"
  }
}
variable "igw_name_tag" {
  description = "The name the Internet Gateway"
  type        = map(string)
}
variable "security_group_tag" {
  description = "A tag assigned to a security group"
  type        = map(string)
}

# -------------------------------
# Variable Resources
# -------------------------------
variable "vpc_cidr_block_value" {
  description = "The CIDR block for the VPC"
  type        = string
}
variable "subnet_cidr_block_value" {
  description = "The CIDR block for the subnet"
  type        = string
}
variable "route_cidr_block_value" {
  description = "The CIDR block for the route"
  type        = string
}
variable "availability_zone_name" {
  description = "The availability zone for the subnet"
  type        = string
}
variable "map_public_ip_on_launch" {
  description = "Whether to assign a public IP address to instances launched in the subnet"
  type        = bool
}
variable "key_pair_name" {
  description = "The name of the AWS key pair to use for the instance"
  type        = string
}

# variable "public_key_path" {
#   description = "The path to the public key file"
#   type        = string
# }

# variable "public_key" {
#   description = "The public key content to be injected to the EC2 instance"
#   type        = string
# }

// used by you to SSH into the instance
// SSH matches your private key to the public key injected to EC2 instance
# variable "private_key_path" {
#   description = "The path to the private key file"
#   type        = string
#   default     = "~/.ssh/id_rsa"
# }
# variable "private_key" {
#   description = "The private key content to SSH into the instance"
#   type        = string
# }

variable "script_path" {
  type        = string
  description = "Path to the app.py script template"
  default = "scripts/app.py"
}

variable "environment_name" {
  type        = string
  description = "Environment name (e.g., dev, stage, prod)"
}
variable "ami_value" {
  description = "The AMI to use for the instance"
}

# variable "instance_type_value" {
#   description = "The type of instance to use"
#   type        = map(string)
#   default = {
#     "dev"   = "t3.micro",
#     "stage" = "t3.micro",
#     "prod"  = "t3.micro"
#   }
# }
variable "instance_type_value" {
  description = "The type of instance to use"
  type        = string
}
variable "ssh_user_ubuntu" {
  description = "SSH username for EC2 instance"
  type        = string
}
variable "security_group_name" {
  description = "The name of the security group"
  type        = string
}
variable "security_group_rules" {
  description = "List of security group rules"
  type = list(object({
    type        = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = optional(string)
  }))

  # default = [
  #   {
  #     type        = "ingress"
  #     from_port   = 22
  #     to_port     = 22
  #     protocol    = "tcp"
  #     cidr_blocks = ["0.0.0.0/0"]
  #     description = "Allow SSH"
  #   },
  #   {
  #     type        = "ingress"
  #     from_port   = 80
  #     to_port     = 80
  #     protocol    = "tcp"
  #     cidr_blocks = ["0.0.0.0/0"]
  #     description = "Allow HTTP"
  #   }
  #   , {
  #     type        = "egress"
  #     from_port   = 0
  #     to_port     = 0
  #     protocol    = "-1"
  #     cidr_blocks = ["0.0.0.0/0"]
  #     description = "Allow all outbound traffic"
  #   }
  # ]
}
variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
}

# variable "state_bucket_name" {
#   description = "The name of the S3 bucket"
#   type        = string
# }

# variable "terrform_lock_name" {
#   description = "The name of the DynamoDB table"
#   type        = string
# }
