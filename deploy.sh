#!/bin/bash

# Set your project name (bucket name)
PROJECT_NAME="nike-test-website"

# Check if dist/ exists, delete if present
if [ -d "dist" ]; then
    echo "Removing existing dist/ directory..."
    rm -rf dist
fi

# Build the React project
echo "Building React project..."
npm run build || { echo "Build failed! Exiting..."; exit 1; }

# Upload build files to S3
echo "Uploading files to S3..."
aws s3 sync ./dist s3://$PROJECT_NAME  || { echo "S3 upload failed! Exiting..."; exit 1; }

# Get the S3 static website URL
WEBSITE_URL=$(aws s3api get-bucket-website --bucket $PROJECT_NAME --query "[WebsiteConfiguration.IndexDocument.Suffix, WebsiteConfiguration.ErrorDocument.Key]" --output text | awk '{print "https://'$PROJECT_NAME'.s3-website-'$(aws configure get region)'.amazonaws.com"}')
echo "Deployment complete! 🚀"
echo "Visit your website at: $WEBSITE_URL"
