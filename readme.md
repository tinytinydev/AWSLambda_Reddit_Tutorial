# AWSLambda_CrawlReddit
 Sample Project with setup and deployment script to create Lambda Function for Crawling Reddit

## Prerequisites
Ensure that you have installed AWS CLI and configured it. More info can be found here https://aws.amazon.com/cli/

## AWS Lambda Set up
1. Log in to AWS Management Console , Click on Services , Click on AWS Lambda
2. Click Create Function
3. Select "Author from Scratch" , Enter "LambdaRedditSingaporeTop10" in Function Name, Run time select "Python 3.7"
4. Click Create Function
5. Under Design Panel, Click on Add Trigger, Add API Gateway, Create a new API , Select HTTP API, click Add

## Setup
1. Fill in your reddit credentials in "auth-key.json"
2. Run setup.sh to set up packages for deployment to AWS Lambda

## Redeploy
Redeploy by running deploy_to_lambda.sh

## Reddit Topic
Do remember to edit the Reddit subtopic to your preferred subtopic. Currently the topic is set to r/singapore

     