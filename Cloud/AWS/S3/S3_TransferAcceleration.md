# S3 Transfer Acceleration

S3 Transfer Acceleration utilities the **CloudFront Edge Network** to accelerate your uploads to S3.

Instead of uploading directly to your S3 bucket, you can use a distinct URL to upload directly to an edge location which will then transfer that file to S3. You will get a distinct url to upload to.

Example
* Your bucket is in DUB, but you are in SEA, instead of uploading to eu-west-2 you can instead upload to us-west-2 edge location and it will do the work to get it into the DUB bucket. 