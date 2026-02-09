# How to use backends

## Whenever you update a key in the `terraform block`
Definitely always run `terraform init`

## Reformatting for readability
Run:
```
terraform fmt -recursive
```

To format the the file to be more readbale.

## To validate terraform code
Run:
```
terraform validate
```

This catches most things but not everything - for example it won't catch an invalid cinder block. These errors that `terraform validate` can't catch will surface at run time when running `terraform apply`

## The plan
```
terraform plan
```
Lists the changes it will apply.

To save the plan into a file:
```
terraform plan <filename>
```

For example:
```
terraform plan myplan
```

This file won't be human readable but can be passed into the `terraform apply` command.

## The apply step
```
terraform apply
```
or 
```
terraform apply <name of file>
```

For example:
```
terraform apply myplan
```

The only difference if you pass in the name of the file is that you don't have to approve the application step.

To verify the creation of the s3 bucket:
```
aws s3 ls
```

## The show
```
terraform show
```

This shows the defaults that terraform configured for the blocks you specified but the arguments that you didn't.

To display the plan file,
```
terraform show <planfile>
```

For example:
```
terraform show myplan
```
This shows a human readable version of the "myplan" plan file.

## List resources
```
terraform state list
```
This shows the resources in our current terraform state files. This is preferred to `terraform show`

## Destroy
Destory steps can be planned too:
```
terraform plan -destroy
```

This can also be saved in a plan file as well.

To destroy:
```
terraform destroy
```

or 

```
terraform apply -destroy
```

or

```
terraform apply -destroy -auto-approve
```

## To get help
Add the help flag to any terraform command you're running
```
terraform -help
```

## Backends
It is conventional to write your backend configurations to different terraform files so that you can run them in different environments.

Note: Whenever you rewrite a block in the `terraform` block you must run:
```
terraform init -migrate-state
```

To pass in the backend file:
```
terraform init -backend-config="prod.s3.tfbackend" -migrate-state
```

In CI/CD environments this allows us to deploy in different environments.

To pass in a specific key-value pair:
```
terraform init -backend-config=region=eu-west-1 -migrate-config
```