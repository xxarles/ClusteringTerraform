# Introduction
This is the repo with all the infrastructure for the image clustering project

One should be able to run this simply by doing, but that's not how life works
```terraform init```
```terraform apply```

First, initizalize the ECR repos, then create before creating the lambdas otherwise it will throw an error

# List of resources
- ECR registry for image uploading and clustering
- s3 buckets for images and artifacts
- ImageUpload lambda and api_gateway
- SNS for file uploaded
- DynamoDB for processing status