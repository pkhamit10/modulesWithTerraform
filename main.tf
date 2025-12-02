
module "ec2_instance" {
  source                 = "./modules/ec2_instance"
  ami_value              = var.ami_value
  instance_type_value    = var.instance_type_value
  key_pair_name          = var.key_pair_name
  # public_key_path        = var.public_key_path
  # private_key_path       = var.private_key_path
  ssh_user_ubuntu        = var.ssh_user_ubuntu
  sub_id                 = module.networking.Osubnet_id
  sg_ids                 = [module.networking.Ossh_sg_id]
  global_tags            = var.global_tags
  instance_webserver_tag = var.instance_webserver_tag
  script_path            = "${path.module}/scripts/app.py"
  environment_name       = var.environment_name

}
module "networking" {
  source                  = "./modules/networking"
  vpc_cidr_block_value    = var.vpc_cidr_block_value
  subnet_cidr_block_value = var.subnet_cidr_block_value
  route_cidr_block_value  = var.route_cidr_block_value
  availability_zone_name  = var.availability_zone_name
  map_public_ip_on_launch = var.map_public_ip_on_launch
  security_group_name     = var.security_group_name
  security_group_rules    = var.security_group_rules
  global_tags             = var.global_tags
  vpc_tag                 = var.vpc_tag
  subnet_tag              = var.subnet_tag
  rt1_tag                 = var.rt1_tag
  igw_name_tag            = var.igw_name_tag
  security_group_tag      = var.security_group_tag
}












# module "ec2-instance" {
#   source        = "terraform-aws-modules/ec2-instance/aws"
#   version       = "6.1.1"
#   instance_type = "t3.micro"
#   ami           = "ami-046c2381f11878233"
#   subnet_id = "subnet-037fc7309c3dcd018"
#   name = "my-instance"

# }

# module "s3_bucket" {
#   source            = "./modules/s3_bucket"
#   state_bucket_name = var.state_bucket_name
# }

# module "dynamodb_table" {
#   source        = "./modules/dynamodb_table"
#   terrform_lock_name = var.terrform_lock_name
# }
