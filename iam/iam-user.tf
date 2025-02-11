resource "aws_iam_user" "user" {
  name = "demo-1"
}
resource "aws_iam_policy" "policy" {
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*",
                "s3-object-lambda:*",
                "ec2:*"
            ],
            "Resource": "*"
        }
    ]
})
}
resource "aws_iam_user_policy" "user-policy" {
  policy = aws_iam_policy.policy.policy
  user = aws_iam_user.user.name
}
resource "aws_iam_group" "grp" {
  name = "dev"
}
resource "aws_iam_group_membership" "group_members" {
  name = "dev-group-attachment"
  group = aws_iam_group.grp.name
  users = [
    aws_iam_user.user.name
  ]
}
resource "aws_iam_user_login_profile" "cred" {
  user = aws_iam_user.user.name
  password_length = 8
  password_reset_required = true
}
resource "aws_iam_user_policy" "password_change" {
  name = "AllowPasswordChange"
  user = aws_iam_user.user.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "iam:ChangePassword",
        Resource = "arn:aws:iam::*:user/${aws_iam_user.user.name}"
      }
    ]
  })
}

output "password" {
  value = aws_iam_user_login_profile.cred.password
  sensitive = true
}