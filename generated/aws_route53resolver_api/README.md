# AWS API client for Amazon Route 53 Resolver

**Warning: This is a generated library, some operations may not work.**

*About the service:*
Here's how you set up to query an Amazon Route 53 private hosted zone from
your network:
<ol>
<li>
Connect your network to a VPC using AWS Direct Connect or a VPN.
</li>
<li>
Run the following AWS CLI command to create a Resolver endpoint:

<code>create-resolver-endpoint --name [endpoint_name] --direction INBOUND
--creator-request-id [unique_string] --security-group-ids
[security_group_with_inbound_rules] --ip-addresses SubnetId=[subnet_id]
SubnetId=[subnet_id_in_different_AZ]</code>

Note the resolver endpoint ID that appears in the response. You'll use it in
step 3.
</li>
<li>
Get the IP addresses for the Resolver endpoints:

<code>get-resolver-endpoint --resolver-endpoint-id
[resolver_endpoint_id]</code>
</li>
<li>
In your network configuration, define the IP addresses that you got in step
3 as DNS servers.

You can now query instance names in your VPCs and the names of records in
your private hosted zone.
</li> </ol>
You can also perform the following operations using the AWS CLI:

<ul>
<li>
<code>list-resolver-endpoints</code>: List all endpoints. The syntax
includes options for pagination and filtering.
</li>
<li>
<code>update-resolver-endpoints</code>: Add IP addresses to an endpoint or
remove IP addresses from an endpoint.
</li>
</ul>
To delete an endpoint, use the following AWS CLI command:

<code>delete-resolver-endpoint --resolver-endpoint-id
[resolver_endpoint_id]</code>

## Links

- [Other AWS libraries](https://github.com/agilord/aws_client/tree/master/generated).
- [Issue tracker](https://github.com/agilord/aws_client/issues).
- [AWS API definitions](https://github.com/aws/aws-sdk-js/tree/master/apis).

## Contributors

- [Jonathan Böcker](https://github.com/Schwusch)
- [Istvan Soós](https://github.com/isoos)

