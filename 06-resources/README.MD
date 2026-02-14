# Steps for implementation:
1. [DONE] Deploy a VPC and subnet
2. [DONE] Deploy an internet gateway and associate it with the VPC
3. [DONE] Setup a route table with a route to the Internet Gateway and associate it with the subnet
4. [DONE] Deploy an EC2 instance inside of the created subnet and associate a public IP
5. [DONE] Associate a security group that allows public ingress.
6. [DONE] Change the EC2 instance to use a publicly available NGINX AMI
7. [DONE] Destroy everything

## On changing the EC2 instance
Note that Terraform's default is to tear down the EC2 instance first then create the new EC2 instance. But we would normally prefer spinning up a new instance first before destroying the old instance.

This is why the `lifecycle` tag is important in the "aws_instance" resource