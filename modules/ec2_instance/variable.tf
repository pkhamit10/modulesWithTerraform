# -------------------------------
# Variable Tags
# -------------------------------
variable "global_tags" {
  description = "Global tags applied to all resources"
  type        = map(string)
}
variable "instance_webserver_tag" {
  description = "A tag assigned to a instance web_server"
  type        = map(string)
}
# -------------------------------
# Variable Resources
# -------------------------------
variable "ami_value" {
  description = "The AMI to use for the instance"
  type        = string
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
variable "key_pair_name" {
  description = "The name of the AWS key pair to use for the instance"
  type        = string
}
// Uploaded to cloud, injected to EC2 instance
# variable "public_key_path" {
#   description = "The path to the public key file"
#   type        = string
# }
# variable "public_key" {
#   type = string
# }

// Used by you to SSH into the instance
# variable "private_key_path" {
#   description = "The path to the private key file"
#   type        = string
# }
# variable "private_key" {
#   description = "The private key content to SSH into the instance"
#   type        = string
# }
variable "ssh_user_ubuntu" {
  description = "SSH username for EC2 instance"
  type        = string
}


variable "script_path" {
  type        = string
  description = "Path to the app.py script template"
  default = "scripts/app.py"
}

variable "environment_name" {
  type        = string
  description = "Environment name (e.g., dev, stage, prod)"
}

////////////////////////////////////////////

# if you don’t output from networking, you cannot use it in root or EC2 module. Outputs are the only way to share resource IDs between modules.
# Why Not Use Networking Variables Directly?
# Because modules cannot access each other’s variables directly. They only communicate through outputs → root → inputs.
# Declaring variables in EC2 module is just saying:
# “I expect these values from outside (root module), and I’ll use them in my EC2 resource.”

# Variables in EC2 module are not for creating those resources again.
# They exist so the EC2 module can accept IDs from networking and use them in its EC2 resource

# EC2 module doesn’t automatically know their IDs unless you pass them in as variables.


variable "sub_id" {
  type = string
}
variable "sg_ids" {
  type = list(string)
}

