# Task 1

## AWS

  * [X] Create S3 bucket in root account for TF State
  * [X] Create DynamoDB in root account for Tf State Lock

## Terraform

### Configure provider

  * [X] Define an AWS TF provider in a separate file 'providers.tf'
  * [X] Define required version for AWS Provider with major version of 6 and minor to be the latest
  * [X] Region defined in a provider to be a variable (set validation rule for the variable, so only EU region can be used)
  * [X] Setup default Tag on a provider level: Terraform=true

### Create a configuration for AWS VPC

  * [X] VPC Configuration to be placed in 'vpc.tf' file
  * [X] CIDR block to be defined as a variable (mandatory fields: description, type, default). OPTIONAL: regex validation for CIDR format 
  * [X] VPC should contain 2 public, 2 private and 2 db subnets. Use Data block to fetch availability zones
  * [X] IGW to be attached to a VPC
  * [X] NAT GW to be attached to a VPC
  * [X] Tags to be placed in 'locals', and contain 2 key-value pairs: Name, Environment
  * [X] Route tables to have necessary routes for resources placed in Public and Private subnets to have access to the Internet (Private instances shouldn't be accessible FROM the Internet)
  * [X] Add VPC ID and subnet CIDRs to outputs. Outputs to have description section
