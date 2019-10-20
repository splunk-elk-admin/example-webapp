#!/bin/bash

aws cloudformation $ACTION \
	--region us-east-2 \
	--stack-name $STACK_NAME \
	--template-body file://service.yaml \
	--capabilities CAPABILITY_NAMED_IAM \
	--parameters \
	ParameterKey=DockerImage,ParameterValue=679721405862.dkr.ecr.us-east-2.amazonaws.com/example-webapp:$(git rev-parse HEAD) \
	ParameterKey=VPC,ParameterValue=vpc-964ebefd \
	ParameterKey=Cluster,ParameterValue=default \
	ParameterKey=Listener,ParameterValue=arn:aws:elasticloadbalancing:us-east-2:679721405862:loadbalancer/app/production-website/d5dc81ce06c11b7b
