provider "aws" {
  region = "us-west-2"
}

data "aws_secretsmanager_secret" "rohitsangolesecret" {
  arn = "arn:aws:secretsmanager:us-west-2:691879165105:secret:rohitsangolesecret-eg12DV"
}

data "aws_secretsmanager_secret_version" "rohitsangolesecret" {
  secret_id = data.aws_secretsmanager_secret.rohitsangolesecret.id
}

provider "aws" {
  region     = "us-west-2"
  access_key = jsondecode(data.aws_secretsmanager_secret_version.rohitsangolesecret.secret_string)["AWS_ACCESS_KEY_ID"]
  secret_key = jsondecode(data.aws_secretsmanager_secret_version.rohitsangolesecret.secret_string)["AWS_SECRET_ACCESS_KEY"]
}

resource "aws_instance" "rohit" {
  ami           = "ami-055e3d4f0bbeb5878"
  instance_type = "t2.micro"

  tags = {
    Name = "rohit"
  }
}
