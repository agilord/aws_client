# AWS API client for Application Auto Scaling

**Warning: This is a generated library, some operations may not work.**

*About the service:*
With Application Auto Scaling, you can configure automatic scaling for the
following resources:

<ul>
<li>
Amazon ECS services
</li>
<li>
Amazon EC2 Spot Fleet requests
</li>
<li>
Amazon EMR clusters
</li>
<li>
Amazon AppStream 2.0 fleets
</li>
<li>
Amazon DynamoDB tables and global secondary indexes throughput capacity
</li>
<li>
Amazon Aurora Replicas
</li>
<li>
Amazon SageMaker endpoint variants
</li>
<li>
Custom resources provided by your own applications or services
</li>
<li>
Amazon Comprehend document classification endpoints
</li>
<li>
AWS Lambda function provisioned concurrency
</li>
<li>
Amazon Keyspaces for Apache Cassandra tables
</li>
</ul>
<b>API Summary</b>

The Application Auto Scaling service API includes three key sets of actions:

<ul>
<li>
Register and manage scalable targets - Register AWS or custom resources as
scalable targets (a resource that Application Auto Scaling can scale), set
minimum and maximum capacity limits, and retrieve information on existing
scalable targets.
</li>
<li>
Configure and manage automatic scaling - Define scaling policies to
dynamically scale your resources in response to CloudWatch alarms, schedule
one-time or recurring scaling actions, and retrieve your recent scaling
activity history.
</li>
<li>
Suspend and resume scaling - Temporarily suspend and later resume automatic
scaling by calling the <a
href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_RegisterScalableTarget.html">RegisterScalableTarget</a>
API action for any Application Auto Scaling scalable target. You can suspend
and resume (individually or in combination) scale-out activities that are
triggered by a scaling policy, scale-in activities that are triggered by a
scaling policy, and scheduled scaling.
</li>
</ul>
To learn more about Application Auto Scaling, including information about
granting IAM users required permissions for Application Auto Scaling
actions, see the <a
href="https://docs.aws.amazon.com/autoscaling/application/userguide/what-is-application-auto-scaling.html">Application
Auto Scaling User Guide</a>.

## Links

- [Other AWS libraries](https://github.com/agilord/aws_client/tree/master/generated).
- [Issue tracker](https://github.com/agilord/aws_client/issues).
- [AWS API definitions](https://github.com/aws/aws-sdk-js/tree/master/apis).

## Contributors

- [Jonathan Böcker](https://github.com/Schwusch)
- [Istvan Soós](https://github.com/isoos)

