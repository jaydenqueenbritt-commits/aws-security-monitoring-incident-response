\# Detailed CloudTrail Event Investigation



\## Objective

Analyze a CloudTrail management event to understand the identity, action, and request details associated with an AWS API call.



\## Event Information

\- Event Name: DescribeSecurityGroups

\- Event Source: ec2.amazonaws.com

\- Event Type: AwsApiCall

\- AWS Region: us-east-1

\- Read-Only Operation: Yes

\- Authentication Method: IAM Identity Center assumed-role session

\- User Agent: AWS CLI on Windows 11

\- TLS Version: TLS 1.3



\## Investigation Findings



\### Identity

The event was performed through an assumed IAM role associated with AWS IAM Identity Center.



\### Activity

The user performed a DescribeSecurityGroups operation to retrieve EC2 security group information.



\### Request Behavior

The event was read-only. No security group configuration changes were made.



\### Network Information

CloudTrail recorded the source IP address of the request. This information should remain private in public portfolio documentation.



\### Authentication Observation

The event recorded mfaAuthenticated as false. This field alone does not establish that MFA was bypassed. The IAM Identity Center MFA configuration should be reviewed separately.



\## Security Assessment

The event is consistent with the security group inspection performed during this lab. No unauthorized modification is indicated by this event.



\## Evidence

\- evidence/cloudtrail-activity-review.json

\- evidence/security-group-review.json



\## Conclusion

CloudTrail provided detailed information about the API operation, assumed-role identity, request source, and encryption protocol. This investigation demonstrated how analysts can use AWS audit logs to evaluate account activity and distinguish read-only operations from configuration changes.



\## IAM Identity Center MFA Assessment



\### Security Control

Multi-factor authentication (MFA) was enabled for the IAM Identity Center user.



\### Security Benefit

MFA adds an additional authentication requirement beyond a password, helping protect AWS access if account credentials are compromised.



\### CloudTrail Observation

An earlier CloudTrail event recorded mfaAuthenticated as false. This field was not treated as proof of MFA bypass. The MFA configuration was subsequently reviewed and MFA was enabled.



\### Conclusion

MFA was enabled as an additional security control to strengthen authentication for AWS administrative access.





\## MFA Sign-In Verification



\- MFA configuration: Enabled

\- Sign-in test: Successful

\- MFA challenge: Received during sign-in

\- AWS access after authentication: Successful



\### Assessment

MFA was successfully tested during a new IAM Identity Center sign-in. The user received an MFA challenge and successfully authenticated.



\### Result

MFA enforcement was verified through a successful sign-in test.

