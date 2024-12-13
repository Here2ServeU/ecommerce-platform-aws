resource "aws_sns_topic" "sns_topic" {
  name = var.topic_name

  tags = {
    Name        = var.topic_name
    Environment = var.environment
  }
}

output "topic_arn" {
  value = aws_sns_topic.sns_topic.arn
}