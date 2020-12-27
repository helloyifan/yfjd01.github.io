## S3 - The Basics

By default, all newly created buckets are **PRIVATE**. You can setup access control to your buckets using;
* Bucket Policies (bucket level)
* Access Control Lists (individual object level)

S3 buckets can be configured to create access logs which log all requests made to the S3 bucket. This can be sent to another bucket and even another bucket in another account.


## Encryption In Transit achieved by

There are two types of encryption

Encryption in Transit is achieved by
* Whenever you go on a website in **HTTPS**, it will be encrypted in Transit. Encrypted between your computer and server 
    * SSL/TLS

Encryption at Rest
* Encryption At Rest (Server Side) is achieved by
    * S3 Managed Keys - SSE-S3 (Server Side Encryption S3)
    * AWS Key Management Service, Managed Keys - SSE - KMS
    * Service Side Encryption With Customer Provided Keys - SSE - C
    
Client Side Encryption