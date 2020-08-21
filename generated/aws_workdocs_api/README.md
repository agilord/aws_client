# AWS API client for Amazon WorkDocs

**Warning: This is a generated library, some operations may not work.**

*About the service:*
The WorkDocs API is designed for the following use cases:

<ul>
<li>
File Migration: File migration applications are supported for users who want
to migrate their files from an on-premises or off-premises file system or
service. Users can insert files into a user directory structure, as well as
allow for basic metadata changes, such as modifications to the permissions
of files.
</li>
<li>
Security: Support security applications are supported for users who have
additional security needs, such as antivirus or data loss prevention. The
API actions, along with AWS CloudTrail, allow these applications to detect
when changes occur in Amazon WorkDocs. Then, the application can take the
necessary actions and replace the target file. If the target file violates
the policy, the application can also choose to email the user.
</li>
<li>
eDiscovery/Analytics: General administrative applications are supported,
such as eDiscovery and analytics. These applications can choose to mimic or
record the actions in an Amazon WorkDocs site, along with AWS CloudTrail, to
replicate data for eDiscovery, backup, or analytical applications.
</li>
</ul>
All Amazon WorkDocs API actions are Amazon authenticated and
certificate-signed. They not only require the use of the AWS SDK, but also
allow for the exclusive use of IAM users and roles to help facilitate
access, trust, and permission policies. By creating a role and allowing an
IAM user to access the Amazon WorkDocs site, the IAM user gains full
administrative visibility into the entire Amazon WorkDocs site (or as set in
the IAM policy). This includes, but is not limited to, the ability to modify
file permissions and upload any file to any user. This allows developers to
perform the three use cases above, as well as give users the ability to
grant access on a selective basis using the IAM model.

## Links

- [Other AWS libraries](https://github.com/agilord/aws_client/tree/master/generated).
- [Issue tracker](https://github.com/agilord/aws_client/issues).
- [AWS API definitions](https://github.com/aws/aws-sdk-js/tree/master/apis).

## Contributors

- [Jonathan Böcker](https://github.com/Schwusch)
- [Istvan Soós](https://github.com/isoos)

