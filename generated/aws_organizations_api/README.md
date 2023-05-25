# AWS API client for AWS Organizations

**Generated Dart library from API specification**

*About the service:*
Organizations is a web service that enables you to consolidate your multiple
Amazon Web Services accounts into an <i>organization</i> and centrally
manage your accounts and their resources.

This guide provides descriptions of the Organizations operations. For more
information about using this service, see the <a
href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html">Organizations
User Guide</a>.

<b>Support and feedback for Organizations</b>

We welcome your feedback. Send your comments to <a
href="mailto:feedback-awsorganizations@amazon.com">feedback-awsorganizations@amazon.com</a>
or post your feedback and questions in the <a
href="https://forums.aws.amazon.com/forum.jspa?forumID=219">Organizations
support forum</a>. For more information about the Amazon Web Services
support forums, see <a href="https://forums.aws.amazon.com/help.jspa">Forums
Help</a>.

<b>Endpoint to call When using the CLI or the Amazon Web Services SDK</b>

For the current release of Organizations, specify the <code>us-east-1</code>
region for all Amazon Web Services API and CLI calls made from the
commercial Amazon Web Services Regions outside of China. If calling from one
of the Amazon Web Services Regions in China, then specify
<code>cn-northwest-1</code>. You can do this in the CLI by using these
parameters and commands:

<ul>
<li>
Use the following parameter with each command to specify both the endpoint
and its region:

<code>--endpoint-url https://organizations.us-east-1.amazonaws.com</code>
<i>(from commercial Amazon Web Services Regions outside of China)</i>

or

<code>--endpoint-url
https://organizations.cn-northwest-1.amazonaws.com.cn</code> <i>(from Amazon
Web Services Regions in China)</i>
</li>
<li>
Use the default endpoint, but configure your default region with this
command:

<code>aws configure set default.region us-east-1</code> <i>(from commercial
Amazon Web Services Regions outside of China)</i>

or

<code>aws configure set default.region cn-northwest-1</code> <i>(from Amazon
Web Services Regions in China)</i>
</li>
<li>
Use the following parameter with each command to specify the endpoint:

<code>--region us-east-1</code> <i>(from commercial Amazon Web Services
Regions outside of China)</i>

or

<code>--region cn-northwest-1</code> <i>(from Amazon Web Services Regions in
China)</i>
</li>
</ul>
<b>Recording API Requests</b>

Organizations supports CloudTrail, a service that records Amazon Web
Services API calls for your Amazon Web Services account and delivers log
files to an Amazon S3 bucket. By using information collected by CloudTrail,
you can determine which requests the Organizations service received, who
made the request and when, and so on. For more about Organizations and its
support for CloudTrail, see <a
href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_incident-response.html#orgs_cloudtrail-integration">Logging
Organizations Events with CloudTrail</a> in the <i>Organizations User
Guide</i>. To learn more about CloudTrail, including how to turn it on and
find your log files, see the <a
href="https://docs.aws.amazon.com/awscloudtrail/latest/userguide/what_is_cloud_trail_top_level.html">CloudTrail
User Guide</a>.

## Links

- [Other AWS libraries](https://github.com/agilord/aws_client/tree/master/generated).
- [Issue tracker](https://github.com/agilord/aws_client/issues).
- [AWS API definitions](https://github.com/aws/aws-sdk-js/tree/master/apis).
