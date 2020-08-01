# Cognito

Adding authentication

Out of the box working service, to easily
* to add users
* sign users up
* confirm users
* reset passwords
* authenticate users
* generate tokens
* give this authorization process
* integrate with other providers (fb, google)


### How it works

```Application -> Authentication -> User Data / Auth provider```

Application
* Web App (e.g Angular App)
* Mobile app

Authentication
* Define how to authenticate Users
* Store Auth Token on User Devices
* Also possible Issue temporary IAM credentials

User Data / Auth provider
* Cognito User Pools
* Third-Party Provider like Facebook, Google


### User Pool vs Federated Identities

User pools is a complete solution for people with no Authentication at all, and don't wanna use third party providers like FB or Google
(Sign up, sign in, really easy to use)

Federated Identities allow you to connect third party providers like FB or Google to Cognito, to then create temporary IAM Credentials you provided, (ie upload files to S3)