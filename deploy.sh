#!/bin/bash
set -e

REGION="eu-west-1"

echo "Deploying VPC..."
aws cloudformation deploy \
  --stack-name eks-vpc \
  --template-file vpc.yaml \
  --region $REGION \
  --capabilities CAPABILITY_NAMED_IAM

echo "Deploying EKS Cluster..."
aws cloudformation deploy \
  --stack-name eks-cluster \
  --template-file cluster.yaml \
  --region $REGION \
  --capabilities CAPABILITY_NAMED_IAM

echo "Deploying Node Group..."
aws cloudformation deploy \
  --stack-name eks-nodegroup \
  --template-file nodegroup.yaml \
  --region $REGION \
  --capabilities CAPABILITY_NAMED_IAM

