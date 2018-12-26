resource "aws_iam_role" "lambda_sqs_tutorial" {
    name = "lambda_sqs_tutorial"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}
resource "aws_iam_role_policy_attachment" "lambda_sqs_tutorial_policy_attach" { 
    role = "${aws_iam_role.lambda_sqs_tutorial.name}"
    count      = "${length(local.iam_policy_arn_lst)}"
    policy_arn = "${local.iam_policy_arn_lst[count.index]}"

}
data "aws_iam_policy" "AWSLambdaExecute" {
    arn = "arn:aws:iam::aws:policy/AWSLambdaExecute"

}

data "aws_iam_policy"  "AmazonSQSFullAccess" {
    arn = "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
}

data "aws_iam_policy" "CloudWatchEventsFullAccess" {
    arn = "arn:aws:iam::aws:policy/CloudWatchEventsFullAccess"
}

data "aws_iam_policy" "AmazonDynamoDBFullAccess" {
    arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}

data "aws_iam_policy" "AmazonSNSFullAccess" {
    arn = "arn:aws:iam::aws:policy/AmazonSNSFullAccess"
}

/*variable "iam_policy_arn_lst" {
  description = "IAM Policies to be attached to role"
  type = "list"
  #value = ["${data.aws_iam_policy.AmazonSNSFullAccess.arn}","${data.aws_iam_policy.AmazonDynamoDBFullAccess.arn}","${data.aws_iam_policy.CloudWatchEventsFullAccess.arn}","${data.aws_iam_policy.AmazonSQSFullAccess.arn}","${data.aws_iam_policy.AWSLambdaExecute.arn}"]
  
}  */ # list - interpolation of datasources doesnt work, apparently there is a issue and will be fixed in 0.12

locals {
  iam_policy_arn_lst = ["${data.aws_iam_policy.AmazonSNSFullAccess.arn}","${data.aws_iam_policy.AmazonDynamoDBFullAccess.arn}","${data.aws_iam_policy.CloudWatchEventsFullAccess.arn}","${data.aws_iam_policy.AmazonSQSFullAccess.arn}","${data.aws_iam_policy.AWSLambdaExecute.arn}"]
}