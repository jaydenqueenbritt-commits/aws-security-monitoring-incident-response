\# CloudTrail Activity Investigation



\## Objective

Review AWS CloudTrail management events to identify and understand activity within the AWS account.



\## Investigation Details

\- AWS Region: us-east-1

\- Log source: AWS CloudTrail

\- Events reviewed: 10

\- Review method: AWS CLI lookup-events



\## Observed Activity



\### EC2 Security Group Activity

\- Event: DescribeSecurityGroups

\- Service: ec2.amazonaws.com

\- Identity: IAM Identity Center user

\- Assessment: Security group configurations were inspected.



\### GuardDuty Activity

\- Events: ListFindings and GetFindings

\- Service: guardduty.amazonaws.com

\- Identity: IAM Identity Center user

\- Assessment: GuardDuty findings were retrieved and reviewed.



\### Notification Activity

\- Event: ListManagedNotificationEvents

\- Service: notifications.amazonaws.com

\- Identity: Root

\- Assessment: Notification events were listed. This event alone does not establish suspicious root account activity.



\## Security Assessment

The reviewed events were consistent with the AWS security monitoring lab activities. No clearly malicious activity was identified in the displayed sample.



\## Evidence

\- evidence/cloudtrail-activity-review.json



\## Conclusion

CloudTrail successfully recorded management activity within the AWS account. Reviewing these events demonstrated how an analyst can identify the AWS service involved, the action performed, and the identity associated with an event.

