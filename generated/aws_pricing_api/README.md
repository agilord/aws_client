# AWS API client for AWS Price List Service

**Warning: This is a generated library, some operations may not work.**

*About the service:*
AWS Price List Service API (AWS Price List Service) is a centralized and
convenient way to programmatically query Amazon Web Services for services,
products, and pricing information. The AWS Price List Service uses
standardized product attributes such as <code>Location</code>, <code>Storage
Class</code>, and <code>Operating System</code>, and provides prices at the
SKU level. You can use the AWS Price List Service to build cost control and
scenario planning tools, reconcile billing data, forecast future spend for
budgeting purposes, and provide cost benefit analysis that compare your
internal workloads with AWS.

Use <code>GetServices</code> without a service code to retrieve the service
codes for all AWS services, then <code>GetServices</code> with a service
code to retreive the attribute names for that service. After you have the
service code and attribute names, you can use
<code>GetAttributeValues</code> to see what values are available for an
attribute. With the service code and an attribute name and value, you can
use <code>GetProducts</code> to find specific products that you're
interested in, such as an <code>AmazonEC2</code> instance, with a
<code>Provisioned IOPS</code> <code>volumeType</code>.

Service Endpoint

AWS Price List Service API provides the following two endpoints:

<ul>
<li>
https://api.pricing.us-east-1.amazonaws.com
</li>
<li>
https://api.pricing.ap-south-1.amazonaws.com
</li>
</ul>

## Links

- [Other AWS libraries](https://github.com/agilord/aws_client/tree/master/generated).
- [Issue tracker](https://github.com/agilord/aws_client/issues).
- [AWS API definitions](https://github.com/aws/aws-sdk-js/tree/master/apis).

## Contributors

- [Jonathan Böcker](https://github.com/Schwusch)
- [Istvan Soós](https://github.com/isoos)

