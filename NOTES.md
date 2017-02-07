# Working information

- set `AWS_PROFILE` to point to credentials in `~/.aws/credentials` with
  `AWSBatchFullAccess` and `PackerMinimumPermissions`
  - The former is likely too much
  - The latter policy is available from the Hashicorp/Packer website
- get login credentials for the docker image repo: 
  `aws ecr get-login --region us-east-1`

## Building images:

```
packer build packer-template.json
```

## Submitting Jobs:

```
aws batch submit-job --cli-input-json file://configs/job.json
```

## Updating Job Definition:

```
aws batch register-job-definition  --cli-input-json file://configs/aws-batch-job-definition.json
```
