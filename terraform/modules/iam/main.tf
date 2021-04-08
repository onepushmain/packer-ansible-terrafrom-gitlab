
resource "aws_iam_role" "SSMInstanceProfile" {
  name = "ssm-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      },
    ]
  })

  tags = {
    tag-key = "tag-value"
    Name    = "SSMInstanceProfile"
  }
}

resource "aws_iam_policy_attachment" "policy-attachment" {
  name = "ssm-ec2-attachment"
  roles = [
    aws_iam_role.SSMInstanceProfile.name
  ]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}

resource "aws_iam_instance_profile" "instance-profile" {
  name = "ssm-ec2-instance-profile"
  role = aws_iam_role.SSMInstanceProfile.name
}
