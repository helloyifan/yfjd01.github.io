## What is Amazon API Gateway?

"Creating a RESTful API with ease"

Amazon API Gateway is a fully managed service that makes it easy for developers to publish, maintain, monitor, and secure APIs at any scale.

With a few clicks in the AWS Management Console, you can create an API that acts as a "front door" for applications to access data, business logic, or functionality from your back-end services, such as applications running on EC2, code running on AWS Lambda, or any web application

### How API Gateway works

```Application -> REST API -> Action```

Application 
* Web App (e.g. Angular App)
* Mobile App
* Other Source (e.g. Postman)

Rest API
* Definite API Endpoints & HTTP Methods (e.g. POST/book)
* Authorize Access

Action
* Directly access some AWS Services
* Run Lambda Code (and forward Request Data)

```Users -> API Gateway --> (Lambda|EC2|DDB)```

### What Can API Gateway Do?
* Expose HTTPs endpoints to define a RESTful API
* Serverless-ly connect to services like Lambda & DynamoDB
* Send each API endpoint to a different target.
* Run efficiently with low cost.
* Scale effortlessly.
* Track and control usage by API key.
* Throttle requests to prevent attacks.
* Connect to Cloudwatch to log all requests for monitoring 
* Maintain multiple versions of your API (test/beta)

### API Gateway Configuration

How Do I Configure API Gateway?
* Define an API (container)
* Define Resources and nested Resources (URL paths)
* For each Resource: 
    * Select supported HTTP methods (verbs)
    * Set security
    * Choose target (such as EC2, Lambda, DynamoDB, etc.)
    * Set request and response transformation

### API Gateway Deployments
How Do I Deploy API Gateway?
* Deploy API to a Stage:
    * Uses API Gateway domain, by default
    * Can use custom domain
    * Now supports AWS Certificate manager: free SSL/TLS certs

### API Gateway Caching

* You can enable API caching in Amazon API Gateway to cache your endpoint's response with caching you can reduce the number of calls made to your endpoint and also improve the latency of the requests to your API. 
* When you enable caching for a stage, API Gateway caches responses from your endpoint for a specified time-to-live (TTL) period, in seconds.
* API Gateway then responds to the requests by looking up the endpoint response from the cached instead of making a request to your endpoint.

### Same Origin Policy

In computing, the same-origin policy is an important concept in the web application security model. Under the policy, a web browser permits scripts container in a first web page to access data in a second web page, but only if both webpages have the same origin

This is done to prevent Cross-site Scripting (XSS) attacks.
    * Enforced by web browsers.
    * Ignored by tools like PostMan and curl

### CORS Explained 
CORS is one way the server at the other end (not the client code in the browser) can relax the same-origin policy.

Cross-origined resource sharing (CORS) is a mechanism that allows restricted resources (e.g. fonts) on a web page to be requested from another domain outside the domain from which the first resource was served.

### CORS in Action
* Browser makes an HTTP OPTIONS call for a URL (OPTIONS is an HTTP method like GET, PUT, and POST)
* Server returns a response that says:
"These other domains are approved to GET this URL."
* Error - "Origin policy cannot be read at the remote source?" You need to enable CORS on API Gateway.

### API Gateway Authorization
* We can use AWS IAM to control access Authorization for specific APIs on the console
* We can make sure only users with IAM Credentials can call the API
* This will lock it down to this AWS account and those who have credentials to this account.
* We rarely want this as we typically want this to be open, as we are more interested in opening up the API and only serving those who identify them selves

### API Gateway Authorizers
* We can create Custom Authorizers or Cognito User Pool Authorizer

### Understanding "Custom Authorizer"
* A customer authorizer users Lambda behind the scene, it calls a specific lambda function, pass some data to the function and that function runs code to validate and identify the user.
* The goal of  this function is to return an IAM Policy to us
* This policy helps us decide whether the user is allowed to invoke the API endpoint, (policy generated dynamically and will expire)
* This policy will grant and deny access
* Custom Authorizer also needs to return Id of user
* Custom Authorizer optionally needs Context object (custom object)
* Authorizer will also provide "Identity token" for the API gateway
    * `const token = event.authorizationToken`

* We can associate the authorization lambda function to the authorizer 
* We can also get the user id from the API Gateway custom authorizer (as a part of the request meta data, as a part of the Body Mapping Template)

### API Gateway Exam Tips
* Remember what API Gateway is at a high level (a door to your AWS environment)
* API Gateway has caching capabilities to increase performance
* API Gateway is low cost and scales automatically
* You can throttle API Gateway to prevent attacks.
* If you are using Javascript/AJAX that uses multiple domains with API Gateways, ensure that you have enabled CORS on API Gateway.