terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
  


}

resource "aws_instance" "instance_1" {
  ami           = "ami-0f64f746a3cb9a16e" # Ubuntu 20.04 LTS // eu-central-1
  instance_type = "t2.micro"
  key_name = "aws_key"
  vpc_security_group_ids = [aws_security_group.main.id]

tags = {
    Name = "Erik-VPC"
  }


}



resource "aws_security_group" "main" {
  egress = [
	{
  	cidr_blocks = ["0.0.0.0/0"]
	description = ""
	from_port   = 0
	ipv6_cidr_blocks = []
	prefix_list_ids = []
	protocol = "-1"
	security_groups = []
	self = false
	to_port = 0
    }
]

  ingress = [
    {
	cidr_blocks = ["0.0.0.0/0"]
	description = ""
	from_port = 22
	ipv6_cidr_blocks = []
	prefix_list_ids = []
	protocol = "tcp"
	security_groups = []
	self = false
	to_port = 22
    }
]

}

resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC1NO4cycBGs2Lm59bztLHgZYS5NeqvnPcqEiJuXjE+VOm+CrcwlR8+Vc17qDsRRSY+uT4r0fNTytccDdzZqylzlIbpVWoZyDnvwi+wMRDOK41e0BN0KwYh49Lh66DdZ00hBVS1T4H5lvFsEMyPOzRq5OLgPBEK3DsrVys0+H/2dkjv7c7qyCUtrd67FQUqinZ0/dGOb5iJ1hnASAVnS69kAQiFdVp28o1v5Slyw30/h1GKHXOhtipwTGkT9n0x1wwWRhnPpOBeNBW970+GnaR0QXKx+yxnevhp1bThqxXM9S0dkJS/t66+z2Wf+RTQQ7lGcDT8cJR5WpLZMMc9t+b/BHJPOaRIvERmMCQKMi086breTDUCvxroA++qtfwuUFiNRIzGBycaUs/T6VbC9vfzgaKlWj6d+HCEn4/ZXdEP3sng/C6j0rit7sSZW3f6RZTFe5Ir8WsyUplgexD6MUy3vlgp3NuKWdMeKe8PntNXG2fnb2D+rLdcrB0LtIQQQmk= rossi-macbookprom1@MacBook-Pro-uzivatela-Erik.local"
  }
