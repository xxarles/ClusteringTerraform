# Introduction
This is the repo with all the infrastructure for the image clustering project

One can run this simply by doing 
```terraform init```
```terraform apply```

# List of resources
- ECR registry for image uploading and clustering
- s3 buckets for images and artifacts
- ImageUpload lambda and api_gateway
- SNS for file uploaded
- DynamoDB for processing status