# -------------------------------
# EC2 Instance Configuration
# -------------------------------
resource "aws_instance" "web_server" {
  ami           = var.ami_value
  #instance_type = lookup(var.instance_type_value, replace(terraform.workspace, "env-", ""), "t2.micro")// This will lookup values as per workspace env, if not take the default value t2.micro 
  instance_type = var.instance_type_value
  # key_name      = aws_key_pair.key_pairName.key_name
  # key_name      = "${var.key_pair_name}-${terraform.workspace}"
  key_name      = var.key_pair_name
  subnet_id     = var.sub_id
  vpc_security_group_ids = var.sg_ids
  tags = merge(var.global_tags,var.instance_webserver_tag)
  # associate_public_ip_address = true

 // Instructions for connecting to the instance
  # connection {
  #   type        = "ssh"
  #   user        = var.ssh_user_ubuntu
  #   private_key = file(var.private_key_path)
  #   # private_key = var.private_key
  #   host        = self.public_ip
  # }

// File provisioner to copy a file from local to remote EC2 instance
  # provisioner "file" {
  #   source = ("${path.module}/../../scripts/app.py")  //${path.module} ensures the path is resolved relative to the module, not the root working directory
  #   destination = "/home/ubuntu/app.py" // path on the remote instance
    
  # }

// Remote-exec provisioner to run commands on the remote EC2 instance
  # provisioner "remote-exec" {
  #  inline = [
  #     "set -e", # To exit immediately if a command exits with a non-zero status (i.e fails)
  #     "echo -e \"\\e[32mHello from the remote instance\\e[0m\"", # Print a message in green color \e[32m for green, \e[0m to reset, use -e to enable interpretation of backslash escapes and \ to escape "double quotes" and "\"
  #     "sudo apt update -y",  # Update package lists (for ubuntu)
  #     "sudo apt install python3-flask -y",  # Example package installation
  #     # "sudo pip3 install flask", new version prevents pip from installing packages because Python environments is mannaged by the OS
  #     # "test -f /home/ubuntu/app.py || { echo 'app.py missing'; exit 1; }", # Check if app.py exists
  #     # "sudo touch /home/ubuntu/app.log && sudo chown ubuntu:ubuntu /home/ubuntu/app.log", # Create log file and set ownership
  #     # "bash -c \"cd /home/ubuntu && nohup setsid sudo python3 app.py > /home/ubuntu/app.log 2>&1 &\"",   # Run the app in the background and redirect output to log file   
  #     # "bash -c \"cd /home/ubuntu && nohup sudo python3 app.py > /home/ubuntu/app.log 2>&1 &\"",      
  #     "cd /home/ubuntu && nohup sudo python3 app.py > /home/ubuntu/app.log 2>&1 &",      
  #     "sleep 5", # sleep 5 gives it time to start the service if not scripts ends before the service starts
  #     "curl -s http://localhost:80 || echo 'Health check failed'" // Simple health check to verify the web server is running
  #   ]
# }
  
// Using user_data to run a script on instance launch
user_data = <<-EOF
              #!/bin/bash 
              set -e
              echo -e "\\e[32mHello from the remote instance\\e[0m"
              sudo apt update -y
              sudo apt install python3-flask -y

              # Create application directory
              mkdir -p /home/ubuntu/app
              cd /home/ubuntu/app

              # Create a simple Flask app
                  cat > app.py <<EOL
                  ${templatefile(var.script_path,{environment = var.environment_name})}
                  EOL

              # Run the Flask app in the background
              nohup sudo python3 app.py > /home/ubuntu/app.log 2>&1 &

              # Wait and check health
              sleep 5
              curl -s http://localhost:80 || echo 'Health check failed'

              echo -e "\\e[32mBootstrap complete!\\e[0m"
            EOF
  }


# -------------------------------
# Key Pair
# -------------------------------

# resource "aws_key_pair" "key_pairName" {
#   key_name   = "${var.key_pair_name}-${terraform.workspace}"
#   public_key = file(var.public_key_path)
#   # public_key = var.public_key
# }
