<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.84.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.tf-autoscaling](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_autoscaling_policy.tf-cpu-policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy) | resource |
| [aws_autoscaling_policy.tf-cpu-policy-scaledown](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_policy) | resource |
| [aws_cloudwatch_metric_alarm.tf-cpu-alarm](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_cloudwatch_metric_alarm.tf-cpu-alarm-scaledown](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_key_pair.tf-ssh-key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_launch_template.tf-launchtemplate](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [aws_security_group.allow-levelup-ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_ami.packer_ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_AUTOSCALING_GROUP_MAX_SIZE"></a> [AUTOSCALING\_GROUP\_MAX\_SIZE](#input\_AUTOSCALING\_GROUP\_MAX\_SIZE) | n/a | `number` | `2` | no |
| <a name="input_AUTOSCALING_GROUP_MIN_SIZE"></a> [AUTOSCALING\_GROUP\_MIN\_SIZE](#input\_AUTOSCALING\_GROUP\_MIN\_SIZE) | n/a | `number` | `1` | no |
| <a name="input_AUTOSCALING_GROUP_NAME"></a> [AUTOSCALING\_GROUP\_NAME](#input\_AUTOSCALING\_GROUP\_NAME) | n/a | `string` | `"tf-autoscaling"` | no |
| <a name="input_AUTOSCALING_POLICY_ADJUSTMENT_TYPE"></a> [AUTOSCALING\_POLICY\_ADJUSTMENT\_TYPE](#input\_AUTOSCALING\_POLICY\_ADJUSTMENT\_TYPE) | n/a | `string` | `"ChangeInCapacity"` | no |
| <a name="input_AUTOSCALING_POLICY_COOLDOWN"></a> [AUTOSCALING\_POLICY\_COOLDOWN](#input\_AUTOSCALING\_POLICY\_COOLDOWN) | n/a | `string` | `"200"` | no |
| <a name="input_AUTOSCALING_POLICY_NAME"></a> [AUTOSCALING\_POLICY\_NAME](#input\_AUTOSCALING\_POLICY\_NAME) | n/a | `string` | `"tf-cpu-policy"` | no |
| <a name="input_AUTOSCALING_POLICY_SCALING_ADJUSTMENT"></a> [AUTOSCALING\_POLICY\_SCALING\_ADJUSTMENT](#input\_AUTOSCALING\_POLICY\_SCALING\_ADJUSTMENT) | n/a | `string` | `"1"` | no |
| <a name="input_AUTOSCALING_POLICY_TYPE"></a> [AUTOSCALING\_POLICY\_TYPE](#input\_AUTOSCALING\_POLICY\_TYPE) | n/a | `string` | `"SimpleScaling"` | no |
| <a name="input_AUTO_DE_SCALING_POLICY_NAME"></a> [AUTO\_DE\_SCALING\_POLICY\_NAME](#input\_AUTO\_DE\_SCALING\_POLICY\_NAME) | n/a | `string` | `"tf-cpu-policy-scaledown"` | no |
| <a name="input_AUTO_DE_SCALING_POLICY_SCALING_ADJUSTMENT"></a> [AUTO\_DE\_SCALING\_POLICY\_SCALING\_ADJUSTMENT](#input\_AUTO\_DE\_SCALING\_POLICY\_SCALING\_ADJUSTMENT) | n/a | `string` | `"-1"` | no |
| <a name="input_AWS_REGION"></a> [AWS\_REGION](#input\_AWS\_REGION) | n/a | `string` | `"us-east-1"` | no |
| <a name="input_HEALTH_CHECK_GRACE_PERIOD"></a> [HEALTH\_CHECK\_GRACE\_PERIOD](#input\_HEALTH\_CHECK\_GRACE\_PERIOD) | n/a | `number` | `200` | no |
| <a name="input_HEALTH_CHECK_TYPE"></a> [HEALTH\_CHECK\_TYPE](#input\_HEALTH\_CHECK\_TYPE) | n/a | `string` | `"EC2"` | no |
| <a name="input_INSTANCE_TYPE"></a> [INSTANCE\_TYPE](#input\_INSTANCE\_TYPE) | n/a | `string` | `"t2.micro"` | no |
| <a name="input_KEY_NAME"></a> [KEY\_NAME](#input\_KEY\_NAME) | n/a | `string` | `"tf-ssh-key"` | no |
| <a name="input_LAUNCH_TEMPLATE_NAME"></a> [LAUNCH\_TEMPLATE\_NAME](#input\_LAUNCH\_TEMPLATE\_NAME) | n/a | `string` | `"tf-launchtemplate"` | no |
| <a name="input_LD_NAME"></a> [LD\_NAME](#input\_LD\_NAME) | n/a | `string` | `"centos"` | no |
| <a name="input_PATH_TO_PUBLIC_KEY"></a> [PATH\_TO\_PUBLIC\_KEY](#input\_PATH\_TO\_PUBLIC\_KEY) | n/a | `string` | `"levelup_key.pub"` | no |
| <a name="input_SG_DESCRIPTION"></a> [SG\_DESCRIPTION](#input\_SG\_DESCRIPTION) | n/a | `string` | `"security group that allows ssh connection"` | no |
| <a name="input_VPC_ZONE_IDENTIFIER"></a> [VPC\_ZONE\_IDENTIFIER](#input\_VPC\_ZONE\_IDENTIFIER) | n/a | `list(any)` | <pre>[<br/>  "subnet-0e5871e683b310bc3",<br/>  "subnet-04b04399210978637"<br/>]</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->