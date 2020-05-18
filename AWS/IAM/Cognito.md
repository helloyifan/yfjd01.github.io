

## Web identity Federation

Web identity federation lets you give your users access to AWS resources after they have successfully authenticated with a web-based identity provider like 
* Amazon
* Facebook
* Google

Following successful authentication, the user receives an authentication code from the Web IP provider, which they can trade fro temporary AWS security credentials

## Amazon Cognito

Amazon Cognito provides Web Identity Federation with the following features:
* Sign-up and sign-in to your apps
* Access for guest users
* Acts as an identity broker between your application and web ID providers, so you don't need to write any additional code
* Synchronizes user data from multiple devices
* Recommended for all mobile applications AWS services.


The recommended approach for  Web Identity Federation using social media accounts like Facebook
* Ie provides temporary credentials from FB and then use that key with Cognito (which map to an IAM role) allowing access to API gateway

## Cognito User Pools

* User pools are used to manage sign-up and sign-in functionality for mobile and web applications
* Users can sign-in directly to the User Pool, or using Facebook, Amazon or Google.
* Cognito acts as an Identity Broker between the identity provider and AWS
* Successful authentication generates a JSON Web token (JWTs)
* User pools are thinks like: emails and passwords

## Cognito Identity Pools

* Identity Pools provide temporary AWS credentials to access AWS services like S3 or DynamoDB
* Identity Pools are granting of actual aws resource

## Cognito Synchronization
* Cognito uses SNS to send a notification to all the devices associated with a given user identity whenever data stored in the cloud changes.