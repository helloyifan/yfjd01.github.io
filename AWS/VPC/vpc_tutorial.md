

1. When you create a new VPC
* It creates new route table, network acl and security group, but not internet gateway or subnets

*** Basically now we have what we see in screenshot1 ***

2. When we create a subnet manually 
* Name: 10.0.1.0 - us-east-2a
    * the CIDR segment we gave is 10.0.1.0/24 (which should give 256 unique address but AWS takes some)
    * use this AZ us-east-2a
* Name: 10.0.2.0 - us-east-2b
    * the CIDR segment we gave is 10.0.1.0/24 
    * use this AZ us-east-2b

3. we made 10.0.1.0 - us-east-2a pubically accessible
* we can now launh EC2 instances into it with pubically accessible IP addresses, so we enable the aut assign IP address setting of this subnet

4. We create internet gateway and attach to our VPC

5. Create our route Table MyPublicNet
* So we can configure our main route so we have aroute to the internet (from our VPC)
* By default our subnet has an association with the main route table, so if we were to add public internet access to our main route table, then our subnets would have that access aswell, however thats bad security
    * best practice is to keep mainroute table as private and then have a seperate route table for our pubic subnets
* We create MyPublicNet

5. Edit our MyPublicNet route table routes to be able to connect to public internet 
*  Create a new route for IPV4
    * set desintation as 0.0.0.0/0 and target to be the internet gateway we just created 
* Create a new route for IPV6
    *set desintation as ::/0 and target to be the internet gateway we just created 
* So now any subnets associates with this route tables will automatically become public for both IPv4 and IPv6

6. Associate Subnet to Route table
*  10.0.1.0 - us-east-2a (this subnet to be exact)

*** So now we have a pubic subnet ( 10.0.1.0 - us-east-2a) and a private subnet ( 10.0.2.0 - us-east-2b) ***

*** Basically now we have what we see in screenshot2 ***

Now lets launch two instances in our VPCs

7. Spin up Public EC2 instance
* for network we choose our newly made vpc,
* we use our newly made subnet of 10.0.1.0 - us-east-2a
* and we leave on auto assigned public ip (we use subnet settings which is public)
* set a tag (not sure why)
* configure a security group (WebDMZ)
    * give that SSH access (:20) and HTTP access (:80)

8. Spin up Private EC2 instance
* Same as above but since we are using the 10.0.2.0 - us-east-2b subnet, it will not have a public ip
* We used the default security group instead of the WebDMZ

*** Basically now we have what we see in screenshot3 ***

9. So now we can actually ssh onto our public instance
* Modify the key pem file we downloaded when we created our security group, run `chmod 400 key.pem` on it and now we can ssh onto our host `ssh ec2-user@xx.xxx.xxx.xxx -i key.pem`
* And right now we can only connect into our public EC2 instance because we have a public ip address

Review 1-9:
* When you create a VPC a default Route Table, Network Access Control List (NACL) and a default Security Group is created
* It won't create any subnets, not will it create a default internet gateway.
* and off topic, but us-east-1A in your AWS account can be a completely different az then us-east-1qa in another AWS account, the AZ's are randomized 
* Amazon always reserve 5 IP address within your subnet
* You cn only have 1 Internet Gateway per VPC
* Security Groups can't span VPCs.

*** Now we will work on connecting our EC2 instance in our public subnet to our EC2 instance in our private subnet ***