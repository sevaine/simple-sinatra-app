Simple terraform vpc environment deployment for sinatra-example-app
-------------------------------------------------------------------

# Intro

This readme assumes that the initial bootstrap steps for terraform have been performed ( see terraform getting started docs ), and that a remote state s3 bucket is set up.

# Usage

```
terraform init
terraform plan

# Check the plan output - it's important! :)
terraform apply ## IFF you're happy with the plan
