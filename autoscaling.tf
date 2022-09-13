#AutoScaling Launch Configuration
resource "aws_launch_configuration" "tf-launchconfig" {
  name_prefix     = "tf-launchconfig"
  image_id        = var.AMI_ID
  instance_type   = var.INSTANCE_TYPE
  key_name        = aws_key_pair.levelup_key.key_name
}

#Generate Key
resource "aws_key_pair" "levelup_key" {
    key_name = "levelup_key"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}

#Autoscaling Group
resource "aws_autoscaling_group" "tf-autoscaling" {
  name                      = "tf-autoscaling"
  vpc_zone_identifier       = ["subnet-9e0ad9f5", "subnet-d7a6afad"]
  launch_configuration      = aws_launch_configuration.tf-launchconfig.name
  min_size                  = 1
  max_size                  = 2
  health_check_grace_period = 200
  health_check_type         = "EC2"
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "LevelUp Custom EC2 instance"
    propagate_at_launch = true
  }
}

#Autoscaling Configuration policy - Scaling Alarm
resource "aws_autoscaling_policy" "tf-cpu-policy" {
  name                   = "tf-cpu-policy"
  autoscaling_group_name = aws_autoscaling_group.tf-autoscaling.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "1"
  cooldown               = "200"
  policy_type            = "SimpleScaling"
}



#Auto Descaling Policy
resource "aws_autoscaling_policy" "tf-cpu-policy-scaledown" {
  name                   = "tf-cpu-policy-scaledown"
  autoscaling_group_name = aws_autoscaling_group.tf-autoscaling.name
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "-1"
  cooldown               = "200"
  policy_type            = "SimpleScaling"
}

