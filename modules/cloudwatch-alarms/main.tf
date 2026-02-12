resource "aws_cloudwatch_metric_alarm" "error_alarm" {
  for_each = toset(var.log_groups)

  alarm_name          = "${replace(each.value, "/", "-")}-error-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 1
  metric_name         = "AppErrorCount"
  namespace           = "AppLogs"
  period              = 300
  statistic           = "Sum"
  threshold           = 1

  alarm_actions = [var.sns_topic_arn]
}
