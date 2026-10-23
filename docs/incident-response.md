

\# Incident Response Procedure



\## Scenario



A test AWS credential is suspected of being compromised.



\## 1. Identification



\- What event or finding triggered the investigation?

\- When did the event occur?

\- Which identity or resource was involved?

\- What evidence supports the alert?



\## 2. Investigation



\- Review relevant CloudTrail events.

\- Identify the principal and API actions.

\- Examine the event source, time, and outcome.

\- Determine the potential scope of exposure.



\## 3. Containment



\- Use only a designated test identity.

\- Disable or revoke the test credential if appropriate.

\- Restrict unnecessary permissions.

\- Preserve relevant evidence.



\## 4. Recovery



\- Rotate affected test credentials securely.

\- Restore only approved permissions.

\- Verify the test environment is secure.

\- Confirm that expected operations work.



\## 5. Lessons Learned



\- What was detected?

\- What was the impact in the simulation?

\- Which controls worked?

\- What should be improved?



\## Evidence



Link sanitized evidence and the corresponding report.



\## Status



Not yet executed. Complete this report after conducting the

controlled incident-response exercise.



