# AWS API client for AWS Price List Service

**Generated Dart library from API specification**

*About the service:*
Amazon Web Services Price List API is a centralized and convenient way to
programmatically query Amazon Web Services for services, products, and
pricing information. The Amazon Web Services Price List uses standardized
product attributes such as <code>Location</code>, <code>Storage
Class</code>, and <code>Operating System</code>, and provides prices at the
SKU level. You can use the Amazon Web Services Price List to build cost
control and scenario planning tools, reconcile billing data, forecast future
spend for budgeting purposes, and provide cost benefit analysis that compare
your internal workloads with Amazon Web Services.

Use <code>GetServices</code> without a service code to retrieve the service
codes for all AWS services, then <code>GetServices</code> with a service
code to retrieve the attribute names for that service. After you have the
service code and attribute names, you can use
<code>GetAttributeValues</code> to see what values are available for an
attribute. With the service code and an attribute name and value, you can
use <code>GetProducts</code> to find specific products that you're
interested in, such as an <code>AmazonEC2</code> instance, with a
<code>Provisioned IOPS</code> <code>volumeType</code>.

Service Endpoint

Amazon Web Services Price List service API provides the following two
endpoints:

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
