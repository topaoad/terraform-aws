# 変数定義 terraform.tfvarsから読み込んでいる
variable "aws_access_key" {}
variable "aws_secret_key" {}

# Provider 指定
provider "aws" {
  # profile = "terraform"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = "ap-northeast-1"
}

# インスタンスの中身設定
resource "aws_instance" "hello-world" {
  # amiのid
  ami           = "ami-0bba69335379e17f8"
  instance_type = "t2.micro"

  tags = {
    name = "sample-tag"
  }
  user_data = <<EOF
#!/bin/bash
amazon-linux-extras install -y nginx1.12
systemctl start nginx
EOF
}

# VPC の作成
