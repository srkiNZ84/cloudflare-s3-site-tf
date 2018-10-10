# Cloudflare, S3, Terraform static site setup

## About

Simple Terraform to create an S3 bucket, configure it for website hosting and then point a CloudFlare site at it using a
CNAME record.

## Requirements/Dependencies

* Terraform
* An AWS account
* A Cloudflare account
* A Cloudflare "site"
* A DNS name that you own/control

## How to use this

Add your AWS API key and Cloudflare API key to a ".tfvars" file. Update the default domain to use (currently set to
"srdan.nz") and then run:

  terraform init

  terraform plan -var-file=my.tfvars

  terraform apply -var-file=my.tfvars
