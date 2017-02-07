# Working information

## Structure

### assets

Things to be downloaded to images, installed into fixtures in AWS, that sort of thing.

### configs

Configurations for installing `awsbatch`

### scripts

Scripts for configuring `awsbatch`

## Hints

- set `AWS_PROFILE` to point to credentials in `~/.aws/credentials` with
  `AWSBatchFullAccess` and `PackerMinimumPermissions`
  - The former is likely too much
  - The latter policy is available from the Hashicorp/Packer website
- get login credentials for the docker image repo: 
  `aws ecr get-login --region us-east-1`
- commands assume that it's in your path

## Building images:

```
packer build configs/packer-template.json
```

## Submitting Jobs:

```
aws batch submit-job --cli-input-json file://configs/job.json
```

## Updating Job Definition:

```
aws batch register-job-definition  --cli-input-json file://configs/aws-batch-job-definition.json
```
