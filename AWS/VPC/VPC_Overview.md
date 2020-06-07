## vpc

### What is a VPC?

`Think of a VPC as a virtual data centre in the cloud.`

* Amazon Virtual Private Cloud (Amazon VPC) lets you provision a logically isolated section of the Amazon Web Services (AWS) Cloud where you can launch AWS resources in a virtual network that you define. 
* You have complete control over your virtual networking environment, including section of your own IP address range, **creation of subsets**, and configuration of route tables and network gateways.
* You can easily customize the network configuration for your Amazon Virtual Private Cloud. 
* For example, you can create a public facing subnet of your webservers that has access to the Internet, and place your backend systems such as databases or application servers in a **private-facing subnet** with no internet access.
* You can leverage multiple layers of security, including security groups and network access control lists, to help you control access to Amazon EC2 instances in each subnet.

`Doing this allows our webservers to be exposed to the internet, but sensitive application and database servers are not exposed to the internet`

* Additionall,y you can create a Hardware Virtual Private Network (VPN) connection between your corporate datacenter and your VPC and leverage the AWS cloud as an extension of your corporate datacenter.

##  VPC Diagram

### Internet Gateway (IGW)/Virtual Private Gateways  
* Provides access to VPC from internet (region us-east-1)
* Two ways of connection to router
* provides access to VPC
* You can only have on internet gateway per VPC

### Router
* directs (and distributes) traffic to route table 

### Route Table
* directs traffic to network ACL 

###  Network Access Contol Llist (Network ACL)
* A network access control list (ACL) is an optional layer of security for your VPC that acts as a firewall for controlling traffic in and out of one or more subnets. 
* You might set up network ACLs with rules similar to your security groups in order to add an additional layer of security to your VPC.
* First line of defence for EC2 instances
* stateless
* has allow rules and deny rules

### Security Group (SG)
* Second line of defense for EC2 instances
* stateful

### Subnet (SN)
A subnet, or subnetwork, is a segmented piece of a larger network. ore specifically, subnets are logical partition of an IP network logical partition of an **IP network into multiple, smaller network segemments** (IPv4 CIDR block)

* Ie this group of IP addresses are for this subnet
https://searchnetworking.techtarget.com/definition/subnet

* **Public subnet**: internet is accessable for any EC2 instance.
* **Private subnet**: EC2 instances cannot access the internet on their own. (weird nickname: Bastion Host)
* Inorder to connect to Private subnet, you need to go through public and ssh to private.
* Private and Public subnets have different IP ranges. (https://cidr.xyz/)

* we can use this to see how many IP addresses we can have in our subnet
* used to "calculate subnets"
* we can only have one subnet per availability zone

`A routing table is a set of rules, often viewed in table format, that is used to determine where data packets traveling oven an IP network will be directed. All IP-enabled devices, including routers and switches, use routing tables`

`A route table contains a set of rules, called routes, that are used to determine where network traffic from your subnet is directed.`

`A network access control list (ACL) is an optional layer of security for your VPC that acts as a firewall for controlling traffic in and out of one or more of your subnets.`


### What can we do with a VPC
* Launch instances into a subnet of your choosing
* Assign custom IP address ranges in each subnet
* Configure route tables between subnets
* Create internet gateways and attach it to our VPC
* Much better security control over your AWS resources
* Instance security groups
* Subnet network Access Contol Lists (ACLS)


### Default VPC vs Custom VPC

Default VPCs have:
* Default VPC is user friendly, allowing you to immediately deploy instances.
* All Subnets in default VPC have a route out to the internet
* Each EC2 instances has both a  public and private IP addresss


### VPC Features

VPC Peering
* Allows you to connect one VPC with another via direct network route using private IP addresses.
* Instances behave as if they were on the same private network
* You can peer VPC's with other WS accounts as well as with other VPCs in the same account.
* Peering is in a star configuration: ie 1 central VPC peers with 4 others. (No Transitive Peering, You can't peer from A to B to C, you have to Peer from A to C, you must set up a peering relationship between A to C)
* You can peer across regions as well

### Exam Tips

* Think of a VPC as a logical datacenter in AWS.
* Consists of IGWs (or Virtual Private Gateways), Route Tables, Network Access Control Lists (ACLs), Subnets, and Security Groups
* `1 Subnet = 1 Availability Zone`
    * ex 10.0.1.0 us-east-1
    * ex 10.0.2.0 us-east-2
    * `you cannot have a subnet stretch  over multiple avaiblity zones`
    * `however you can have multiple subets in on avaibility zone` 
* Security Groups are Stateful; Network Access Control Lists (ACLs) are Stateless
  *  With ACLs contollers you can add deny rules and allow rules, if you open a port on inbound, you also have to open on outbound
* NO TRANSITIVE PEERING
  * (No Transitive Peering, You can't peer from A to B to C, you have to Peer from A to C, you must set up a peering relationship between A to C)