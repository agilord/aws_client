# AWS API client for AWS CodeStar connections

**Warning: This is a generated library, some operations may not work.**

*About the service:*
This AWS CodeStar Connections API Reference provides descriptions and usage
examples of the operations and data types for the AWS CodeStar Connections
API. You can use the Connections API to work with connections and
installations.

<i>Connections</i> are configurations that you use to connect AWS resources
to external code repositories. Each connection is a resource that can be
given to services such as CodePipeline to connect to a third-party
repository such as Bitbucket. For example, you can add the connection in
CodePipeline so that it triggers your pipeline when a code change is made to
your third-party code repository. Each connection is named and associated
with a unique ARN that is used to reference the connection.

When you create a connection, the console initiates a third-party connection
handshake. <i>Installations</i> are the apps that are used to conduct this
handshake. For example, the installation for the Bitbucket provider type is
the Bitbucket Cloud app. When you create a connection, you can choose an
existing installation or create one.

You can work with connections by calling:

<ul>
<li>
<a>CreateConnection</a>, which creates a uniquely named connection that can
be referenced by services such as CodePipeline.
</li>
<li>
<a>DeleteConnection</a>, which deletes the specified connection.
</li>
<li>
<a>GetConnection</a>, which returns information about the connection,
including the connection status.
</li>
<li>
<a>ListConnections</a>, which lists the connections associated with your
account.
</li>
</ul>
For information about how to use AWS CodeStar Connections, see the <a
href="https://docs.aws.amazon.com/codepipeline/latest/userguide/welcome.html">AWS
CodePipeline User Guide</a>.

## Links

- [Other AWS libraries](https://github.com/agilord/aws_client/tree/master/generated).
- [Issue tracker](https://github.com/agilord/aws_client/issues).
- [AWS API definitions](https://github.com/aws/aws-sdk-js/tree/master/apis).

## Contributors

- [Jonathan Böcker](https://github.com/Schwusch)
- [Istvan Soós](https://github.com/isoos)

