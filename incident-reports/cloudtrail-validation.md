\# CloudTrail Validation Report



\## Objective

Validate that AWS CloudTrail is recording management events and delivering

audit logs to the protected S3 logging bucket.



\## Environment

\- AWS Region: us-east-1

\- Additional monitored Region: us-east-2

\- Deployment method: Terraform

\- Logging service: AWS CloudTrail

\- Storage service: Amazon S3



\## Validation Results



\### 1. Multi-Region Trail

Verified that the CloudTrail trail was configured to capture activity

across multiple AWS regions.



\### 2. Management Events

Verified that CloudTrail management events were being recorded.



\### 3. S3 Log Delivery

Confirmed that compressed CloudTrail log files were delivered to the

designated S3 logging bucket.



\### 4. Log Integrity

Verified the presence of CloudTrail digest files in the S3 bucket.



\### 5. Regional Log Verification

Confirmed that log files included activity from:

\- us-east-1

\- us-east-2



\## Conclusion



The CloudTrail deployment was successfully validated. Management events

were recorded, compressed log files were delivered to the protected S3

bucket, and digest files were present. Logs from both us-east-1 and

us-east-2 were verified, demonstrating successful multi-region logging.



\## Security Significance



Centralized CloudTrail logging provides an audit trail for AWS account

activity. These logs support security monitoring, incident investigation,

and auditing.

