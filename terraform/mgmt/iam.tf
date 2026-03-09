resource "aws_iam_role" "devops_home_exercise" {
  name = "devops_home_exercise"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
            "Effect": "Allow",
            "Principal": {
                "Federated": "arn:aws:iam::532150070616:oidc-provider/token.actions.githubusercontent.com"
            },
            "Action": "sts:AssumeRoleWithWebIdentity",
            "Condition": {
                "StringEquals": {
                    "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
                },
                "StringLike": {
                    "token.actions.githubusercontent.com:sub": "repo:emilyl14/unleash-devops-home-exercise:ref:refs/heads/main"
                }
            }
        }
    ]
  })
}

resource "aws_iam_policy" "devops_home_exercise" {
  name = "devops_home_exercise"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
            "Effect": "Allow",
            "Action": "ecr:GetAuthorizationToken",
            "Resource": "*"
        },
        {
            "Effect": "Allow",
            "Action": [
                "ecr:BatchCheckLayerAvailability",
                "ecr:PutImage",
                "ecr:InitiateLayerUpload",
                "ecr:UploadLayerPart",
                "ecr:CompleteLayerUpload",
                "ecs:*",
                "ec2:*",
                "logs:*",
                "s3:*"
            ],
            "Resource": "*"
        },
        {
            "Sid": "Statement1",
            "Effect": "Allow",
            "Action": [
                "iam:*"
            ],
            "Resource": [
                "arn:aws:iam::532150070616:role/unleash-devops-home-exercise-ecs-task-role",
                "arn:aws:iam::532150070616:role/unleash-devops-home-exercise-ecs-task-execution-role",
                "arn:aws:iam::532150070616:policy/unleash-devops-home-exercise-s3-permissions-object"
            ]
        }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "devops_home_exercise" {
  role       = aws_iam_role.devops_home_exercise.name
  policy_arn = aws_iam_policy.devops_home_exercise.arn
}