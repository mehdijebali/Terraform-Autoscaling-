variable "AWS_REGION" {
  type        = string
  description = "The region where resources are deployed"
  default     = "us-east-1"
}

variable "PATH_TO_PUBLIC_KEY" {
  type        = string
  description = "Path to SSH public key"
  default     = "levelup_key.pub"
}

variable "INSTANCE_TYPE" {
  type        = string
  description = "AWS Instance type"
  default     = "t2.micro"
}

variable "VPC_ZONE_IDENTIFIER" {
  type        = list(any)
  description = "List of VPC Subnets"
  default     = ["subnet-0e5871e683b310bc3", "subnet-04b04399210978637"]
}

variable "LAUNCH_TEMPLATE_NAME" {
  type        = string
  description = "Launch Template Name"
  default     = "tf-launchtemplate"
}

variable "KEY_NAME" {
  type        = string
  description = "SSH key name"
  default     = "tf-ssh-key"
}

variable "AUTOSCALING_GROUP_NAME" {
  type        = string
  description = "Auto Scaling Group name"
  default     = "tf-autoscaling"
}

variable "AUTOSCALING_GROUP_MIN_SIZE" {
  type        = number
  description = "Auto-Scaling Minimum EC2 Instances number"
  default     = 1
}

variable "AUTOSCALING_GROUP_MAX_SIZE" {
  type        = number
  description = "Auto-Scaling Maximum EC2 Instances number"
  default     = 2
}

variable "HEALTH_CHECK_GRACE_PERIOD" {
  type        = number
  description = "Health Check Period in seconds"
  default     = 200
}

variable "HEALTH_CHECK_TYPE" {
  type        = string
  description = "Health Check Type"
  default     = "EC2"
}

variable "AUTOSCALING_POLICY_NAME" {
  type        = string
  description = "Auto-Scaling Policy Name"
  default     = "tf-cpu-policy"
}

variable "AUTO_DE_SCALING_POLICY_NAME" {
  type        = string
  description = "Auto-DEScaling Policy Name"
  default     = "tf-cpu-policy-scaledown"
}

variable "AUTOSCALING_POLICY_ADJUSTMENT_TYPE" {
  type        = string
  description = "Auto-Scaling Policy Adjustment Type"
  default     = "ChangeInCapacity"
}

variable "AUTOSCALING_POLICY_TYPE" {
  type        = string
  description = "Auto-Scaling Policy Type"
  default     = "SimpleScaling"
}

variable "AUTOSCALING_POLICY_SCALING_ADJUSTMENT" {
  type        = string
  description = "Auto-Scaling Adjustment Policy"
  default     = "1"
}

variable "AUTO_DE_SCALING_POLICY_SCALING_ADJUSTMENT" {
  type        = string
  description = "Auto-DEScaling Adjustment Policy"
  default     = "-1"
}

variable "AUTOSCALING_POLICY_COOLDOWN" {
  type        = string
  description = "Auto-Scaling CoolDown Policy"
  default     = "200"
}

variable "SG_DESCRIPTION" {
  type        = string
  description = "EC2 Security Group Description"
  default     = "security group that allows ssh connection"
}

variable "LD_NAME" {
  type        = string
  description = "Linux Distribution Name"
  default     = "centos"
}