\# AWS Security Monitoring and Incident Response

\## Final Incident Response Summary



\### 1. Project Overview

This project demonstrates the implementation and evaluation of AWS security monitoring and incident response controls using AWS CloudTrail, Amazon GuardDuty, IAM Identity Center, and EC2 security groups.



The objective was to understand how cloud security analysts monitor AWS activity, identify potential threats, investigate findings, and document security assessments.



\### 2. Security Monitoring Implementation



\*\*AWS CloudTrail\*\*

\- Deployed a multi-region CloudTrail trail using Terraform.

\- Configured an S3 bucket for CloudTrail log storage.

\- Enabled management event logging.

\- Verified that CloudTrail logs were successfully delivered.



\*\*Amazon GuardDuty\*\*

\- Enabled GuardDuty in us-east-1.

\- Enabled CloudTrail, DNS logs, and VPC Flow Logs protection features.

\- Generated a synthetic sample finding.

\- Retrieved and examined the finding using the AWS CLI.



\### 3. Security Group Assessment

\- Inspected the default EC2 security group.

\- Reviewed inbound and outbound permissions.

\- Identified a self-referencing inbound rule.

\- Identified unrestricted outbound IPv4 traffic.

\- Confirmed that no unrestricted public inbound rule was present in the reviewed security group.

\- Documented findings without modifying security group rules.



\### 4. CloudTrail Investigation

\- Retrieved recent AWS management events.

\- Identified EC2 and GuardDuty API activity.

\- Examined a detailed DescribeSecurityGroups event.

\- Reviewed the event identity, timestamp, source IP, user agent, request parameters, and TLS version.

\- Determined that the inspected API operation was read-only.



\### 5. Identity and Access Security

\- Configured AWS IAM Identity Center.

\- Used an assumed administrative role to access AWS.

\- Enabled multi-factor authentication.

\- Successfully tested MFA during a new sign-in.

\- Verified AWS access following authentication.



\### 6. Incident Response Exercise



\*\*Scenario:\*\* GuardDuty generated a synthetic finding indicating that an EC2 instance had an unprotected port being probed.



\*\*Detection:\*\*

\- Used Amazon GuardDuty to retrieve the sample finding.

\- Identified the finding type as Recon:EC2/PortProbeUnprotectedPort.

\- Reviewed the finding's severity and affected resource information.



\*\*Investigation:\*\*

\- Examined the reported ports.

\- Reviewed the finding's details.

\- Confirmed that the finding was synthetic sample data.



\*\*Response Recommendations:\*\*

\- Review affected security group rules.

\- Restrict unnecessary inbound access.

\- Investigate relevant CloudTrail activity.

\- Continue monitoring GuardDuty findings.

\- Document investigation results and recommended corrective actions.



\*\*Outcome:\*\* The sample finding was successfully investigated and documented. No real EC2 instance was attacked by this synthetic exercise.



\### 7. Evidence Collected

\- CloudTrail configuration and log verification.

\- GuardDuty configuration.

\- GuardDuty sample finding.

\- Security group configuration review.

\- CloudTrail activity review.

\- Detailed CloudTrail event investigation.

\- MFA sign-in verification.

\- Incident investigation reports.



\### 8. Skills Demonstrated

\- AWS CloudTrail

\- Amazon GuardDuty

\- AWS IAM Identity Center

\- Multi-factor authentication (MFA)

\- Amazon EC2 security groups

\- Terraform infrastructure deployment

\- AWS CLI

\- Windows PowerShell

\- Cloud security monitoring

\- Security event investigation

\- Incident response documentation

\- Git and GitHub



\### 9. Final Conclusion

This project provided practical experience implementing AWS security monitoring tools and investigating cloud security events. It demonstrated how CloudTrail and GuardDuty support threat detection and investigation, while IAM Identity Center, MFA, and security group reviews contribute to cloud security. The project also strengthened skills in Terraform, AWS CLI, PowerShell, and technical documentation.

