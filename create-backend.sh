#!/bin/bash

# Variables
S3_BUCKET="t2s-ecommerce-tf-state"
DYNAMODB_TABLE="t2s-ecommerce-tf-locks"
REGION="us-east-1"

# Create S3 bucket
echo "Creating S3 bucket..."
aws s3api create-bucket --bucket $S3_BUCKET --region $REGION --create-bucket-configuration LocationConstraint=$REGION

# Enable versioning
echo "Enabling versioning on S3 bucket..."
aws s3api put-bucket-versioning --bucket $S3_BUCKET --versioning-configuration Status=Enabled

# Create DynamoDB table
echo "Creating DynamoDB table for locking..."
aws dynamodb create-table \
    --table-name $DYNAMODB_TABLE \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --billing-mode PAY_PER_REQUEST

echo "S3 bucket and DynamoDB table setup complete."
