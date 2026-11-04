# GuardDuty Sample Finding Investigation

## 1. Objective
Practice identifying and investigating a security finding using Amazon GuardDuty.

## 2. Alert Information
- Finding type: Recon:EC2/PortProbeUnprotectedPort
- Severity: Low (2.0)
- Finding ID: e1124a7c98ec44b9a21f6304a2fffa97
- Region: us-east-1
- Affected resource: Sample EC2 instance i-99999999
- Detection service: Amazon GuardDuty

## 3. Finding Description
GuardDuty generated an alert indicating that an EC2 instance had an unprotected port being probed by a known malicious host.

## 4. Ports Identified
- Port 80: HTTP
- Port 443: HTTPS
- Port 22: SSH
- Port 3306: MySQL

## 5. Investigation
Reviewed the finding details using the AWS GuardDuty console and AWS CLI. Identified the affected resource, probed ports, action type, severity, and threat intelligence details.

## 6. Recommended Response
- Review EC2 security group inbound rules.
- Restrict unnecessary public access.
- Limit SSH access to trusted IP addresses.
- Avoid exposing database ports such as MySQL (3306) publicly.
- Review network activity for suspicious connections.

## 7. Result
The sample finding was successfully generated and retrieved using AWS GuardDuty. The finding was identified as synthetic test data and did not represent an actual compromised EC2 instance.

## 8. Lessons Learned
This exercise demonstrated how GuardDuty identifies potential reconnaissance activity and how security analysts can investigate alerts and recommend network security improvements.
