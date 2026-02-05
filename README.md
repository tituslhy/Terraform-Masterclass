# Terraform-Masterclass
Titus learns Terraform

<p align="center">
    <img src="./images/terraform_masterclass.png" height = 600px>
</p>

## Installation
I use a Mac!

To install Terraform
```
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

To install AWS CLI
```
brew install awscli
```

To login to AWS CLI in a terminal session:
```
source .env
```
the env vars in the .env file

To test login:
```
aws s3 ls
```

If your credentials are valid, you would be able to see the list of s3 buckets.