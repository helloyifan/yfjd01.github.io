## How to actually use Route53 lol

1. Hosted zone

* When you purchase a domain with route53, by default a hosted zone is created for you
* Lets try to creat a test record set in this hosted zone (ie myfirstrecord.yourdomain.ca, and lets give it a value 11.22.33.44 (values are IPv4 addresses), it will be redireced to that IPv4 addresss)
* We can verify with `nslookup myfirstrecord.yourdomain.ca` or
`dig nslookup myfirstrecord.yourdomain.ca`