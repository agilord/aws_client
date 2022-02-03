# AWS API client for AWS SecurityHub

**Generated Dart library from API specification**

*About the service:*
Security Hub provides you with a comprehensive view of the security state of
your AWS environment and resources. It also provides you with the readiness
status of your environment based on controls from supported security
standards. Security Hub collects security data from AWS accounts, services,
and integrated third-party products and helps you analyze security trends in
your environment to identify the highest priority security issues. For more
information about Security Hub, see the <i> <a
href="https://docs.aws.amazon.com/securityhub/latest/userguide/what-is-securityhub.html">AWS
Security Hub User Guide</a> </i>.

When you use operations in the Security Hub API, the requests are executed
only in the AWS Region that is currently active or in the specific AWS
Region that you specify in your request. Any configuration or settings
change that results from the operation is applied only to that Region. To
make the same change in other Regions, execute the same command for each
Region to apply the change to.

For example, if your Region is set to <code>us-west-2</code>, when you use
<code> <a>CreateMembers</a> </code> to add a member account to Security Hub,
the association of the member account with the master account is created
only in the <code>us-west-2</code> Region. Security Hub must be enabled for
the member account in the same Region that the invitation was sent from.

The following throttling limits apply to using Security Hub API operations.

<ul>
<li>
<code> <a>BatchEnableStandards</a> </code> - <code>RateLimit</code> of 1
request per second, <code>BurstLimit</code> of 1 request per second.
</li>
<li>
<code> <a>GetFindings</a> </code> - <code>RateLimit</code> of 3 requests per
second. <code>BurstLimit</code> of 6 requests per second.
</li>
<li>
<code> <a>UpdateFindings</a> </code> - <code>RateLimit</code> of 1 request
per second. <code>BurstLimit</code> of 5 requests per second.
</li>
<li>
<code> <a>UpdateStandardsControl</a> </code> - <code>RateLimit</code> of 1
request per second, <code>BurstLimit</code> of 5 requests per second.
</li>
<li>
All other operations - <code>RateLimit</code> of 10 requests per second.
<code>BurstLimit</code> of 30 requests per second.
</li>
</ul>

## Links

- [Other AWS libraries](https://github.com/agilord/aws_client/tree/master/generated).
- [Issue tracker](https://github.com/agilord/aws_client/issues).
- [AWS API definitions](https://github.com/aws/aws-sdk-js/tree/master/apis).
