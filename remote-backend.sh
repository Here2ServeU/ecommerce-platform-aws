#!/bin/bash

BUCKET_NAME="t2s-ecommerce-tf-state"
REGION="us-east-1"

# Create the bucket
echo "Creating S3 bucket..."
aws s3api create-bucket --bucket $BUCKET_NAME --region $REGION --create-bucket-configuration LocationConstraint=$REGION

# Enable versioning
echo "Enabling versioning..."
aws s3api put-bucket-versioning --bucket $BUCKET_NAME --versioning-configuration Status=Enabled

# Empty the bucket
echo "Emptying the bucket..."
aws s3 rm s3://$BUCKET_NAME --recursive

# Delete the bucket
echo "Deleting the bucket..."
aws s3api delete-bucket --bucket $BUCKET_NAME --region $REGION

echo "S3 bucket $BUCKET_NAME deleted successfully."
