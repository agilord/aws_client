# AWS API client for AWS SSO OIDC

**Generated Dart library from API specification**

*About the service:*
AWS IAM Identity Center (successor to AWS Single Sign-On) OpenID Connect
(OIDC) is a web service that enables a client (such as AWS CLI or a native
application) to register with IAM Identity Center. The service also enables
the client to fetch the user’s access token upon successful authentication
and authorization with IAM Identity Center.
<note>
Although AWS Single Sign-On was renamed, the <code>sso</code> and
<code>identitystore</code> API namespaces will continue to retain their
original name for backward compatibility purposes. For more information, see
<a
href="https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html#renamed">IAM
Identity Center rename</a>.
</note>
<b>Considerations for Using This Guide</b>

Before you begin using this guide, we recommend that you first review the
following important information about how the IAM Identity Center OIDC
service works.

<ul>
<li>
The IAM Identity Center OIDC service currently implements only the portions
of the OAuth 2.0 Device Authorization Grant standard (<a
href="https://tools.ietf.org/html/rfc8628">https://tools.ietf.org/html/rfc8628</a>)
that are necessary to enable single sign-on authentication with the AWS CLI.
Support for other OIDC flows frequently needed for native applications, such
as Authorization Code Flow (+ PKCE), will be addressed in future releases.
</li>
<li>
The service emits only OIDC access tokens, such that obtaining a new token
(For example, token refresh) requires explicit user re-authentication.
</li>
<li>
The access tokens provided by this service grant access to all AWS account
entitlements assigned to an IAM Identity Center user, not just a particular
application.
</li>
<li>
The documentation in this guide does not describe the mechanism to convert
the access token into AWS Auth (“sigv4”) credentials for use with
IAM-protected AWS service endpoints. For more information, see <a
href="https://docs.aws.amazon.com/singlesignon/latest/PortalAPIReference/API_GetRoleCredentials.html">GetRoleCredentials</a>
in the <i>IAM Identity Center Portal API Reference Guide</i>.
</li>
</ul>
For general information about IAM Identity Center, see <a
href="https://docs.aws.amazon.com/singlesignon/latest/userguide/what-is.html">What
is IAM Identity Center?</a> in the <i>IAM Identity Center User Guide</i>.

## Links

- [Other AWS libraries](https://github.com/agilord/aws_client/tree/master/generated).
- [Issue tracker](https://github.com/agilord/aws_client/issues).
- [AWS API definitions](https://github.com/aws/aws-sdk-js/tree/master/apis).
