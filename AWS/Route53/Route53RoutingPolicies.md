
### The Following Routing Policies Are Available With Route53:
* Simple Routing Policy
* Weighted Routing Policy
* Latency-based Routing Policy
* Failover Routing Policy
* Geolocation Routing Policy (Traffic Flow Only)
* Multivalue Answer Routing Policy


### Simple Routing Policy
* If you choose the simple routing policy you can only have one records with multiple IP addresses.
* If you specificy multiple values in a record, Route53 returns all values to the user in a random order

`Your browser will cache the IP that you got from DNS for the duration of the TTL, you can mitigate this by flushing your dns`
