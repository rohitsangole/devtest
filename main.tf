provider "aws" {
  region = "us-west-2"  
}

resource "aws_instance" "rohit" {
  ami           = "ami-055e3d4f0bbeb5878" 
  instance_type = "t2.micro"

  tags = {
    Name = "rohit"
  }
}
