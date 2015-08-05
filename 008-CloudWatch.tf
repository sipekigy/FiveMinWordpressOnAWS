resource "aws_cloudwatch_metric_alarm" "CPUGThan" {
    alarm_name = "WebServers-CPUGThan"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods = "2"
    metric_name = "CPUUtilization"
    namespace = "AWS/EC2"
    period = "300"
    statistic = "Average"
    threshold = "80"
    alarm_description = "This metric monitor ec2 cpu utilization"
    insufficient_data_actions = []
}

