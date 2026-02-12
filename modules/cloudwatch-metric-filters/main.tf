resource "aws_cloudwatch_log_metric_filter" "error_filter" {
  for_each = toset(var.log_groups)

  name           = "${replace(each.value, "/", "-")}-error-filter"
  log_group_name = each.value
  pattern        = var.filter_pattern

  metric_transformation {
    name      = "AppErrorCount"
    namespace = "AppLogs"
    value     = "1"
  }
}
