
## DNS 101

### Route 53 - Amazons DNS service

History: Route 53 (Route 66 is the first roud across america, DNS is on port 53)

What is a DNS?
* its a phone book basically, (look up name, get phone number)
* DNS is used to convert human friendly domain names into an internet protocoal (IP) address (IPV4 or IPV6)

IPv4 vs IPv6
* The IPv4 space is a 32 bit field and has over 4 billion addresses
* IPv6 was created to solve this depletion issue and has an address space of 128 bits 

### Top Level Domains
* If we look at common domain name such as google.com, bbc.co.uk. you will notice a string of characters separated by periods.
* The last word in a domain represents the "top level domain".
* The second word in a domain name is known as a second level domain name (this is optional though and depends on the domain name)

Example
* .com
* .edu
* .gov
* .co.uk (uk is top level, co is second level)
* .gov.uk
* .com.au

These top level domain names are controlled by Internet Assigned Numbers Authority (IANA) in a root zone database which is essentially a database of all available top level domainds
* You can visit this database by visiting http://iana.org/domains/root/db 

###  Domain Registrars
* Since all of the names in a given domain name have to be unique there needs to be a way to organize all this to avoid duplication.
* This is where domaind registrars come in.
* A registrar is an authority that can assign domain names directly under one or more top level domains.
* These domains are registeed with InterNIC, a service of ICANN, which enforces uniquesness of domain names across the internet.
* each domain name becomes registed in a central database known as the WholS database

Sample domain Registrars (where you go and buy domain name)
* Amazon (new one actually)
* GoDaddy.com
* 123-reg.co.uk

### Start of Authority Records (SOA)

The SOA records store information about
* The name of the server that supplied the data for the zone
* The administrator of the zone
* The current version of the data file 
* The default number of seoncds for the time-to-live file on resoruce records

### NS Records

NS stands for Name Service Records
* They are used by Top Level Domain servers to direct traffic to the Content DNS service which continas the authoritative DNS records.

Sample Flow of Execution
* Browser goes TDL
* TDL has the NS, return NS records
* Then we go to the NS records, returns SOA
* SOA will have all the DNS records,

### Whats an "A" records
* An "A" records is the fundamental type of DNS record.
* The "A" is A records stands for Address.
* The "A" records is used by a computer to translate the name of the domain to an IP address
* Example http://www.acloud.guru might point to http://123.10.10.80.

### TTL 
What's an TTL?
* The length that a DNS records is cached on either the Resolving Server or the users own local PC is equal to the value of the "Time to Live" (TTL) in seconds.
* The lower the time to live, the faster changes to DNS records take to propagate through the internet.
* Default TTS is 48 hours (If you make a dns change it could take 48 hours to propagate through the internet)

### CName

What's a CName?
A Canonical Name (CName) can be used to resolve one domain name to another. 
* For example, you may have a mobile website with the domain name http://m.acloud.guru that is used for when users browse to your domain on their mobile devices. You may also want the name http://mobile.acloud.guru to resolve to this same address
* So instead of having 2 IP addresses you can have one for both CNames. (Another reference that we can look up for the IPv4 Address)
* Examples 
  * Batman -> See West Adam
  * Adam West -> 123 1234 3456

### Alias Records

* **Alias** records are used to map resource records sets in your hosted zone to Elastic Load Balanced, CloudFront distributions, or S3 buckets that are configured as websites.

* **Alias** records work like a CNAME record in that you can map one DNS name (www.exaple.com) to another "target" DNS name (elb1234.elb.amazonaws.com)

* Key difference - A CName can't be used for named domain names (zone apex record.) You can't have a CNAME for http://acloud.guru, it must be either an "A" records on an **Alias**.


### Route53 Exam Tips 

* ELBs do not have pre-defined IPv4 addresses; you resolve to them using a DNS name
* Understand the difference between an **Alias** Records and a CNAME
* Given the choice, always choose an **Alias** Records over a CName


### Common DNS Types
* SOA Records
* NS Records
* A Records
* CName
* MX Records 
  * Used for mail
* PTR Records
  * Reverse of a A records, look up a name against a IP address