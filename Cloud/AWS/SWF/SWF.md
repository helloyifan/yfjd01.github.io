## What is SWF?
Amazon Simple Workflow Service (Amazon SWF) is a webservices that makes it easy to coordinate work across distributed application components. SWF enables applications for a range of use cases, including media processing, web application backends, business process workflows and analytics pipelines, to be designed as a coordination of tasks.

## Tasks 
Tasks represent invocations of various processing steps in an application which can be performed by executable code, web services calls, human actions, and scripts

* SWF is a way of coordinating both applications and with human beings (manual processing)
* Human element is involved
* SWF is a way of combining digital interations and human tasks
* Haha his example is in a warehouse.
* SWF has a human element to it as compared to a SQS. (Manual action needed) 
* Amazon SWF is task-oriented API whereas Amazon SQS offers a message-oriented API

## Exam Tips
SWF vs SQS
* SQS has a rentention period of up to 14 days; with SWF, workflow executions can last up to 1 year.
* Amazon SWF is task-oriented API whereas Amazon SQS offers a message-oriented API
* Amazon SWF ensures that a task is assigned only once and is never duplicated. With Amazon SQS, you need to handle duplicated message sand may also need to ensure that a messag eis processed only once.
* Amazon SWF keeps task of all the tasks and events in an application. With Amazon SQS, you need to implement your own application-level tracking, especially if your application uses multiple queues.

## SWF Actors
* Workflow Starters - An application that can initate (start ) a workflow. Could be your e-commerce website following the placement of an order or app searching for bus times
* Decides - Control the flow of activity tasks in a workflow execution. If something has finished (or failed) in a workflow, a Decider decides what to do next.
* Activity Workers- Carry out the activity tasks