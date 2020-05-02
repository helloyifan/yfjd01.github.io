## AWS - 10,000 Foot Overview 

### Compute
EC2, Lambda

### Storage
S3

### Databases
RDS, DDB, RedShift

### Network & Content Delivery
Route 53 (which is Amazon's DNS) Very important
VPC (like a virtual DataCenter) Very important
CDN

### Security, Identity, and Compliance
Identity Access Management Very Important

Thinks of AZ's as DataCenter or serveral that are closer together

#### Definition:

* Edge locations are endpoints for AWS which are used for caching content. Typically this consists of CloudFront, Amazon's Content Delivery System (CDN)
* There are many more Edge Locations than Regions. Currently there are over 150 Edge Locations 
* Edge regions are not locations is the key detail
* A region is a physical location in the world which conssits of two or more availability Zones (AZ's)
* An AZ is one or more discrete data centers, each with redundant power, networking and connectivity, housed in separate facilities
* Edge Locations are endpoints for AWS which are used for caching content. Typcally consists of CloudFront
