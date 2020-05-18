## S3 Cross Region Replication

## Details: 
* Requires versioning enabled  before you can do Cross Region Replication
* Can choose to replicate entire buckets, or by prefix and tags

## Exam Tips
* Versioning must be enabaled on both teh source and destination buckets.
* Regions must be unique
* Files in an existing bucket are not replicated automatically
* All subsequent updated files will be replicated automatically.
* Delete markets are not replicated
* Deleting individual versions or delete markets will not be replicated