## What is SQS?

Amazon SQS is a websetvice that gives you access to a message queue that can be used to store messages while waiting for a computer to process them.

Amazon SQS is a distributed queue system that enables web service applications to quickly and reliably queue messages that one component in the application generates to be consumed by another component. A queue is temporary repository for messages that are awaiting processing.

Using Amazon SQS, you can decouple the components of an application so they run indepdently, easing message management between components. Any component of a distributed application can store messages in a fail-safe queue.

Messages can contain up to 256KB of test in any format. Any component can later retrieve the messages programmatically using the Amazon SQS API.

The queue acts as a buffer between the components producing and saving data, and the component receiving the data for processing. This means the queue resolves issues that arise if the producer is producing work faster than the consumer can process it, or if the producer or consumer are only intermittently connected to the network.


## TLDR use case0
* Write to SQS, EC2 polls SQS messages

## Queue Types

There are two types of Queues
* Standard Queues (default)
* FIFO Queues

### Standard Queues
* Amazon SQS offers standard as the default queue type. A standard queue lets you have a nearly-unlimited number of transactions per second. 
* Standard queues guarantee that a message is delivered at least once.
* However, occasionally (because of the highly-distributed architecture that allows high throughput), more than one copy of a messsage might be delivered out of order.
* Standard queues provide best-effort ordering which ensures that messages are generally delivered in the same order they are sent.

### FIFO Queues
* THe FIFO queue complements the standard queue. The most important features of this queue types are FIFO (first-in-first-out) delivery and exactly once processing: The order in which messages are sent and received is strictly preserved and a message is delivered once and remains available until a consumer processess and deletes it; duplicates are not introducted into the queue.
* FIrst in first out, definitely ordered, definitely one time processing, duplicates are not introducted into the queu
* Good for order and sensitive to duplicates.
* FIFO queues also support message groups that allow multiple ordered message groups within a single queue. FIFO queues are limited to 300 transactions per seconds (TPS), but have all the capabilites of standard queues.


### SQS Exam TIPS

* SQS is pull based, not pushed based (EC2 is pulling from SQS)
    * SNS is push based
* Messages are 256KB in size
* Messages can be kept in the queue from 1 minute to 14 days; the default retention period is 4 days
* Visibility Time out is the amount of time that the message is invisible in the SQS queue after a reader picks up that message. Provided the job is processed before the visibility time out expires, the message will then be deleted from the queue. If the job is not processed within that time, the message will become visible again and another reader will process it. This could result in the same message being delivered twice.
* Visibility timeout maximum is 12 hours.
* **SQS guarantees that your messages will be processed at least once.**
* Amazon SQS long polling is a way to retrieve messages from your Amazon SQS queues. While the regular short polling returns immediately (even if the message queue being polled is empty), long polling doesn't return a response until a message arrives in the message queue, or the long poll times out. (Saves money to avoid polling and getting empty, this will do its best to get a message everytime)