provider "aws" {
    region = "us-east-1"
}

# resource "aws_instance" "app_server" {
#   ami           = "ami-0c55b159cbfafe1f0"
#   instance_type = "t2.micro"
# }


data "aws_ami" "latest_amazon_linux" {
  most_recent = true   # Gets the latest available AMI
  owners      = ["amazon"]   # Ensures it's an official AWS AMI

  filter {
    name   = "name"  #Specifies that we are filtering based on the AMI name.
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]  # Amazon Linux 2 AMI
  }
}


resource "aws_instance" "my_ec2" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = "t2.micro"

  tags = {
    Name = "MyEC2Instance"
  }
}
