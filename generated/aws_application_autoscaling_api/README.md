# AWS API client for Application Auto Scaling

**Generated Dart library from API specification**

*About the service:*
With Application Auto Scaling, you can configure automatic scaling for the
following resources:

<ul>
<li>
Amazon AppStream 2.0 fleets
</li>
<li>
Amazon Aurora Replicas
</li>
<li>
Amazon Comprehend document classification and entity recognizer endpoints
</li>
<li>
Amazon DynamoDB tables and global secondary indexes throughput capacity
</li>
<li>
Amazon ECS services
</li>
<li>
Amazon ElastiCache for Redis clusters (replication groups)
</li>
<li>
Amazon EMR clusters
</li>
<li>
Amazon Keyspaces (for Apache Cassandra) tables
</li>
<li>
Lambda function provisioned concurrency
</li>
<li>
Amazon Managed Streaming for Apache Kafka broker storage
</li>
<li>
Amazon Neptune clusters
</li>
<li>
Amazon SageMaker endpoint variants
</li>
<li>
Amazon SageMaker Serverless endpoint provisioned concurrency
</li>
<li>
Amazon SageMaker inference components
</li>
<li>
Spot Fleets (Amazon EC2)
</li>
<li>
Custom resources provided by your own applications or services
</li>
</ul>
To learn more about Application Auto Scaling, see the <a
href="https://docs.aws.amazon.com/autoscaling/application/userguide/what-is-application-auto-scaling.html">Application
Auto Scaling User Guide</a>.

<b>API Summary</b>

The Application Auto Scaling service API includes three key sets of actions:

<ul>
<li>
Register and manage scalable targets - Register Amazon Web Services or
custom resources as scalable targets (a resource that Application Auto
Scaling can scale), set minimum and maximum capacity limits, and retrieve
information on existing scalable targets.
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

## Links

- [Other AWS libraries](https://github.com/agilord/aws_client/tree/master/generated).
- [Issue tracker](https://github.com/agilord/aws_client/issues).
- [AWS API definitions](https://github.com/aws/aws-sdk-js/tree/master/apis).
