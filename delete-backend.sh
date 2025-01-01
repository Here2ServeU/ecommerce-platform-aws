#!/bin/bash

# Variables
S3_BUCKET="t2s-ecommerce-tf-state"
DYNAMODB_TABLE="t2s-ecommerce-tf-locks"
REGION="us-east-1"

# Empty S3 bucket
echo "Emptying S3 bucket..."
aws s3 rm s3://$S3_BUCKET --recursive

# Delete S3 bucket
echo "Deleting S3 bucket..."
aws s3api delete-bucket --bucket $S3_BUCKET --region $REGION

# If you have issues deleting the S3 bucket, you can do it on the Console. 

# Delete DynamoDB table
echo "Deleting DynamoDB table..."
aws dynamodb delete-table --table-name $DYNAMODB_TABLE

echo "S3 bucket and DynamoDB table deletion complete."
