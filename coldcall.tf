provider "aws" {
  region = "us-west-2"
}

resource "aws_lex_bot" "example_bot" {
  name     = "example_bot"
  locale   = "en-US"
  voice_id = "Joanna"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_dynamodb_table" "example_table" {
  name           = "example_table"
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5

  attribute = [
    {
      name = "pk"
      type = "S"
    },
    {
      name = "sk"
      type = "S"
    },
  ]

  key_schema = [
    {
      attribute_name = "pk"
      key_type       = "HASH"
    },
    {
      attribute_name = "sk"
      key_type       = "RANGE"
    },
  ]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_lambda_function" "example_function" {
  filename      = "function.zip"
  function_name = "example_function"
  role          = aws_iam_role.example_role.arn
  handler       = "index.handler"
  runtime       = "nodejs12.x"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_iam_role" "example_role" {
  name = "example_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "example_bucket"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_sns_topic" "example_topic" {
  name = "example_topic"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_cloudwatch_log_group" "example_log_group" {
  name = "example_log_group"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_api_gateway_rest_api" "example_api" {
  name = "example_api"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
