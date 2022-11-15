variable "AWS_REGION" {
default = "us-east-1"
}

variable "AMI_ID" {
  default = "ami-09d3b3274b6c5d4aa"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "levelup_key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "levelup_key.pub"
}

variable "INSTANCE_TYPE" {
  default = "t2.micro"
}

variable "VPC_ZONE_IDENTIFIER" {
  type = list
  default = ["subnet-0e5871e683b310bc3","subnet-04b04399210978637"]
}

variable "LAUNCH_CONFIGURATION_NAME" {
  default = "tf-launchconfig"
}

variable "KEY_NAME" {
  default = "tf-ssh-key"
}

variable "AUTOSCALING_GROUP_NAME" {
  default = "tf-autoscaling"
}

variable "AUTOSCALING_GROUP_MIN_SIZE" {
  default = 1
}

variable "AUTOSCALING_GROUP_MAX_SIZE" {
  default = 2
}

variable "HEALTH_CHECK_GRACE_PERIOD" {
  default = 200
}

variable "HEALTH_CHECK_TYPE" {
  default = "EC2"
}

variable "AUTOSCALING_POLICY_NAME" {
  default = "tf-cpu-policy"
}

variable "AUTO_DE_SCALING_POLICY_NAME" {
  default = "tf-cpu-policy-scaledown"
}

variable "AUTOSCALING_POLICY_ADJUSTMENT_TYPE" {
  default = "ChangeInCapacity"
}

variable "AUTOSCALING_POLICY_TYPE" {
  default = "SimpleScaling"
}

variable "AUTOSCALING_POLICY_SCALING_ADJUSTMENT" {
  default = "1"
}

variable "AUTO_DE_SCALING_POLICY_SCALING_ADJUSTMENT" {
  default = "-1"
}

variable "AUTOSCALING_POLICY_COOLDOWN" {
  default = "200"
}

variable "SG_NAME" {
  default = "allow-levelup-ssh"
}

variable "SG_DESCRIPTION" {
  default = "security group that allows ssh connection"
}