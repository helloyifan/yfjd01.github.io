## EC2
* Control
* Stateful
* Lift and Shift

## Containers (ECS/Fargate/EKS)
* Control and Flexibility
* Stateful/Stateless
* Availiablity and Fault tolerance built in (conditionally)

## Lambda
* Simplicity
* Stateless
* Event Driven
* Never pay for idle
* Availability and fault tolerance built in

## Amazon EC2
* Our flagship compute service

## Overview of the Basics
* Basically cloud computing depends on virtualization (the concept of software that run ontop of hardware before the operating system allowing us to run multiple operating systems on the same hardware, each OS is oblivious of the other OS, in EC2 we only interact with the OS never the hardware

* Benefit is options of instance types (We will probably use the same type we currently use)

* Disadvantages monitoring usage and scaling as how we do it today
* Scale up/down as resources are needed as how we do it today

## EC2 Containter Service (ECS)
Virtualization at the host level: Taking the abstraction up one level where we have multiple running Application on the same OS (rather then multiple OS running on same metal)

Conatiner Advantage
Virtualization at the OS level:

* Portable: Small execution environments are portable, easily to move from host to host
* Flexible: Small and easier to change then the whole operating system
* Fast and Efficient: Much more efficient to roll out then VMs, containierized workloads would only take seconds to come up vs the minutes it takes for a VM.

## Amazon ECS
* Is a highly scalabe, high-performance container orchestration service.
* Easily run and scale containerized applications to AWS
* Launch tens of thousands of Docker containers in seconds with simple API calls

## Amazon EKS
* Highly available and scalable Kubernetes service.
* Fully managed; no need to install/operate your own K8s clusters.
* Automated version upgrades and patching for the master nodes

Run Kubernetes on AWS without needing to install and operate your own Kubernetes clusters
* Provision on EKS cluster
* Deploy worker nodes
* Connect to EKS
* Run Kubernetes apps

## AWS Fargate
It manages your containerization clusters for us
* Run containers without provisiong, configuring, or scaling clusters of VMs
* Supports all of the common container use cases
* Manages your hardware for you
* Simply specify:
* CPU and memory requirements
* Networking and IAM policies

* Supports ECS coming for EKS soon

## Run containers without having to manage servers or clusters
* Build a container images
* Choose orchestrators (choose a container orchestration solution)
* Define application (define your containzerized application requirements)
* Memory, CPU, network bandwidth
* Launch containers (AWS Fargate launches your containers)
* Run containers on AWS

## Serverless (Lambda)
Abstracting away the whole infrastructure the code is running on

#### Lambda is event based

Anatomy of Lambda Functions

Handler Function
* Method in your code wehre AWS Lambda begins execution
* Invoked everytime our lambda is invoked

Event Object
* Pre-defined object fomat for AWS integrations and events
* The event thas happened that invoked the Lambda

Context Object
* Method and properties like getRemainingTimeInMillis()
* Information about the lambda function

About Lambda:
Simple Resources Model:
Up to 3GBS of Ram for invocation
* CPU and network allocated proportionately

Flexible use
* Synchronous or asynchronous
* Integrated with other AWS service

Flexible authorization
* Securely grant access to resources and VPS
* Fine-grained control for invoking your functions

Monitoring and Logging
* Metrics for requests, errors and throttles
* Built-in logs to Cloudwatch logs
* Cloudtrain integration

Stateless
* Persost data using external storage
* No affinity or access to underlying infrastructure
* Cold start problem

Execution Time
* From code execution to return/termination (rounded to nearest 100ms)
* Default 3 seconds
* Maximum 5 minutes (but not a blocker if you can work around it with step functions and saving state in DDB)

Debugging & Error Handling
* DeadLetterQueue: Failed events sent to your SQS/SNS
* X-Ray Integration (AWS X-Ray gives visibility into latency for instrucuture, ie invocation time/ execution time/ api calls to dependencies/aws servies and see how long they are taking)

VPC Support
* Enables private communication with resoruces within VPC
* Use NAT Gateway for Internet Access

Environment Variables
* Exist outside of an invocation
* Key/Value pairs
* Encrypted with AWS Key Management System(KMS) key, decrypted at container init
* Managed through GUI/SDK

Versioning and Aliases
* Version: Immuated copies of code
* Alias: mutable pointer to version

Deployment
* Cloudformation (native aws deployment toools)
* Cloud pipeline, code build, code deploy

Concurrency
* Concurrency = RPS * function duration
* Instead if we are talking about streaming data its the # of Shards for streams
* Default is 1000 for account
* You can setLimit on concurrency


Our use case is event based data

Lambda Real-Time Event sources

Async Push Model Example
* Amazon S3
* Amazon SNS

Sync Push Model Example
* AWS IOT
* Amazon Alexa

How Sync/Async event sources works
* Mapping owned by Event Source,
* Invokes Lambda via Event Source API Resources-based policy permissions Concurrent executions

Stream Pull Model Example (Streaming Data)
* Amazon DynamoDB
* Amazon Kinesis

How Stream Pull model event sources
* Lambda polls the stream
* Lambda functions invokes when a new records founds in the stream

## Review: Components of serverless architectures to use with Lambda

Streaming Data to invoke lambda
* DynamoDB streams and Kinesis

Data Persistence
* Amazon DynamoDB, S3 and ElasticSearch!

APIs (exposing and managing api security)
*  API Gateway

Popular Event Sources
* Amazon CloudWatch
* Amazon S3
* AWS Config
* Amazon SNS

Integration Points (Lambda can reach out to other services, and interact with other services)
* Amazon VPC resources
* AWS Service VPI (wirite to kinese, upload to s3)
* Third-party services

Smart Resrouce Allocation
* https://github.com/alexcasalboni/aws-lambda-power-tuning

Questions: Can you use normal lambda triggered by CloudFrontDistribution (instead of lambda at edge (probably because of performancce))

Which Compute Service to choose

Considerations

VMS
* Machines as the unit of scale
* Abstracts the hardware

Containers
* Application as the unit of scale
* Abstracts the OS

Serverless
* Function as the unit of scale
* Abstracts the langauge runtime

Choose Amazon EC2 for
* More control over provisioning, scaling, and managing server capacity
* Customizing the OS< and runtime environment
* Stateful Applications
* Larger disk or memory footprint
* Execution time > 5 minutes
* Lift and shift (Lift from existing implemntation to EC2) (Vingilot is a tool for migration)
* I want to configure machines, storage , networking and my OS

Choose Amazon ECS for
* Managed Docker containers
* Microservices based applications
* Long runtime applications (e.g run time > 5min), batch jobs
* Applications that require fine grained access control
* I want to run servers, configure applications and control scaling

Chooses AWS Lambda for
* Managed provisioning, scaling high-availabilit, utilization
* Event driven workloads
* Serverless data processing
* Execution < 5 minutes
* Cost optimization (dont pay for idel, but we dont really have idle lol)
* Run my code when its needed
