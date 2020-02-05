# AWSLambda_CrawlReddit
 Sample Project with setup and deployment script to create Lambda Function for Crawling Reddit

## Prerequisites
Ensure that you have installed AWS CLI and configured it. More info can be found here https://aws.amazon.com/cli/ 

Please set up your AWS CLI by following this tutorial: https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html 

## AWS Lambda Set up
1. Log in to AWS Management Console , Click on Services , Click on AWS Lambda
2. Click Create Function
3. Select "Author from Scratch" , Enter "LambdaRedditSingaporeTop10" in Function Name, Run time select "Python 3.7"
4. Click Create Function
5. Under Design Panel, Click on Add Trigger, Add API Gateway, Create a new API , Select HTTP API, click Add

## Setup
1. Fill in your reddit credentials in "auth-key.json"
2. Run setup.sh (setup.ps for Window Users) to set up packages for deployment to AWS Lambda

## Redeploy
Redeploy by running deploy_to_lambda.sh (deploy_to_lambda.ps1 for Window Users)

## Reddit Topic
Do remember to edit the Reddit subtopic to your preferred subtopic. Currently the topic is set to r/singapore

## Accessing the API Endpoint
Navigate to your function page, Click on API Gateway to obtain your URL
![alt text](/images/API_Gateway_SS.jpg "AWS Lambda function page screenshot")

## Credit
github.com/winstonho90 for providing the Powershell scripts!