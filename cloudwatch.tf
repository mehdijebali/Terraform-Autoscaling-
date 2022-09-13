#Auto scaling Cloud Watch Monitoring
resource "aws_cloudwatch_metric_alarm" "tf-cpu-alarm" {
  alarm_name          = "tf-cpu-alarm"
  alarm_description   = "Alarm once CPU Uses Increase"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"

  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.tf-autoscaling.name
  }

  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.tf-cpu-policy.arn]
}

#Auto descaling cloud watch 
resource "aws_cloudwatch_metric_alarm" "tf-cpu-alarm-scaledown" {
  alarm_name          = "tf-cpu-alarm-scaledown"
  alarm_description   = "Alarm once CPU Uses Decrease"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "10"

  dimensions = {
    "AutoScalingGroupName" = aws_autoscaling_group.tf-autoscaling.name
  }

  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.tf-cpu-policy-scaledown.arn]
}