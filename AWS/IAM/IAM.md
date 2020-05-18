## IAM

### Identity Access Management (IAM) offers the following features;
* Centralized control of your AWS account
* Shared Access to your AWS account
* Granular Permissions
* Identity Federation (including Active Directory , Facebook, Linkedin etc)
* Multi factor Authentication
* Provide temporary access for users/devices and services where necessary
* Allows you to set up your own password rotation policy
* Integrates with many different AWS services
* Supports PCI DSS Compliance

### Key temporary

1. Users
  * end users such as people, employees of an organization
  * ex: `hulk.hugan`
  * has User, Access key ID, Secret access key, Password
2. Groups
  * A collection of users. Each user in the group will inherit permissions of the group
  * ex: `Developers`
3. Policies
  * Polices are made up of documents, called Policy documentations. These documents are in a format called JSON and they give permission to what a User/Group/Role is able to documents
  * There are AWS custom made policies, and you can make your own as well (its just JSON)
  * ex: `AdministratorAccess` or like `AmazonSQSReadAccessOnly`
4. Roles
  * You create roles and then assign them to AWS Resources
  * Let a machine write to S3
  * **TLDR: Roles are a way for onw AWS user to access another aws user**
  * IAM roles are a secure way to grant permissions to entities that you trust. Examples of entities include the following
    * IAM user in another account
    * Application code running on an EC2 instance that needs to perform actions on AWS resources
    * An AWS service that needs to act on resources in your account to provide its features
    * Users from a corporate directory who use identity federation with SAML (Security Assertion Markup Language)
  * ex : `S3_Admin_Access` which is all s3 access for EC2 instances
