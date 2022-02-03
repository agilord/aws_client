# AWS API client for Amazon Detective

**Generated Dart library from API specification**

*About the service:*
Detective uses machine learning and purpose-built visualizations to help you
analyze and investigate security issues across your Amazon Web Services
(AWS) workloads. Detective automatically extracts time-based events such as
login attempts, API calls, and network traffic from AWS CloudTrail and
Amazon Virtual Private Cloud (Amazon VPC) flow logs. It also extracts
findings detected by Amazon GuardDuty.

The Detective API primarily supports the creation and management of behavior
graphs. A behavior graph contains the extracted data from a set of member
accounts, and is created and managed by a master account.

Every behavior graph is specific to a Region. You can only use the API to
manage graphs that belong to the Region that is associated with the
currently selected endpoint.

A Detective master account can use the Detective API to do the following:

<ul>
<li>
Enable and disable Detective. Enabling Detective creates a new behavior
graph.
</li>
<li>
View the list of member accounts in a behavior graph.
</li>
<li>
Add member accounts to a behavior graph.
</li>
<li>
Remove member accounts from a behavior graph.
</li>
</ul>
A member account can use the Detective API to do the following:

<ul>
<li>
View the list of behavior graphs that they are invited to.
</li>
<li>
Accept an invitation to contribute to a behavior graph.
</li>
<li>
Decline an invitation to contribute to a behavior graph.
</li>
<li>
Remove their account from a behavior graph.
</li>
</ul>
All API actions are logged as CloudTrail events. See <a
href="https://docs.aws.amazon.com/detective/latest/adminguide/logging-using-cloudtrail.html">Logging
Detective API Calls with CloudTrail</a>.

## Links

- [Other AWS libraries](https://github.com/agilord/aws_client/tree/master/generated).
- [Issue tracker](https://github.com/agilord/aws_client/issues).
- [AWS API definitions](https://github.com/aws/aws-sdk-js/tree/master/apis).
