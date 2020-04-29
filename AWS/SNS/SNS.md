## What is SNS?

Amazon Simple Notification Service is a web service that makes it easy to set up, operate and send notifications from the cloud.

It provdiers developers with a highly scalable, flexible, and cost-effective capability to publish messages from an application and immediately deliver them to subscribers or other applications


### Push Notifications
* Push notifications to Apple, Goole, Fire OS and Windows devices, as well as Android devices in China with Baidu Cloud Push.

### SQS Integration
* Besides pushing cloud notifications directly to mobile delives, Amazon SNS can also deliver notifications my SMS text messages or email to Amazon Simple Queue Service (SQS) queues, or to any HTTP endpoint

### What is a Topic?

SNS allows you to group multiple recipient using topics. A topic is an **"access point"** for allowing recipient to dynamically subscribe for identical copies of the same notification.

One topic can support deliveries to multiple endpoint types - for example, you can group together iOS, Android and SMS recipients. 
When you publish once to a topic, **SNS delivers appropriately formatted copies of your message to each subscriber.**

### SNS Availability
To prevent messages from being lost, all messages published to Amazon SNS are stored redundantly across multiple availability zones.


### SNS Benefits
* Instantaneous, push-based delivery (no polling)
* Simple APIs and easy integration with applications
* Flexible message delivery over multiple transport protocols.
* Inexpensive, pay as you go model with no up gfront costs.
* Web-based AWS management console offers the simplicity of a point and-click interface.

### SNS vs SQS?

* Both "messaging" services in AWS
* SNS - Push (push via text messages or notifications etc)
* SQS - Polls (Pulls - EC2 Polling at SQS queues) 
* Thats literally it.
