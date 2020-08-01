## What is DynamoDB

* Amazon DynamoDB is a fast and flexible NoSQL database service for all applicatiosn that need consistent, single-digit millisecond latency at any scale. 
* It is a fully managed database and supports both document and key value data models
* Its flexible data model and reliable performance make it a great for for many web applications.

### The basics of DynamoDB are as follows

* Stored on SSD storage
* Spread across 3 grographically distincy data centres
* Eventual Consistent Reads (Default)
* Strong Consistent Reads 

### Eventual Consistent Reads
* Consistenct across all copies of data is usally reached within a second. Repeating  read after a short time should return the updated data (Best Read Performance)

### Strongly Consistent Reads 
* Before one second rule
* A strongly consistent read returns a result that reflects all writes that receivd a successful response prior to the read