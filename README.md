# Provision Autoscaling Group with Terraform
In this demo, we will create an Autoscaling Group with Launch Template EC2 service, we will need AWS Cloudwatch service in order to monitor our created EC2 instances and set up alerts. We use a custom AMI created by **Packer** and configured by **Ansible**.
![](./Lab_Results/Autoscaler.png)
## About Autoscaling Group
An Auto Scaling group contains a collection of EC2 instances that are treated as a logical grouping for the purposes of automatic scaling and management. An Auto Scaling group also lets you use Amazon EC2 Auto Scaling features such as health check replacements and scaling policies. Both maintaining the number of instances in an Auto Scaling group and automatic scaling are the core functionality of the Amazon EC2 Auto Scaling service.

The size of an Auto Scaling group depends on the number of instances that you set as the desired capacity. You can adjust its size to meet demand, either manually or by using automatic scaling.

An Auto Scaling group starts by launching enough instances to meet its desired capacity. It maintains this number of instances by performing periodic health checks on the instances in the group. The Auto Scaling group continues to maintain a fixed number of instances even if an instance becomes unhealthy. If an instance becomes unhealthy, the group terminates the unhealthy instance and launches another instance to replace it.
## Instructions
<details>
  <summary>Centos</summary>

1. Clone the project 
```
git clone https://github.com/mehdijebali/Terraform-Autoscaling-.git
```
2. In the project root directory, create an SSH key and name it **levelup_key**
```
ssh-keygen
``` 
3. Export your AWS Credentials
```
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_DEFAULT_REGION=us-west-2
```
4. Validate Packer configuration file syntax
```
packer validate ./packer/centos/install_custom_ami.json
```
5. Once the validation is succeeded, you can build the custom image
```
packer build ./packer/centos/install_custom_ami.json
```
5. In the project root directory, initiate Terraform in order to install the declared provider in `main.tf` file
```
terraform init
```
6. If you want to see your provisionning details, run the following command
```
terraform plan
```
7. Apply modifications
```
terraform apply
```
8. After the creation is completed, SSH to the EC2 instance
```
ssh ec2-user@<public_ip>
```
9. apply the load for 5 minutes
```
stress --cpu 2 --timeout 300
```
</details>

<details>
  <summary>Ubuntu</summary>

1. Clone the project 
```
git clone https://github.com/mehdijebali/Terraform-Autoscaling-.git
```
2. In the project root directory, create an SSH key and name it **levelup_key**
```
ssh-keygen
``` 
3. Export your AWS Credentials
```
export AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_DEFAULT_REGION=us-west-2
```
4. Validate Packer configuration file syntax
```
packer validate ./packer/ubuntu/install_custom_ami.json
```
5. Once the validation is succeeded, you can build the custom image
```
packer build ./packer/ubuntu/install_custom_ami.json
```
5. In the project root directory, initiate Terraform in order to install the declared provider in `main.tf` file
```
terraform init
```
6. If you want to see your provisionning details, run the following command
```
terraform plan
```
7. Apply modifications
```
terraform apply
```
8. After the creation is completed, SSH to the EC2 instance
```
ssh ec2-user@<public_ip>
```
9. apply the load for 5 minutes
```
stress --cpu 2 --timeout 300
```
</details>

## Expected Results
After the provisionning is done, we can verify the implementation of AWS resources and test the autoscaling group
#### Launch Configuration
![](./Lab_Results/lunch_config.png)
#### Autoscaling Group
![](./Lab_Results/auto_scaling.png)
#### CloudWatch
![](./Lab_Results/cloudwatch.png)
#### EC2 instance
An EC2 instance is created once the autoScaling is activated. note that the desired number of instances is 1.
![](./Lab_Results/instance.png)
#### Scaling
After applying the load in the instance, we should notify the spinning of another instance with the same name
![](./Lab_Results/scaling_instance.png) 