# AWS Security Monitoring and Incident Response

## Project Overview

This project demonstrates the implementation of AWS security monitoring and incident response capabilities using Terraform, AWS CLI, and the AWS Management Console.

The goal was to build practical experience monitoring AWS account activity, investigating security findings, reviewing network access controls, and documenting incident response procedures.

## Technologies Used

- Amazon Web Services (AWS)
- AWS CloudTrail
- Amazon GuardDuty
- AWS IAM Identity Center
- Amazon EC2 Security Groups
- Amazon S3
- Terraform
- AWS CLI
- Windows PowerShell
- Git and GitHub

## Project Objectives

- Deploy AWS security monitoring infrastructure using Terraform.
- Configure CloudTrail to record AWS management events.
- Store CloudTrail logs in an Amazon S3 bucket.
- Enable Amazon GuardDuty and review its security findings.
- Inspect EC2 security group inbound and outbound rules.
- Investigate AWS activity using CloudTrail Event History.
- Configure and verify multi-factor authentication through IAM Identity Center.
- Document security findings and incident response recommendations.

## Implementation

### 1. CloudTrail Configuration

- Created a multi-region CloudTrail trail using Terraform.
- Configured an S3 bucket for log storage.
- Enabled management event logging and log file validation.
- Verified that CloudTrail logs were delivered successfully.

  ## Terraform Infrastructure Deployment

Terraform was used to provision and manage the AWS security monitoring infrastructure. The following screenshots demonstrate the deployment and resources managed through Terraform.

<table>
  <tr>
    <td><img src="images/terraform-deployment1.png" width="400"></td>
    <td><img src="images/terraform-deployment2.png" width="400"></td>
  </tr>
</table>

### 2. GuardDuty Threat Detection

- Enabled GuardDuty in the **us-east-1** region.
- Enabled CloudTrail, DNS log, and VPC Flow Logs protection features.
- Generated a synthetic GuardDuty sample finding.
- Retrieved and analyzed the finding using AWS CLI.

### 3. Security Group Assessment

- Inspected the default EC2 security group.
- Reviewed inbound and outbound permissions.
- Identified a self-referencing inbound rule.
- Identified unrestricted outbound IPv4 traffic.
- Confirmed that no unrestricted public inbound rule was present in the reviewed security group.

### 4. CloudTrail Investigation

- Retrieved recent AWS management events.
- Identified EC2 and GuardDuty API activity.
- Examined a detailed **DescribeSecurityGroups** event.
- Reviewed the event identity, timestamp, source IP, user agent, request parameters, and TLS information.
- Confirmed that the inspected operation was read-only.

### 5. Identity and Access Security

- Configured AWS IAM Identity Center.
- Used an assumed role to access AWS.
- Enabled multi-factor authentication (MFA).
- Tested a new sign-in and confirmed that an MFA challenge was presented.

<table>
  <tr>
    <td align="center" width="50%">
      <strong>Before: MFA Not Required</strong>
      <br><br>
      <img src="images/MFA1_before.png" width="350">
    </td>
    <td align="center" width="50%">
      <strong>After: MFA Enabled</strong>
      <br><br>
      <img src="images/MFA2_after.png" width="350">
    </td>
  </tr>
</table>

### 6. Incident Response Exercise

**Scenario:** GuardDuty generated a synthetic finding indicating that an EC2 instance had an unprotected port being probed.

**Investigation activities:**
- Retrieved the GuardDuty finding.
- Reviewed its severity, finding type, and resource information.
- Examined the reported ports.
- Confirmed that the finding was synthetic sample data.

**Recommended response actions:**
- Review affected security group rules.
- Restrict unnecessary inbound access.
- Investigate related CloudTrail activity.
- Continue monitoring GuardDuty findings.
- Document investigation results and recommended corrective actions.

**Outcome:** Successfully investigated and documented a simulated security finding without attacking or modifying a real EC2 instance.

## Repository Structure

```text
aws-security-lab/
├── terraform/
│   ├── main.tf
│   ├── versions.tf
│   ├── outputs.tf
│   ├── variables.tf
│   └── .terraform.lock.hcl
├── evidence/
├── incident-reports/
├── .gitignore
└── README.md
```

Evidence and Terraform state files should remain private unless reviewed and sanitized for publication.

## Skills Demonstrated

- AWS security monitoring
- CloudTrail log analysis
- GuardDuty threat detection
- IAM Identity Center and MFA
- EC2 security group analysis
- Terraform infrastructure as code
- AWS CLI
- Windows PowerShell
- Cloud security investigation
- Incident response documentation
- Git and GitHub

## Project Outcome

This project provided hands-on experience configuring AWS security monitoring services, investigating cloud activity, reviewing access controls, and documenting incident response procedures. It strengthened practical skills in AWS, Terraform, PowerShell, and cloud security operations.

