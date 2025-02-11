provider "aws" {
  region = "us-east-2"
}

# resource "aws_vpc" "myvpc" {
#   cidr_block = var.cidr
#   tags = {
#     Name = "myvpc"
#   }
# }

# resource "aws_subnet" "s1" {
#   vpc_id = aws_vpc.myvpc.id
#   cidr_block = cidrsubnet(var.cidr,7,2)
#   tags = {
#     Name = "s1"
#   }
# }
# resource "aws_security_group" "sg" {
#   vpc_id = aws_vpc.myvpc.id
#   description = "test"
#   name = "sg1"
#   ingress {
#     protocol = "-1"
#     from_port = "0"
#     to_port = "0"

#   }
#   egress {
#     protocol = "-1"
#     from_port = "0"
#     to_port = "0"
#   }
#   tags = {
#     Name = "sg2"
# }
# }

# resource "aws_iam_user" "user" {
#   name = "demo-1"
# }
# resource "aws_iam_policy" "policy" {
#   policy = jsonencode({
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Effect": "Allow",
#             "Action": [
#                 "s3:*",
#                 "s3-object-lambda:*"
#             ],
#             "Resource": "*"
#         }
#     ]
# })
# }
# resource "aws_iam_user_policy" "user-policy" {
#   policy = aws_iam_policy.policy.policy
#   user = aws_iam_user.user.name
# }