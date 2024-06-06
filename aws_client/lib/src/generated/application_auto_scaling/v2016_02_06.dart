// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import '../../shared/shared.dart' as _s;
import '../../shared/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export '../../shared/shared.dart' show AwsClientCredentials;

/// With Application Auto Scaling, you can configure automatic scaling for the
/// following resources:
///
/// <ul>
/// <li>
/// Amazon AppStream 2.0 fleets
/// </li>
/// <li>
/// Amazon Aurora Replicas
/// </li>
/// <li>
/// Amazon Comprehend document classification and entity recognizer endpoints
/// </li>
/// <li>
/// Amazon DynamoDB tables and global secondary indexes throughput capacity
/// </li>
/// <li>
/// Amazon ECS services
/// </li>
/// <li>
/// Amazon ElastiCache for Redis clusters (replication groups)
/// </li>
/// <li>
/// Amazon EMR clusters
/// </li>
/// <li>
/// Amazon Keyspaces (for Apache Cassandra) tables
/// </li>
/// <li>
/// Lambda function provisioned concurrency
/// </li>
/// <li>
/// Amazon Managed Streaming for Apache Kafka broker storage
/// </li>
/// <li>
/// Amazon Neptune clusters
/// </li>
/// <li>
/// Amazon SageMaker endpoint variants
/// </li>
/// <li>
/// Amazon SageMaker Serverless endpoint provisioned concurrency
/// </li>
/// <li>
/// Amazon SageMaker inference components
/// </li>
/// <li>
/// Spot Fleets (Amazon EC2)
/// </li>
/// <li>
/// Custom resources provided by your own applications or services
/// </li>
/// </ul>
/// To learn more about Application Auto Scaling, see the <a
/// href="https://docs.aws.amazon.com/autoscaling/application/userguide/what-is-application-auto-scaling.html">Application
/// Auto Scaling User Guide</a>.
///
/// <b>API Summary</b>
///
/// The Application Auto Scaling service API includes three key sets of actions:
///
/// <ul>
/// <li>
/// Register and manage scalable targets - Register Amazon Web Services or
/// custom resources as scalable targets (a resource that Application Auto
/// Scaling can scale), set minimum and maximum capacity limits, and retrieve
/// information on existing scalable targets.
/// </li>
/// <li>
/// Configure and manage automatic scaling - Define scaling policies to
/// dynamically scale your resources in response to CloudWatch alarms, schedule
/// one-time or recurring scaling actions, and retrieve your recent scaling
/// activity history.
/// </li>
/// <li>
/// Suspend and resume scaling - Temporarily suspend and later resume automatic
/// scaling by calling the <a
/// href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_RegisterScalableTarget.html">RegisterScalableTarget</a>
/// API action for any Application Auto Scaling scalable target. You can suspend
/// and resume (individually or in combination) scale-out activities that are
/// triggered by a scaling policy, scale-in activities that are triggered by a
/// scaling policy, and scheduled scaling.
/// </li>
/// </ul>
class ApplicationAutoScaling {
  final _s.JsonProtocol _protocol;
  ApplicationAutoScaling({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'application-autoscaling',
            signingName: 'application-autoscaling',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Deletes the specified scaling policy for an Application Auto Scaling
  /// scalable target.
  ///
  /// Deleting a step scaling policy deletes the underlying alarm action, but
  /// does not delete the CloudWatch alarm associated with the scaling policy,
  /// even if it no longer has an associated action.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/create-step-scaling-policy-cli.html#delete-step-scaling-policy">Delete
  /// a step scaling policy</a> and <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/create-target-tracking-policy-cli.html#delete-target-tracking-policy">Delete
  /// a target tracking scaling policy</a> in the <i>Application Auto Scaling
  /// User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [ObjectNotFoundException].
  /// May throw [ConcurrentUpdateException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [policyName] :
  /// The name of the scaling policy.
  ///
  /// Parameter [resourceId] :
  /// The identifier of the resource associated with the scalable target. This
  /// string consists of the resource type and unique identifier.
  ///
  /// <ul>
  /// <li>
  /// ECS service - The resource type is <code>service</code> and the unique
  /// identifier is the cluster name and service name. Example:
  /// <code>service/default/sample-webapp</code>.
  /// </li>
  /// <li>
  /// Spot Fleet - The resource type is <code>spot-fleet-request</code> and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.
  /// </li>
  /// <li>
  /// EMR cluster - The resource type is <code>instancegroup</code> and the
  /// unique identifier is the cluster ID and instance group ID. Example:
  /// <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.
  /// </li>
  /// <li>
  /// AppStream 2.0 fleet - The resource type is <code>fleet</code> and the
  /// unique identifier is the fleet name. Example:
  /// <code>fleet/sample-fleet</code>.
  /// </li>
  /// <li>
  /// DynamoDB table - The resource type is <code>table</code> and the unique
  /// identifier is the table name. Example: <code>table/my-table</code>.
  /// </li>
  /// <li>
  /// DynamoDB global secondary index - The resource type is <code>index</code>
  /// and the unique identifier is the index name. Example:
  /// <code>table/my-table/index/my-table-index</code>.
  /// </li>
  /// <li>
  /// Aurora DB cluster - The resource type is <code>cluster</code> and the
  /// unique identifier is the cluster name. Example:
  /// <code>cluster:my-db-cluster</code>.
  /// </li>
  /// <li>
  /// SageMaker endpoint variant - The resource type is <code>variant</code> and
  /// the unique identifier is the resource ID. Example:
  /// <code>endpoint/my-end-point/variant/KMeansClustering</code>.
  /// </li>
  /// <li>
  /// Custom resources are not supported with a resource type. This parameter
  /// must specify the <code>OutputValue</code> from the CloudFormation template
  /// stack used to access the resources. The unique identifier is defined by
  /// the service provider. More information is available in our <a
  /// href="https://github.com/aws/aws-auto-scaling-custom-resource">GitHub
  /// repository</a>.
  /// </li>
  /// <li>
  /// Amazon Comprehend document classification endpoint - The resource type and
  /// unique identifier are specified using the endpoint ARN. Example:
  /// <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Amazon Comprehend entity recognizer endpoint - The resource type and
  /// unique identifier are specified using the endpoint ARN. Example:
  /// <code>arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Lambda provisioned concurrency - The resource type is
  /// <code>function</code> and the unique identifier is the function name with
  /// a function version or alias name suffix that is not <code>$LATEST</code>.
  /// Example: <code>function:my-function:prod</code> or
  /// <code>function:my-function:1</code>.
  /// </li>
  /// <li>
  /// Amazon Keyspaces table - The resource type is <code>table</code> and the
  /// unique identifier is the table name. Example:
  /// <code>keyspace/mykeyspace/table/mytable</code>.
  /// </li>
  /// <li>
  /// Amazon MSK cluster - The resource type and unique identifier are specified
  /// using the cluster ARN. Example:
  /// <code>arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5</code>.
  /// </li>
  /// <li>
  /// Amazon ElastiCache replication group - The resource type is
  /// <code>replication-group</code> and the unique identifier is the
  /// replication group name. Example: <code>replication-group/mycluster</code>.
  /// </li>
  /// <li>
  /// Neptune cluster - The resource type is <code>cluster</code> and the unique
  /// identifier is the cluster name. Example: <code>cluster:mycluster</code>.
  /// </li>
  /// <li>
  /// SageMaker Serverless endpoint - The resource type is <code>variant</code>
  /// and the unique identifier is the resource ID. Example:
  /// <code>endpoint/my-end-point/variant/KMeansClustering</code>.
  /// </li>
  /// <li>
  /// SageMaker inference component - The resource type is
  /// <code>inference-component</code> and the unique identifier is the resource
  /// ID. Example: <code>inference-component/my-inference-component</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [scalableDimension] :
  /// The scalable dimension. This string consists of the service namespace,
  /// resource type, and scaling property.
  ///
  /// <ul>
  /// <li>
  /// <code>ecs:service:DesiredCount</code> - The desired task count of an ECS
  /// service.
  /// </li>
  /// <li>
  /// <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance
  /// count of an EMR Instance Group.
  /// </li>
  /// <li>
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity
  /// of a Spot Fleet.
  /// </li>
  /// <li>
  /// <code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an
  /// AppStream 2.0 fleet.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas
  /// in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  /// </li>
  /// <li>
  /// <code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2
  /// instances for a SageMaker model endpoint variant.
  /// </li>
  /// <li>
  /// <code>custom-resource:ResourceType:Property</code> - The scalable
  /// dimension for a custom resource provided by your own application or
  /// service.
  /// </li>
  /// <li>
  /// <code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code>
  /// - The number of inference units for an Amazon Comprehend document
  /// classification endpoint.
  /// </li>
  /// <li>
  /// <code>comprehend:entity-recognizer-endpoint:DesiredInferenceUnits</code> -
  /// The number of inference units for an Amazon Comprehend entity recognizer
  /// endpoint.
  /// </li>
  /// <li>
  /// <code>lambda:function:ProvisionedConcurrency</code> - The provisioned
  /// concurrency for a Lambda function.
  /// </li>
  /// <li>
  /// <code>cassandra:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for an Amazon Keyspaces table.
  /// </li>
  /// <li>
  /// <code>cassandra:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for an Amazon Keyspaces table.
  /// </li>
  /// <li>
  /// <code>kafka:broker-storage:VolumeSize</code> - The provisioned volume size
  /// (in GiB) for brokers in an Amazon MSK cluster.
  /// </li>
  /// <li>
  /// <code>elasticache:replication-group:NodeGroups</code> - The number of node
  /// groups for an Amazon ElastiCache replication group.
  /// </li>
  /// <li>
  /// <code>elasticache:replication-group:Replicas</code> - The number of
  /// replicas per node group for an Amazon ElastiCache replication group.
  /// </li>
  /// <li>
  /// <code>neptune:cluster:ReadReplicaCount</code> - The count of read replicas
  /// in an Amazon Neptune DB cluster.
  /// </li>
  /// <li>
  /// <code>sagemaker:variant:DesiredProvisionedConcurrency</code> - The
  /// provisioned concurrency for a SageMaker Serverless endpoint.
  /// </li>
  /// <li>
  /// <code>sagemaker:inference-component:DesiredCopyCount</code> - The number
  /// of copies across an endpoint for a SageMaker inference component.
  /// </li>
  /// </ul>
  ///
  /// Parameter [serviceNamespace] :
  /// The namespace of the Amazon Web Services service that provides the
  /// resource. For a resource provided by your own application or service, use
  /// <code>custom-resource</code> instead.
  Future<void> deleteScalingPolicy({
    required String policyName,
    required String resourceId,
    required ScalableDimension scalableDimension,
    required ServiceNamespace serviceNamespace,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AnyScaleFrontendService.DeleteScalingPolicy'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PolicyName': policyName,
        'ResourceId': resourceId,
        'ScalableDimension': scalableDimension.toValue(),
        'ServiceNamespace': serviceNamespace.toValue(),
      },
    );
  }

  /// Deletes the specified scheduled action for an Application Auto Scaling
  /// scalable target.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/scheduled-scaling-additional-cli-commands.html#delete-scheduled-action">Delete
  /// a scheduled action</a> in the <i>Application Auto Scaling User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [ObjectNotFoundException].
  /// May throw [ConcurrentUpdateException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [resourceId] :
  /// The identifier of the resource associated with the scheduled action. This
  /// string consists of the resource type and unique identifier.
  ///
  /// <ul>
  /// <li>
  /// ECS service - The resource type is <code>service</code> and the unique
  /// identifier is the cluster name and service name. Example:
  /// <code>service/default/sample-webapp</code>.
  /// </li>
  /// <li>
  /// Spot Fleet - The resource type is <code>spot-fleet-request</code> and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.
  /// </li>
  /// <li>
  /// EMR cluster - The resource type is <code>instancegroup</code> and the
  /// unique identifier is the cluster ID and instance group ID. Example:
  /// <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.
  /// </li>
  /// <li>
  /// AppStream 2.0 fleet - The resource type is <code>fleet</code> and the
  /// unique identifier is the fleet name. Example:
  /// <code>fleet/sample-fleet</code>.
  /// </li>
  /// <li>
  /// DynamoDB table - The resource type is <code>table</code> and the unique
  /// identifier is the table name. Example: <code>table/my-table</code>.
  /// </li>
  /// <li>
  /// DynamoDB global secondary index - The resource type is <code>index</code>
  /// and the unique identifier is the index name. Example:
  /// <code>table/my-table/index/my-table-index</code>.
  /// </li>
  /// <li>
  /// Aurora DB cluster - The resource type is <code>cluster</code> and the
  /// unique identifier is the cluster name. Example:
  /// <code>cluster:my-db-cluster</code>.
  /// </li>
  /// <li>
  /// SageMaker endpoint variant - The resource type is <code>variant</code> and
  /// the unique identifier is the resource ID. Example:
  /// <code>endpoint/my-end-point/variant/KMeansClustering</code>.
  /// </li>
  /// <li>
  /// Custom resources are not supported with a resource type. This parameter
  /// must specify the <code>OutputValue</code> from the CloudFormation template
  /// stack used to access the resources. The unique identifier is defined by
  /// the service provider. More information is available in our <a
  /// href="https://github.com/aws/aws-auto-scaling-custom-resource">GitHub
  /// repository</a>.
  /// </li>
  /// <li>
  /// Amazon Comprehend document classification endpoint - The resource type and
  /// unique identifier are specified using the endpoint ARN. Example:
  /// <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Amazon Comprehend entity recognizer endpoint - The resource type and
  /// unique identifier are specified using the endpoint ARN. Example:
  /// <code>arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Lambda provisioned concurrency - The resource type is
  /// <code>function</code> and the unique identifier is the function name with
  /// a function version or alias name suffix that is not <code>$LATEST</code>.
  /// Example: <code>function:my-function:prod</code> or
  /// <code>function:my-function:1</code>.
  /// </li>
  /// <li>
  /// Amazon Keyspaces table - The resource type is <code>table</code> and the
  /// unique identifier is the table name. Example:
  /// <code>keyspace/mykeyspace/table/mytable</code>.
  /// </li>
  /// <li>
  /// Amazon MSK cluster - The resource type and unique identifier are specified
  /// using the cluster ARN. Example:
  /// <code>arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5</code>.
  /// </li>
  /// <li>
  /// Amazon ElastiCache replication group - The resource type is
  /// <code>replication-group</code> and the unique identifier is the
  /// replication group name. Example: <code>replication-group/mycluster</code>.
  /// </li>
  /// <li>
  /// Neptune cluster - The resource type is <code>cluster</code> and the unique
  /// identifier is the cluster name. Example: <code>cluster:mycluster</code>.
  /// </li>
  /// <li>
  /// SageMaker Serverless endpoint - The resource type is <code>variant</code>
  /// and the unique identifier is the resource ID. Example:
  /// <code>endpoint/my-end-point/variant/KMeansClustering</code>.
  /// </li>
  /// <li>
  /// SageMaker inference component - The resource type is
  /// <code>inference-component</code> and the unique identifier is the resource
  /// ID. Example: <code>inference-component/my-inference-component</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [scalableDimension] :
  /// The scalable dimension. This string consists of the service namespace,
  /// resource type, and scaling property.
  ///
  /// <ul>
  /// <li>
  /// <code>ecs:service:DesiredCount</code> - The desired task count of an ECS
  /// service.
  /// </li>
  /// <li>
  /// <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance
  /// count of an EMR Instance Group.
  /// </li>
  /// <li>
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity
  /// of a Spot Fleet.
  /// </li>
  /// <li>
  /// <code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an
  /// AppStream 2.0 fleet.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas
  /// in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  /// </li>
  /// <li>
  /// <code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2
  /// instances for a SageMaker model endpoint variant.
  /// </li>
  /// <li>
  /// <code>custom-resource:ResourceType:Property</code> - The scalable
  /// dimension for a custom resource provided by your own application or
  /// service.
  /// </li>
  /// <li>
  /// <code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code>
  /// - The number of inference units for an Amazon Comprehend document
  /// classification endpoint.
  /// </li>
  /// <li>
  /// <code>comprehend:entity-recognizer-endpoint:DesiredInferenceUnits</code> -
  /// The number of inference units for an Amazon Comprehend entity recognizer
  /// endpoint.
  /// </li>
  /// <li>
  /// <code>lambda:function:ProvisionedConcurrency</code> - The provisioned
  /// concurrency for a Lambda function.
  /// </li>
  /// <li>
  /// <code>cassandra:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for an Amazon Keyspaces table.
  /// </li>
  /// <li>
  /// <code>cassandra:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for an Amazon Keyspaces table.
  /// </li>
  /// <li>
  /// <code>kafka:broker-storage:VolumeSize</code> - The provisioned volume size
  /// (in GiB) for brokers in an Amazon MSK cluster.
  /// </li>
  /// <li>
  /// <code>elasticache:replication-group:NodeGroups</code> - The number of node
  /// groups for an Amazon ElastiCache replication group.
  /// </li>
  /// <li>
  /// <code>elasticache:replication-group:Replicas</code> - The number of
  /// replicas per node group for an Amazon ElastiCache replication group.
  /// </li>
  /// <li>
  /// <code>neptune:cluster:ReadReplicaCount</code> - The count of read replicas
  /// in an Amazon Neptune DB cluster.
  /// </li>
  /// <li>
  /// <code>sagemaker:variant:DesiredProvisionedConcurrency</code> - The
  /// provisioned concurrency for a SageMaker Serverless endpoint.
  /// </li>
  /// <li>
  /// <code>sagemaker:inference-component:DesiredCopyCount</code> - The number
  /// of copies across an endpoint for a SageMaker inference component.
  /// </li>
  /// </ul>
  ///
  /// Parameter [scheduledActionName] :
  /// The name of the scheduled action.
  ///
  /// Parameter [serviceNamespace] :
  /// The namespace of the Amazon Web Services service that provides the
  /// resource. For a resource provided by your own application or service, use
  /// <code>custom-resource</code> instead.
  Future<void> deleteScheduledAction({
    required String resourceId,
    required ScalableDimension scalableDimension,
    required String scheduledActionName,
    required ServiceNamespace serviceNamespace,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AnyScaleFrontendService.DeleteScheduledAction'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'ScalableDimension': scalableDimension.toValue(),
        'ScheduledActionName': scheduledActionName,
        'ServiceNamespace': serviceNamespace.toValue(),
      },
    );
  }

  /// Deregisters an Application Auto Scaling scalable target when you have
  /// finished using it. To see which resources have been registered, use <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DescribeScalableTargets.html">DescribeScalableTargets</a>.
  /// <note>
  /// Deregistering a scalable target deletes the scaling policies and the
  /// scheduled actions that are associated with it.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ObjectNotFoundException].
  /// May throw [ConcurrentUpdateException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [resourceId] :
  /// The identifier of the resource associated with the scalable target. This
  /// string consists of the resource type and unique identifier.
  ///
  /// <ul>
  /// <li>
  /// ECS service - The resource type is <code>service</code> and the unique
  /// identifier is the cluster name and service name. Example:
  /// <code>service/default/sample-webapp</code>.
  /// </li>
  /// <li>
  /// Spot Fleet - The resource type is <code>spot-fleet-request</code> and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.
  /// </li>
  /// <li>
  /// EMR cluster - The resource type is <code>instancegroup</code> and the
  /// unique identifier is the cluster ID and instance group ID. Example:
  /// <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.
  /// </li>
  /// <li>
  /// AppStream 2.0 fleet - The resource type is <code>fleet</code> and the
  /// unique identifier is the fleet name. Example:
  /// <code>fleet/sample-fleet</code>.
  /// </li>
  /// <li>
  /// DynamoDB table - The resource type is <code>table</code> and the unique
  /// identifier is the table name. Example: <code>table/my-table</code>.
  /// </li>
  /// <li>
  /// DynamoDB global secondary index - The resource type is <code>index</code>
  /// and the unique identifier is the index name. Example:
  /// <code>table/my-table/index/my-table-index</code>.
  /// </li>
  /// <li>
  /// Aurora DB cluster - The resource type is <code>cluster</code> and the
  /// unique identifier is the cluster name. Example:
  /// <code>cluster:my-db-cluster</code>.
  /// </li>
  /// <li>
  /// SageMaker endpoint variant - The resource type is <code>variant</code> and
  /// the unique identifier is the resource ID. Example:
  /// <code>endpoint/my-end-point/variant/KMeansClustering</code>.
  /// </li>
  /// <li>
  /// Custom resources are not supported with a resource type. This parameter
  /// must specify the <code>OutputValue</code> from the CloudFormation template
  /// stack used to access the resources. The unique identifier is defined by
  /// the service provider. More information is available in our <a
  /// href="https://github.com/aws/aws-auto-scaling-custom-resource">GitHub
  /// repository</a>.
  /// </li>
  /// <li>
  /// Amazon Comprehend document classification endpoint - The resource type and
  /// unique identifier are specified using the endpoint ARN. Example:
  /// <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Amazon Comprehend entity recognizer endpoint - The resource type and
  /// unique identifier are specified using the endpoint ARN. Example:
  /// <code>arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Lambda provisioned concurrency - The resource type is
  /// <code>function</code> and the unique identifier is the function name with
  /// a function version or alias name suffix that is not <code>$LATEST</code>.
  /// Example: <code>function:my-function:prod</code> or
  /// <code>function:my-function:1</code>.
  /// </li>
  /// <li>
  /// Amazon Keyspaces table - The resource type is <code>table</code> and the
  /// unique identifier is the table name. Example:
  /// <code>keyspace/mykeyspace/table/mytable</code>.
  /// </li>
  /// <li>
  /// Amazon MSK cluster - The resource type and unique identifier are specified
  /// using the cluster ARN. Example:
  /// <code>arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5</code>.
  /// </li>
  /// <li>
  /// Amazon ElastiCache replication group - The resource type is
  /// <code>replication-group</code> and the unique identifier is the
  /// replication group name. Example: <code>replication-group/mycluster</code>.
  /// </li>
  /// <li>
  /// Neptune cluster - The resource type is <code>cluster</code> and the unique
  /// identifier is the cluster name. Example: <code>cluster:mycluster</code>.
  /// </li>
  /// <li>
  /// SageMaker Serverless endpoint - The resource type is <code>variant</code>
  /// and the unique identifier is the resource ID. Example:
  /// <code>endpoint/my-end-point/variant/KMeansClustering</code>.
  /// </li>
  /// <li>
  /// SageMaker inference component - The resource type is
  /// <code>inference-component</code> and the unique identifier is the resource
  /// ID. Example: <code>inference-component/my-inference-component</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [scalableDimension] :
  /// The scalable dimension associated with the scalable target. This string
  /// consists of the service namespace, resource type, and scaling property.
  ///
  /// <ul>
  /// <li>
  /// <code>ecs:service:DesiredCount</code> - The desired task count of an ECS
  /// service.
  /// </li>
  /// <li>
  /// <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance
  /// count of an EMR Instance Group.
  /// </li>
  /// <li>
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity
  /// of a Spot Fleet.
  /// </li>
  /// <li>
  /// <code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an
  /// AppStream 2.0 fleet.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas
  /// in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  /// </li>
  /// <li>
  /// <code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2
  /// instances for a SageMaker model endpoint variant.
  /// </li>
  /// <li>
  /// <code>custom-resource:ResourceType:Property</code> - The scalable
  /// dimension for a custom resource provided by your own application or
  /// service.
  /// </li>
  /// <li>
  /// <code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code>
  /// - The number of inference units for an Amazon Comprehend document
  /// classification endpoint.
  /// </li>
  /// <li>
  /// <code>comprehend:entity-recognizer-endpoint:DesiredInferenceUnits</code> -
  /// The number of inference units for an Amazon Comprehend entity recognizer
  /// endpoint.
  /// </li>
  /// <li>
  /// <code>lambda:function:ProvisionedConcurrency</code> - The provisioned
  /// concurrency for a Lambda function.
  /// </li>
  /// <li>
  /// <code>cassandra:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for an Amazon Keyspaces table.
  /// </li>
  /// <li>
  /// <code>cassandra:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for an Amazon Keyspaces table.
  /// </li>
  /// <li>
  /// <code>kafka:broker-storage:VolumeSize</code> - The provisioned volume size
  /// (in GiB) for brokers in an Amazon MSK cluster.
  /// </li>
  /// <li>
  /// <code>elasticache:replication-group:NodeGroups</code> - The number of node
  /// groups for an Amazon ElastiCache replication group.
  /// </li>
  /// <li>
  /// <code>elasticache:replication-group:Replicas</code> - The number of
  /// replicas per node group for an Amazon ElastiCache replication group.
  /// </li>
  /// <li>
  /// <code>neptune:cluster:ReadReplicaCount</code> - The count of read replicas
  /// in an Amazon Neptune DB cluster.
  /// </li>
  /// <li>
  /// <code>sagemaker:variant:DesiredProvisionedConcurrency</code> - The
  /// provisioned concurrency for a SageMaker Serverless endpoint.
  /// </li>
  /// <li>
  /// <code>sagemaker:inference-component:DesiredCopyCount</code> - The number
  /// of copies across an endpoint for a SageMaker inference component.
  /// </li>
  /// </ul>
  ///
  /// Parameter [serviceNamespace] :
  /// The namespace of the Amazon Web Services service that provides the
  /// resource. For a resource provided by your own application or service, use
  /// <code>custom-resource</code> instead.
  Future<void> deregisterScalableTarget({
    required String resourceId,
    required ScalableDimension scalableDimension,
    required ServiceNamespace serviceNamespace,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AnyScaleFrontendService.DeregisterScalableTarget'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'ScalableDimension': scalableDimension.toValue(),
        'ServiceNamespace': serviceNamespace.toValue(),
      },
    );
  }

  /// Gets information about the scalable targets in the specified namespace.
  ///
  /// You can filter the results using <code>ResourceIds</code> and
  /// <code>ScalableDimension</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ConcurrentUpdateException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [serviceNamespace] :
  /// The namespace of the Amazon Web Services service that provides the
  /// resource. For a resource provided by your own application or service, use
  /// <code>custom-resource</code> instead.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of scalable targets. This value can be between 1 and
  /// 50. The default value is 50.
  ///
  /// If this parameter is used, the operation returns up to
  /// <code>MaxResults</code> results at a time, along with a
  /// <code>NextToken</code> value. To get the next set of results, include the
  /// <code>NextToken</code> value in a subsequent call. If this parameter is
  /// not used, the operation returns up to 50 results and a
  /// <code>NextToken</code> value, if applicable.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [resourceIds] :
  /// The identifier of the resource associated with the scalable target. This
  /// string consists of the resource type and unique identifier.
  ///
  /// <ul>
  /// <li>
  /// ECS service - The resource type is <code>service</code> and the unique
  /// identifier is the cluster name and service name. Example:
  /// <code>service/default/sample-webapp</code>.
  /// </li>
  /// <li>
  /// Spot Fleet - The resource type is <code>spot-fleet-request</code> and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.
  /// </li>
  /// <li>
  /// EMR cluster - The resource type is <code>instancegroup</code> and the
  /// unique identifier is the cluster ID and instance group ID. Example:
  /// <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.
  /// </li>
  /// <li>
  /// AppStream 2.0 fleet - The resource type is <code>fleet</code> and the
  /// unique identifier is the fleet name. Example:
  /// <code>fleet/sample-fleet</code>.
  /// </li>
  /// <li>
  /// DynamoDB table - The resource type is <code>table</code> and the unique
  /// identifier is the table name. Example: <code>table/my-table</code>.
  /// </li>
  /// <li>
  /// DynamoDB global secondary index - The resource type is <code>index</code>
  /// and the unique identifier is the index name. Example:
  /// <code>table/my-table/index/my-table-index</code>.
  /// </li>
  /// <li>
  /// Aurora DB cluster - The resource type is <code>cluster</code> and the
  /// unique identifier is the cluster name. Example:
  /// <code>cluster:my-db-cluster</code>.
  /// </li>
  /// <li>
  /// SageMaker endpoint variant - The resource type is <code>variant</code> and
  /// the unique identifier is the resource ID. Example:
  /// <code>endpoint/my-end-point/variant/KMeansClustering</code>.
  /// </li>
  /// <li>
  /// Custom resources are not supported with a resource type. This parameter
  /// must specify the <code>OutputValue</code> from the CloudFormation template
  /// stack used to access the resources. The unique identifier is defined by
  /// the service provider. More information is available in our <a
  /// href="https://github.com/aws/aws-auto-scaling-custom-resource">GitHub
  /// repository</a>.
  /// </li>
  /// <li>
  /// Amazon Comprehend document classification endpoint - The resource type and
  /// unique identifier are specified using the endpoint ARN. Example:
  /// <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Amazon Comprehend entity recognizer endpoint - The resource type and
  /// unique identifier are specified using the endpoint ARN. Example:
  /// <code>arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Lambda provisioned concurrency - The resource type is
  /// <code>function</code> and the unique identifier is the function name with
  /// a function version or alias name suffix that is not <code>$LATEST</code>.
  /// Example: <code>function:my-function:prod</code> or
  /// <code>function:my-function:1</code>.
  /// </li>
  /// <li>
  /// Amazon Keyspaces table - The resource type is <code>table</code> and the
  /// unique identifier is the table name. Example:
  /// <code>keyspace/mykeyspace/table/mytable</code>.
  /// </li>
  /// <li>
  /// Amazon MSK cluster - The resource type and unique identifier are specified
  /// using the cluster ARN. Example:
  /// <code>arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5</code>.
  /// </li>
  /// <li>
  /// Amazon ElastiCache replication group - The resource type is
  /// <code>replication-group</code> and the unique identifier is the
  /// replication group name. Example: <code>replication-group/mycluster</code>.
  /// </li>
  /// <li>
  /// Neptune cluster - The resource type is <code>cluster</code> and the unique
  /// identifier is the cluster name. Example: <code>cluster:mycluster</code>.
  /// </li>
  /// <li>
  /// SageMaker Serverless endpoint - The resource type is <code>variant</code>
  /// and the unique identifier is the resource ID. Example:
  /// <code>endpoint/my-end-point/variant/KMeansClustering</code>.
  /// </li>
  /// <li>
  /// SageMaker inference component - The resource type is
  /// <code>inference-component</code> and the unique identifier is the resource
  /// ID. Example: <code>inference-component/my-inference-component</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [scalableDimension] :
  /// The scalable dimension associated with the scalable target. This string
  /// consists of the service namespace, resource type, and scaling property. If
  /// you specify a scalable dimension, you must also specify a resource ID.
  ///
  /// <ul>
  /// <li>
  /// <code>ecs:service:DesiredCount</code> - The desired task count of an ECS
  /// service.
  /// </li>
  /// <li>
  /// <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance
  /// count of an EMR Instance Group.
  /// </li>
  /// <li>
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity
  /// of a Spot Fleet.
  /// </li>
  /// <li>
  /// <code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an
  /// AppStream 2.0 fleet.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas
  /// in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  /// </li>
  /// <li>
  /// <code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2
  /// instances for a SageMaker model endpoint variant.
  /// </li>
  /// <li>
  /// <code>custom-resource:ResourceType:Property</code> - The scalable
  /// dimension for a custom resource provided by your own application or
  /// service.
  /// </li>
  /// <li>
  /// <code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code>
  /// - The number of inference units for an Amazon Comprehend document
  /// classification endpoint.
  /// </li>
  /// <li>
  /// <code>comprehend:entity-recognizer-endpoint:DesiredInferenceUnits</code> -
  /// The number of inference units for an Amazon Comprehend entity recognizer
  /// endpoint.
  /// </li>
  /// <li>
  /// <code>lambda:function:ProvisionedConcurrency</code> - The provisioned
  /// concurrency for a Lambda function.
  /// </li>
  /// <li>
  /// <code>cassandra:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for an Amazon Keyspaces table.
  /// </li>
  /// <li>
  /// <code>cassandra:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for an Amazon Keyspaces table.
  /// </li>
  /// <li>
  /// <code>kafka:broker-storage:VolumeSize</code> - The provisioned volume size
  /// (in GiB) for brokers in an Amazon MSK cluster.
  /// </li>
  /// <li>
  /// <code>elasticache:replication-group:NodeGroups</code> - The number of node
  /// groups for an Amazon ElastiCache replication group.
  /// </li>
  /// <li>
  /// <code>elasticache:replication-group:Replicas</code> - The number of
  /// replicas per node group for an Amazon ElastiCache replication group.
  /// </li>
  /// <li>
  /// <code>neptune:cluster:ReadReplicaCount</code> - The count of read replicas
  /// in an Amazon Neptune DB cluster.
  /// </li>
  /// <li>
  /// <code>sagemaker:variant:DesiredProvisionedConcurrency</code> - The
  /// provisioned concurrency for a SageMaker Serverless endpoint.
  /// </li>
  /// <li>
  /// <code>sagemaker:inference-component:DesiredCopyCount</code> - The number
  /// of copies across an endpoint for a SageMaker inference component.
  /// </li>
  /// </ul>
  Future<DescribeScalableTargetsResponse> describeScalableTargets({
    required ServiceNamespace serviceNamespace,
    int? maxResults,
    String? nextToken,
    List<String>? resourceIds,
    ScalableDimension? scalableDimension,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AnyScaleFrontendService.DescribeScalableTargets'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServiceNamespace': serviceNamespace.toValue(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (resourceIds != null) 'ResourceIds': resourceIds,
        if (scalableDimension != null)
          'ScalableDimension': scalableDimension.toValue(),
      },
    );

    return DescribeScalableTargetsResponse.fromJson(jsonResponse.body);
  }

  /// Provides descriptive information about the scaling activities in the
  /// specified namespace from the previous six weeks.
  ///
  /// You can filter the results using <code>ResourceId</code> and
  /// <code>ScalableDimension</code>.
  ///
  /// For information about viewing scaling activities using the Amazon Web
  /// Services CLI, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scaling-activities.html">Scaling
  /// activities for Application Auto Scaling</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ConcurrentUpdateException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [serviceNamespace] :
  /// The namespace of the Amazon Web Services service that provides the
  /// resource. For a resource provided by your own application or service, use
  /// <code>custom-resource</code> instead.
  ///
  /// Parameter [includeNotScaledActivities] :
  /// Specifies whether to include activities that aren't scaled (<i>not scaled
  /// activities</i>) in the response. Not scaled activities are activities that
  /// aren't completed or started for various reasons, such as preventing
  /// infinite scaling loops. For help interpreting the not scaled reason
  /// details in the response, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scaling-activities.html">Scaling
  /// activities for Application Auto Scaling</a>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of scalable targets. This value can be between 1 and
  /// 50. The default value is 50.
  ///
  /// If this parameter is used, the operation returns up to
  /// <code>MaxResults</code> results at a time, along with a
  /// <code>NextToken</code> value. To get the next set of results, include the
  /// <code>NextToken</code> value in a subsequent call. If this parameter is
  /// not used, the operation returns up to 50 results and a
  /// <code>NextToken</code> value, if applicable.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [resourceId] :
  /// The identifier of the resource associated with the scaling activity. This
  /// string consists of the resource type and unique identifier.
  ///
  /// <ul>
  /// <li>
  /// ECS service - The resource type is <code>service</code> and the unique
  /// identifier is the cluster name and service name. Example:
  /// <code>service/default/sample-webapp</code>.
  /// </li>
  /// <li>
  /// Spot Fleet - The resource type is <code>spot-fleet-request</code> and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.
  /// </li>
  /// <li>
  /// EMR cluster - The resource type is <code>instancegroup</code> and the
  /// unique identifier is the cluster ID and instance group ID. Example:
  /// <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.
  /// </li>
  /// <li>
  /// AppStream 2.0 fleet - The resource type is <code>fleet</code> and the
  /// unique identifier is the fleet name. Example:
  /// <code>fleet/sample-fleet</code>.
  /// </li>
  /// <li>
  /// DynamoDB table - The resource type is <code>table</code> and the unique
  /// identifier is the table name. Example: <code>table/my-table</code>.
  /// </li>
  /// <li>
  /// DynamoDB global secondary index - The resource type is <code>index</code>
  /// and the unique identifier is the index name. Example:
  /// <code>table/my-table/index/my-table-index</code>.
  /// </li>
  /// <li>
  /// Aurora DB cluster - The resource type is <code>cluster</code> and the
  /// unique identifier is the cluster name. Example:
  /// <code>cluster:my-db-cluster</code>.
  /// </li>
  /// <li>
  /// SageMaker endpoint variant - The resource type is <code>variant</code> and
  /// the unique identifier is the resource ID. Example:
  /// <code>endpoint/my-end-point/variant/KMeansClustering</code>.
  /// </li>
  /// <li>
  /// Custom resources are not supported with a resource type. This parameter
  /// must specify the <code>OutputValue</code> from the CloudFormation template
  /// stack used to access the resources. The unique identifier is defined by
  /// the service provider. More information is available in our <a
  /// href="https://github.com/aws/aws-auto-scaling-custom-resource">GitHub
  /// repository</a>.
  /// </li>
  /// <li>
  /// Amazon Comprehend document classification endpoint - The resource type and
  /// unique identifier are specified using the endpoint ARN. Example:
  /// <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Amazon Comprehend entity recognizer endpoint - The resource type and
  /// unique identifier are specified using the endpoint ARN. Example:
  /// <code>arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Lambda provisioned concurrency - The resource type is
  /// <code>function</code> and the unique identifier is the function name with
  /// a function version or alias name suffix that is not <code>$LATEST</code>.
  /// Example: <code>function:my-function:prod</code> or
  /// <code>function:my-function:1</code>.
  /// </li>
  /// <li>
  /// Amazon Keyspaces table - The resource type is <code>table</code> and the
  /// unique identifier is the table name. Example:
  /// <code>keyspace/mykeyspace/table/mytable</code>.
  /// </li>
  /// <li>
  /// Amazon MSK cluster - The resource type and unique identifier are specified
  /// using the cluster ARN. Example:
  /// <code>arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5</code>.
  /// </li>
  /// <li>
  /// Amazon ElastiCache replication group - The resource type is
  /// <code>replication-group</code> and the unique identifier is the
  /// replication group name. Example: <code>replication-group/mycluster</code>.
  /// </li>
  /// <li>
  /// Neptune cluster - The resource type is <code>cluster</code> and the unique
  /// identifier is the cluster name. Example: <code>cluster:mycluster</code>.
  /// </li>
  /// <li>
  /// SageMaker Serverless endpoint - The resource type is <code>variant</code>
  /// and the unique identifier is the resource ID. Example:
  /// <code>endpoint/my-end-point/variant/KMeansClustering</code>.
  /// </li>
  /// <li>
  /// SageMaker inference component - The resource type is
  /// <code>inference-component</code> and the unique identifier is the resource
  /// ID. Example: <code>inference-component/my-inference-component</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [scalableDimension] :
  /// The scalable dimension. This string consists of the service namespace,
  /// resource type, and scaling property. If you specify a scalable dimension,
  /// you must also specify a resource ID.
  ///
  /// <ul>
  /// <li>
  /// <code>ecs:service:DesiredCount</code> - The desired task count of an ECS
  /// service.
  /// </li>
  /// <li>
  /// <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance
  /// count of an EMR Instance Group.
  /// </li>
  /// <li>
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity
  /// of a Spot Fleet.
  /// </li>
  /// <li>
  /// <code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an
  /// AppStream 2.0 fleet.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas
  /// in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  /// </li>
  /// <li>
  /// <code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2
  /// instances for a SageMaker model endpoint variant.
  /// </li>
  /// <li>
  /// <code>custom-resource:ResourceType:Property</code> - The scalable
  /// dimension for a custom resource provided by your own application or
  /// service.
  /// </li>
  /// <li>
  /// <code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code>
  /// - The number of inference units for an Amazon Comprehend document
  /// classification endpoint.
  /// </li>
  /// <li>
  /// <code>comprehend:entity-recognizer-endpoint:DesiredInferenceUnits</code> -
  /// The number of inference units for an Amazon Comprehend entity recognizer
  /// endpoint.
  /// </li>
  /// <li>
  /// <code>lambda:function:ProvisionedConcurrency</code> - The provisioned
  /// concurrency for a Lambda function.
  /// </li>
  /// <li>
  /// <code>cassandra:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for an Amazon Keyspaces table.
  /// </li>
  /// <li>
  /// <code>cassandra:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for an Amazon Keyspaces table.
  /// </li>
  /// <li>
  /// <code>kafka:broker-storage:VolumeSize</code> - The provisioned volume size
  /// (in GiB) for brokers in an Amazon MSK cluster.
  /// </li>
  /// <li>
  /// <code>elasticache:replication-group:NodeGroups</code> - The number of node
  /// groups for an Amazon ElastiCache replication group.
  /// </li>
  /// <li>
  /// <code>elasticache:replication-group:Replicas</code> - The number of
  /// replicas per node group for an Amazon ElastiCache replication group.
  /// </li>
  /// <li>
  /// <code>neptune:cluster:ReadReplicaCount</code> - The count of read replicas
  /// in an Amazon Neptune DB cluster.
  /// </li>
  /// <li>
  /// <code>sagemaker:variant:DesiredProvisionedConcurrency</code> - The
  /// provisioned concurrency for a SageMaker Serverless endpoint.
  /// </li>
  /// <li>
  /// <code>sagemaker:inference-component:DesiredCopyCount</code> - The number
  /// of copies across an endpoint for a SageMaker inference component.
  /// </li>
  /// </ul>
  Future<DescribeScalingActivitiesResponse> describeScalingActivities({
    required ServiceNamespace serviceNamespace,
    bool? includeNotScaledActivities,
    int? maxResults,
    String? nextToken,
    String? resourceId,
    ScalableDimension? scalableDimension,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AnyScaleFrontendService.DescribeScalingActivities'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServiceNamespace': serviceNamespace.toValue(),
        if (includeNotScaledActivities != null)
          'IncludeNotScaledActivities': includeNotScaledActivities,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (resourceId != null) 'ResourceId': resourceId,
        if (scalableDimension != null)
          'ScalableDimension': scalableDimension.toValue(),
      },
    );

    return DescribeScalingActivitiesResponse.fromJson(jsonResponse.body);
  }

  /// Describes the Application Auto Scaling scaling policies for the specified
  /// service namespace.
  ///
  /// You can filter the results using <code>ResourceId</code>,
  /// <code>ScalableDimension</code>, and <code>PolicyNames</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html">Target
  /// tracking scaling policies</a> and <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html">Step
  /// scaling policies</a> in the <i>Application Auto Scaling User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [FailedResourceAccessException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ConcurrentUpdateException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [serviceNamespace] :
  /// The namespace of the Amazon Web Services service that provides the
  /// resource. For a resource provided by your own application or service, use
  /// <code>custom-resource</code> instead.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of scalable targets. This value can be between 1 and
  /// 10. The default value is 10.
  ///
  /// If this parameter is used, the operation returns up to
  /// <code>MaxResults</code> results at a time, along with a
  /// <code>NextToken</code> value. To get the next set of results, include the
  /// <code>NextToken</code> value in a subsequent call. If this parameter is
  /// not used, the operation returns up to 10 results and a
  /// <code>NextToken</code> value, if applicable.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [policyNames] :
  /// The names of the scaling policies to describe.
  ///
  /// Parameter [resourceId] :
  /// The identifier of the resource associated with the scaling policy. This
  /// string consists of the resource type and unique identifier.
  ///
  /// <ul>
  /// <li>
  /// ECS service - The resource type is <code>service</code> and the unique
  /// identifier is the cluster name and service name. Example:
  /// <code>service/default/sample-webapp</code>.
  /// </li>
  /// <li>
  /// Spot Fleet - The resource type is <code>spot-fleet-request</code> and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.
  /// </li>
  /// <li>
  /// EMR cluster - The resource type is <code>instancegroup</code> and the
  /// unique identifier is the cluster ID and instance group ID. Example:
  /// <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.
  /// </li>
  /// <li>
  /// AppStream 2.0 fleet - The resource type is <code>fleet</code> and the
  /// unique identifier is the fleet name. Example:
  /// <code>fleet/sample-fleet</code>.
  /// </li>
  /// <li>
  /// DynamoDB table - The resource type is <code>table</code> and the unique
  /// identifier is the table name. Example: <code>table/my-table</code>.
  /// </li>
  /// <li>
  /// DynamoDB global secondary index - The resource type is <code>index</code>
  /// and the unique identifier is the index name. Example:
  /// <code>table/my-table/index/my-table-index</code>.
  /// </li>
  /// <li>
  /// Aurora DB cluster - The resource type is <code>cluster</code> and the
  /// unique identifier is the cluster name. Example:
  /// <code>cluster:my-db-cluster</code>.
  /// </li>
  /// <li>
  /// SageMaker endpoint variant - The resource type is <code>variant</code> and
  /// the unique identifier is the resource ID. Example:
  /// <code>endpoint/my-end-point/variant/KMeansClustering</code>.
  /// </li>
  /// <li>
  /// Custom resources are not supported with a resource type. This parameter
  /// must specify the <code>OutputValue</code> from the CloudFormation template
  /// stack used to access the resources. The unique identifier is defined by
  /// the service provider. More information is available in our <a
  /// href="https://github.com/aws/aws-auto-scaling-custom-resource">GitHub
  /// repository</a>.
  /// </li>
  /// <li>
  /// Amazon Comprehend document classification endpoint - The resource type and
  /// unique identifier are specified using the endpoint ARN. Example:
  /// <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Amazon Comprehend entity recognizer endpoint - The resource type and
  /// unique identifier are specified using the endpoint ARN. Example:
  /// <code>arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Lambda provisioned concurrency - The resource type is
  /// <code>function</code> and the unique identifier is the function name with
  /// a function version or alias name suffix that is not <code>$LATEST</code>.
  /// Example: <code>function:my-function:prod</code> or
  /// <code>function:my-function:1</code>.
  /// </li>
  /// <li>
  /// Amazon Keyspaces table - The resource type is <code>table</code> and the
  /// unique identifier is the table name. Example:
  /// <code>keyspace/mykeyspace/table/mytable</code>.
  /// </li>
  /// <li>
  /// Amazon MSK cluster - The resource type and unique identifier are specified
  /// using the cluster ARN. Example:
  /// <code>arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5</code>.
  /// </li>
  /// <li>
  /// Amazon ElastiCache replication group - The resource type is
  /// <code>replication-group</code> and the unique identifier is the
  /// replication group name. Example: <code>replication-group/mycluster</code>.
  /// </li>
  /// <li>
  /// Neptune cluster - The resource type is <code>cluster</code> and the unique
  /// identifier is the cluster name. Example: <code>cluster:mycluster</code>.
  /// </li>
  /// <li>
  /// SageMaker Serverless endpoint - The resource type is <code>variant</code>
  /// and the unique identifier is the resource ID. Example:
  /// <code>endpoint/my-end-point/variant/KMeansClustering</code>.
  /// </li>
  /// <li>
  /// SageMaker inference component - The resource type is
  /// <code>inference-component</code> and the unique identifier is the resource
  /// ID. Example: <code>inference-component/my-inference-component</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [scalableDimension] :
  /// The scalable dimension. This string consists of the service namespace,
  /// resource type, and scaling property. If you specify a scalable dimension,
  /// you must also specify a resource ID.
  ///
  /// <ul>
  /// <li>
  /// <code>ecs:service:DesiredCount</code> - The desired task count of an ECS
  /// service.
  /// </li>
  /// <li>
  /// <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance
  /// count of an EMR Instance Group.
  /// </li>
  /// <li>
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity
  /// of a Spot Fleet.
  /// </li>
  /// <li>
  /// <code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an
  /// AppStream 2.0 fleet.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas
  /// in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  /// </li>
  /// <li>
  /// <code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2
  /// instances for a SageMaker model endpoint variant.
  /// </li>
  /// <li>
  /// <code>custom-resource:ResourceType:Property</code> - The scalable
  /// dimension for a custom resource provided by your own application or
  /// service.
  /// </li>
  /// <li>
  /// <code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code>
  /// - The number of inference units for an Amazon Comprehend document
  /// classification endpoint.
  /// </li>
  /// <li>
  /// <code>comprehend:entity-recognizer-endpoint:DesiredInferenceUnits</code> -
  /// The number of inference units for an Amazon Comprehend entity recognizer
  /// endpoint.
  /// </li>
  /// <li>
  /// <code>lambda:function:ProvisionedConcurrency</code> - The provisioned
  /// concurrency for a Lambda function.
  /// </li>
  /// <li>
  /// <code>cassandra:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for an Amazon Keyspaces table.
  /// </li>
  /// <li>
  /// <code>cassandra:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for an Amazon Keyspaces table.
  /// </li>
  /// <li>
  /// <code>kafka:broker-storage:VolumeSize</code> - The provisioned volume size
  /// (in GiB) for brokers in an Amazon MSK cluster.
  /// </li>
  /// <li>
  /// <code>elasticache:replication-group:NodeGroups</code> - The number of node
  /// groups for an Amazon ElastiCache replication group.
  /// </li>
  /// <li>
  /// <code>elasticache:replication-group:Replicas</code> - The number of
  /// replicas per node group for an Amazon ElastiCache replication group.
  /// </li>
  /// <li>
  /// <code>neptune:cluster:ReadReplicaCount</code> - The count of read replicas
  /// in an Amazon Neptune DB cluster.
  /// </li>
  /// <li>
  /// <code>sagemaker:variant:DesiredProvisionedConcurrency</code> - The
  /// provisioned concurrency for a SageMaker Serverless endpoint.
  /// </li>
  /// <li>
  /// <code>sagemaker:inference-component:DesiredCopyCount</code> - The number
  /// of copies across an endpoint for a SageMaker inference component.
  /// </li>
  /// </ul>
  Future<DescribeScalingPoliciesResponse> describeScalingPolicies({
    required ServiceNamespace serviceNamespace,
    int? maxResults,
    String? nextToken,
    List<String>? policyNames,
    String? resourceId,
    ScalableDimension? scalableDimension,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AnyScaleFrontendService.DescribeScalingPolicies'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServiceNamespace': serviceNamespace.toValue(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (policyNames != null) 'PolicyNames': policyNames,
        if (resourceId != null) 'ResourceId': resourceId,
        if (scalableDimension != null)
          'ScalableDimension': scalableDimension.toValue(),
      },
    );

    return DescribeScalingPoliciesResponse.fromJson(jsonResponse.body);
  }

  /// Describes the Application Auto Scaling scheduled actions for the specified
  /// service namespace.
  ///
  /// You can filter the results using the <code>ResourceId</code>,
  /// <code>ScalableDimension</code>, and <code>ScheduledActionNames</code>
  /// parameters.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html">Scheduled
  /// scaling</a> and <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/scheduled-scaling-additional-cli-commands.html">Managing
  /// scheduled scaling</a> in the <i>Application Auto Scaling User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ConcurrentUpdateException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [serviceNamespace] :
  /// The namespace of the Amazon Web Services service that provides the
  /// resource. For a resource provided by your own application or service, use
  /// <code>custom-resource</code> instead.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of scheduled action results. This value can be between
  /// 1 and 50. The default value is 50.
  ///
  /// If this parameter is used, the operation returns up to
  /// <code>MaxResults</code> results at a time, along with a
  /// <code>NextToken</code> value. To get the next set of results, include the
  /// <code>NextToken</code> value in a subsequent call. If this parameter is
  /// not used, the operation returns up to 50 results and a
  /// <code>NextToken</code> value, if applicable.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [resourceId] :
  /// The identifier of the resource associated with the scheduled action. This
  /// string consists of the resource type and unique identifier.
  ///
  /// <ul>
  /// <li>
  /// ECS service - The resource type is <code>service</code> and the unique
  /// identifier is the cluster name and service name. Example:
  /// <code>service/default/sample-webapp</code>.
  /// </li>
  /// <li>
  /// Spot Fleet - The resource type is <code>spot-fleet-request</code> and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.
  /// </li>
  /// <li>
  /// EMR cluster - The resource type is <code>instancegroup</code> and the
  /// unique identifier is the cluster ID and instance group ID. Example:
  /// <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.
  /// </li>
  /// <li>
  /// AppStream 2.0 fleet - The resource type is <code>fleet</code> and the
  /// unique identifier is the fleet name. Example:
  /// <code>fleet/sample-fleet</code>.
  /// </li>
  /// <li>
  /// DynamoDB table - The resource type is <code>table</code> and the unique
  /// identifier is the table name. Example: <code>table/my-table</code>.
  /// </li>
  /// <li>
  /// DynamoDB global secondary index - The resource type is <code>index</code>
  /// and the unique identifier is the index name. Example:
  /// <code>table/my-table/index/my-table-index</code>.
  /// </li>
  /// <li>
  /// Aurora DB cluster - The resource type is <code>cluster</code> and the
  /// unique identifier is the cluster name. Example:
  /// <code>cluster:my-db-cluster</code>.
  /// </li>
  /// <li>
  /// SageMaker endpoint variant - The resource type is <code>variant</code> and
  /// the unique identifier is the resource ID. Example:
  /// <code>endpoint/my-end-point/variant/KMeansClustering</code>.
  /// </li>
  /// <li>
  /// Custom resources are not supported with a resource type. This parameter
  /// must specify the <code>OutputValue</code> from the CloudFormation template
  /// stack used to access the resources. The unique identifier is defined by
  /// the service provider. More information is available in our <a
  /// href="https://github.com/aws/aws-auto-scaling-custom-resource">GitHub
  /// repository</a>.
  /// </li>
  /// <li>
  /// Amazon Comprehend document classification endpoint - The resource type and
  /// unique identifier are specified using the endpoint ARN. Example:
  /// <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Amazon Comprehend entity recognizer endpoint - The resource type and
  /// unique identifier are specified using the endpoint ARN. Example:
  /// <code>arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Lambda provisioned concurrency - The resource type is
  /// <code>function</code> and the unique identifier is the function name with
  /// a function version or alias name suffix that is not <code>$LATEST</code>.
  /// Example: <code>function:my-function:prod</code> or
  /// <code>function:my-function:1</code>.
  /// </li>
  /// <li>
  /// Amazon Keyspaces table - The resource type is <code>table</code> and the
  /// unique identifier is the table name. Example:
  /// <code>keyspace/mykeyspace/table/mytable</code>.
  /// </li>
  /// <li>
  /// Amazon MSK cluster - The resource type and unique identifier are specified
  /// using the cluster ARN. Example:
  /// <code>arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5</code>.
  /// </li>
  /// <li>
  /// Amazon ElastiCache replication group - The resource type is
  /// <code>replication-group</code> and the unique identifier is the
  /// replication group name. Example: <code>replication-group/mycluster</code>.
  /// </li>
  /// <li>
  /// Neptune cluster - The resource type is <code>cluster</code> and the unique
  /// identifier is the cluster name. Example: <code>cluster:mycluster</code>.
  /// </li>
  /// <li>
  /// SageMaker Serverless endpoint - The resource type is <code>variant</code>
  /// and the unique identifier is the resource ID. Example:
  /// <code>endpoint/my-end-point/variant/KMeansClustering</code>.
  /// </li>
  /// <li>
  /// SageMaker inference component - The resource type is
  /// <code>inference-component</code> and the unique identifier is the resource
  /// ID. Example: <code>inference-component/my-inference-component</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [scalableDimension] :
  /// The scalable dimension. This string consists of the service namespace,
  /// resource type, and scaling property. If you specify a scalable dimension,
  /// you must also specify a resource ID.
  ///
  /// <ul>
  /// <li>
  /// <code>ecs:service:DesiredCount</code> - The desired task count of an ECS
  /// service.
  /// </li>
  /// <li>
  /// <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance
  /// count of an EMR Instance Group.
  /// </li>
  /// <li>
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity
  /// of a Spot Fleet.
  /// </li>
  /// <li>
  /// <code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an
  /// AppStream 2.0 fleet.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas
  /// in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  /// </li>
  /// <li>
  /// <code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2
  /// instances for a SageMaker model endpoint variant.
  /// </li>
  /// <li>
  /// <code>custom-resource:ResourceType:Property</code> - The scalable
  /// dimension for a custom resource provided by your own application or
  /// service.
  /// </li>
  /// <li>
  /// <code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code>
  /// - The number of inference units for an Amazon Comprehend document
  /// classification endpoint.
  /// </li>
  /// <li>
  /// <code>comprehend:entity-recognizer-endpoint:DesiredInferenceUnits</code> -
  /// The number of inference units for an Amazon Comprehend entity recognizer
  /// endpoint.
  /// </li>
  /// <li>
  /// <code>lambda:function:ProvisionedConcurrency</code> - The provisioned
  /// concurrency for a Lambda function.
  /// </li>
  /// <li>
  /// <code>cassandra:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for an Amazon Keyspaces table.
  /// </li>
  /// <li>
  /// <code>cassandra:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for an Amazon Keyspaces table.
  /// </li>
  /// <li>
  /// <code>kafka:broker-storage:VolumeSize</code> - The provisioned volume size
  /// (in GiB) for brokers in an Amazon MSK cluster.
  /// </li>
  /// <li>
  /// <code>elasticache:replication-group:NodeGroups</code> - The number of node
  /// groups for an Amazon ElastiCache replication group.
  /// </li>
  /// <li>
  /// <code>elasticache:replication-group:Replicas</code> - The number of
  /// replicas per node group for an Amazon ElastiCache replication group.
  /// </li>
  /// <li>
  /// <code>neptune:cluster:ReadReplicaCount</code> - The count of read replicas
  /// in an Amazon Neptune DB cluster.
  /// </li>
  /// <li>
  /// <code>sagemaker:variant:DesiredProvisionedConcurrency</code> - The
  /// provisioned concurrency for a SageMaker Serverless endpoint.
  /// </li>
  /// <li>
  /// <code>sagemaker:inference-component:DesiredCopyCount</code> - The number
  /// of copies across an endpoint for a SageMaker inference component.
  /// </li>
  /// </ul>
  ///
  /// Parameter [scheduledActionNames] :
  /// The names of the scheduled actions to describe.
  Future<DescribeScheduledActionsResponse> describeScheduledActions({
    required ServiceNamespace serviceNamespace,
    int? maxResults,
    String? nextToken,
    String? resourceId,
    ScalableDimension? scalableDimension,
    List<String>? scheduledActionNames,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AnyScaleFrontendService.DescribeScheduledActions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ServiceNamespace': serviceNamespace.toValue(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (resourceId != null) 'ResourceId': resourceId,
        if (scalableDimension != null)
          'ScalableDimension': scalableDimension.toValue(),
        if (scheduledActionNames != null)
          'ScheduledActionNames': scheduledActionNames,
      },
    );

    return DescribeScheduledActionsResponse.fromJson(jsonResponse.body);
  }

  /// Returns all the tags on the specified Application Auto Scaling scalable
  /// target.
  ///
  /// For general information about tags, including the format and syntax, see
  /// <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// Specify the ARN of the scalable target.
  ///
  /// For example:
  /// <code>arn:aws:application-autoscaling:us-east-1:123456789012:scalable-target/1234abcd56ab78cd901ef1234567890ab123</code>
  ///
  /// To get the ARN for a scalable target, use <a>DescribeScalableTargets</a>.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AnyScaleFrontendService.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Creates or updates a scaling policy for an Application Auto Scaling
  /// scalable target.
  ///
  /// Each scalable target is identified by a service namespace, resource ID,
  /// and scalable dimension. A scaling policy applies to the scalable target
  /// identified by those three attributes. You cannot create a scaling policy
  /// until you have registered the resource as a scalable target.
  ///
  /// Multiple scaling policies can be in force at the same time for the same
  /// scalable target. You can have one or more target tracking scaling
  /// policies, one or more step scaling policies, or both. However, there is a
  /// chance that multiple policies could conflict, instructing the scalable
  /// target to scale out or in at the same time. Application Auto Scaling gives
  /// precedence to the policy that provides the largest capacity for both scale
  /// out and scale in. For example, if one policy increases capacity by 3,
  /// another policy increases capacity by 200 percent, and the current capacity
  /// is 10, Application Auto Scaling uses the policy with the highest
  /// calculated capacity (200% of 10 = 20) and scales out to 30.
  ///
  /// We recommend caution, however, when using target tracking scaling policies
  /// with step scaling policies because conflicts between these policies can
  /// cause undesirable behavior. For example, if the step scaling policy
  /// initiates a scale-in activity before the target tracking policy is ready
  /// to scale in, the scale-in activity will not be blocked. After the scale-in
  /// activity completes, the target tracking policy could instruct the scalable
  /// target to scale out again.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html">Target
  /// tracking scaling policies</a> and <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html">Step
  /// scaling policies</a> in the <i>Application Auto Scaling User Guide</i>.
  /// <note>
  /// If a scalable target is deregistered, the scalable target is no longer
  /// available to use scaling policies. Any scaling policies that were
  /// specified for the scalable target are deleted.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [ObjectNotFoundException].
  /// May throw [ConcurrentUpdateException].
  /// May throw [FailedResourceAccessException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [policyName] :
  /// The name of the scaling policy.
  ///
  /// You cannot change the name of a scaling policy, but you can delete the
  /// original scaling policy and create a new scaling policy with the same
  /// settings and a different name.
  ///
  /// Parameter [resourceId] :
  /// The identifier of the resource associated with the scaling policy. This
  /// string consists of the resource type and unique identifier.
  ///
  /// <ul>
  /// <li>
  /// ECS service - The resource type is <code>service</code> and the unique
  /// identifier is the cluster name and service name. Example:
  /// <code>service/default/sample-webapp</code>.
  /// </li>
  /// <li>
  /// Spot Fleet - The resource type is <code>spot-fleet-request</code> and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.
  /// </li>
  /// <li>
  /// EMR cluster - The resource type is <code>instancegroup</code> and the
  /// unique identifier is the cluster ID and instance group ID. Example:
  /// <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.
  /// </li>
  /// <li>
  /// AppStream 2.0 fleet - The resource type is <code>fleet</code> and the
  /// unique identifier is the fleet name. Example:
  /// <code>fleet/sample-fleet</code>.
  /// </li>
  /// <li>
  /// DynamoDB table - The resource type is <code>table</code> and the unique
  /// identifier is the table name. Example: <code>table/my-table</code>.
  /// </li>
  /// <li>
  /// DynamoDB global secondary index - The resource type is <code>index</code>
  /// and the unique identifier is the index name. Example:
  /// <code>table/my-table/index/my-table-index</code>.
  /// </li>
  /// <li>
  /// Aurora DB cluster - The resource type is <code>cluster</code> and the
  /// unique identifier is the cluster name. Example:
  /// <code>cluster:my-db-cluster</code>.
  /// </li>
  /// <li>
  /// SageMaker endpoint variant - The resource type is <code>variant</code> and
  /// the unique identifier is the resource ID. Example:
  /// <code>endpoint/my-end-point/variant/KMeansClustering</code>.
  /// </li>
  /// <li>
  /// Custom resources are not supported with a resource type. This parameter
  /// must specify the <code>OutputValue</code> from the CloudFormation template
  /// stack used to access the resources. The unique identifier is defined by
  /// the service provider. More information is available in our <a
  /// href="https://github.com/aws/aws-auto-scaling-custom-resource">GitHub
  /// repository</a>.
  /// </li>
  /// <li>
  /// Amazon Comprehend document classification endpoint - The resource type and
  /// unique identifier are specified using the endpoint ARN. Example:
  /// <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Amazon Comprehend entity recognizer endpoint - The resource type and
  /// unique identifier are specified using the endpoint ARN. Example:
  /// <code>arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Lambda provisioned concurrency - The resource type is
  /// <code>function</code> and the unique identifier is the function name with
  /// a function version or alias name suffix that is not <code>$LATEST</code>.
  /// Example: <code>function:my-function:prod</code> or
  /// <code>function:my-function:1</code>.
  /// </li>
  /// <li>
  /// Amazon Keyspaces table - The resource type is <code>table</code> and the
  /// unique identifier is the table name. Example:
  /// <code>keyspace/mykeyspace/table/mytable</code>.
  /// </li>
  /// <li>
  /// Amazon MSK cluster - The resource type and unique identifier are specified
  /// using the cluster ARN. Example:
  /// <code>arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5</code>.
  /// </li>
  /// <li>
  /// Amazon ElastiCache replication group - The resource type is
  /// <code>replication-group</code> and the unique identifier is the
  /// replication group name. Example: <code>replication-group/mycluster</code>.
  /// </li>
  /// <li>
  /// Neptune cluster - The resource type is <code>cluster</code> and the unique
  /// identifier is the cluster name. Example: <code>cluster:mycluster</code>.
  /// </li>
  /// <li>
  /// SageMaker Serverless endpoint - The resource type is <code>variant</code>
  /// and the unique identifier is the resource ID. Example:
  /// <code>endpoint/my-end-point/variant/KMeansClustering</code>.
  /// </li>
  /// <li>
  /// SageMaker inference component - The resource type is
  /// <code>inference-component</code> and the unique identifier is the resource
  /// ID. Example: <code>inference-component/my-inference-component</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [scalableDimension] :
  /// The scalable dimension. This string consists of the service namespace,
  /// resource type, and scaling property.
  ///
  /// <ul>
  /// <li>
  /// <code>ecs:service:DesiredCount</code> - The desired task count of an ECS
  /// service.
  /// </li>
  /// <li>
  /// <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance
  /// count of an EMR Instance Group.
  /// </li>
  /// <li>
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity
  /// of a Spot Fleet.
  /// </li>
  /// <li>
  /// <code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an
  /// AppStream 2.0 fleet.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas
  /// in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  /// </li>
  /// <li>
  /// <code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2
  /// instances for a SageMaker model endpoint variant.
  /// </li>
  /// <li>
  /// <code>custom-resource:ResourceType:Property</code> - The scalable
  /// dimension for a custom resource provided by your own application or
  /// service.
  /// </li>
  /// <li>
  /// <code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code>
  /// - The number of inference units for an Amazon Comprehend document
  /// classification endpoint.
  /// </li>
  /// <li>
  /// <code>comprehend:entity-recognizer-endpoint:DesiredInferenceUnits</code> -
  /// The number of inference units for an Amazon Comprehend entity recognizer
  /// endpoint.
  /// </li>
  /// <li>
  /// <code>lambda:function:ProvisionedConcurrency</code> - The provisioned
  /// concurrency for a Lambda function.
  /// </li>
  /// <li>
  /// <code>cassandra:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for an Amazon Keyspaces table.
  /// </li>
  /// <li>
  /// <code>cassandra:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for an Amazon Keyspaces table.
  /// </li>
  /// <li>
  /// <code>kafka:broker-storage:VolumeSize</code> - The provisioned volume size
  /// (in GiB) for brokers in an Amazon MSK cluster.
  /// </li>
  /// <li>
  /// <code>elasticache:replication-group:NodeGroups</code> - The number of node
  /// groups for an Amazon ElastiCache replication group.
  /// </li>
  /// <li>
  /// <code>elasticache:replication-group:Replicas</code> - The number of
  /// replicas per node group for an Amazon ElastiCache replication group.
  /// </li>
  /// <li>
  /// <code>neptune:cluster:ReadReplicaCount</code> - The count of read replicas
  /// in an Amazon Neptune DB cluster.
  /// </li>
  /// <li>
  /// <code>sagemaker:variant:DesiredProvisionedConcurrency</code> - The
  /// provisioned concurrency for a SageMaker Serverless endpoint.
  /// </li>
  /// <li>
  /// <code>sagemaker:inference-component:DesiredCopyCount</code> - The number
  /// of copies across an endpoint for a SageMaker inference component.
  /// </li>
  /// </ul>
  ///
  /// Parameter [serviceNamespace] :
  /// The namespace of the Amazon Web Services service that provides the
  /// resource. For a resource provided by your own application or service, use
  /// <code>custom-resource</code> instead.
  ///
  /// Parameter [policyType] :
  /// The scaling policy type. This parameter is required if you are creating a
  /// scaling policy.
  ///
  /// The following policy types are supported:
  ///
  /// <code>TargetTrackingScaling</code>—Not supported for Amazon EMR.
  ///
  /// <code>StepScaling</code>—Not supported for DynamoDB, Amazon Comprehend,
  /// Lambda, Amazon Keyspaces, Amazon MSK, Amazon ElastiCache, or Neptune.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html">Target
  /// tracking scaling policies</a> and <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html">Step
  /// scaling policies</a> in the <i>Application Auto Scaling User Guide</i>.
  ///
  /// Parameter [stepScalingPolicyConfiguration] :
  /// A step scaling policy.
  ///
  /// This parameter is required if you are creating a policy and the policy
  /// type is <code>StepScaling</code>.
  ///
  /// Parameter [targetTrackingScalingPolicyConfiguration] :
  /// A target tracking scaling policy. Includes support for predefined or
  /// customized metrics.
  ///
  /// This parameter is required if you are creating a policy and the policy
  /// type is <code>TargetTrackingScaling</code>.
  Future<PutScalingPolicyResponse> putScalingPolicy({
    required String policyName,
    required String resourceId,
    required ScalableDimension scalableDimension,
    required ServiceNamespace serviceNamespace,
    PolicyType? policyType,
    StepScalingPolicyConfiguration? stepScalingPolicyConfiguration,
    TargetTrackingScalingPolicyConfiguration?
        targetTrackingScalingPolicyConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AnyScaleFrontendService.PutScalingPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'PolicyName': policyName,
        'ResourceId': resourceId,
        'ScalableDimension': scalableDimension.toValue(),
        'ServiceNamespace': serviceNamespace.toValue(),
        if (policyType != null) 'PolicyType': policyType.toValue(),
        if (stepScalingPolicyConfiguration != null)
          'StepScalingPolicyConfiguration': stepScalingPolicyConfiguration,
        if (targetTrackingScalingPolicyConfiguration != null)
          'TargetTrackingScalingPolicyConfiguration':
              targetTrackingScalingPolicyConfiguration,
      },
    );

    return PutScalingPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Creates or updates a scheduled action for an Application Auto Scaling
  /// scalable target.
  ///
  /// Each scalable target is identified by a service namespace, resource ID,
  /// and scalable dimension. A scheduled action applies to the scalable target
  /// identified by those three attributes. You cannot create a scheduled action
  /// until you have registered the resource as a scalable target.
  ///
  /// When you specify start and end times with a recurring schedule using a
  /// cron expression or rates, they form the boundaries for when the recurring
  /// action starts and stops.
  ///
  /// To update a scheduled action, specify the parameters that you want to
  /// change. If you don't specify start and end times, the old values are
  /// deleted.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html">Scheduled
  /// scaling</a> in the <i>Application Auto Scaling User Guide</i>.
  /// <note>
  /// If a scalable target is deregistered, the scalable target is no longer
  /// available to run scheduled actions. Any scheduled actions that were
  /// specified for the scalable target are deleted.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [ObjectNotFoundException].
  /// May throw [ConcurrentUpdateException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [resourceId] :
  /// The identifier of the resource associated with the scheduled action. This
  /// string consists of the resource type and unique identifier.
  ///
  /// <ul>
  /// <li>
  /// ECS service - The resource type is <code>service</code> and the unique
  /// identifier is the cluster name and service name. Example:
  /// <code>service/default/sample-webapp</code>.
  /// </li>
  /// <li>
  /// Spot Fleet - The resource type is <code>spot-fleet-request</code> and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.
  /// </li>
  /// <li>
  /// EMR cluster - The resource type is <code>instancegroup</code> and the
  /// unique identifier is the cluster ID and instance group ID. Example:
  /// <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.
  /// </li>
  /// <li>
  /// AppStream 2.0 fleet - The resource type is <code>fleet</code> and the
  /// unique identifier is the fleet name. Example:
  /// <code>fleet/sample-fleet</code>.
  /// </li>
  /// <li>
  /// DynamoDB table - The resource type is <code>table</code> and the unique
  /// identifier is the table name. Example: <code>table/my-table</code>.
  /// </li>
  /// <li>
  /// DynamoDB global secondary index - The resource type is <code>index</code>
  /// and the unique identifier is the index name. Example:
  /// <code>table/my-table/index/my-table-index</code>.
  /// </li>
  /// <li>
  /// Aurora DB cluster - The resource type is <code>cluster</code> and the
  /// unique identifier is the cluster name. Example:
  /// <code>cluster:my-db-cluster</code>.
  /// </li>
  /// <li>
  /// SageMaker endpoint variant - The resource type is <code>variant</code> and
  /// the unique identifier is the resource ID. Example:
  /// <code>endpoint/my-end-point/variant/KMeansClustering</code>.
  /// </li>
  /// <li>
  /// Custom resources are not supported with a resource type. This parameter
  /// must specify the <code>OutputValue</code> from the CloudFormation template
  /// stack used to access the resources. The unique identifier is defined by
  /// the service provider. More information is available in our <a
  /// href="https://github.com/aws/aws-auto-scaling-custom-resource">GitHub
  /// repository</a>.
  /// </li>
  /// <li>
  /// Amazon Comprehend document classification endpoint - The resource type and
  /// unique identifier are specified using the endpoint ARN. Example:
  /// <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Amazon Comprehend entity recognizer endpoint - The resource type and
  /// unique identifier are specified using the endpoint ARN. Example:
  /// <code>arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Lambda provisioned concurrency - The resource type is
  /// <code>function</code> and the unique identifier is the function name with
  /// a function version or alias name suffix that is not <code>$LATEST</code>.
  /// Example: <code>function:my-function:prod</code> or
  /// <code>function:my-function:1</code>.
  /// </li>
  /// <li>
  /// Amazon Keyspaces table - The resource type is <code>table</code> and the
  /// unique identifier is the table name. Example:
  /// <code>keyspace/mykeyspace/table/mytable</code>.
  /// </li>
  /// <li>
  /// Amazon MSK cluster - The resource type and unique identifier are specified
  /// using the cluster ARN. Example:
  /// <code>arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5</code>.
  /// </li>
  /// <li>
  /// Amazon ElastiCache replication group - The resource type is
  /// <code>replication-group</code> and the unique identifier is the
  /// replication group name. Example: <code>replication-group/mycluster</code>.
  /// </li>
  /// <li>
  /// Neptune cluster - The resource type is <code>cluster</code> and the unique
  /// identifier is the cluster name. Example: <code>cluster:mycluster</code>.
  /// </li>
  /// <li>
  /// SageMaker Serverless endpoint - The resource type is <code>variant</code>
  /// and the unique identifier is the resource ID. Example:
  /// <code>endpoint/my-end-point/variant/KMeansClustering</code>.
  /// </li>
  /// <li>
  /// SageMaker inference component - The resource type is
  /// <code>inference-component</code> and the unique identifier is the resource
  /// ID. Example: <code>inference-component/my-inference-component</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [scalableDimension] :
  /// The scalable dimension. This string consists of the service namespace,
  /// resource type, and scaling property.
  ///
  /// <ul>
  /// <li>
  /// <code>ecs:service:DesiredCount</code> - The desired task count of an ECS
  /// service.
  /// </li>
  /// <li>
  /// <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance
  /// count of an EMR Instance Group.
  /// </li>
  /// <li>
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity
  /// of a Spot Fleet.
  /// </li>
  /// <li>
  /// <code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an
  /// AppStream 2.0 fleet.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas
  /// in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  /// </li>
  /// <li>
  /// <code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2
  /// instances for a SageMaker model endpoint variant.
  /// </li>
  /// <li>
  /// <code>custom-resource:ResourceType:Property</code> - The scalable
  /// dimension for a custom resource provided by your own application or
  /// service.
  /// </li>
  /// <li>
  /// <code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code>
  /// - The number of inference units for an Amazon Comprehend document
  /// classification endpoint.
  /// </li>
  /// <li>
  /// <code>comprehend:entity-recognizer-endpoint:DesiredInferenceUnits</code> -
  /// The number of inference units for an Amazon Comprehend entity recognizer
  /// endpoint.
  /// </li>
  /// <li>
  /// <code>lambda:function:ProvisionedConcurrency</code> - The provisioned
  /// concurrency for a Lambda function.
  /// </li>
  /// <li>
  /// <code>cassandra:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for an Amazon Keyspaces table.
  /// </li>
  /// <li>
  /// <code>cassandra:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for an Amazon Keyspaces table.
  /// </li>
  /// <li>
  /// <code>kafka:broker-storage:VolumeSize</code> - The provisioned volume size
  /// (in GiB) for brokers in an Amazon MSK cluster.
  /// </li>
  /// <li>
  /// <code>elasticache:replication-group:NodeGroups</code> - The number of node
  /// groups for an Amazon ElastiCache replication group.
  /// </li>
  /// <li>
  /// <code>elasticache:replication-group:Replicas</code> - The number of
  /// replicas per node group for an Amazon ElastiCache replication group.
  /// </li>
  /// <li>
  /// <code>neptune:cluster:ReadReplicaCount</code> - The count of read replicas
  /// in an Amazon Neptune DB cluster.
  /// </li>
  /// <li>
  /// <code>sagemaker:variant:DesiredProvisionedConcurrency</code> - The
  /// provisioned concurrency for a SageMaker Serverless endpoint.
  /// </li>
  /// <li>
  /// <code>sagemaker:inference-component:DesiredCopyCount</code> - The number
  /// of copies across an endpoint for a SageMaker inference component.
  /// </li>
  /// </ul>
  ///
  /// Parameter [scheduledActionName] :
  /// The name of the scheduled action. This name must be unique among all other
  /// scheduled actions on the specified scalable target.
  ///
  /// Parameter [serviceNamespace] :
  /// The namespace of the Amazon Web Services service that provides the
  /// resource. For a resource provided by your own application or service, use
  /// <code>custom-resource</code> instead.
  ///
  /// Parameter [endTime] :
  /// The date and time for the recurring schedule to end, in UTC.
  ///
  /// Parameter [scalableTargetAction] :
  /// The new minimum and maximum capacity. You can set both values or just one.
  /// At the scheduled time, if the current capacity is below the minimum
  /// capacity, Application Auto Scaling scales out to the minimum capacity. If
  /// the current capacity is above the maximum capacity, Application Auto
  /// Scaling scales in to the maximum capacity.
  ///
  /// Parameter [schedule] :
  /// The schedule for this action. The following formats are supported:
  ///
  /// <ul>
  /// <li>
  /// At expressions -
  /// "<code>at(<i>yyyy</i>-<i>mm</i>-<i>dd</i>T<i>hh</i>:<i>mm</i>:<i>ss</i>)</code>"
  /// </li>
  /// <li>
  /// Rate expressions - "<code>rate(<i>value</i> <i>unit</i>)</code>"
  /// </li>
  /// <li>
  /// Cron expressions - "<code>cron(<i>fields</i>)</code>"
  /// </li>
  /// </ul>
  /// At expressions are useful for one-time schedules. Cron expressions are
  /// useful for scheduled actions that run periodically at a specified date and
  /// time, and rate expressions are useful for scheduled actions that run at a
  /// regular interval.
  ///
  /// At and cron expressions use Universal Coordinated Time (UTC) by default.
  ///
  /// The cron format consists of six fields separated by white spaces:
  /// [Minutes] [Hours] [Day_of_Month] [Month] [Day_of_Week] [Year].
  ///
  /// For rate expressions, <i>value</i> is a positive integer and <i>unit</i>
  /// is <code>minute</code> | <code>minutes</code> | <code>hour</code> |
  /// <code>hours</code> | <code>day</code> | <code>days</code>.
  ///
  /// For more information and examples, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/examples-scheduled-actions.html">Example
  /// scheduled actions for Application Auto Scaling</a> in the <i>Application
  /// Auto Scaling User Guide</i>.
  ///
  /// Parameter [startTime] :
  /// The date and time for this scheduled action to start, in UTC.
  ///
  /// Parameter [timezone] :
  /// Specifies the time zone used when setting a scheduled action by using an
  /// at or cron expression. If a time zone is not provided, UTC is used by
  /// default.
  ///
  /// Valid values are the canonical names of the IANA time zones supported by
  /// Joda-Time (such as <code>Etc/GMT+9</code> or <code>Pacific/Tahiti</code>).
  /// For more information, see <a
  /// href="https://www.joda.org/joda-time/timezones.html">https://www.joda.org/joda-time/timezones.html</a>.
  Future<void> putScheduledAction({
    required String resourceId,
    required ScalableDimension scalableDimension,
    required String scheduledActionName,
    required ServiceNamespace serviceNamespace,
    DateTime? endTime,
    ScalableTargetAction? scalableTargetAction,
    String? schedule,
    DateTime? startTime,
    String? timezone,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AnyScaleFrontendService.PutScheduledAction'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'ScalableDimension': scalableDimension.toValue(),
        'ScheduledActionName': scheduledActionName,
        'ServiceNamespace': serviceNamespace.toValue(),
        if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
        if (scalableTargetAction != null)
          'ScalableTargetAction': scalableTargetAction,
        if (schedule != null) 'Schedule': schedule,
        if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
        if (timezone != null) 'Timezone': timezone,
      },
    );
  }

  /// Registers or updates a scalable target, which is the resource that you
  /// want to scale.
  ///
  /// Scalable targets are uniquely identified by the combination of resource
  /// ID, scalable dimension, and namespace, which represents some capacity
  /// dimension of the underlying service.
  ///
  /// When you register a new scalable target, you must specify values for the
  /// minimum and maximum capacity. If the specified resource is not active in
  /// the target service, this operation does not change the resource's current
  /// capacity. Otherwise, it changes the resource's current capacity to a value
  /// that is inside of this range.
  ///
  /// If you add a scaling policy, current capacity is adjustable within the
  /// specified range when scaling starts. Application Auto Scaling scaling
  /// policies will not scale capacity to values that are outside of the minimum
  /// and maximum range.
  ///
  /// After you register a scalable target, you do not need to register it again
  /// to use other Application Auto Scaling operations. To see which resources
  /// have been registered, use <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DescribeScalableTargets.html">DescribeScalableTargets</a>.
  /// You can also view the scaling policies for a service namespace by using <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DescribeScalableTargets.html">DescribeScalableTargets</a>.
  /// If you no longer need a scalable target, you can deregister it by using <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DeregisterScalableTarget.html">DeregisterScalableTarget</a>.
  ///
  /// To update a scalable target, specify the parameters that you want to
  /// change. Include the parameters that identify the scalable target: resource
  /// ID, scalable dimension, and namespace. Any parameters that you don't
  /// specify are not changed by this update request.
  /// <note>
  /// If you call the <code>RegisterScalableTarget</code> API operation to
  /// create a scalable target, there might be a brief delay until the operation
  /// achieves <a
  /// href="https://en.wikipedia.org/wiki/Eventual_consistency">eventual
  /// consistency</a>. You might become aware of this brief delay if you get
  /// unexpected errors when performing sequential operations. The typical
  /// strategy is to retry the request, and some Amazon Web Services SDKs
  /// include automatic backoff and retry logic.
  ///
  /// If you call the <code>RegisterScalableTarget</code> API operation to
  /// update an existing scalable target, Application Auto Scaling retrieves the
  /// current capacity of the resource. If it's below the minimum capacity or
  /// above the maximum capacity, Application Auto Scaling adjusts the capacity
  /// of the scalable target to place it within these bounds, even if you don't
  /// include the <code>MinCapacity</code> or <code>MaxCapacity</code> request
  /// parameters.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [LimitExceededException].
  /// May throw [ConcurrentUpdateException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [resourceId] :
  /// The identifier of the resource that is associated with the scalable
  /// target. This string consists of the resource type and unique identifier.
  ///
  /// <ul>
  /// <li>
  /// ECS service - The resource type is <code>service</code> and the unique
  /// identifier is the cluster name and service name. Example:
  /// <code>service/default/sample-webapp</code>.
  /// </li>
  /// <li>
  /// Spot Fleet - The resource type is <code>spot-fleet-request</code> and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.
  /// </li>
  /// <li>
  /// EMR cluster - The resource type is <code>instancegroup</code> and the
  /// unique identifier is the cluster ID and instance group ID. Example:
  /// <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.
  /// </li>
  /// <li>
  /// AppStream 2.0 fleet - The resource type is <code>fleet</code> and the
  /// unique identifier is the fleet name. Example:
  /// <code>fleet/sample-fleet</code>.
  /// </li>
  /// <li>
  /// DynamoDB table - The resource type is <code>table</code> and the unique
  /// identifier is the table name. Example: <code>table/my-table</code>.
  /// </li>
  /// <li>
  /// DynamoDB global secondary index - The resource type is <code>index</code>
  /// and the unique identifier is the index name. Example:
  /// <code>table/my-table/index/my-table-index</code>.
  /// </li>
  /// <li>
  /// Aurora DB cluster - The resource type is <code>cluster</code> and the
  /// unique identifier is the cluster name. Example:
  /// <code>cluster:my-db-cluster</code>.
  /// </li>
  /// <li>
  /// SageMaker endpoint variant - The resource type is <code>variant</code> and
  /// the unique identifier is the resource ID. Example:
  /// <code>endpoint/my-end-point/variant/KMeansClustering</code>.
  /// </li>
  /// <li>
  /// Custom resources are not supported with a resource type. This parameter
  /// must specify the <code>OutputValue</code> from the CloudFormation template
  /// stack used to access the resources. The unique identifier is defined by
  /// the service provider. More information is available in our <a
  /// href="https://github.com/aws/aws-auto-scaling-custom-resource">GitHub
  /// repository</a>.
  /// </li>
  /// <li>
  /// Amazon Comprehend document classification endpoint - The resource type and
  /// unique identifier are specified using the endpoint ARN. Example:
  /// <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Amazon Comprehend entity recognizer endpoint - The resource type and
  /// unique identifier are specified using the endpoint ARN. Example:
  /// <code>arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Lambda provisioned concurrency - The resource type is
  /// <code>function</code> and the unique identifier is the function name with
  /// a function version or alias name suffix that is not <code>$LATEST</code>.
  /// Example: <code>function:my-function:prod</code> or
  /// <code>function:my-function:1</code>.
  /// </li>
  /// <li>
  /// Amazon Keyspaces table - The resource type is <code>table</code> and the
  /// unique identifier is the table name. Example:
  /// <code>keyspace/mykeyspace/table/mytable</code>.
  /// </li>
  /// <li>
  /// Amazon MSK cluster - The resource type and unique identifier are specified
  /// using the cluster ARN. Example:
  /// <code>arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5</code>.
  /// </li>
  /// <li>
  /// Amazon ElastiCache replication group - The resource type is
  /// <code>replication-group</code> and the unique identifier is the
  /// replication group name. Example: <code>replication-group/mycluster</code>.
  /// </li>
  /// <li>
  /// Neptune cluster - The resource type is <code>cluster</code> and the unique
  /// identifier is the cluster name. Example: <code>cluster:mycluster</code>.
  /// </li>
  /// <li>
  /// SageMaker Serverless endpoint - The resource type is <code>variant</code>
  /// and the unique identifier is the resource ID. Example:
  /// <code>endpoint/my-end-point/variant/KMeansClustering</code>.
  /// </li>
  /// <li>
  /// SageMaker inference component - The resource type is
  /// <code>inference-component</code> and the unique identifier is the resource
  /// ID. Example: <code>inference-component/my-inference-component</code>.
  /// </li>
  /// </ul>
  ///
  /// Parameter [scalableDimension] :
  /// The scalable dimension associated with the scalable target. This string
  /// consists of the service namespace, resource type, and scaling property.
  ///
  /// <ul>
  /// <li>
  /// <code>ecs:service:DesiredCount</code> - The desired task count of an ECS
  /// service.
  /// </li>
  /// <li>
  /// <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance
  /// count of an EMR Instance Group.
  /// </li>
  /// <li>
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity
  /// of a Spot Fleet.
  /// </li>
  /// <li>
  /// <code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an
  /// AppStream 2.0 fleet.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas
  /// in an Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  /// </li>
  /// <li>
  /// <code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2
  /// instances for a SageMaker model endpoint variant.
  /// </li>
  /// <li>
  /// <code>custom-resource:ResourceType:Property</code> - The scalable
  /// dimension for a custom resource provided by your own application or
  /// service.
  /// </li>
  /// <li>
  /// <code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code>
  /// - The number of inference units for an Amazon Comprehend document
  /// classification endpoint.
  /// </li>
  /// <li>
  /// <code>comprehend:entity-recognizer-endpoint:DesiredInferenceUnits</code> -
  /// The number of inference units for an Amazon Comprehend entity recognizer
  /// endpoint.
  /// </li>
  /// <li>
  /// <code>lambda:function:ProvisionedConcurrency</code> - The provisioned
  /// concurrency for a Lambda function.
  /// </li>
  /// <li>
  /// <code>cassandra:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for an Amazon Keyspaces table.
  /// </li>
  /// <li>
  /// <code>cassandra:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for an Amazon Keyspaces table.
  /// </li>
  /// <li>
  /// <code>kafka:broker-storage:VolumeSize</code> - The provisioned volume size
  /// (in GiB) for brokers in an Amazon MSK cluster.
  /// </li>
  /// <li>
  /// <code>elasticache:replication-group:NodeGroups</code> - The number of node
  /// groups for an Amazon ElastiCache replication group.
  /// </li>
  /// <li>
  /// <code>elasticache:replication-group:Replicas</code> - The number of
  /// replicas per node group for an Amazon ElastiCache replication group.
  /// </li>
  /// <li>
  /// <code>neptune:cluster:ReadReplicaCount</code> - The count of read replicas
  /// in an Amazon Neptune DB cluster.
  /// </li>
  /// <li>
  /// <code>sagemaker:variant:DesiredProvisionedConcurrency</code> - The
  /// provisioned concurrency for a SageMaker Serverless endpoint.
  /// </li>
  /// <li>
  /// <code>sagemaker:inference-component:DesiredCopyCount</code> - The number
  /// of copies across an endpoint for a SageMaker inference component.
  /// </li>
  /// </ul>
  ///
  /// Parameter [serviceNamespace] :
  /// The namespace of the Amazon Web Services service that provides the
  /// resource. For a resource provided by your own application or service, use
  /// <code>custom-resource</code> instead.
  ///
  /// Parameter [maxCapacity] :
  /// The maximum value that you plan to scale out to. When a scaling policy is
  /// in effect, Application Auto Scaling can scale out (expand) as needed to
  /// the maximum capacity limit in response to changing demand. This property
  /// is required when registering a new scalable target.
  ///
  /// Although you can specify a large maximum capacity, note that service
  /// quotas might impose lower limits. Each service has its own default quotas
  /// for the maximum capacity of the resource. If you want to specify a higher
  /// limit, you can request an increase. For more information, consult the
  /// documentation for that service. For information about the default quotas
  /// for each service, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-service-information.html">Service
  /// endpoints and quotas</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  ///
  /// Parameter [minCapacity] :
  /// The minimum value that you plan to scale in to. When a scaling policy is
  /// in effect, Application Auto Scaling can scale in (contract) as needed to
  /// the minimum capacity limit in response to changing demand. This property
  /// is required when registering a new scalable target.
  ///
  /// For the following resources, the minimum value allowed is 0.
  ///
  /// <ul>
  /// <li>
  /// AppStream 2.0 fleets
  /// </li>
  /// <li>
  /// Aurora DB clusters
  /// </li>
  /// <li>
  /// ECS services
  /// </li>
  /// <li>
  /// EMR clusters
  /// </li>
  /// <li>
  /// Lambda provisioned concurrency
  /// </li>
  /// <li>
  /// SageMaker endpoint variants
  /// </li>
  /// <li>
  /// SageMaker Serverless endpoint provisioned concurrency
  /// </li>
  /// <li>
  /// Spot Fleets
  /// </li>
  /// <li>
  /// custom resources
  /// </li>
  /// </ul>
  /// It's strongly recommended that you specify a value greater than 0. A value
  /// greater than 0 means that data points are continuously reported to
  /// CloudWatch that scaling policies can use to scale on a metric like average
  /// CPU utilization.
  ///
  /// For all other resources, the minimum allowed value depends on the type of
  /// resource that you are using. If you provide a value that is lower than
  /// what a resource can accept, an error occurs. In which case, the error
  /// message will provide the minimum value that the resource can accept.
  ///
  /// Parameter [roleARN] :
  /// This parameter is required for services that do not support service-linked
  /// roles (such as Amazon EMR), and it must specify the ARN of an IAM role
  /// that allows Application Auto Scaling to modify the scalable target on your
  /// behalf.
  ///
  /// If the service supports service-linked roles, Application Auto Scaling
  /// uses a service-linked role, which it creates if it does not yet exist. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/security_iam_service-with-iam.html#security_iam_service-with-iam-roles">Application
  /// Auto Scaling IAM roles</a>.
  ///
  /// Parameter [suspendedState] :
  /// An embedded object that contains attributes and attribute values that are
  /// used to suspend and resume automatic scaling. Setting the value of an
  /// attribute to <code>true</code> suspends the specified scaling activities.
  /// Setting it to <code>false</code> (default) resumes the specified scaling
  /// activities.
  ///
  /// <b>Suspension Outcomes</b>
  ///
  /// <ul>
  /// <li>
  /// For <code>DynamicScalingInSuspended</code>, while a suspension is in
  /// effect, all scale-in activities that are triggered by a scaling policy are
  /// suspended.
  /// </li>
  /// <li>
  /// For <code>DynamicScalingOutSuspended</code>, while a suspension is in
  /// effect, all scale-out activities that are triggered by a scaling policy
  /// are suspended.
  /// </li>
  /// <li>
  /// For <code>ScheduledScalingSuspended</code>, while a suspension is in
  /// effect, all scaling activities that involve scheduled actions are
  /// suspended.
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-suspend-resume-scaling.html">Suspending
  /// and resuming scaling</a> in the <i>Application Auto Scaling User
  /// Guide</i>.
  ///
  /// Parameter [tags] :
  /// Assigns one or more tags to the scalable target. Use this parameter to tag
  /// the scalable target when it is created. To tag an existing scalable
  /// target, use the <a>TagResource</a> operation.
  ///
  /// Each tag consists of a tag key and a tag value. Both the tag key and the
  /// tag value are required. You cannot have more than one tag on a scalable
  /// target with the same tag key.
  ///
  /// Use tags to control access to a scalable target. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/resource-tagging-support.html">Tagging
  /// support for Application Auto Scaling</a> in the <i>Application Auto
  /// Scaling User Guide</i>.
  Future<RegisterScalableTargetResponse> registerScalableTarget({
    required String resourceId,
    required ScalableDimension scalableDimension,
    required ServiceNamespace serviceNamespace,
    int? maxCapacity,
    int? minCapacity,
    String? roleARN,
    SuspendedState? suspendedState,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AnyScaleFrontendService.RegisterScalableTarget'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'ScalableDimension': scalableDimension.toValue(),
        'ServiceNamespace': serviceNamespace.toValue(),
        if (maxCapacity != null) 'MaxCapacity': maxCapacity,
        if (minCapacity != null) 'MinCapacity': minCapacity,
        if (roleARN != null) 'RoleARN': roleARN,
        if (suspendedState != null) 'SuspendedState': suspendedState,
        if (tags != null) 'Tags': tags,
      },
    );

    return RegisterScalableTargetResponse.fromJson(jsonResponse.body);
  }

  /// Adds or edits tags on an Application Auto Scaling scalable target.
  ///
  /// Each tag consists of a tag key and a tag value, which are both
  /// case-sensitive strings. To add a tag, specify a new tag key and a tag
  /// value. To edit a tag, specify an existing tag key and a new tag value.
  ///
  /// You can use this operation to tag an Application Auto Scaling scalable
  /// target, but you cannot tag a scaling policy or scheduled action.
  ///
  /// You can also add tags to an Application Auto Scaling scalable target while
  /// creating it (<code>RegisterScalableTarget</code>).
  ///
  /// For general information about tags, including the format and syntax, see
  /// <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  ///
  /// Use tags to control access to a scalable target. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/resource-tagging-support.html">Tagging
  /// support for Application Auto Scaling</a> in the <i>Application Auto
  /// Scaling User Guide</i>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyTagsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceARN] :
  /// Identifies the Application Auto Scaling scalable target that you want to
  /// apply tags to.
  ///
  /// For example:
  /// <code>arn:aws:application-autoscaling:us-east-1:123456789012:scalable-target/1234abcd56ab78cd901ef1234567890ab123</code>
  ///
  /// To get the ARN for a scalable target, use <a>DescribeScalableTargets</a>.
  ///
  /// Parameter [tags] :
  /// The tags assigned to the resource. A tag is a label that you assign to an
  /// Amazon Web Services resource.
  ///
  /// Each tag consists of a tag key and a tag value.
  ///
  /// You cannot have more than one tag on an Application Auto Scaling scalable
  /// target with the same tag key. If you specify an existing tag key with a
  /// different tag value, Application Auto Scaling replaces the current tag
  /// value with the specified one.
  ///
  /// For information about the rules that apply to tag keys and tag values, see
  /// <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html">User-defined
  /// tag restrictions</a> in the <i>Amazon Web Services Billing and Cost
  /// Management User Guide</i>.
  Future<void> tagResource({
    required String resourceARN,
    required Map<String, String> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AnyScaleFrontendService.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'Tags': tags,
      },
    );
  }

  /// Deletes tags from an Application Auto Scaling scalable target. To delete a
  /// tag, specify the tag key and the Application Auto Scaling scalable target.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceARN] :
  /// Identifies the Application Auto Scaling scalable target from which to
  /// remove tags.
  ///
  /// For example:
  /// <code>arn:aws:application-autoscaling:us-east-1:123456789012:scalable-target/1234abcd56ab78cd901ef1234567890ab123</code>
  ///
  /// To get the ARN for a scalable target, use <a>DescribeScalableTargets</a>.
  ///
  /// Parameter [tagKeys] :
  /// One or more tag keys. Specify only the tag keys, not the tag values.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AnyScaleFrontendService.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'TagKeys': tagKeys,
      },
    );
  }
}

enum AdjustmentType {
  changeInCapacity,
  percentChangeInCapacity,
  exactCapacity,
}

extension AdjustmentTypeValueExtension on AdjustmentType {
  String toValue() {
    switch (this) {
      case AdjustmentType.changeInCapacity:
        return 'ChangeInCapacity';
      case AdjustmentType.percentChangeInCapacity:
        return 'PercentChangeInCapacity';
      case AdjustmentType.exactCapacity:
        return 'ExactCapacity';
    }
  }
}

extension AdjustmentTypeFromString on String {
  AdjustmentType toAdjustmentType() {
    switch (this) {
      case 'ChangeInCapacity':
        return AdjustmentType.changeInCapacity;
      case 'PercentChangeInCapacity':
        return AdjustmentType.percentChangeInCapacity;
      case 'ExactCapacity':
        return AdjustmentType.exactCapacity;
    }
    throw Exception('$this is not known in enum AdjustmentType');
  }
}

/// Represents a CloudWatch alarm associated with a scaling policy.
class Alarm {
  /// The Amazon Resource Name (ARN) of the alarm.
  final String alarmARN;

  /// The name of the alarm.
  final String alarmName;

  Alarm({
    required this.alarmARN,
    required this.alarmName,
  });

  factory Alarm.fromJson(Map<String, dynamic> json) {
    return Alarm(
      alarmARN: json['AlarmARN'] as String,
      alarmName: json['AlarmName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final alarmARN = this.alarmARN;
    final alarmName = this.alarmName;
    return {
      'AlarmARN': alarmARN,
      'AlarmName': alarmName,
    };
  }
}

/// Represents a CloudWatch metric of your choosing for a target tracking
/// scaling policy to use with Application Auto Scaling.
///
/// For information about the available metrics for a service, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html">Amazon
/// Web Services services that publish CloudWatch metrics</a> in the <i>Amazon
/// CloudWatch User Guide</i>.
///
/// To create your customized metric specification:
///
/// <ul>
/// <li>
/// Add values for each required parameter from CloudWatch. You can use an
/// existing metric, or a new metric that you create. To use your own metric,
/// you must first publish the metric to CloudWatch. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/publishingMetrics.html">Publish
/// custom metrics</a> in the <i>Amazon CloudWatch User Guide</i>.
/// </li>
/// <li>
/// Choose a metric that changes proportionally with capacity. The value of the
/// metric should increase or decrease in inverse proportion to the number of
/// capacity units. That is, the value of the metric should decrease when
/// capacity increases, and increase when capacity decreases.
/// </li>
/// </ul>
/// For more information about the CloudWatch terminology below, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html">Amazon
/// CloudWatch concepts</a> in the <i>Amazon CloudWatch User Guide</i>.
class CustomizedMetricSpecification {
  /// The dimensions of the metric.
  ///
  /// Conditional: If you published your metric with dimensions, you must specify
  /// the same dimensions in your scaling policy.
  final List<MetricDimension>? dimensions;

  /// The name of the metric. To get the exact metric name, namespace, and
  /// dimensions, inspect the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_Metric.html">Metric</a>
  /// object that's returned by a call to <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_ListMetrics.html">ListMetrics</a>.
  final String? metricName;

  /// The metrics to include in the target tracking scaling policy, as a metric
  /// data query. This can include both raw metric and metric math expressions.
  final List<TargetTrackingMetricDataQuery>? metrics;

  /// The namespace of the metric.
  final String? namespace;

  /// The statistic of the metric.
  final MetricStatistic? statistic;

  /// The unit of the metric. For a complete list of the units that CloudWatch
  /// supports, see the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_MetricDatum.html">MetricDatum</a>
  /// data type in the <i>Amazon CloudWatch API Reference</i>.
  final String? unit;

  CustomizedMetricSpecification({
    this.dimensions,
    this.metricName,
    this.metrics,
    this.namespace,
    this.statistic,
    this.unit,
  });

  factory CustomizedMetricSpecification.fromJson(Map<String, dynamic> json) {
    return CustomizedMetricSpecification(
      dimensions: (json['Dimensions'] as List?)
          ?.whereNotNull()
          .map((e) => MetricDimension.fromJson(e as Map<String, dynamic>))
          .toList(),
      metricName: json['MetricName'] as String?,
      metrics: (json['Metrics'] as List?)
          ?.whereNotNull()
          .map((e) =>
              TargetTrackingMetricDataQuery.fromJson(e as Map<String, dynamic>))
          .toList(),
      namespace: json['Namespace'] as String?,
      statistic: (json['Statistic'] as String?)?.toMetricStatistic(),
      unit: json['Unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dimensions = this.dimensions;
    final metricName = this.metricName;
    final metrics = this.metrics;
    final namespace = this.namespace;
    final statistic = this.statistic;
    final unit = this.unit;
    return {
      if (dimensions != null) 'Dimensions': dimensions,
      if (metricName != null) 'MetricName': metricName,
      if (metrics != null) 'Metrics': metrics,
      if (namespace != null) 'Namespace': namespace,
      if (statistic != null) 'Statistic': statistic.toValue(),
      if (unit != null) 'Unit': unit,
    };
  }
}

class DeleteScalingPolicyResponse {
  DeleteScalingPolicyResponse();

  factory DeleteScalingPolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteScalingPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteScheduledActionResponse {
  DeleteScheduledActionResponse();

  factory DeleteScheduledActionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteScheduledActionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeregisterScalableTargetResponse {
  DeregisterScalableTargetResponse();

  factory DeregisterScalableTargetResponse.fromJson(Map<String, dynamic> _) {
    return DeregisterScalableTargetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeScalableTargetsResponse {
  /// The token required to get the next set of results. This value is
  /// <code>null</code> if there are no more results to return.
  final String? nextToken;

  /// The scalable targets that match the request parameters.
  final List<ScalableTarget>? scalableTargets;

  DescribeScalableTargetsResponse({
    this.nextToken,
    this.scalableTargets,
  });

  factory DescribeScalableTargetsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeScalableTargetsResponse(
      nextToken: json['NextToken'] as String?,
      scalableTargets: (json['ScalableTargets'] as List?)
          ?.whereNotNull()
          .map((e) => ScalableTarget.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final scalableTargets = this.scalableTargets;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (scalableTargets != null) 'ScalableTargets': scalableTargets,
    };
  }
}

class DescribeScalingActivitiesResponse {
  /// The token required to get the next set of results. This value is
  /// <code>null</code> if there are no more results to return.
  final String? nextToken;

  /// A list of scaling activity objects.
  final List<ScalingActivity>? scalingActivities;

  DescribeScalingActivitiesResponse({
    this.nextToken,
    this.scalingActivities,
  });

  factory DescribeScalingActivitiesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeScalingActivitiesResponse(
      nextToken: json['NextToken'] as String?,
      scalingActivities: (json['ScalingActivities'] as List?)
          ?.whereNotNull()
          .map((e) => ScalingActivity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final scalingActivities = this.scalingActivities;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (scalingActivities != null) 'ScalingActivities': scalingActivities,
    };
  }
}

class DescribeScalingPoliciesResponse {
  /// The token required to get the next set of results. This value is
  /// <code>null</code> if there are no more results to return.
  final String? nextToken;

  /// Information about the scaling policies.
  final List<ScalingPolicy>? scalingPolicies;

  DescribeScalingPoliciesResponse({
    this.nextToken,
    this.scalingPolicies,
  });

  factory DescribeScalingPoliciesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeScalingPoliciesResponse(
      nextToken: json['NextToken'] as String?,
      scalingPolicies: (json['ScalingPolicies'] as List?)
          ?.whereNotNull()
          .map((e) => ScalingPolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final scalingPolicies = this.scalingPolicies;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (scalingPolicies != null) 'ScalingPolicies': scalingPolicies,
    };
  }
}

class DescribeScheduledActionsResponse {
  /// The token required to get the next set of results. This value is
  /// <code>null</code> if there are no more results to return.
  final String? nextToken;

  /// Information about the scheduled actions.
  final List<ScheduledAction>? scheduledActions;

  DescribeScheduledActionsResponse({
    this.nextToken,
    this.scheduledActions,
  });

  factory DescribeScheduledActionsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeScheduledActionsResponse(
      nextToken: json['NextToken'] as String?,
      scheduledActions: (json['ScheduledActions'] as List?)
          ?.whereNotNull()
          .map((e) => ScheduledAction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final scheduledActions = this.scheduledActions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (scheduledActions != null) 'ScheduledActions': scheduledActions,
    };
  }
}

class ListTagsForResourceResponse {
  /// A list of tags. Each tag consists of a tag key and a tag value.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

enum MetricAggregationType {
  average,
  minimum,
  maximum,
}

extension MetricAggregationTypeValueExtension on MetricAggregationType {
  String toValue() {
    switch (this) {
      case MetricAggregationType.average:
        return 'Average';
      case MetricAggregationType.minimum:
        return 'Minimum';
      case MetricAggregationType.maximum:
        return 'Maximum';
    }
  }
}

extension MetricAggregationTypeFromString on String {
  MetricAggregationType toMetricAggregationType() {
    switch (this) {
      case 'Average':
        return MetricAggregationType.average;
      case 'Minimum':
        return MetricAggregationType.minimum;
      case 'Maximum':
        return MetricAggregationType.maximum;
    }
    throw Exception('$this is not known in enum MetricAggregationType');
  }
}

/// Describes the dimension names and values associated with a metric.
class MetricDimension {
  /// The name of the dimension.
  final String name;

  /// The value of the dimension.
  final String value;

  MetricDimension({
    required this.name,
    required this.value,
  });

  factory MetricDimension.fromJson(Map<String, dynamic> json) {
    return MetricDimension(
      name: json['Name'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'Name': name,
      'Value': value,
    };
  }
}

enum MetricStatistic {
  average,
  minimum,
  maximum,
  sampleCount,
  sum,
}

extension MetricStatisticValueExtension on MetricStatistic {
  String toValue() {
    switch (this) {
      case MetricStatistic.average:
        return 'Average';
      case MetricStatistic.minimum:
        return 'Minimum';
      case MetricStatistic.maximum:
        return 'Maximum';
      case MetricStatistic.sampleCount:
        return 'SampleCount';
      case MetricStatistic.sum:
        return 'Sum';
    }
  }
}

extension MetricStatisticFromString on String {
  MetricStatistic toMetricStatistic() {
    switch (this) {
      case 'Average':
        return MetricStatistic.average;
      case 'Minimum':
        return MetricStatistic.minimum;
      case 'Maximum':
        return MetricStatistic.maximum;
      case 'SampleCount':
        return MetricStatistic.sampleCount;
      case 'Sum':
        return MetricStatistic.sum;
    }
    throw Exception('$this is not known in enum MetricStatistic');
  }
}

enum MetricType {
  dynamoDBReadCapacityUtilization,
  dynamoDBWriteCapacityUtilization,
  aLBRequestCountPerTarget,
  rDSReaderAverageCPUUtilization,
  rDSReaderAverageDatabaseConnections,
  eC2SpotFleetRequestAverageCPUUtilization,
  eC2SpotFleetRequestAverageNetworkIn,
  eC2SpotFleetRequestAverageNetworkOut,
  sageMakerVariantInvocationsPerInstance,
  eCSServiceAverageCPUUtilization,
  eCSServiceAverageMemoryUtilization,
  appStreamAverageCapacityUtilization,
  comprehendInferenceUtilization,
  lambdaProvisionedConcurrencyUtilization,
  cassandraReadCapacityUtilization,
  cassandraWriteCapacityUtilization,
  kafkaBrokerStorageUtilization,
  elastiCachePrimaryEngineCPUUtilization,
  elastiCacheReplicaEngineCPUUtilization,
  elastiCacheDatabaseMemoryUsageCountedForEvictPercentage,
  neptuneReaderAverageCPUUtilization,
  sageMakerVariantProvisionedConcurrencyUtilization,
  elastiCacheDatabaseCapacityUsageCountedForEvictPercentage,
  sageMakerInferenceComponentInvocationsPerCopy,
}

extension MetricTypeValueExtension on MetricType {
  String toValue() {
    switch (this) {
      case MetricType.dynamoDBReadCapacityUtilization:
        return 'DynamoDBReadCapacityUtilization';
      case MetricType.dynamoDBWriteCapacityUtilization:
        return 'DynamoDBWriteCapacityUtilization';
      case MetricType.aLBRequestCountPerTarget:
        return 'ALBRequestCountPerTarget';
      case MetricType.rDSReaderAverageCPUUtilization:
        return 'RDSReaderAverageCPUUtilization';
      case MetricType.rDSReaderAverageDatabaseConnections:
        return 'RDSReaderAverageDatabaseConnections';
      case MetricType.eC2SpotFleetRequestAverageCPUUtilization:
        return 'EC2SpotFleetRequestAverageCPUUtilization';
      case MetricType.eC2SpotFleetRequestAverageNetworkIn:
        return 'EC2SpotFleetRequestAverageNetworkIn';
      case MetricType.eC2SpotFleetRequestAverageNetworkOut:
        return 'EC2SpotFleetRequestAverageNetworkOut';
      case MetricType.sageMakerVariantInvocationsPerInstance:
        return 'SageMakerVariantInvocationsPerInstance';
      case MetricType.eCSServiceAverageCPUUtilization:
        return 'ECSServiceAverageCPUUtilization';
      case MetricType.eCSServiceAverageMemoryUtilization:
        return 'ECSServiceAverageMemoryUtilization';
      case MetricType.appStreamAverageCapacityUtilization:
        return 'AppStreamAverageCapacityUtilization';
      case MetricType.comprehendInferenceUtilization:
        return 'ComprehendInferenceUtilization';
      case MetricType.lambdaProvisionedConcurrencyUtilization:
        return 'LambdaProvisionedConcurrencyUtilization';
      case MetricType.cassandraReadCapacityUtilization:
        return 'CassandraReadCapacityUtilization';
      case MetricType.cassandraWriteCapacityUtilization:
        return 'CassandraWriteCapacityUtilization';
      case MetricType.kafkaBrokerStorageUtilization:
        return 'KafkaBrokerStorageUtilization';
      case MetricType.elastiCachePrimaryEngineCPUUtilization:
        return 'ElastiCachePrimaryEngineCPUUtilization';
      case MetricType.elastiCacheReplicaEngineCPUUtilization:
        return 'ElastiCacheReplicaEngineCPUUtilization';
      case MetricType.elastiCacheDatabaseMemoryUsageCountedForEvictPercentage:
        return 'ElastiCacheDatabaseMemoryUsageCountedForEvictPercentage';
      case MetricType.neptuneReaderAverageCPUUtilization:
        return 'NeptuneReaderAverageCPUUtilization';
      case MetricType.sageMakerVariantProvisionedConcurrencyUtilization:
        return 'SageMakerVariantProvisionedConcurrencyUtilization';
      case MetricType.elastiCacheDatabaseCapacityUsageCountedForEvictPercentage:
        return 'ElastiCacheDatabaseCapacityUsageCountedForEvictPercentage';
      case MetricType.sageMakerInferenceComponentInvocationsPerCopy:
        return 'SageMakerInferenceComponentInvocationsPerCopy';
    }
  }
}

extension MetricTypeFromString on String {
  MetricType toMetricType() {
    switch (this) {
      case 'DynamoDBReadCapacityUtilization':
        return MetricType.dynamoDBReadCapacityUtilization;
      case 'DynamoDBWriteCapacityUtilization':
        return MetricType.dynamoDBWriteCapacityUtilization;
      case 'ALBRequestCountPerTarget':
        return MetricType.aLBRequestCountPerTarget;
      case 'RDSReaderAverageCPUUtilization':
        return MetricType.rDSReaderAverageCPUUtilization;
      case 'RDSReaderAverageDatabaseConnections':
        return MetricType.rDSReaderAverageDatabaseConnections;
      case 'EC2SpotFleetRequestAverageCPUUtilization':
        return MetricType.eC2SpotFleetRequestAverageCPUUtilization;
      case 'EC2SpotFleetRequestAverageNetworkIn':
        return MetricType.eC2SpotFleetRequestAverageNetworkIn;
      case 'EC2SpotFleetRequestAverageNetworkOut':
        return MetricType.eC2SpotFleetRequestAverageNetworkOut;
      case 'SageMakerVariantInvocationsPerInstance':
        return MetricType.sageMakerVariantInvocationsPerInstance;
      case 'ECSServiceAverageCPUUtilization':
        return MetricType.eCSServiceAverageCPUUtilization;
      case 'ECSServiceAverageMemoryUtilization':
        return MetricType.eCSServiceAverageMemoryUtilization;
      case 'AppStreamAverageCapacityUtilization':
        return MetricType.appStreamAverageCapacityUtilization;
      case 'ComprehendInferenceUtilization':
        return MetricType.comprehendInferenceUtilization;
      case 'LambdaProvisionedConcurrencyUtilization':
        return MetricType.lambdaProvisionedConcurrencyUtilization;
      case 'CassandraReadCapacityUtilization':
        return MetricType.cassandraReadCapacityUtilization;
      case 'CassandraWriteCapacityUtilization':
        return MetricType.cassandraWriteCapacityUtilization;
      case 'KafkaBrokerStorageUtilization':
        return MetricType.kafkaBrokerStorageUtilization;
      case 'ElastiCachePrimaryEngineCPUUtilization':
        return MetricType.elastiCachePrimaryEngineCPUUtilization;
      case 'ElastiCacheReplicaEngineCPUUtilization':
        return MetricType.elastiCacheReplicaEngineCPUUtilization;
      case 'ElastiCacheDatabaseMemoryUsageCountedForEvictPercentage':
        return MetricType
            .elastiCacheDatabaseMemoryUsageCountedForEvictPercentage;
      case 'NeptuneReaderAverageCPUUtilization':
        return MetricType.neptuneReaderAverageCPUUtilization;
      case 'SageMakerVariantProvisionedConcurrencyUtilization':
        return MetricType.sageMakerVariantProvisionedConcurrencyUtilization;
      case 'ElastiCacheDatabaseCapacityUsageCountedForEvictPercentage':
        return MetricType
            .elastiCacheDatabaseCapacityUsageCountedForEvictPercentage;
      case 'SageMakerInferenceComponentInvocationsPerCopy':
        return MetricType.sageMakerInferenceComponentInvocationsPerCopy;
    }
    throw Exception('$this is not known in enum MetricType');
  }
}

/// Describes the reason for an activity that isn't scaled (<i>not scaled
/// activity</i>), in machine-readable format. For help interpreting the not
/// scaled reason details, see <a
/// href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scaling-activities.html">Scaling
/// activities for Application Auto Scaling</a>.
class NotScaledReason {
  /// A code that represents the reason for not scaling.
  ///
  /// Valid values:
  ///
  /// <ul>
  /// <li>
  /// AutoScalingAnticipatedFlapping
  /// </li>
  /// <li>
  /// TargetServicePutResourceAsUnscalable
  /// </li>
  /// <li>
  /// AlreadyAtMaxCapacity
  /// </li>
  /// <li>
  /// AlreadyAtMinCapacity
  /// </li>
  /// <li>
  /// AlreadyAtDesiredCapacity
  /// </li>
  /// </ul>
  final String code;

  /// The current capacity.
  final int? currentCapacity;

  /// The maximum capacity.
  final int? maxCapacity;

  /// The minimum capacity.
  final int? minCapacity;

  NotScaledReason({
    required this.code,
    this.currentCapacity,
    this.maxCapacity,
    this.minCapacity,
  });

  factory NotScaledReason.fromJson(Map<String, dynamic> json) {
    return NotScaledReason(
      code: json['Code'] as String,
      currentCapacity: json['CurrentCapacity'] as int?,
      maxCapacity: json['MaxCapacity'] as int?,
      minCapacity: json['MinCapacity'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final currentCapacity = this.currentCapacity;
    final maxCapacity = this.maxCapacity;
    final minCapacity = this.minCapacity;
    return {
      'Code': code,
      if (currentCapacity != null) 'CurrentCapacity': currentCapacity,
      if (maxCapacity != null) 'MaxCapacity': maxCapacity,
      if (minCapacity != null) 'MinCapacity': minCapacity,
    };
  }
}

enum PolicyType {
  stepScaling,
  targetTrackingScaling,
}

extension PolicyTypeValueExtension on PolicyType {
  String toValue() {
    switch (this) {
      case PolicyType.stepScaling:
        return 'StepScaling';
      case PolicyType.targetTrackingScaling:
        return 'TargetTrackingScaling';
    }
  }
}

extension PolicyTypeFromString on String {
  PolicyType toPolicyType() {
    switch (this) {
      case 'StepScaling':
        return PolicyType.stepScaling;
      case 'TargetTrackingScaling':
        return PolicyType.targetTrackingScaling;
    }
    throw Exception('$this is not known in enum PolicyType');
  }
}

/// Represents a predefined metric for a target tracking scaling policy to use
/// with Application Auto Scaling.
///
/// Only the Amazon Web Services that you're using send metrics to Amazon
/// CloudWatch. To determine whether a desired metric already exists by looking
/// up its namespace and dimension using the CloudWatch metrics dashboard in the
/// console, follow the procedure in <a
/// href="https://docs.aws.amazon.com/autoscaling/application/userguide/monitoring-cloudwatch.html">Monitor
/// your resources using CloudWatch</a> in the <i>Application Auto Scaling User
/// Guide</i>.
class PredefinedMetricSpecification {
  /// The metric type. The <code>ALBRequestCountPerTarget</code> metric type
  /// applies only to Spot Fleets and ECS services.
  final MetricType predefinedMetricType;

  /// Identifies the resource associated with the metric type. You can't specify a
  /// resource label unless the metric type is
  /// <code>ALBRequestCountPerTarget</code> and there is a target group attached
  /// to the Spot Fleet or ECS service.
  ///
  /// You create the resource label by appending the final portion of the load
  /// balancer ARN and the final portion of the target group ARN into a single
  /// value, separated by a forward slash (/). The format of the resource label
  /// is:
  ///
  /// <code>app/my-alb/778d41231b141a0f/targetgroup/my-alb-target-group/943f017f100becff</code>.
  ///
  /// Where:
  ///
  /// <ul>
  /// <li>
  /// app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt; is the final portion
  /// of the load balancer ARN
  /// </li>
  /// <li>
  /// targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt; is the final
  /// portion of the target group ARN.
  /// </li>
  /// </ul>
  /// To find the ARN for an Application Load Balancer, use the <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeLoadBalancers.html">DescribeLoadBalancers</a>
  /// API operation. To find the ARN for the target group, use the <a
  /// href="https://docs.aws.amazon.com/elasticloadbalancing/latest/APIReference/API_DescribeTargetGroups.html">DescribeTargetGroups</a>
  /// API operation.
  final String? resourceLabel;

  PredefinedMetricSpecification({
    required this.predefinedMetricType,
    this.resourceLabel,
  });

  factory PredefinedMetricSpecification.fromJson(Map<String, dynamic> json) {
    return PredefinedMetricSpecification(
      predefinedMetricType:
          (json['PredefinedMetricType'] as String).toMetricType(),
      resourceLabel: json['ResourceLabel'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final predefinedMetricType = this.predefinedMetricType;
    final resourceLabel = this.resourceLabel;
    return {
      'PredefinedMetricType': predefinedMetricType.toValue(),
      if (resourceLabel != null) 'ResourceLabel': resourceLabel,
    };
  }
}

class PutScalingPolicyResponse {
  /// The Amazon Resource Name (ARN) of the resulting scaling policy.
  final String policyARN;

  /// The CloudWatch alarms created for the target tracking scaling policy.
  final List<Alarm>? alarms;

  PutScalingPolicyResponse({
    required this.policyARN,
    this.alarms,
  });

  factory PutScalingPolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutScalingPolicyResponse(
      policyARN: json['PolicyARN'] as String,
      alarms: (json['Alarms'] as List?)
          ?.whereNotNull()
          .map((e) => Alarm.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final policyARN = this.policyARN;
    final alarms = this.alarms;
    return {
      'PolicyARN': policyARN,
      if (alarms != null) 'Alarms': alarms,
    };
  }
}

class PutScheduledActionResponse {
  PutScheduledActionResponse();

  factory PutScheduledActionResponse.fromJson(Map<String, dynamic> _) {
    return PutScheduledActionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class RegisterScalableTargetResponse {
  /// The ARN of the scalable target.
  final String? scalableTargetARN;

  RegisterScalableTargetResponse({
    this.scalableTargetARN,
  });

  factory RegisterScalableTargetResponse.fromJson(Map<String, dynamic> json) {
    return RegisterScalableTargetResponse(
      scalableTargetARN: json['ScalableTargetARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final scalableTargetARN = this.scalableTargetARN;
    return {
      if (scalableTargetARN != null) 'ScalableTargetARN': scalableTargetARN,
    };
  }
}

enum ScalableDimension {
  ecsServiceDesiredCount,
  ec2SpotFleetRequestTargetCapacity,
  elasticmapreduceInstancegroupInstanceCount,
  appstreamFleetDesiredCapacity,
  dynamodbTableReadCapacityUnits,
  dynamodbTableWriteCapacityUnits,
  dynamodbIndexReadCapacityUnits,
  dynamodbIndexWriteCapacityUnits,
  rdsClusterReadReplicaCount,
  sagemakerVariantDesiredInstanceCount,
  customResourceResourceTypeProperty,
  comprehendDocumentClassifierEndpointDesiredInferenceUnits,
  comprehendEntityRecognizerEndpointDesiredInferenceUnits,
  lambdaFunctionProvisionedConcurrency,
  cassandraTableReadCapacityUnits,
  cassandraTableWriteCapacityUnits,
  kafkaBrokerStorageVolumeSize,
  elasticacheReplicationGroupNodeGroups,
  elasticacheReplicationGroupReplicas,
  neptuneClusterReadReplicaCount,
  sagemakerVariantDesiredProvisionedConcurrency,
  sagemakerInferenceComponentDesiredCopyCount,
}

extension ScalableDimensionValueExtension on ScalableDimension {
  String toValue() {
    switch (this) {
      case ScalableDimension.ecsServiceDesiredCount:
        return 'ecs:service:DesiredCount';
      case ScalableDimension.ec2SpotFleetRequestTargetCapacity:
        return 'ec2:spot-fleet-request:TargetCapacity';
      case ScalableDimension.elasticmapreduceInstancegroupInstanceCount:
        return 'elasticmapreduce:instancegroup:InstanceCount';
      case ScalableDimension.appstreamFleetDesiredCapacity:
        return 'appstream:fleet:DesiredCapacity';
      case ScalableDimension.dynamodbTableReadCapacityUnits:
        return 'dynamodb:table:ReadCapacityUnits';
      case ScalableDimension.dynamodbTableWriteCapacityUnits:
        return 'dynamodb:table:WriteCapacityUnits';
      case ScalableDimension.dynamodbIndexReadCapacityUnits:
        return 'dynamodb:index:ReadCapacityUnits';
      case ScalableDimension.dynamodbIndexWriteCapacityUnits:
        return 'dynamodb:index:WriteCapacityUnits';
      case ScalableDimension.rdsClusterReadReplicaCount:
        return 'rds:cluster:ReadReplicaCount';
      case ScalableDimension.sagemakerVariantDesiredInstanceCount:
        return 'sagemaker:variant:DesiredInstanceCount';
      case ScalableDimension.customResourceResourceTypeProperty:
        return 'custom-resource:ResourceType:Property';
      case ScalableDimension
            .comprehendDocumentClassifierEndpointDesiredInferenceUnits:
        return 'comprehend:document-classifier-endpoint:DesiredInferenceUnits';
      case ScalableDimension
            .comprehendEntityRecognizerEndpointDesiredInferenceUnits:
        return 'comprehend:entity-recognizer-endpoint:DesiredInferenceUnits';
      case ScalableDimension.lambdaFunctionProvisionedConcurrency:
        return 'lambda:function:ProvisionedConcurrency';
      case ScalableDimension.cassandraTableReadCapacityUnits:
        return 'cassandra:table:ReadCapacityUnits';
      case ScalableDimension.cassandraTableWriteCapacityUnits:
        return 'cassandra:table:WriteCapacityUnits';
      case ScalableDimension.kafkaBrokerStorageVolumeSize:
        return 'kafka:broker-storage:VolumeSize';
      case ScalableDimension.elasticacheReplicationGroupNodeGroups:
        return 'elasticache:replication-group:NodeGroups';
      case ScalableDimension.elasticacheReplicationGroupReplicas:
        return 'elasticache:replication-group:Replicas';
      case ScalableDimension.neptuneClusterReadReplicaCount:
        return 'neptune:cluster:ReadReplicaCount';
      case ScalableDimension.sagemakerVariantDesiredProvisionedConcurrency:
        return 'sagemaker:variant:DesiredProvisionedConcurrency';
      case ScalableDimension.sagemakerInferenceComponentDesiredCopyCount:
        return 'sagemaker:inference-component:DesiredCopyCount';
    }
  }
}

extension ScalableDimensionFromString on String {
  ScalableDimension toScalableDimension() {
    switch (this) {
      case 'ecs:service:DesiredCount':
        return ScalableDimension.ecsServiceDesiredCount;
      case 'ec2:spot-fleet-request:TargetCapacity':
        return ScalableDimension.ec2SpotFleetRequestTargetCapacity;
      case 'elasticmapreduce:instancegroup:InstanceCount':
        return ScalableDimension.elasticmapreduceInstancegroupInstanceCount;
      case 'appstream:fleet:DesiredCapacity':
        return ScalableDimension.appstreamFleetDesiredCapacity;
      case 'dynamodb:table:ReadCapacityUnits':
        return ScalableDimension.dynamodbTableReadCapacityUnits;
      case 'dynamodb:table:WriteCapacityUnits':
        return ScalableDimension.dynamodbTableWriteCapacityUnits;
      case 'dynamodb:index:ReadCapacityUnits':
        return ScalableDimension.dynamodbIndexReadCapacityUnits;
      case 'dynamodb:index:WriteCapacityUnits':
        return ScalableDimension.dynamodbIndexWriteCapacityUnits;
      case 'rds:cluster:ReadReplicaCount':
        return ScalableDimension.rdsClusterReadReplicaCount;
      case 'sagemaker:variant:DesiredInstanceCount':
        return ScalableDimension.sagemakerVariantDesiredInstanceCount;
      case 'custom-resource:ResourceType:Property':
        return ScalableDimension.customResourceResourceTypeProperty;
      case 'comprehend:document-classifier-endpoint:DesiredInferenceUnits':
        return ScalableDimension
            .comprehendDocumentClassifierEndpointDesiredInferenceUnits;
      case 'comprehend:entity-recognizer-endpoint:DesiredInferenceUnits':
        return ScalableDimension
            .comprehendEntityRecognizerEndpointDesiredInferenceUnits;
      case 'lambda:function:ProvisionedConcurrency':
        return ScalableDimension.lambdaFunctionProvisionedConcurrency;
      case 'cassandra:table:ReadCapacityUnits':
        return ScalableDimension.cassandraTableReadCapacityUnits;
      case 'cassandra:table:WriteCapacityUnits':
        return ScalableDimension.cassandraTableWriteCapacityUnits;
      case 'kafka:broker-storage:VolumeSize':
        return ScalableDimension.kafkaBrokerStorageVolumeSize;
      case 'elasticache:replication-group:NodeGroups':
        return ScalableDimension.elasticacheReplicationGroupNodeGroups;
      case 'elasticache:replication-group:Replicas':
        return ScalableDimension.elasticacheReplicationGroupReplicas;
      case 'neptune:cluster:ReadReplicaCount':
        return ScalableDimension.neptuneClusterReadReplicaCount;
      case 'sagemaker:variant:DesiredProvisionedConcurrency':
        return ScalableDimension.sagemakerVariantDesiredProvisionedConcurrency;
      case 'sagemaker:inference-component:DesiredCopyCount':
        return ScalableDimension.sagemakerInferenceComponentDesiredCopyCount;
    }
    throw Exception('$this is not known in enum ScalableDimension');
  }
}

/// Represents a scalable target.
class ScalableTarget {
  /// The Unix timestamp for when the scalable target was created.
  final DateTime creationTime;

  /// The maximum value to scale to in response to a scale-out activity.
  final int maxCapacity;

  /// The minimum value to scale to in response to a scale-in activity.
  final int minCapacity;

  /// The identifier of the resource associated with the scalable target. This
  /// string consists of the resource type and unique identifier.
  ///
  /// <ul>
  /// <li>
  /// ECS service - The resource type is <code>service</code> and the unique
  /// identifier is the cluster name and service name. Example:
  /// <code>service/default/sample-webapp</code>.
  /// </li>
  /// <li>
  /// Spot Fleet - The resource type is <code>spot-fleet-request</code> and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.
  /// </li>
  /// <li>
  /// EMR cluster - The resource type is <code>instancegroup</code> and the unique
  /// identifier is the cluster ID and instance group ID. Example:
  /// <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.
  /// </li>
  /// <li>
  /// AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique
  /// identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.
  /// </li>
  /// <li>
  /// DynamoDB table - The resource type is <code>table</code> and the unique
  /// identifier is the table name. Example: <code>table/my-table</code>.
  /// </li>
  /// <li>
  /// DynamoDB global secondary index - The resource type is <code>index</code>
  /// and the unique identifier is the index name. Example:
  /// <code>table/my-table/index/my-table-index</code>.
  /// </li>
  /// <li>
  /// Aurora DB cluster - The resource type is <code>cluster</code> and the unique
  /// identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.
  /// </li>
  /// <li>
  /// SageMaker endpoint variant - The resource type is <code>variant</code> and
  /// the unique identifier is the resource ID. Example:
  /// <code>endpoint/my-end-point/variant/KMeansClustering</code>.
  /// </li>
  /// <li>
  /// Custom resources are not supported with a resource type. This parameter must
  /// specify the <code>OutputValue</code> from the CloudFormation template stack
  /// used to access the resources. The unique identifier is defined by the
  /// service provider. More information is available in our <a
  /// href="https://github.com/aws/aws-auto-scaling-custom-resource">GitHub
  /// repository</a>.
  /// </li>
  /// <li>
  /// Amazon Comprehend document classification endpoint - The resource type and
  /// unique identifier are specified using the endpoint ARN. Example:
  /// <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Amazon Comprehend entity recognizer endpoint - The resource type and unique
  /// identifier are specified using the endpoint ARN. Example:
  /// <code>arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Lambda provisioned concurrency - The resource type is <code>function</code>
  /// and the unique identifier is the function name with a function version or
  /// alias name suffix that is not <code>$LATEST</code>. Example:
  /// <code>function:my-function:prod</code> or
  /// <code>function:my-function:1</code>.
  /// </li>
  /// <li>
  /// Amazon Keyspaces table - The resource type is <code>table</code> and the
  /// unique identifier is the table name. Example:
  /// <code>keyspace/mykeyspace/table/mytable</code>.
  /// </li>
  /// <li>
  /// Amazon MSK cluster - The resource type and unique identifier are specified
  /// using the cluster ARN. Example:
  /// <code>arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5</code>.
  /// </li>
  /// <li>
  /// Amazon ElastiCache replication group - The resource type is
  /// <code>replication-group</code> and the unique identifier is the replication
  /// group name. Example: <code>replication-group/mycluster</code>.
  /// </li>
  /// <li>
  /// Neptune cluster - The resource type is <code>cluster</code> and the unique
  /// identifier is the cluster name. Example: <code>cluster:mycluster</code>.
  /// </li>
  /// <li>
  /// SageMaker Serverless endpoint - The resource type is <code>variant</code>
  /// and the unique identifier is the resource ID. Example:
  /// <code>endpoint/my-end-point/variant/KMeansClustering</code>.
  /// </li>
  /// <li>
  /// SageMaker inference component - The resource type is
  /// <code>inference-component</code> and the unique identifier is the resource
  /// ID. Example: <code>inference-component/my-inference-component</code>.
  /// </li>
  /// </ul>
  final String resourceId;

  /// The ARN of an IAM role that allows Application Auto Scaling to modify the
  /// scalable target on your behalf.
  final String roleARN;

  /// The scalable dimension associated with the scalable target. This string
  /// consists of the service namespace, resource type, and scaling property.
  ///
  /// <ul>
  /// <li>
  /// <code>ecs:service:DesiredCount</code> - The desired task count of an ECS
  /// service.
  /// </li>
  /// <li>
  /// <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance
  /// count of an EMR Instance Group.
  /// </li>
  /// <li>
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of
  /// a Spot Fleet.
  /// </li>
  /// <li>
  /// <code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an
  /// AppStream 2.0 fleet.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in
  /// an Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  /// </li>
  /// <li>
  /// <code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2
  /// instances for a SageMaker model endpoint variant.
  /// </li>
  /// <li>
  /// <code>custom-resource:ResourceType:Property</code> - The scalable dimension
  /// for a custom resource provided by your own application or service.
  /// </li>
  /// <li>
  /// <code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> -
  /// The number of inference units for an Amazon Comprehend document
  /// classification endpoint.
  /// </li>
  /// <li>
  /// <code>comprehend:entity-recognizer-endpoint:DesiredInferenceUnits</code> -
  /// The number of inference units for an Amazon Comprehend entity recognizer
  /// endpoint.
  /// </li>
  /// <li>
  /// <code>lambda:function:ProvisionedConcurrency</code> - The provisioned
  /// concurrency for a Lambda function.
  /// </li>
  /// <li>
  /// <code>cassandra:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for an Amazon Keyspaces table.
  /// </li>
  /// <li>
  /// <code>cassandra:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for an Amazon Keyspaces table.
  /// </li>
  /// <li>
  /// <code>kafka:broker-storage:VolumeSize</code> - The provisioned volume size
  /// (in GiB) for brokers in an Amazon MSK cluster.
  /// </li>
  /// <li>
  /// <code>elasticache:replication-group:NodeGroups</code> - The number of node
  /// groups for an Amazon ElastiCache replication group.
  /// </li>
  /// <li>
  /// <code>elasticache:replication-group:Replicas</code> - The number of replicas
  /// per node group for an Amazon ElastiCache replication group.
  /// </li>
  /// <li>
  /// <code>neptune:cluster:ReadReplicaCount</code> - The count of read replicas
  /// in an Amazon Neptune DB cluster.
  /// </li>
  /// <li>
  /// <code>sagemaker:variant:DesiredProvisionedConcurrency</code> - The
  /// provisioned concurrency for a SageMaker Serverless endpoint.
  /// </li>
  /// <li>
  /// <code>sagemaker:inference-component:DesiredCopyCount</code> - The number of
  /// copies across an endpoint for a SageMaker inference component.
  /// </li>
  /// </ul>
  final ScalableDimension scalableDimension;

  /// The namespace of the Amazon Web Services service that provides the resource,
  /// or a <code>custom-resource</code>.
  final ServiceNamespace serviceNamespace;

  /// The ARN of the scalable target.
  final String? scalableTargetARN;

  /// Specifies whether the scaling activities for a scalable target are in a
  /// suspended state.
  final SuspendedState? suspendedState;

  ScalableTarget({
    required this.creationTime,
    required this.maxCapacity,
    required this.minCapacity,
    required this.resourceId,
    required this.roleARN,
    required this.scalableDimension,
    required this.serviceNamespace,
    this.scalableTargetARN,
    this.suspendedState,
  });

  factory ScalableTarget.fromJson(Map<String, dynamic> json) {
    return ScalableTarget(
      creationTime:
          nonNullableTimeStampFromJson(json['CreationTime'] as Object),
      maxCapacity: json['MaxCapacity'] as int,
      minCapacity: json['MinCapacity'] as int,
      resourceId: json['ResourceId'] as String,
      roleARN: json['RoleARN'] as String,
      scalableDimension:
          (json['ScalableDimension'] as String).toScalableDimension(),
      serviceNamespace:
          (json['ServiceNamespace'] as String).toServiceNamespace(),
      scalableTargetARN: json['ScalableTargetARN'] as String?,
      suspendedState: json['SuspendedState'] != null
          ? SuspendedState.fromJson(
              json['SuspendedState'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final maxCapacity = this.maxCapacity;
    final minCapacity = this.minCapacity;
    final resourceId = this.resourceId;
    final roleARN = this.roleARN;
    final scalableDimension = this.scalableDimension;
    final serviceNamespace = this.serviceNamespace;
    final scalableTargetARN = this.scalableTargetARN;
    final suspendedState = this.suspendedState;
    return {
      'CreationTime': unixTimestampToJson(creationTime),
      'MaxCapacity': maxCapacity,
      'MinCapacity': minCapacity,
      'ResourceId': resourceId,
      'RoleARN': roleARN,
      'ScalableDimension': scalableDimension.toValue(),
      'ServiceNamespace': serviceNamespace.toValue(),
      if (scalableTargetARN != null) 'ScalableTargetARN': scalableTargetARN,
      if (suspendedState != null) 'SuspendedState': suspendedState,
    };
  }
}

/// Represents the minimum and maximum capacity for a scheduled action.
class ScalableTargetAction {
  /// The maximum capacity.
  ///
  /// Although you can specify a large maximum capacity, note that service quotas
  /// may impose lower limits. Each service has its own default quotas for the
  /// maximum capacity of the resource. If you want to specify a higher limit, you
  /// can request an increase. For more information, consult the documentation for
  /// that service. For information about the default quotas for each service, see
  /// <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-service-information.html">Service
  /// endpoints and quotas</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  final int? maxCapacity;

  /// The minimum capacity.
  ///
  /// When the scheduled action runs, the resource will have at least this much
  /// capacity, but it might have more depending on other settings, such as the
  /// target utilization level of a target tracking scaling policy.
  final int? minCapacity;

  ScalableTargetAction({
    this.maxCapacity,
    this.minCapacity,
  });

  factory ScalableTargetAction.fromJson(Map<String, dynamic> json) {
    return ScalableTargetAction(
      maxCapacity: json['MaxCapacity'] as int?,
      minCapacity: json['MinCapacity'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxCapacity = this.maxCapacity;
    final minCapacity = this.minCapacity;
    return {
      if (maxCapacity != null) 'MaxCapacity': maxCapacity,
      if (minCapacity != null) 'MinCapacity': minCapacity,
    };
  }
}

/// Represents a scaling activity.
class ScalingActivity {
  /// The unique identifier of the scaling activity.
  final String activityId;

  /// A simple description of what caused the scaling activity to happen.
  final String cause;

  /// A simple description of what action the scaling activity intends to
  /// accomplish.
  final String description;

  /// The identifier of the resource associated with the scaling activity. This
  /// string consists of the resource type and unique identifier.
  ///
  /// <ul>
  /// <li>
  /// ECS service - The resource type is <code>service</code> and the unique
  /// identifier is the cluster name and service name. Example:
  /// <code>service/default/sample-webapp</code>.
  /// </li>
  /// <li>
  /// Spot Fleet - The resource type is <code>spot-fleet-request</code> and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.
  /// </li>
  /// <li>
  /// EMR cluster - The resource type is <code>instancegroup</code> and the unique
  /// identifier is the cluster ID and instance group ID. Example:
  /// <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.
  /// </li>
  /// <li>
  /// AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique
  /// identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.
  /// </li>
  /// <li>
  /// DynamoDB table - The resource type is <code>table</code> and the unique
  /// identifier is the table name. Example: <code>table/my-table</code>.
  /// </li>
  /// <li>
  /// DynamoDB global secondary index - The resource type is <code>index</code>
  /// and the unique identifier is the index name. Example:
  /// <code>table/my-table/index/my-table-index</code>.
  /// </li>
  /// <li>
  /// Aurora DB cluster - The resource type is <code>cluster</code> and the unique
  /// identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.
  /// </li>
  /// <li>
  /// SageMaker endpoint variant - The resource type is <code>variant</code> and
  /// the unique identifier is the resource ID. Example:
  /// <code>endpoint/my-end-point/variant/KMeansClustering</code>.
  /// </li>
  /// <li>
  /// Custom resources are not supported with a resource type. This parameter must
  /// specify the <code>OutputValue</code> from the CloudFormation template stack
  /// used to access the resources. The unique identifier is defined by the
  /// service provider. More information is available in our <a
  /// href="https://github.com/aws/aws-auto-scaling-custom-resource">GitHub
  /// repository</a>.
  /// </li>
  /// <li>
  /// Amazon Comprehend document classification endpoint - The resource type and
  /// unique identifier are specified using the endpoint ARN. Example:
  /// <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Amazon Comprehend entity recognizer endpoint - The resource type and unique
  /// identifier are specified using the endpoint ARN. Example:
  /// <code>arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Lambda provisioned concurrency - The resource type is <code>function</code>
  /// and the unique identifier is the function name with a function version or
  /// alias name suffix that is not <code>$LATEST</code>. Example:
  /// <code>function:my-function:prod</code> or
  /// <code>function:my-function:1</code>.
  /// </li>
  /// <li>
  /// Amazon Keyspaces table - The resource type is <code>table</code> and the
  /// unique identifier is the table name. Example:
  /// <code>keyspace/mykeyspace/table/mytable</code>.
  /// </li>
  /// <li>
  /// Amazon MSK cluster - The resource type and unique identifier are specified
  /// using the cluster ARN. Example:
  /// <code>arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5</code>.
  /// </li>
  /// <li>
  /// Amazon ElastiCache replication group - The resource type is
  /// <code>replication-group</code> and the unique identifier is the replication
  /// group name. Example: <code>replication-group/mycluster</code>.
  /// </li>
  /// <li>
  /// Neptune cluster - The resource type is <code>cluster</code> and the unique
  /// identifier is the cluster name. Example: <code>cluster:mycluster</code>.
  /// </li>
  /// <li>
  /// SageMaker Serverless endpoint - The resource type is <code>variant</code>
  /// and the unique identifier is the resource ID. Example:
  /// <code>endpoint/my-end-point/variant/KMeansClustering</code>.
  /// </li>
  /// <li>
  /// SageMaker inference component - The resource type is
  /// <code>inference-component</code> and the unique identifier is the resource
  /// ID. Example: <code>inference-component/my-inference-component</code>.
  /// </li>
  /// </ul>
  final String resourceId;

  /// The scalable dimension. This string consists of the service namespace,
  /// resource type, and scaling property.
  ///
  /// <ul>
  /// <li>
  /// <code>ecs:service:DesiredCount</code> - The desired task count of an ECS
  /// service.
  /// </li>
  /// <li>
  /// <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance
  /// count of an EMR Instance Group.
  /// </li>
  /// <li>
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of
  /// a Spot Fleet.
  /// </li>
  /// <li>
  /// <code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an
  /// AppStream 2.0 fleet.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in
  /// an Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  /// </li>
  /// <li>
  /// <code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2
  /// instances for a SageMaker model endpoint variant.
  /// </li>
  /// <li>
  /// <code>custom-resource:ResourceType:Property</code> - The scalable dimension
  /// for a custom resource provided by your own application or service.
  /// </li>
  /// <li>
  /// <code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> -
  /// The number of inference units for an Amazon Comprehend document
  /// classification endpoint.
  /// </li>
  /// <li>
  /// <code>comprehend:entity-recognizer-endpoint:DesiredInferenceUnits</code> -
  /// The number of inference units for an Amazon Comprehend entity recognizer
  /// endpoint.
  /// </li>
  /// <li>
  /// <code>lambda:function:ProvisionedConcurrency</code> - The provisioned
  /// concurrency for a Lambda function.
  /// </li>
  /// <li>
  /// <code>cassandra:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for an Amazon Keyspaces table.
  /// </li>
  /// <li>
  /// <code>cassandra:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for an Amazon Keyspaces table.
  /// </li>
  /// <li>
  /// <code>kafka:broker-storage:VolumeSize</code> - The provisioned volume size
  /// (in GiB) for brokers in an Amazon MSK cluster.
  /// </li>
  /// <li>
  /// <code>elasticache:replication-group:NodeGroups</code> - The number of node
  /// groups for an Amazon ElastiCache replication group.
  /// </li>
  /// <li>
  /// <code>elasticache:replication-group:Replicas</code> - The number of replicas
  /// per node group for an Amazon ElastiCache replication group.
  /// </li>
  /// <li>
  /// <code>neptune:cluster:ReadReplicaCount</code> - The count of read replicas
  /// in an Amazon Neptune DB cluster.
  /// </li>
  /// <li>
  /// <code>sagemaker:variant:DesiredProvisionedConcurrency</code> - The
  /// provisioned concurrency for a SageMaker Serverless endpoint.
  /// </li>
  /// <li>
  /// <code>sagemaker:inference-component:DesiredCopyCount</code> - The number of
  /// copies across an endpoint for a SageMaker inference component.
  /// </li>
  /// </ul>
  final ScalableDimension scalableDimension;

  /// The namespace of the Amazon Web Services service that provides the resource,
  /// or a <code>custom-resource</code>.
  final ServiceNamespace serviceNamespace;

  /// The Unix timestamp for when the scaling activity began.
  final DateTime startTime;

  /// Indicates the status of the scaling activity.
  final ScalingActivityStatusCode statusCode;

  /// The details about the scaling activity.
  final String? details;

  /// The Unix timestamp for when the scaling activity ended.
  final DateTime? endTime;

  /// Machine-readable data that describes the reason for a not scaled activity.
  /// Only available when <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_DescribeScalingActivities.html">DescribeScalingActivities</a>
  /// includes not scaled activities.
  final List<NotScaledReason>? notScaledReasons;

  /// A simple message about the current status of the scaling activity.
  final String? statusMessage;

  ScalingActivity({
    required this.activityId,
    required this.cause,
    required this.description,
    required this.resourceId,
    required this.scalableDimension,
    required this.serviceNamespace,
    required this.startTime,
    required this.statusCode,
    this.details,
    this.endTime,
    this.notScaledReasons,
    this.statusMessage,
  });

  factory ScalingActivity.fromJson(Map<String, dynamic> json) {
    return ScalingActivity(
      activityId: json['ActivityId'] as String,
      cause: json['Cause'] as String,
      description: json['Description'] as String,
      resourceId: json['ResourceId'] as String,
      scalableDimension:
          (json['ScalableDimension'] as String).toScalableDimension(),
      serviceNamespace:
          (json['ServiceNamespace'] as String).toServiceNamespace(),
      startTime: nonNullableTimeStampFromJson(json['StartTime'] as Object),
      statusCode: (json['StatusCode'] as String).toScalingActivityStatusCode(),
      details: json['Details'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      notScaledReasons: (json['NotScaledReasons'] as List?)
          ?.whereNotNull()
          .map((e) => NotScaledReason.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final activityId = this.activityId;
    final cause = this.cause;
    final description = this.description;
    final resourceId = this.resourceId;
    final scalableDimension = this.scalableDimension;
    final serviceNamespace = this.serviceNamespace;
    final startTime = this.startTime;
    final statusCode = this.statusCode;
    final details = this.details;
    final endTime = this.endTime;
    final notScaledReasons = this.notScaledReasons;
    final statusMessage = this.statusMessage;
    return {
      'ActivityId': activityId,
      'Cause': cause,
      'Description': description,
      'ResourceId': resourceId,
      'ScalableDimension': scalableDimension.toValue(),
      'ServiceNamespace': serviceNamespace.toValue(),
      'StartTime': unixTimestampToJson(startTime),
      'StatusCode': statusCode.toValue(),
      if (details != null) 'Details': details,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (notScaledReasons != null) 'NotScaledReasons': notScaledReasons,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

enum ScalingActivityStatusCode {
  pending,
  inProgress,
  successful,
  overridden,
  unfulfilled,
  failed,
}

extension ScalingActivityStatusCodeValueExtension on ScalingActivityStatusCode {
  String toValue() {
    switch (this) {
      case ScalingActivityStatusCode.pending:
        return 'Pending';
      case ScalingActivityStatusCode.inProgress:
        return 'InProgress';
      case ScalingActivityStatusCode.successful:
        return 'Successful';
      case ScalingActivityStatusCode.overridden:
        return 'Overridden';
      case ScalingActivityStatusCode.unfulfilled:
        return 'Unfulfilled';
      case ScalingActivityStatusCode.failed:
        return 'Failed';
    }
  }
}

extension ScalingActivityStatusCodeFromString on String {
  ScalingActivityStatusCode toScalingActivityStatusCode() {
    switch (this) {
      case 'Pending':
        return ScalingActivityStatusCode.pending;
      case 'InProgress':
        return ScalingActivityStatusCode.inProgress;
      case 'Successful':
        return ScalingActivityStatusCode.successful;
      case 'Overridden':
        return ScalingActivityStatusCode.overridden;
      case 'Unfulfilled':
        return ScalingActivityStatusCode.unfulfilled;
      case 'Failed':
        return ScalingActivityStatusCode.failed;
    }
    throw Exception('$this is not known in enum ScalingActivityStatusCode');
  }
}

/// Represents a scaling policy to use with Application Auto Scaling.
///
/// For more information about configuring scaling policies for a specific
/// service, see <a
/// href="https://docs.aws.amazon.com/autoscaling/application/userguide/integrated-services-list.html">Amazon
/// Web Services services that you can use with Application Auto Scaling</a> in
/// the <i>Application Auto Scaling User Guide</i>.
class ScalingPolicy {
  /// The Unix timestamp for when the scaling policy was created.
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the scaling policy.
  final String policyARN;

  /// The name of the scaling policy.
  final String policyName;

  /// The scaling policy type.
  ///
  /// The following policy types are supported:
  ///
  /// <code>TargetTrackingScaling</code>—Not supported for Amazon EMR
  ///
  /// <code>StepScaling</code>—Not supported for DynamoDB, Amazon Comprehend,
  /// Lambda, Amazon Keyspaces, Amazon MSK, Amazon ElastiCache, or Neptune.
  final PolicyType policyType;

  /// The identifier of the resource associated with the scaling policy. This
  /// string consists of the resource type and unique identifier.
  ///
  /// <ul>
  /// <li>
  /// ECS service - The resource type is <code>service</code> and the unique
  /// identifier is the cluster name and service name. Example:
  /// <code>service/default/sample-webapp</code>.
  /// </li>
  /// <li>
  /// Spot Fleet - The resource type is <code>spot-fleet-request</code> and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.
  /// </li>
  /// <li>
  /// EMR cluster - The resource type is <code>instancegroup</code> and the unique
  /// identifier is the cluster ID and instance group ID. Example:
  /// <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.
  /// </li>
  /// <li>
  /// AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique
  /// identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.
  /// </li>
  /// <li>
  /// DynamoDB table - The resource type is <code>table</code> and the unique
  /// identifier is the table name. Example: <code>table/my-table</code>.
  /// </li>
  /// <li>
  /// DynamoDB global secondary index - The resource type is <code>index</code>
  /// and the unique identifier is the index name. Example:
  /// <code>table/my-table/index/my-table-index</code>.
  /// </li>
  /// <li>
  /// Aurora DB cluster - The resource type is <code>cluster</code> and the unique
  /// identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.
  /// </li>
  /// <li>
  /// SageMaker endpoint variant - The resource type is <code>variant</code> and
  /// the unique identifier is the resource ID. Example:
  /// <code>endpoint/my-end-point/variant/KMeansClustering</code>.
  /// </li>
  /// <li>
  /// Custom resources are not supported with a resource type. This parameter must
  /// specify the <code>OutputValue</code> from the CloudFormation template stack
  /// used to access the resources. The unique identifier is defined by the
  /// service provider. More information is available in our <a
  /// href="https://github.com/aws/aws-auto-scaling-custom-resource">GitHub
  /// repository</a>.
  /// </li>
  /// <li>
  /// Amazon Comprehend document classification endpoint - The resource type and
  /// unique identifier are specified using the endpoint ARN. Example:
  /// <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Amazon Comprehend entity recognizer endpoint - The resource type and unique
  /// identifier are specified using the endpoint ARN. Example:
  /// <code>arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Lambda provisioned concurrency - The resource type is <code>function</code>
  /// and the unique identifier is the function name with a function version or
  /// alias name suffix that is not <code>$LATEST</code>. Example:
  /// <code>function:my-function:prod</code> or
  /// <code>function:my-function:1</code>.
  /// </li>
  /// <li>
  /// Amazon Keyspaces table - The resource type is <code>table</code> and the
  /// unique identifier is the table name. Example:
  /// <code>keyspace/mykeyspace/table/mytable</code>.
  /// </li>
  /// <li>
  /// Amazon MSK cluster - The resource type and unique identifier are specified
  /// using the cluster ARN. Example:
  /// <code>arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5</code>.
  /// </li>
  /// <li>
  /// Amazon ElastiCache replication group - The resource type is
  /// <code>replication-group</code> and the unique identifier is the replication
  /// group name. Example: <code>replication-group/mycluster</code>.
  /// </li>
  /// <li>
  /// Neptune cluster - The resource type is <code>cluster</code> and the unique
  /// identifier is the cluster name. Example: <code>cluster:mycluster</code>.
  /// </li>
  /// <li>
  /// SageMaker Serverless endpoint - The resource type is <code>variant</code>
  /// and the unique identifier is the resource ID. Example:
  /// <code>endpoint/my-end-point/variant/KMeansClustering</code>.
  /// </li>
  /// <li>
  /// SageMaker inference component - The resource type is
  /// <code>inference-component</code> and the unique identifier is the resource
  /// ID. Example: <code>inference-component/my-inference-component</code>.
  /// </li>
  /// </ul>
  final String resourceId;

  /// The scalable dimension. This string consists of the service namespace,
  /// resource type, and scaling property.
  ///
  /// <ul>
  /// <li>
  /// <code>ecs:service:DesiredCount</code> - The desired task count of an ECS
  /// service.
  /// </li>
  /// <li>
  /// <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance
  /// count of an EMR Instance Group.
  /// </li>
  /// <li>
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of
  /// a Spot Fleet.
  /// </li>
  /// <li>
  /// <code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an
  /// AppStream 2.0 fleet.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in
  /// an Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  /// </li>
  /// <li>
  /// <code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2
  /// instances for a SageMaker model endpoint variant.
  /// </li>
  /// <li>
  /// <code>custom-resource:ResourceType:Property</code> - The scalable dimension
  /// for a custom resource provided by your own application or service.
  /// </li>
  /// <li>
  /// <code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> -
  /// The number of inference units for an Amazon Comprehend document
  /// classification endpoint.
  /// </li>
  /// <li>
  /// <code>comprehend:entity-recognizer-endpoint:DesiredInferenceUnits</code> -
  /// The number of inference units for an Amazon Comprehend entity recognizer
  /// endpoint.
  /// </li>
  /// <li>
  /// <code>lambda:function:ProvisionedConcurrency</code> - The provisioned
  /// concurrency for a Lambda function.
  /// </li>
  /// <li>
  /// <code>cassandra:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for an Amazon Keyspaces table.
  /// </li>
  /// <li>
  /// <code>cassandra:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for an Amazon Keyspaces table.
  /// </li>
  /// <li>
  /// <code>kafka:broker-storage:VolumeSize</code> - The provisioned volume size
  /// (in GiB) for brokers in an Amazon MSK cluster.
  /// </li>
  /// <li>
  /// <code>elasticache:replication-group:NodeGroups</code> - The number of node
  /// groups for an Amazon ElastiCache replication group.
  /// </li>
  /// <li>
  /// <code>elasticache:replication-group:Replicas</code> - The number of replicas
  /// per node group for an Amazon ElastiCache replication group.
  /// </li>
  /// <li>
  /// <code>neptune:cluster:ReadReplicaCount</code> - The count of read replicas
  /// in an Amazon Neptune DB cluster.
  /// </li>
  /// <li>
  /// <code>sagemaker:variant:DesiredProvisionedConcurrency</code> - The
  /// provisioned concurrency for a SageMaker Serverless endpoint.
  /// </li>
  /// <li>
  /// <code>sagemaker:inference-component:DesiredCopyCount</code> - The number of
  /// copies across an endpoint for a SageMaker inference component.
  /// </li>
  /// </ul>
  final ScalableDimension scalableDimension;

  /// The namespace of the Amazon Web Services service that provides the resource,
  /// or a <code>custom-resource</code>.
  final ServiceNamespace serviceNamespace;

  /// The CloudWatch alarms associated with the scaling policy.
  final List<Alarm>? alarms;

  /// A step scaling policy.
  final StepScalingPolicyConfiguration? stepScalingPolicyConfiguration;

  /// A target tracking scaling policy.
  final TargetTrackingScalingPolicyConfiguration?
      targetTrackingScalingPolicyConfiguration;

  ScalingPolicy({
    required this.creationTime,
    required this.policyARN,
    required this.policyName,
    required this.policyType,
    required this.resourceId,
    required this.scalableDimension,
    required this.serviceNamespace,
    this.alarms,
    this.stepScalingPolicyConfiguration,
    this.targetTrackingScalingPolicyConfiguration,
  });

  factory ScalingPolicy.fromJson(Map<String, dynamic> json) {
    return ScalingPolicy(
      creationTime:
          nonNullableTimeStampFromJson(json['CreationTime'] as Object),
      policyARN: json['PolicyARN'] as String,
      policyName: json['PolicyName'] as String,
      policyType: (json['PolicyType'] as String).toPolicyType(),
      resourceId: json['ResourceId'] as String,
      scalableDimension:
          (json['ScalableDimension'] as String).toScalableDimension(),
      serviceNamespace:
          (json['ServiceNamespace'] as String).toServiceNamespace(),
      alarms: (json['Alarms'] as List?)
          ?.whereNotNull()
          .map((e) => Alarm.fromJson(e as Map<String, dynamic>))
          .toList(),
      stepScalingPolicyConfiguration: json['StepScalingPolicyConfiguration'] !=
              null
          ? StepScalingPolicyConfiguration.fromJson(
              json['StepScalingPolicyConfiguration'] as Map<String, dynamic>)
          : null,
      targetTrackingScalingPolicyConfiguration:
          json['TargetTrackingScalingPolicyConfiguration'] != null
              ? TargetTrackingScalingPolicyConfiguration.fromJson(
                  json['TargetTrackingScalingPolicyConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final policyARN = this.policyARN;
    final policyName = this.policyName;
    final policyType = this.policyType;
    final resourceId = this.resourceId;
    final scalableDimension = this.scalableDimension;
    final serviceNamespace = this.serviceNamespace;
    final alarms = this.alarms;
    final stepScalingPolicyConfiguration = this.stepScalingPolicyConfiguration;
    final targetTrackingScalingPolicyConfiguration =
        this.targetTrackingScalingPolicyConfiguration;
    return {
      'CreationTime': unixTimestampToJson(creationTime),
      'PolicyARN': policyARN,
      'PolicyName': policyName,
      'PolicyType': policyType.toValue(),
      'ResourceId': resourceId,
      'ScalableDimension': scalableDimension.toValue(),
      'ServiceNamespace': serviceNamespace.toValue(),
      if (alarms != null) 'Alarms': alarms,
      if (stepScalingPolicyConfiguration != null)
        'StepScalingPolicyConfiguration': stepScalingPolicyConfiguration,
      if (targetTrackingScalingPolicyConfiguration != null)
        'TargetTrackingScalingPolicyConfiguration':
            targetTrackingScalingPolicyConfiguration,
    };
  }
}

/// Represents a scheduled action.
class ScheduledAction {
  /// The date and time that the scheduled action was created.
  final DateTime creationTime;

  /// The identifier of the resource associated with the scaling policy. This
  /// string consists of the resource type and unique identifier.
  ///
  /// <ul>
  /// <li>
  /// ECS service - The resource type is <code>service</code> and the unique
  /// identifier is the cluster name and service name. Example:
  /// <code>service/default/sample-webapp</code>.
  /// </li>
  /// <li>
  /// Spot Fleet - The resource type is <code>spot-fleet-request</code> and the
  /// unique identifier is the Spot Fleet request ID. Example:
  /// <code>spot-fleet-request/sfr-73fbd2ce-aa30-494c-8788-1cee4EXAMPLE</code>.
  /// </li>
  /// <li>
  /// EMR cluster - The resource type is <code>instancegroup</code> and the unique
  /// identifier is the cluster ID and instance group ID. Example:
  /// <code>instancegroup/j-2EEZNYKUA1NTV/ig-1791Y4E1L8YI0</code>.
  /// </li>
  /// <li>
  /// AppStream 2.0 fleet - The resource type is <code>fleet</code> and the unique
  /// identifier is the fleet name. Example: <code>fleet/sample-fleet</code>.
  /// </li>
  /// <li>
  /// DynamoDB table - The resource type is <code>table</code> and the unique
  /// identifier is the table name. Example: <code>table/my-table</code>.
  /// </li>
  /// <li>
  /// DynamoDB global secondary index - The resource type is <code>index</code>
  /// and the unique identifier is the index name. Example:
  /// <code>table/my-table/index/my-table-index</code>.
  /// </li>
  /// <li>
  /// Aurora DB cluster - The resource type is <code>cluster</code> and the unique
  /// identifier is the cluster name. Example: <code>cluster:my-db-cluster</code>.
  /// </li>
  /// <li>
  /// SageMaker endpoint variant - The resource type is <code>variant</code> and
  /// the unique identifier is the resource ID. Example:
  /// <code>endpoint/my-end-point/variant/KMeansClustering</code>.
  /// </li>
  /// <li>
  /// Custom resources are not supported with a resource type. This parameter must
  /// specify the <code>OutputValue</code> from the CloudFormation template stack
  /// used to access the resources. The unique identifier is defined by the
  /// service provider. More information is available in our <a
  /// href="https://github.com/aws/aws-auto-scaling-custom-resource">GitHub
  /// repository</a>.
  /// </li>
  /// <li>
  /// Amazon Comprehend document classification endpoint - The resource type and
  /// unique identifier are specified using the endpoint ARN. Example:
  /// <code>arn:aws:comprehend:us-west-2:123456789012:document-classifier-endpoint/EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Amazon Comprehend entity recognizer endpoint - The resource type and unique
  /// identifier are specified using the endpoint ARN. Example:
  /// <code>arn:aws:comprehend:us-west-2:123456789012:entity-recognizer-endpoint/EXAMPLE</code>.
  /// </li>
  /// <li>
  /// Lambda provisioned concurrency - The resource type is <code>function</code>
  /// and the unique identifier is the function name with a function version or
  /// alias name suffix that is not <code>$LATEST</code>. Example:
  /// <code>function:my-function:prod</code> or
  /// <code>function:my-function:1</code>.
  /// </li>
  /// <li>
  /// Amazon Keyspaces table - The resource type is <code>table</code> and the
  /// unique identifier is the table name. Example:
  /// <code>keyspace/mykeyspace/table/mytable</code>.
  /// </li>
  /// <li>
  /// Amazon MSK cluster - The resource type and unique identifier are specified
  /// using the cluster ARN. Example:
  /// <code>arn:aws:kafka:us-east-1:123456789012:cluster/demo-cluster-1/6357e0b2-0e6a-4b86-a0b4-70df934c2e31-5</code>.
  /// </li>
  /// <li>
  /// Amazon ElastiCache replication group - The resource type is
  /// <code>replication-group</code> and the unique identifier is the replication
  /// group name. Example: <code>replication-group/mycluster</code>.
  /// </li>
  /// <li>
  /// Neptune cluster - The resource type is <code>cluster</code> and the unique
  /// identifier is the cluster name. Example: <code>cluster:mycluster</code>.
  /// </li>
  /// <li>
  /// SageMaker Serverless endpoint - The resource type is <code>variant</code>
  /// and the unique identifier is the resource ID. Example:
  /// <code>endpoint/my-end-point/variant/KMeansClustering</code>.
  /// </li>
  /// <li>
  /// SageMaker inference component - The resource type is
  /// <code>inference-component</code> and the unique identifier is the resource
  /// ID. Example: <code>inference-component/my-inference-component</code>.
  /// </li>
  /// </ul>
  final String resourceId;

  /// The schedule for this action. The following formats are supported:
  ///
  /// <ul>
  /// <li>
  /// At expressions -
  /// "<code>at(<i>yyyy</i>-<i>mm</i>-<i>dd</i>T<i>hh</i>:<i>mm</i>:<i>ss</i>)</code>"
  /// </li>
  /// <li>
  /// Rate expressions - "<code>rate(<i>value</i> <i>unit</i>)</code>"
  /// </li>
  /// <li>
  /// Cron expressions - "<code>cron(<i>fields</i>)</code>"
  /// </li>
  /// </ul>
  /// At expressions are useful for one-time schedules. Cron expressions are
  /// useful for scheduled actions that run periodically at a specified date and
  /// time, and rate expressions are useful for scheduled actions that run at a
  /// regular interval.
  ///
  /// At and cron expressions use Universal Coordinated Time (UTC) by default.
  ///
  /// The cron format consists of six fields separated by white spaces: [Minutes]
  /// [Hours] [Day_of_Month] [Month] [Day_of_Week] [Year].
  ///
  /// For rate expressions, <i>value</i> is a positive integer and <i>unit</i> is
  /// <code>minute</code> | <code>minutes</code> | <code>hour</code> |
  /// <code>hours</code> | <code>day</code> | <code>days</code>.
  ///
  /// For more information and examples, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/examples-scheduled-actions.html">Example
  /// scheduled actions for Application Auto Scaling</a> in the <i>Application
  /// Auto Scaling User Guide</i>.
  final String schedule;

  /// The Amazon Resource Name (ARN) of the scheduled action.
  final String scheduledActionARN;

  /// The name of the scheduled action.
  final String scheduledActionName;

  /// The namespace of the Amazon Web Services service that provides the resource,
  /// or a <code>custom-resource</code>.
  final ServiceNamespace serviceNamespace;

  /// The date and time that the action is scheduled to end, in UTC.
  final DateTime? endTime;

  /// The scalable dimension. This string consists of the service namespace,
  /// resource type, and scaling property.
  ///
  /// <ul>
  /// <li>
  /// <code>ecs:service:DesiredCount</code> - The desired task count of an ECS
  /// service.
  /// </li>
  /// <li>
  /// <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance
  /// count of an EMR Instance Group.
  /// </li>
  /// <li>
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of
  /// a Spot Fleet.
  /// </li>
  /// <li>
  /// <code>appstream:fleet:DesiredCapacity</code> - The desired capacity of an
  /// AppStream 2.0 fleet.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB table.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:ReadCapacityUnits</code> - The provisioned read
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>dynamodb:index:WriteCapacityUnits</code> - The provisioned write
  /// capacity for a DynamoDB global secondary index.
  /// </li>
  /// <li>
  /// <code>rds:cluster:ReadReplicaCount</code> - The count of Aurora Replicas in
  /// an Aurora DB cluster. Available for Aurora MySQL-compatible edition and
  /// Aurora PostgreSQL-compatible edition.
  /// </li>
  /// <li>
  /// <code>sagemaker:variant:DesiredInstanceCount</code> - The number of EC2
  /// instances for a SageMaker model endpoint variant.
  /// </li>
  /// <li>
  /// <code>custom-resource:ResourceType:Property</code> - The scalable dimension
  /// for a custom resource provided by your own application or service.
  /// </li>
  /// <li>
  /// <code>comprehend:document-classifier-endpoint:DesiredInferenceUnits</code> -
  /// The number of inference units for an Amazon Comprehend document
  /// classification endpoint.
  /// </li>
  /// <li>
  /// <code>comprehend:entity-recognizer-endpoint:DesiredInferenceUnits</code> -
  /// The number of inference units for an Amazon Comprehend entity recognizer
  /// endpoint.
  /// </li>
  /// <li>
  /// <code>lambda:function:ProvisionedConcurrency</code> - The provisioned
  /// concurrency for a Lambda function.
  /// </li>
  /// <li>
  /// <code>cassandra:table:ReadCapacityUnits</code> - The provisioned read
  /// capacity for an Amazon Keyspaces table.
  /// </li>
  /// <li>
  /// <code>cassandra:table:WriteCapacityUnits</code> - The provisioned write
  /// capacity for an Amazon Keyspaces table.
  /// </li>
  /// <li>
  /// <code>kafka:broker-storage:VolumeSize</code> - The provisioned volume size
  /// (in GiB) for brokers in an Amazon MSK cluster.
  /// </li>
  /// <li>
  /// <code>elasticache:replication-group:NodeGroups</code> - The number of node
  /// groups for an Amazon ElastiCache replication group.
  /// </li>
  /// <li>
  /// <code>elasticache:replication-group:Replicas</code> - The number of replicas
  /// per node group for an Amazon ElastiCache replication group.
  /// </li>
  /// <li>
  /// <code>neptune:cluster:ReadReplicaCount</code> - The count of read replicas
  /// in an Amazon Neptune DB cluster.
  /// </li>
  /// <li>
  /// <code>sagemaker:variant:DesiredProvisionedConcurrency</code> - The
  /// provisioned concurrency for a SageMaker Serverless endpoint.
  /// </li>
  /// <li>
  /// <code>sagemaker:inference-component:DesiredCopyCount</code> - The number of
  /// copies across an endpoint for a SageMaker inference component.
  /// </li>
  /// </ul>
  final ScalableDimension? scalableDimension;

  /// The new minimum and maximum capacity. You can set both values or just one.
  /// At the scheduled time, if the current capacity is below the minimum
  /// capacity, Application Auto Scaling scales out to the minimum capacity. If
  /// the current capacity is above the maximum capacity, Application Auto Scaling
  /// scales in to the maximum capacity.
  final ScalableTargetAction? scalableTargetAction;

  /// The date and time that the action is scheduled to begin, in UTC.
  final DateTime? startTime;

  /// The time zone used when referring to the date and time of a scheduled
  /// action, when the scheduled action uses an at or cron expression.
  final String? timezone;

  ScheduledAction({
    required this.creationTime,
    required this.resourceId,
    required this.schedule,
    required this.scheduledActionARN,
    required this.scheduledActionName,
    required this.serviceNamespace,
    this.endTime,
    this.scalableDimension,
    this.scalableTargetAction,
    this.startTime,
    this.timezone,
  });

  factory ScheduledAction.fromJson(Map<String, dynamic> json) {
    return ScheduledAction(
      creationTime:
          nonNullableTimeStampFromJson(json['CreationTime'] as Object),
      resourceId: json['ResourceId'] as String,
      schedule: json['Schedule'] as String,
      scheduledActionARN: json['ScheduledActionARN'] as String,
      scheduledActionName: json['ScheduledActionName'] as String,
      serviceNamespace:
          (json['ServiceNamespace'] as String).toServiceNamespace(),
      endTime: timeStampFromJson(json['EndTime']),
      scalableDimension:
          (json['ScalableDimension'] as String?)?.toScalableDimension(),
      scalableTargetAction: json['ScalableTargetAction'] != null
          ? ScalableTargetAction.fromJson(
              json['ScalableTargetAction'] as Map<String, dynamic>)
          : null,
      startTime: timeStampFromJson(json['StartTime']),
      timezone: json['Timezone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final resourceId = this.resourceId;
    final schedule = this.schedule;
    final scheduledActionARN = this.scheduledActionARN;
    final scheduledActionName = this.scheduledActionName;
    final serviceNamespace = this.serviceNamespace;
    final endTime = this.endTime;
    final scalableDimension = this.scalableDimension;
    final scalableTargetAction = this.scalableTargetAction;
    final startTime = this.startTime;
    final timezone = this.timezone;
    return {
      'CreationTime': unixTimestampToJson(creationTime),
      'ResourceId': resourceId,
      'Schedule': schedule,
      'ScheduledActionARN': scheduledActionARN,
      'ScheduledActionName': scheduledActionName,
      'ServiceNamespace': serviceNamespace.toValue(),
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (scalableDimension != null)
        'ScalableDimension': scalableDimension.toValue(),
      if (scalableTargetAction != null)
        'ScalableTargetAction': scalableTargetAction,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (timezone != null) 'Timezone': timezone,
    };
  }
}

enum ServiceNamespace {
  ecs,
  elasticmapreduce,
  ec2,
  appstream,
  dynamodb,
  rds,
  sagemaker,
  customResource,
  comprehend,
  lambda,
  cassandra,
  kafka,
  elasticache,
  neptune,
}

extension ServiceNamespaceValueExtension on ServiceNamespace {
  String toValue() {
    switch (this) {
      case ServiceNamespace.ecs:
        return 'ecs';
      case ServiceNamespace.elasticmapreduce:
        return 'elasticmapreduce';
      case ServiceNamespace.ec2:
        return 'ec2';
      case ServiceNamespace.appstream:
        return 'appstream';
      case ServiceNamespace.dynamodb:
        return 'dynamodb';
      case ServiceNamespace.rds:
        return 'rds';
      case ServiceNamespace.sagemaker:
        return 'sagemaker';
      case ServiceNamespace.customResource:
        return 'custom-resource';
      case ServiceNamespace.comprehend:
        return 'comprehend';
      case ServiceNamespace.lambda:
        return 'lambda';
      case ServiceNamespace.cassandra:
        return 'cassandra';
      case ServiceNamespace.kafka:
        return 'kafka';
      case ServiceNamespace.elasticache:
        return 'elasticache';
      case ServiceNamespace.neptune:
        return 'neptune';
    }
  }
}

extension ServiceNamespaceFromString on String {
  ServiceNamespace toServiceNamespace() {
    switch (this) {
      case 'ecs':
        return ServiceNamespace.ecs;
      case 'elasticmapreduce':
        return ServiceNamespace.elasticmapreduce;
      case 'ec2':
        return ServiceNamespace.ec2;
      case 'appstream':
        return ServiceNamespace.appstream;
      case 'dynamodb':
        return ServiceNamespace.dynamodb;
      case 'rds':
        return ServiceNamespace.rds;
      case 'sagemaker':
        return ServiceNamespace.sagemaker;
      case 'custom-resource':
        return ServiceNamespace.customResource;
      case 'comprehend':
        return ServiceNamespace.comprehend;
      case 'lambda':
        return ServiceNamespace.lambda;
      case 'cassandra':
        return ServiceNamespace.cassandra;
      case 'kafka':
        return ServiceNamespace.kafka;
      case 'elasticache':
        return ServiceNamespace.elasticache;
      case 'neptune':
        return ServiceNamespace.neptune;
    }
    throw Exception('$this is not known in enum ServiceNamespace');
  }
}

/// Represents a step adjustment for a <a
/// href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_StepScalingPolicyConfiguration.html">StepScalingPolicyConfiguration</a>.
/// Describes an adjustment based on the difference between the value of the
/// aggregated CloudWatch metric and the breach threshold that you've defined
/// for the alarm.
///
/// For the following examples, suppose that you have an alarm with a breach
/// threshold of 50:
///
/// <ul>
/// <li>
/// To initiate the adjustment when the metric is greater than or equal to 50
/// and less than 60, specify a lower bound of <code>0</code> and an upper bound
/// of <code>10</code>.
/// </li>
/// <li>
/// To initiate the adjustment when the metric is greater than 40 and less than
/// or equal to 50, specify a lower bound of <code>-10</code> and an upper bound
/// of <code>0</code>.
/// </li>
/// </ul>
/// There are a few rules for the step adjustments for your step policy:
///
/// <ul>
/// <li>
/// The ranges of your step adjustments can't overlap or have a gap.
/// </li>
/// <li>
/// At most one step adjustment can have a null lower bound. If one step
/// adjustment has a negative lower bound, then there must be a step adjustment
/// with a null lower bound.
/// </li>
/// <li>
/// At most one step adjustment can have a null upper bound. If one step
/// adjustment has a positive upper bound, then there must be a step adjustment
/// with a null upper bound.
/// </li>
/// <li>
/// The upper and lower bound can't be null in the same step adjustment.
/// </li>
/// </ul>
class StepAdjustment {
  /// The amount by which to scale, based on the specified adjustment type. A
  /// positive value adds to the current capacity while a negative number removes
  /// from the current capacity. For exact capacity, you must specify a
  /// non-negative value.
  final int scalingAdjustment;

  /// The lower bound for the difference between the alarm threshold and the
  /// CloudWatch metric. If the metric value is above the breach threshold, the
  /// lower bound is inclusive (the metric must be greater than or equal to the
  /// threshold plus the lower bound). Otherwise, it's exclusive (the metric must
  /// be greater than the threshold plus the lower bound). A null value indicates
  /// negative infinity.
  final double? metricIntervalLowerBound;

  /// The upper bound for the difference between the alarm threshold and the
  /// CloudWatch metric. If the metric value is above the breach threshold, the
  /// upper bound is exclusive (the metric must be less than the threshold plus
  /// the upper bound). Otherwise, it's inclusive (the metric must be less than or
  /// equal to the threshold plus the upper bound). A null value indicates
  /// positive infinity.
  ///
  /// The upper bound must be greater than the lower bound.
  final double? metricIntervalUpperBound;

  StepAdjustment({
    required this.scalingAdjustment,
    this.metricIntervalLowerBound,
    this.metricIntervalUpperBound,
  });

  factory StepAdjustment.fromJson(Map<String, dynamic> json) {
    return StepAdjustment(
      scalingAdjustment: json['ScalingAdjustment'] as int,
      metricIntervalLowerBound: json['MetricIntervalLowerBound'] as double?,
      metricIntervalUpperBound: json['MetricIntervalUpperBound'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final scalingAdjustment = this.scalingAdjustment;
    final metricIntervalLowerBound = this.metricIntervalLowerBound;
    final metricIntervalUpperBound = this.metricIntervalUpperBound;
    return {
      'ScalingAdjustment': scalingAdjustment,
      if (metricIntervalLowerBound != null)
        'MetricIntervalLowerBound': metricIntervalLowerBound,
      if (metricIntervalUpperBound != null)
        'MetricIntervalUpperBound': metricIntervalUpperBound,
    };
  }
}

/// Represents a step scaling policy configuration to use with Application Auto
/// Scaling.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html">Step
/// scaling policies</a> in the <i>Application Auto Scaling User Guide</i>.
class StepScalingPolicyConfiguration {
  /// Specifies how the <code>ScalingAdjustment</code> value in a <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/APIReference/API_StepAdjustment.html">StepAdjustment</a>
  /// is interpreted (for example, an absolute number or a percentage). The valid
  /// values are <code>ChangeInCapacity</code>, <code>ExactCapacity</code>, and
  /// <code>PercentChangeInCapacity</code>.
  ///
  /// <code>AdjustmentType</code> is required if you are adding a new step scaling
  /// policy configuration.
  final AdjustmentType? adjustmentType;

  /// The amount of time, in seconds, to wait for a previous scaling activity to
  /// take effect. If not specified, the default value is 300. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/step-scaling-policy-overview.html#step-scaling-cooldown">Cooldown
  /// period</a> in the <i>Application Auto Scaling User Guide</i>.
  final int? cooldown;

  /// The aggregation type for the CloudWatch metrics. Valid values are
  /// <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code>. If the
  /// aggregation type is null, the value is treated as <code>Average</code>.
  final MetricAggregationType? metricAggregationType;

  /// The minimum value to scale by when the adjustment type is
  /// <code>PercentChangeInCapacity</code>. For example, suppose that you create a
  /// step scaling policy to scale out an Amazon ECS service by 25 percent and you
  /// specify a <code>MinAdjustmentMagnitude</code> of 2. If the service has 4
  /// tasks and the scaling policy is performed, 25 percent of 4 is 1. However,
  /// because you specified a <code>MinAdjustmentMagnitude</code> of 2,
  /// Application Auto Scaling scales out the service by 2 tasks.
  final int? minAdjustmentMagnitude;

  /// A set of adjustments that enable you to scale based on the size of the alarm
  /// breach.
  ///
  /// At least one step adjustment is required if you are adding a new step
  /// scaling policy configuration.
  final List<StepAdjustment>? stepAdjustments;

  StepScalingPolicyConfiguration({
    this.adjustmentType,
    this.cooldown,
    this.metricAggregationType,
    this.minAdjustmentMagnitude,
    this.stepAdjustments,
  });

  factory StepScalingPolicyConfiguration.fromJson(Map<String, dynamic> json) {
    return StepScalingPolicyConfiguration(
      adjustmentType: (json['AdjustmentType'] as String?)?.toAdjustmentType(),
      cooldown: json['Cooldown'] as int?,
      metricAggregationType:
          (json['MetricAggregationType'] as String?)?.toMetricAggregationType(),
      minAdjustmentMagnitude: json['MinAdjustmentMagnitude'] as int?,
      stepAdjustments: (json['StepAdjustments'] as List?)
          ?.whereNotNull()
          .map((e) => StepAdjustment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final adjustmentType = this.adjustmentType;
    final cooldown = this.cooldown;
    final metricAggregationType = this.metricAggregationType;
    final minAdjustmentMagnitude = this.minAdjustmentMagnitude;
    final stepAdjustments = this.stepAdjustments;
    return {
      if (adjustmentType != null) 'AdjustmentType': adjustmentType.toValue(),
      if (cooldown != null) 'Cooldown': cooldown,
      if (metricAggregationType != null)
        'MetricAggregationType': metricAggregationType.toValue(),
      if (minAdjustmentMagnitude != null)
        'MinAdjustmentMagnitude': minAdjustmentMagnitude,
      if (stepAdjustments != null) 'StepAdjustments': stepAdjustments,
    };
  }
}

/// Specifies whether the scaling activities for a scalable target are in a
/// suspended state.
class SuspendedState {
  /// Whether scale in by a target tracking scaling policy or a step scaling
  /// policy is suspended. Set the value to <code>true</code> if you don't want
  /// Application Auto Scaling to remove capacity when a scaling policy is
  /// triggered. The default is <code>false</code>.
  final bool? dynamicScalingInSuspended;

  /// Whether scale out by a target tracking scaling policy or a step scaling
  /// policy is suspended. Set the value to <code>true</code> if you don't want
  /// Application Auto Scaling to add capacity when a scaling policy is triggered.
  /// The default is <code>false</code>.
  final bool? dynamicScalingOutSuspended;

  /// Whether scheduled scaling is suspended. Set the value to <code>true</code>
  /// if you don't want Application Auto Scaling to add or remove capacity by
  /// initiating scheduled actions. The default is <code>false</code>.
  final bool? scheduledScalingSuspended;

  SuspendedState({
    this.dynamicScalingInSuspended,
    this.dynamicScalingOutSuspended,
    this.scheduledScalingSuspended,
  });

  factory SuspendedState.fromJson(Map<String, dynamic> json) {
    return SuspendedState(
      dynamicScalingInSuspended: json['DynamicScalingInSuspended'] as bool?,
      dynamicScalingOutSuspended: json['DynamicScalingOutSuspended'] as bool?,
      scheduledScalingSuspended: json['ScheduledScalingSuspended'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final dynamicScalingInSuspended = this.dynamicScalingInSuspended;
    final dynamicScalingOutSuspended = this.dynamicScalingOutSuspended;
    final scheduledScalingSuspended = this.scheduledScalingSuspended;
    return {
      if (dynamicScalingInSuspended != null)
        'DynamicScalingInSuspended': dynamicScalingInSuspended,
      if (dynamicScalingOutSuspended != null)
        'DynamicScalingOutSuspended': dynamicScalingOutSuspended,
      if (scheduledScalingSuspended != null)
        'ScheduledScalingSuspended': scheduledScalingSuspended,
    };
  }
}

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a specific metric.
///
/// Metric is a property of the <a>TargetTrackingMetricStat</a> object.
class TargetTrackingMetric {
  /// The dimensions for the metric. For the list of available dimensions, see the
  /// Amazon Web Services documentation available from the table in <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html">Amazon
  /// Web Services services that publish CloudWatch metrics </a> in the <i>Amazon
  /// CloudWatch User Guide</i>.
  ///
  /// Conditional: If you published your metric with dimensions, you must specify
  /// the same dimensions in your scaling policy.
  final List<TargetTrackingMetricDimension>? dimensions;

  /// The name of the metric.
  final String? metricName;

  /// The namespace of the metric. For more information, see the table in <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/aws-services-cloudwatch-metrics.html">Amazon
  /// Web Services services that publish CloudWatch metrics </a> in the <i>Amazon
  /// CloudWatch User Guide</i>.
  final String? namespace;

  TargetTrackingMetric({
    this.dimensions,
    this.metricName,
    this.namespace,
  });

  factory TargetTrackingMetric.fromJson(Map<String, dynamic> json) {
    return TargetTrackingMetric(
      dimensions: (json['Dimensions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              TargetTrackingMetricDimension.fromJson(e as Map<String, dynamic>))
          .toList(),
      metricName: json['MetricName'] as String?,
      namespace: json['Namespace'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dimensions = this.dimensions;
    final metricName = this.metricName;
    final namespace = this.namespace;
    return {
      if (dimensions != null) 'Dimensions': dimensions,
      if (metricName != null) 'MetricName': metricName,
      if (namespace != null) 'Namespace': namespace,
    };
  }
}

/// The metric data to return. Also defines whether this call is returning data
/// for one metric only, or whether it is performing a math expression on the
/// values of returned metric statistics to create a new time series. A time
/// series is a series of data points, each of which is associated with a
/// timestamp.
///
/// For more information and examples, see <a
/// href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking-metric-math.html">Create
/// a target tracking scaling policy for Application Auto Scaling using metric
/// math</a> in the <i>Application Auto Scaling User Guide</i>.
class TargetTrackingMetricDataQuery {
  /// A short name that identifies the object's results in the response. This name
  /// must be unique among all <code>MetricDataQuery</code> objects specified for
  /// a single scaling policy. If you are performing math expressions on this set
  /// of data, this name represents that data and can serve as a variable in the
  /// mathematical expression. The valid characters are letters, numbers, and
  /// underscores. The first character must be a lowercase letter.
  final String id;

  /// The math expression to perform on the returned data, if this object is
  /// performing a math expression. This expression can use the <code>Id</code> of
  /// the other metrics to refer to those metrics, and can also use the
  /// <code>Id</code> of other expressions to use the result of those expressions.
  ///
  /// Conditional: Within each <code>TargetTrackingMetricDataQuery</code> object,
  /// you must specify either <code>Expression</code> or <code>MetricStat</code>,
  /// but not both.
  final String? expression;

  /// A human-readable label for this metric or expression. This is especially
  /// useful if this is a math expression, so that you know what the value
  /// represents.
  final String? label;

  /// Information about the metric data to return.
  ///
  /// Conditional: Within each <code>MetricDataQuery</code> object, you must
  /// specify either <code>Expression</code> or <code>MetricStat</code>, but not
  /// both.
  final TargetTrackingMetricStat? metricStat;

  /// Indicates whether to return the timestamps and raw data values of this
  /// metric.
  ///
  /// If you use any math expressions, specify <code>true</code> for this value
  /// for only the final math expression that the metric specification is based
  /// on. You must specify <code>false</code> for <code>ReturnData</code> for all
  /// the other metrics and expressions used in the metric specification.
  ///
  /// If you are only retrieving metrics and not performing any math expressions,
  /// do not specify anything for <code>ReturnData</code>. This sets it to its
  /// default (<code>true</code>).
  final bool? returnData;

  TargetTrackingMetricDataQuery({
    required this.id,
    this.expression,
    this.label,
    this.metricStat,
    this.returnData,
  });

  factory TargetTrackingMetricDataQuery.fromJson(Map<String, dynamic> json) {
    return TargetTrackingMetricDataQuery(
      id: json['Id'] as String,
      expression: json['Expression'] as String?,
      label: json['Label'] as String?,
      metricStat: json['MetricStat'] != null
          ? TargetTrackingMetricStat.fromJson(
              json['MetricStat'] as Map<String, dynamic>)
          : null,
      returnData: json['ReturnData'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final expression = this.expression;
    final label = this.label;
    final metricStat = this.metricStat;
    final returnData = this.returnData;
    return {
      'Id': id,
      if (expression != null) 'Expression': expression,
      if (label != null) 'Label': label,
      if (metricStat != null) 'MetricStat': metricStat,
      if (returnData != null) 'ReturnData': returnData,
    };
  }
}

/// Describes the dimension of a metric.
class TargetTrackingMetricDimension {
  /// The name of the dimension.
  final String name;

  /// The value of the dimension.
  final String value;

  TargetTrackingMetricDimension({
    required this.name,
    required this.value,
  });

  factory TargetTrackingMetricDimension.fromJson(Map<String, dynamic> json) {
    return TargetTrackingMetricDimension(
      name: json['Name'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'Name': name,
      'Value': value,
    };
  }
}

/// This structure defines the CloudWatch metric to return, along with the
/// statistic, period, and unit.
///
/// For more information about the CloudWatch terminology below, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html">Amazon
/// CloudWatch concepts</a> in the <i>Amazon CloudWatch User Guide</i>.
class TargetTrackingMetricStat {
  /// The CloudWatch metric to return, including the metric name, namespace, and
  /// dimensions. To get the exact metric name, namespace, and dimensions, inspect
  /// the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_Metric.html">Metric</a>
  /// object that is returned by a call to <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_ListMetrics.html">ListMetrics</a>.
  final TargetTrackingMetric metric;

  /// The statistic to return. It can include any CloudWatch statistic or extended
  /// statistic. For a list of valid values, see the table in <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#Statistic">Statistics</a>
  /// in the <i>Amazon CloudWatch User Guide</i>.
  ///
  /// The most commonly used metric for scaling is <code>Average</code>.
  final String stat;

  /// The unit to use for the returned data points. For a complete list of the
  /// units that CloudWatch supports, see the <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/APIReference/API_MetricDatum.html">MetricDatum</a>
  /// data type in the <i>Amazon CloudWatch API Reference</i>.
  final String? unit;

  TargetTrackingMetricStat({
    required this.metric,
    required this.stat,
    this.unit,
  });

  factory TargetTrackingMetricStat.fromJson(Map<String, dynamic> json) {
    return TargetTrackingMetricStat(
      metric:
          TargetTrackingMetric.fromJson(json['Metric'] as Map<String, dynamic>),
      stat: json['Stat'] as String,
      unit: json['Unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metric = this.metric;
    final stat = this.stat;
    final unit = this.unit;
    return {
      'Metric': metric,
      'Stat': stat,
      if (unit != null) 'Unit': unit,
    };
  }
}

/// Represents a target tracking scaling policy configuration to use with
/// Application Auto Scaling.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html">Target
/// tracking scaling policies</a> in the <i>Application Auto Scaling User
/// Guide</i>.
class TargetTrackingScalingPolicyConfiguration {
  /// The target value for the metric. Although this property accepts numbers of
  /// type Double, it won't accept values that are either too small or too large.
  /// Values must be in the range of -2^360 to 2^360. The value must be a valid
  /// number based on the choice of metric. For example, if the metric is CPU
  /// utilization, then the target value is a percent value that represents how
  /// much of the CPU can be used before scaling out.
  /// <note>
  /// If the scaling policy specifies the <code>ALBRequestCountPerTarget</code>
  /// predefined metric, specify the target utilization as the optimal average
  /// request count per target during any one-minute interval.
  /// </note>
  final double targetValue;

  /// A customized metric. You can specify either a predefined metric or a
  /// customized metric.
  final CustomizedMetricSpecification? customizedMetricSpecification;

  /// Indicates whether scale in by the target tracking scaling policy is
  /// disabled. If the value is <code>true</code>, scale in is disabled and the
  /// target tracking scaling policy won't remove capacity from the scalable
  /// target. Otherwise, scale in is enabled and the target tracking scaling
  /// policy can remove capacity from the scalable target. The default value is
  /// <code>false</code>.
  final bool? disableScaleIn;

  /// A predefined metric. You can specify either a predefined metric or a
  /// customized metric.
  final PredefinedMetricSpecification? predefinedMetricSpecification;

  /// The amount of time, in seconds, after a scale-in activity completes before
  /// another scale-in activity can start. For more information and for default
  /// values, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/target-tracking-scaling-policy-overview.html#target-tracking-cooldown">Define
  /// cooldown periods</a> in the <i>Application Auto Scaling User Guide</i>.
  final int? scaleInCooldown;

  /// The amount of time, in seconds, to wait for a previous scale-out activity to
  /// take effect. For more information and for default values, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/target-tracking-scaling-policy-overview.html#target-tracking-cooldown">Define
  /// cooldown periods</a> in the <i>Application Auto Scaling User Guide</i>.
  final int? scaleOutCooldown;

  TargetTrackingScalingPolicyConfiguration({
    required this.targetValue,
    this.customizedMetricSpecification,
    this.disableScaleIn,
    this.predefinedMetricSpecification,
    this.scaleInCooldown,
    this.scaleOutCooldown,
  });

  factory TargetTrackingScalingPolicyConfiguration.fromJson(
      Map<String, dynamic> json) {
    return TargetTrackingScalingPolicyConfiguration(
      targetValue: json['TargetValue'] as double,
      customizedMetricSpecification:
          json['CustomizedMetricSpecification'] != null
              ? CustomizedMetricSpecification.fromJson(
                  json['CustomizedMetricSpecification'] as Map<String, dynamic>)
              : null,
      disableScaleIn: json['DisableScaleIn'] as bool?,
      predefinedMetricSpecification:
          json['PredefinedMetricSpecification'] != null
              ? PredefinedMetricSpecification.fromJson(
                  json['PredefinedMetricSpecification'] as Map<String, dynamic>)
              : null,
      scaleInCooldown: json['ScaleInCooldown'] as int?,
      scaleOutCooldown: json['ScaleOutCooldown'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final targetValue = this.targetValue;
    final customizedMetricSpecification = this.customizedMetricSpecification;
    final disableScaleIn = this.disableScaleIn;
    final predefinedMetricSpecification = this.predefinedMetricSpecification;
    final scaleInCooldown = this.scaleInCooldown;
    final scaleOutCooldown = this.scaleOutCooldown;
    return {
      'TargetValue': targetValue,
      if (customizedMetricSpecification != null)
        'CustomizedMetricSpecification': customizedMetricSpecification,
      if (disableScaleIn != null) 'DisableScaleIn': disableScaleIn,
      if (predefinedMetricSpecification != null)
        'PredefinedMetricSpecification': predefinedMetricSpecification,
      if (scaleInCooldown != null) 'ScaleInCooldown': scaleInCooldown,
      if (scaleOutCooldown != null) 'ScaleOutCooldown': scaleOutCooldown,
    };
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ConcurrentUpdateException extends _s.GenericAwsException {
  ConcurrentUpdateException({String? type, String? message})
      : super(type: type, code: 'ConcurrentUpdateException', message: message);
}

class FailedResourceAccessException extends _s.GenericAwsException {
  FailedResourceAccessException({String? type, String? message})
      : super(
            type: type,
            code: 'FailedResourceAccessException',
            message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String? type, String? message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ObjectNotFoundException extends _s.GenericAwsException {
  ObjectNotFoundException({String? type, String? message})
      : super(type: type, code: 'ObjectNotFoundException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConcurrentUpdateException': (type, message) =>
      ConcurrentUpdateException(type: type, message: message),
  'FailedResourceAccessException': (type, message) =>
      FailedResourceAccessException(type: type, message: message),
  'InternalServiceException': (type, message) =>
      InternalServiceException(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ObjectNotFoundException': (type, message) =>
      ObjectNotFoundException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
