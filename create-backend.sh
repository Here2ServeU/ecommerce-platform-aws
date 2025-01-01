#!/bin/bash

# Variables
REGION="us-east-1"                # Change this to your desired region
BUCKET_NAME="t2s-ecommerce-tf-state"
DYNAMODB_TABLE="t2s-terraform-locks"

# Create S3 bucket
echo "Creating S3 bucket..."
if [ "$REGION" == "us-east-1" ]; then
  aws s3api create-bucket --bucket $BUCKET_NAME --region $REGION
else
  aws s3api create-bucket --bucket $BUCKET_NAME --region $REGION --create-bucket-configuration LocationConstraint=$REGION
fi

# Enable versioning on the bucket
echo "Enabling versioning on S3 bucket..."
aws s3api put-bucket-versioning --bucket $BUCKET_NAME --versioning-configuration Status=Enabled

# Create DynamoDB table for locking
echo "Creating DynamoDB table for locking..."
aws dynamodb create-table \
    --table-name $DYNAMODB_TABLE \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --provisioned-throughput ReadCapacityUnits=1,WriteCapacityUnits=1 \
    --region $REGION

echo "Backend resources created successfully."
