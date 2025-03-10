# provider "aws" {
#   region = "us-east-1"
# }

module "ec2_instance" {
  source = "./modules/ec2.instance"
  ami_id = "ami-08b5b3a93ed654d19"
  instance_type = "t2.micro"
}

output "ec2_public_ip" {
  value = module.ec2_instance.my_ec2_public_ip
}