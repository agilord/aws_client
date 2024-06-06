# AWS API client for AWS Price List Service

**Generated Dart library from API specification**

*About the service:*
The Amazon Web Services Price List API is a centralized and convenient way
to programmatically query Amazon Web Services for services, products, and
pricing information. The Amazon Web Services Price List uses standardized
product attributes such as <code>Location</code>, <code>Storage
Class</code>, and <code>Operating System</code>, and provides prices at the
SKU level. You can use the Amazon Web Services Price List to do the
following:

<ul>
<li>
Build cost control and scenario planning tools
</li>
<li>
Reconcile billing data
</li>
<li>
Forecast future spend for budgeting purposes
</li>
<li>
Provide cost benefit analysis that compare your internal workloads with
Amazon Web Services
</li>
</ul>
Use <code>GetServices</code> without a service code to retrieve the service
codes for all Amazon Web Services, then <code>GetServices</code> with a
service code to retrieve the attribute names for that service. After you
have the service code and attribute names, you can use
<code>GetAttributeValues</code> to see what values are available for an
attribute. With the service code and an attribute name and value, you can
use <code>GetProducts</code> to find specific products that you're
interested in, such as an <code>AmazonEC2</code> instance, with a
<code>Provisioned IOPS</code> <code>volumeType</code>.

For more information, see <a
href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/price-changes.html">Using
the Amazon Web Services Price List API</a> in the <i>Billing User Guide</i>.

## Links

- [Other AWS libraries](https://github.com/agilord/aws_client/tree/master/generated).
- [Issue tracker](https://github.com/agilord/aws_client/issues).
- [AWS API definitions](https://github.com/aws/aws-sdk-js/tree/master/apis).
