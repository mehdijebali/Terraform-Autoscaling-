#AutoScaling Launch Template
resource "aws_launch_template" "tf-launchtemplate" {
  name                   = var.LAUNCH_TEMPLATE_NAME
  image_id               = data.aws_ami.packer_ami.id
  instance_type          = var.INSTANCE_TYPE
  key_name               = aws_key_pair.tf-ssh-key.key_name
  vpc_security_group_ids = [aws_security_group.allow-levelup-ssh.id]
  update_default_version = true
}

#Generate Key
resource "aws_key_pair" "tf-ssh-key" {
  key_name   = var.KEY_NAME
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

#Autoscaling Group
resource "aws_autoscaling_group" "tf-autoscaling" {
  name                      = var.AUTOSCALING_GROUP_NAME
  vpc_zone_identifier       = var.VPC_ZONE_IDENTIFIER
  min_size                  = var.AUTOSCALING_GROUP_MIN_SIZE
  max_size                  = var.AUTOSCALING_GROUP_MAX_SIZE
  health_check_grace_period = var.HEALTH_CHECK_GRACE_PERIOD
  health_check_type         = var.HEALTH_CHECK_TYPE
  force_delete              = true
  launch_template {
    id = aws_launch_template.tf-launchtemplate.id
  }
  tag {
    key                 = "Name"
    value               = "LevelUp Custom EC2 instance"
    propagate_at_launch = true
  }
}

#Autoscaling Configuration policy - Scaling Alarm
resource "aws_autoscaling_policy" "tf-cpu-policy" {
  name                   = var.AUTOSCALING_POLICY_NAME
  autoscaling_group_name = aws_autoscaling_group.tf-autoscaling.name
  adjustment_type        = var.AUTOSCALING_POLICY_ADJUSTMENT_TYPE
  scaling_adjustment     = var.AUTOSCALING_POLICY_SCALING_ADJUSTMENT
  cooldown               = var.AUTOSCALING_POLICY_COOLDOWN
  policy_type            = var.AUTOSCALING_POLICY_TYPE
}



#Auto Descaling Policy
resource "aws_autoscaling_policy" "tf-cpu-policy-scaledown" {
  name                   = var.AUTO_DE_SCALING_POLICY_NAME
  autoscaling_group_name = aws_autoscaling_group.tf-autoscaling.name
  adjustment_type        = var.AUTOSCALING_POLICY_ADJUSTMENT_TYPE
  scaling_adjustment     = var.AUTO_DE_SCALING_POLICY_SCALING_ADJUSTMENT
  cooldown               = var.AUTOSCALING_POLICY_COOLDOWN
  policy_type            = var.AUTOSCALING_POLICY_TYPE
}

