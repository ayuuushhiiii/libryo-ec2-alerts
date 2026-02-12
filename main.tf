provider "aws" {
  region = var.aws_region
}

module "sns" {
  source      = "./modules/sns"
  topic_name  = "application-error-alerts"
  alert_email = var.alert_email
}

module "log_groups" {
  source     = "./modules/cloudwatch-log-groups"
  log_groups = var.log_groups
}

module "metric_filters" {
  source         = "./modules/cloudwatch-metric-filters"
  log_groups     = var.log_groups
  filter_pattern = var.error_filter_pattern

  depends_on = [module.log_groups]
}
module "alarms" {
  source        = "./modules/cloudwatch-alarms"
  log_groups    = var.log_groups
  sns_topic_arn = module.sns.topic_arn
}

