variable "AWS_REGION" {
  type    = string
  default = "us-east-1"
}

variable "PATH_TO_PUBLIC_KEY" {
  type    = string
  default = "levelup_key.pub"
}

variable "INSTANCE_TYPE" {
  type    = string
  default = "t2.micro"
}

variable "VPC_ZONE_IDENTIFIER" {
  type    = list(any)
  default = ["subnet-0e5871e683b310bc3", "subnet-04b04399210978637"]
}

variable "LAUNCH_TEMPLATE_NAME" {
  type    = string
  default = "tf-launchtemplate"
}

variable "KEY_NAME" {
  type    = string
  default = "tf-ssh-key"
}

variable "AUTOSCALING_GROUP_NAME" {
  type    = string
  default = "tf-autoscaling"
}

variable "AUTOSCALING_GROUP_MIN_SIZE" {
  type    = number
  default = 1
}

variable "AUTOSCALING_GROUP_MAX_SIZE" {
  type    = number
  default = 2
}

variable "HEALTH_CHECK_GRACE_PERIOD" {
  type    = number
  default = 200
}

variable "HEALTH_CHECK_TYPE" {
  type    = string
  default = "EC2"
}

variable "AUTOSCALING_POLICY_NAME" {
  type    = string
  default = "tf-cpu-policy"
}

variable "AUTO_DE_SCALING_POLICY_NAME" {
  type    = string
  default = "tf-cpu-policy-scaledown"
}

variable "AUTOSCALING_POLICY_ADJUSTMENT_TYPE" {
  type    = string
  default = "ChangeInCapacity"
}

variable "AUTOSCALING_POLICY_TYPE" {
  type    = string
  default = "SimpleScaling"
}

variable "AUTOSCALING_POLICY_SCALING_ADJUSTMENT" {
  type    = string
  default = "1"
}

variable "AUTO_DE_SCALING_POLICY_SCALING_ADJUSTMENT" {
  type    = string
  default = "-1"
}

variable "AUTOSCALING_POLICY_COOLDOWN" {
  type    = string
  default = "200"
}

variable "SG_DESCRIPTION" {
  type    = string
  default = "security group that allows ssh connection"
}

variable "LD_NAME" {
  type    = string
  default = "centos"
}