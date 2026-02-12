# Steps for implementation:
1. [DONE] Deploy a VPC and subnet
2. [DONE] Deploy an internet gateway and associate it with the VPC
3. [DONE] Setup a route table with a route to the Internet Gateway and associate it with the subnet
4. [DONE] Deploy an EC2 instance inside of the created subnet
5. Associate a public IP and a security group that allows public ingress.
6. Change the EC2 instance to use a publicly available NGINX AMI
7. Destroy everything