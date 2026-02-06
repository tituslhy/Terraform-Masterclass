# The main phases of Terraform
1. Plan
2. Apply
3. Destroy

```
terraform init
terraform plan
terraform apply
terraform destroy
```

Run the `terraform init` command every time so that the lock file is updated.

We'll use 01-benefits-iac as the reference for the commands below

## Plan

```
terraform plan
```

Output:
```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_internet_gateway.igw will be created
  + resource "aws_internet_gateway" "igw" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags_all = (known after apply)
      + vpc_id   = (known after apply)
    }

  # aws_route_table.public_rtb will be created
  + resource "aws_route_table" "public_rtb" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + cidr_block                 = "0.0.0.0/0"
              + gateway_id                 = (known after apply)
                # (11 unchanged attributes hidden)
            },
        ]
      + tags_all         = (known after apply)
      + vpc_id           = (known after apply)
    }

  # aws_route_table_association.public_subnet will be created
  + resource "aws_route_table_association" "public_subnet" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_subnet.private_subnet will be created
  + resource "aws_subnet" "private_subnet" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = (known after apply)
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.1.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags_all                                       = (known after apply)
      + vpc_id                                         = (known after apply)
    }
```
Note that the plan does not reflect the order at which the things are done.

## Apply
```
terraform apply
```

Output:
```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_internet_gateway.igw will be created
  + resource "aws_internet_gateway" "igw" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags_all = (known after apply)
      + vpc_id   = (known after apply)
    }

  # aws_route_table.public_rtb will be created
  + resource "aws_route_table" "public_rtb" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = [
          + {
              + cidr_block                 = "0.0.0.0/0"
              + gateway_id                 = (known after apply)
                # (11 unchanged attributes hidden)
            },
        ]
      + tags_all         = (known after apply)
      + vpc_id           = (known after apply)
    }

  # aws_route_table_association.public_subnet will be created
  + resource "aws_route_table_association" "public_subnet" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # aws_subnet.private_subnet will be created
  + resource "aws_subnet" "private_subnet" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = (known after apply)
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.1.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags_all                                       = (known after apply)
      + vpc_id                                         = (known after apply)
    }

  # aws_subnet.public_subnet will be created
  + resource "aws_subnet" "public_subnet" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = (known after apply)
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "10.0.0.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags_all                                       = (known after apply)
      + vpc_id                                         = (known after apply)
    }

  # aws_vpc.demo_vpc will be created
  + resource "aws_vpc" "demo_vpc" {
      + arn                                  = (known after apply)
      + cidr_block                           = "10.0.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = (known after apply)
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name" = "Terraform VPC"
        }
      + tags_all                             = {
          + "Name" = "Terraform VPC"
        }
    }

Plan: 6 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_vpc.demo_vpc: Creating...
aws_vpc.demo_vpc: Creation complete after 8s [id=vpc-00da43c8f6acb20f4]
aws_internet_gateway.igw: Creating...
aws_subnet.private_subnet: Creating...
aws_subnet.public_subnet: Creating...
aws_subnet.public_subnet: Creation complete after 2s [id=subnet-08ada3703f77db167]
aws_subnet.private_subnet: Creation complete after 3s [id=subnet-0212fabbfc53936fe]
aws_internet_gateway.igw: Creation complete after 3s [id=igw-0b268a2addfa8249a]
aws_route_table.public_rtb: Creating...
aws_route_table.public_rtb: Creation complete after 4s [id=rtb-0e2bf0cfef0a24335]
aws_route_table_association.public_subnet: Creating...
aws_route_table_association.public_subnet: Creation complete after 2s [id=rtbassoc-01444b4d4afb30d3e]

Apply complete! Resources: 6 added, 0 changed, 0 destroyed.
```

## Destroy
```
terraform destroy
```

Output:
```
aws_vpc.demo_vpc: Refreshing state... [id=vpc-00da43c8f6acb20f4]
aws_internet_gateway.igw: Refreshing state... [id=igw-0b268a2addfa8249a]
aws_subnet.private_subnet: Refreshing state... [id=subnet-0212fabbfc53936fe]
aws_subnet.public_subnet: Refreshing state... [id=subnet-08ada3703f77db167]
aws_route_table.public_rtb: Refreshing state... [id=rtb-0e2bf0cfef0a24335]
aws_route_table_association.public_subnet: Refreshing state... [id=rtbassoc-01444b4d4afb30d3e]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # aws_internet_gateway.igw will be destroyed
  - resource "aws_internet_gateway" "igw" {
      - arn      = "arn:aws:ec2:us-east-1:147550364303:internet-gateway/igw-0b268a2addfa8249a" -> null
      - id       = "igw-0b268a2addfa8249a" -> null
      - owner_id = "147550364303" -> null
      - tags     = {} -> null
      - tags_all = {} -> null
      - vpc_id   = "vpc-00da43c8f6acb20f4" -> null
    }

  # aws_route_table.public_rtb will be destroyed
  - resource "aws_route_table" "public_rtb" {
      - arn              = "arn:aws:ec2:us-east-1:147550364303:route-table/rtb-0e2bf0cfef0a24335" -> null
      - id               = "rtb-0e2bf0cfef0a24335" -> null
      - owner_id         = "147550364303" -> null
      - propagating_vgws = [] -> null
      - route            = [
          - {
              - cidr_block                 = "0.0.0.0/0"
              - gateway_id                 = "igw-0b268a2addfa8249a"
                # (11 unchanged attributes hidden)
            },
        ] -> null
      - tags             = {} -> null
      - tags_all         = {} -> null
      - vpc_id           = "vpc-00da43c8f6acb20f4" -> null
    }

  # aws_route_table_association.public_subnet will be destroyed
  - resource "aws_route_table_association" "public_subnet" {
      - id             = "rtbassoc-01444b4d4afb30d3e" -> null
      - route_table_id = "rtb-0e2bf0cfef0a24335" -> null
      - subnet_id      = "subnet-08ada3703f77db167" -> null
        # (1 unchanged attribute hidden)
    }

  # aws_subnet.private_subnet will be destroyed
  - resource "aws_subnet" "private_subnet" {
      - arn                                            = "arn:aws:ec2:us-east-1:147550364303:subnet/subnet-0212fabbfc53936fe" -> null
      - assign_ipv6_address_on_creation                = false -> null
      - availability_zone                              = "us-east-1d" -> null
      - availability_zone_id                           = "use1-az6" -> null
      - cidr_block                                     = "10.0.1.0/24" -> null
      - enable_dns64                                   = false -> null
      - enable_lni_at_device_index                     = 0 -> null
      - enable_resource_name_dns_a_record_on_launch    = false -> null
      - enable_resource_name_dns_aaaa_record_on_launch = false -> null
      - id                                             = "subnet-0212fabbfc53936fe" -> null
      - ipv6_native                                    = false -> null
      - map_customer_owned_ip_on_launch                = false -> null
      - map_public_ip_on_launch                        = false -> null
      - owner_id                                       = "147550364303" -> null
      - private_dns_hostname_type_on_launch            = "ip-name" -> null
      - tags                                           = {} -> null
      - tags_all                                       = {} -> null
      - vpc_id                                         = "vpc-00da43c8f6acb20f4" -> null
        # (4 unchanged attributes hidden)
    }

  # aws_subnet.public_subnet will be destroyed
  - resource "aws_subnet" "public_subnet" {
      - arn                                            = "arn:aws:ec2:us-east-1:147550364303:subnet/subnet-08ada3703f77db167" -> null
      - assign_ipv6_address_on_creation                = false -> null
      - availability_zone                              = "us-east-1d" -> null
      - availability_zone_id                           = "use1-az6" -> null
      - cidr_block                                     = "10.0.0.0/24" -> null
      - enable_dns64                                   = false -> null
      - enable_lni_at_device_index                     = 0 -> null
      - enable_resource_name_dns_a_record_on_launch    = false -> null
      - enable_resource_name_dns_aaaa_record_on_launch = false -> null
      - id                                             = "subnet-08ada3703f77db167" -> null
      - ipv6_native                                    = false -> null
      - map_customer_owned_ip_on_launch                = false -> null
      - map_public_ip_on_launch                        = false -> null
      - owner_id                                       = "147550364303" -> null
      - private_dns_hostname_type_on_launch            = "ip-name" -> null
      - tags                                           = {} -> null
      - tags_all                                       = {} -> null
      - vpc_id                                         = "vpc-00da43c8f6acb20f4" -> null
        # (4 unchanged attributes hidden)
    }

  # aws_vpc.demo_vpc will be destroyed
  - resource "aws_vpc" "demo_vpc" {
      - arn                                  = "arn:aws:ec2:us-east-1:147550364303:vpc/vpc-00da43c8f6acb20f4" -> null
      - assign_generated_ipv6_cidr_block     = false -> null
      - cidr_block                           = "10.0.0.0/16" -> null
      - default_network_acl_id               = "acl-02c93e5205ea5f04b" -> null
      - default_route_table_id               = "rtb-0399675dd85a8dea6" -> null
      - default_security_group_id            = "sg-0827fde36a2928e5d" -> null
      - dhcp_options_id                      = "dopt-0afcbedcf3b6a5655" -> null
      - enable_dns_hostnames                 = false -> null
      - enable_dns_support                   = true -> null
      - enable_network_address_usage_metrics = false -> null
      - id                                   = "vpc-00da43c8f6acb20f4" -> null
      - instance_tenancy                     = "default" -> null
      - ipv6_netmask_length                  = 0 -> null
      - main_route_table_id                  = "rtb-0399675dd85a8dea6" -> null
      - owner_id                             = "147550364303" -> null
      - tags                                 = {
          - "Name" = "Terraform VPC"
        } -> null
      - tags_all                             = {
          - "Name" = "Terraform VPC"
        } -> null
        # (4 unchanged attributes hidden)
    }

Plan: 0 to add, 0 to change, 6 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

aws_route_table_association.public_subnet: Destroying... [id=rtbassoc-01444b4d4afb30d3e]
aws_subnet.private_subnet: Destroying... [id=subnet-0212fabbfc53936fe]
aws_route_table_association.public_subnet: Destruction complete after 3s
aws_route_table.public_rtb: Destroying... [id=rtb-0e2bf0cfef0a24335]
aws_subnet.public_subnet: Destroying... [id=subnet-08ada3703f77db167]
aws_subnet.private_subnet: Destruction complete after 4s
aws_subnet.public_subnet: Destruction complete after 2s
aws_route_table.public_rtb: Destruction complete after 3s
aws_internet_gateway.igw: Destroying... [id=igw-0b268a2addfa8249a]
aws_internet_gateway.igw: Destruction complete after 1s
aws_vpc.demo_vpc: Destroying... [id=vpc-00da43c8f6acb20f4]
aws_vpc.demo_vpc: Destruction complete after 1s

Destroy complete! Resources: 6 destroyed.
```