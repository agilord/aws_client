// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822fromJson,
        rfc822toJson,
        iso8601fromJson,
        iso8601toJson,
        unixFromJson,
        unixToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'application-autoscaling-2016-02-06.g.dart';

/// With Application Auto Scaling, you can configure automatic scaling for the
/// following resources:
///
/// <ul>
/// <li>
/// Amazon ECS services
/// </li>
/// <li>
/// Amazon EC2 Spot Fleet requests
/// </li>
/// <li>
/// Amazon EMR clusters
/// </li>
/// <li>
/// Amazon AppStream 2.0 fleets
/// </li>
/// <li>
/// Amazon DynamoDB tables and global secondary indexes throughput capacity
/// </li>
/// <li>
/// Amazon Aurora Replicas
/// </li>
/// <li>
/// Amazon SageMaker endpoint variants
/// </li>
/// <li>
/// Custom resources provided by your own applications or services
/// </li>
/// <li>
/// Amazon Comprehend document classification endpoints
/// </li>
/// <li>
/// AWS Lambda function provisioned concurrency
/// </li>
/// </ul>
/// <b>API Summary</b>
///
/// The Application Auto Scaling service API includes three key sets of actions:
///
/// <ul>
/// <li>
/// Register and manage scalable targets - Register AWS or custom resources as
/// scalable targets (a resource that Application Auto Scaling can scale), set
/// minimum and maximum capacity limits, and retrieve information on existing
/// scalable targets.
/// </li>
/// <li>
/// Configure and manage automatic scaling - Define scaling policies to
/// dynamically scale your resources in response to CloudWatch alarms, schedule
/// one-time or recurring scaling actions, and retrieve your recent scaling
/// activity history.
/// </li>
/// <li>
/// Suspend and resume scaling - Temporarily suspend and later resume automatic
/// scaling by calling the <a>RegisterScalableTarget</a> action for any
/// Application Auto Scaling scalable target. You can suspend and resume,
/// individually or in combination, scale-out activities triggered by a scaling
/// policy, scale-in activities triggered by a scaling policy, and scheduled
/// scaling.
/// </li>
/// </ul>
/// To learn more about Application Auto Scaling, including information about
/// granting IAM users required permissions for Application Auto Scaling
/// actions, see the <a
/// href="https://docs.aws.amazon.com/autoscaling/application/userguide/what-is-application-auto-scaling.html">Application
/// Auto Scaling User Guide</a>.
class ApplicationAutoScaling {
  final _s.JsonProtocol _protocol;
  ApplicationAutoScaling({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: 'application-autoscaling',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Deletes the specified scaling policy for an Application Auto Scaling
  /// scalable target.
  ///
  /// Deleting a step scaling policy deletes the underlying alarm action, but
  /// does not delete the CloudWatch alarm associated with the scaling policy,
  /// even if it no longer has an associated action.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html#delete-step-scaling-policy">Delete
  /// a Step Scaling Policy</a> and <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html#delete-target-tracking-policy">Delete
  /// a Target Tracking Scaling Policy</a> in the <i>Application Auto Scaling
  /// User Guide</i>.
  ///
  /// To create a scaling policy or update an existing one, see
  /// <a>PutScalingPolicy</a>.
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
  /// Spot Fleet request - The resource type is <code>spot-fleet-request</code>
  /// and the unique identifier is the Spot Fleet request ID. Example:
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
  /// Amazon SageMaker endpoint variant - The resource type is
  /// <code>variant</code> and the unique identifier is the resource ID.
  /// Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.
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
  /// Lambda provisioned concurrency - The resource type is
  /// <code>function</code> and the unique identifier is the function name with
  /// a function version or alias name suffix that is not <code>$LATEST</code>.
  /// Example: <code>function:my-function:prod</code> or
  /// <code>function:my-function:1</code>.
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
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity
  /// of a Spot Fleet request.
  /// </li>
  /// <li>
  /// <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance
  /// count of an EMR Instance Group.
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
  /// instances for an Amazon SageMaker model endpoint variant.
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
  /// <code>lambda:function:ProvisionedConcurrency</code> - The provisioned
  /// concurrency for a Lambda function.
  /// </li>
  /// </ul>
  ///
  /// Parameter [serviceNamespace] :
  /// The namespace of the AWS service that provides the resource or
  /// <code>custom-resource</code> for a resource provided by your own
  /// application or service. For more information, see <a
  /// href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">AWS
  /// Service Namespaces</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  Future<void> deleteScalingPolicy({
    @_s.required String policyName,
    @_s.required String resourceId,
    @_s.required ScalableDimension scalableDimension,
    @_s.required ServiceNamespace serviceNamespace,
  }) async {
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scalableDimension, 'scalableDimension');
    ArgumentError.checkNotNull(serviceNamespace, 'serviceNamespace');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AnyScaleFrontendService.DeleteScalingPolicy'
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
        'ScalableDimension': scalableDimension?.toValue(),
        'ServiceNamespace': serviceNamespace?.toValue(),
      },
    );

    return DeleteScalingPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified scheduled action for an Application Auto Scaling
  /// scalable target.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-scheduled-scaling.html#delete-scheduled-action">Delete
  /// a Scheduled Action</a> in the <i>Application Auto Scaling User Guide</i>.
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
  /// Spot Fleet request - The resource type is <code>spot-fleet-request</code>
  /// and the unique identifier is the Spot Fleet request ID. Example:
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
  /// Amazon SageMaker endpoint variant - The resource type is
  /// <code>variant</code> and the unique identifier is the resource ID.
  /// Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.
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
  /// Lambda provisioned concurrency - The resource type is
  /// <code>function</code> and the unique identifier is the function name with
  /// a function version or alias name suffix that is not <code>$LATEST</code>.
  /// Example: <code>function:my-function:prod</code> or
  /// <code>function:my-function:1</code>.
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
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity
  /// of a Spot Fleet request.
  /// </li>
  /// <li>
  /// <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance
  /// count of an EMR Instance Group.
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
  /// instances for an Amazon SageMaker model endpoint variant.
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
  /// <code>lambda:function:ProvisionedConcurrency</code> - The provisioned
  /// concurrency for a Lambda function.
  /// </li>
  /// </ul>
  ///
  /// Parameter [scheduledActionName] :
  /// The name of the scheduled action.
  ///
  /// Parameter [serviceNamespace] :
  /// The namespace of the AWS service that provides the resource or
  /// <code>custom-resource</code> for a resource provided by your own
  /// application or service. For more information, see <a
  /// href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">AWS
  /// Service Namespaces</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  Future<void> deleteScheduledAction({
    @_s.required String resourceId,
    @_s.required ScalableDimension scalableDimension,
    @_s.required String scheduledActionName,
    @_s.required ServiceNamespace serviceNamespace,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scalableDimension, 'scalableDimension');
    ArgumentError.checkNotNull(scheduledActionName, 'scheduledActionName');
    _s.validateStringLength(
      'scheduledActionName',
      scheduledActionName,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'scheduledActionName',
      scheduledActionName,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceNamespace, 'serviceNamespace');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AnyScaleFrontendService.DeleteScheduledAction'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'ScalableDimension': scalableDimension?.toValue(),
        'ScheduledActionName': scheduledActionName,
        'ServiceNamespace': serviceNamespace?.toValue(),
      },
    );

    return DeleteScheduledActionResponse.fromJson(jsonResponse.body);
  }

  /// Deregisters an Application Auto Scaling scalable target.
  ///
  /// Deregistering a scalable target deletes the scaling policies that are
  /// associated with it.
  ///
  /// To create a scalable target or update an existing one, see
  /// <a>RegisterScalableTarget</a>.
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
  /// Spot Fleet request - The resource type is <code>spot-fleet-request</code>
  /// and the unique identifier is the Spot Fleet request ID. Example:
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
  /// Amazon SageMaker endpoint variant - The resource type is
  /// <code>variant</code> and the unique identifier is the resource ID.
  /// Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.
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
  /// Lambda provisioned concurrency - The resource type is
  /// <code>function</code> and the unique identifier is the function name with
  /// a function version or alias name suffix that is not <code>$LATEST</code>.
  /// Example: <code>function:my-function:prod</code> or
  /// <code>function:my-function:1</code>.
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
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity
  /// of a Spot Fleet request.
  /// </li>
  /// <li>
  /// <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance
  /// count of an EMR Instance Group.
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
  /// instances for an Amazon SageMaker model endpoint variant.
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
  /// <code>lambda:function:ProvisionedConcurrency</code> - The provisioned
  /// concurrency for a Lambda function.
  /// </li>
  /// </ul>
  ///
  /// Parameter [serviceNamespace] :
  /// The namespace of the AWS service that provides the resource or
  /// <code>custom-resource</code> for a resource provided by your own
  /// application or service. For more information, see <a
  /// href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">AWS
  /// Service Namespaces</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  Future<void> deregisterScalableTarget({
    @_s.required String resourceId,
    @_s.required ScalableDimension scalableDimension,
    @_s.required ServiceNamespace serviceNamespace,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scalableDimension, 'scalableDimension');
    ArgumentError.checkNotNull(serviceNamespace, 'serviceNamespace');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AnyScaleFrontendService.DeregisterScalableTarget'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'ScalableDimension': scalableDimension?.toValue(),
        'ServiceNamespace': serviceNamespace?.toValue(),
      },
    );

    return DeregisterScalableTargetResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about the scalable targets in the specified namespace.
  ///
  /// You can filter the results using <code>ResourceIds</code> and
  /// <code>ScalableDimension</code>.
  ///
  /// To create a scalable target or update an existing one, see
  /// <a>RegisterScalableTarget</a>. If you are no longer using a scalable
  /// target, you can deregister it using <a>DeregisterScalableTarget</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ConcurrentUpdateException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [serviceNamespace] :
  /// The namespace of the AWS service that provides the resource or
  /// <code>custom-resource</code> for a resource provided by your own
  /// application or service. For more information, see <a
  /// href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">AWS
  /// Service Namespaces</a> in the <i>Amazon Web Services General
  /// Reference</i>.
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
  /// string consists of the resource type and unique identifier. If you specify
  /// a scalable dimension, you must also specify a resource ID.
  ///
  /// <ul>
  /// <li>
  /// ECS service - The resource type is <code>service</code> and the unique
  /// identifier is the cluster name and service name. Example:
  /// <code>service/default/sample-webapp</code>.
  /// </li>
  /// <li>
  /// Spot Fleet request - The resource type is <code>spot-fleet-request</code>
  /// and the unique identifier is the Spot Fleet request ID. Example:
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
  /// Amazon SageMaker endpoint variant - The resource type is
  /// <code>variant</code> and the unique identifier is the resource ID.
  /// Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.
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
  /// Lambda provisioned concurrency - The resource type is
  /// <code>function</code> and the unique identifier is the function name with
  /// a function version or alias name suffix that is not <code>$LATEST</code>.
  /// Example: <code>function:my-function:prod</code> or
  /// <code>function:my-function:1</code>.
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
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity
  /// of a Spot Fleet request.
  /// </li>
  /// <li>
  /// <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance
  /// count of an EMR Instance Group.
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
  /// instances for an Amazon SageMaker model endpoint variant.
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
  /// <code>lambda:function:ProvisionedConcurrency</code> - The provisioned
  /// concurrency for a Lambda function.
  /// </li>
  /// </ul>
  Future<DescribeScalableTargetsResponse> describeScalableTargets({
    @_s.required ServiceNamespace serviceNamespace,
    int maxResults,
    String nextToken,
    List<String> resourceIds,
    ScalableDimension scalableDimension,
  }) async {
    ArgumentError.checkNotNull(serviceNamespace, 'serviceNamespace');
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
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
        'ServiceNamespace': serviceNamespace?.toValue(),
        'MaxResults': maxResults,
        'NextToken': nextToken,
        'ResourceIds': resourceIds,
        'ScalableDimension': scalableDimension?.toValue(),
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
  /// Scaling activities are triggered by CloudWatch alarms that are associated
  /// with scaling policies. To view the scaling policies for a service
  /// namespace, see <a>DescribeScalingPolicies</a>. To create a scaling policy
  /// or update an existing one, see <a>PutScalingPolicy</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ConcurrentUpdateException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [serviceNamespace] :
  /// The namespace of the AWS service that provides the resource or
  /// <code>custom-resource</code> for a resource provided by your own
  /// application or service. For more information, see <a
  /// href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">AWS
  /// Service Namespaces</a> in the <i>Amazon Web Services General
  /// Reference</i>.
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
  /// string consists of the resource type and unique identifier. If you specify
  /// a scalable dimension, you must also specify a resource ID.
  ///
  /// <ul>
  /// <li>
  /// ECS service - The resource type is <code>service</code> and the unique
  /// identifier is the cluster name and service name. Example:
  /// <code>service/default/sample-webapp</code>.
  /// </li>
  /// <li>
  /// Spot Fleet request - The resource type is <code>spot-fleet-request</code>
  /// and the unique identifier is the Spot Fleet request ID. Example:
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
  /// Amazon SageMaker endpoint variant - The resource type is
  /// <code>variant</code> and the unique identifier is the resource ID.
  /// Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.
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
  /// Lambda provisioned concurrency - The resource type is
  /// <code>function</code> and the unique identifier is the function name with
  /// a function version or alias name suffix that is not <code>$LATEST</code>.
  /// Example: <code>function:my-function:prod</code> or
  /// <code>function:my-function:1</code>.
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
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity
  /// of a Spot Fleet request.
  /// </li>
  /// <li>
  /// <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance
  /// count of an EMR Instance Group.
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
  /// instances for an Amazon SageMaker model endpoint variant.
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
  /// <code>lambda:function:ProvisionedConcurrency</code> - The provisioned
  /// concurrency for a Lambda function.
  /// </li>
  /// </ul>
  Future<DescribeScalingActivitiesResponse> describeScalingActivities({
    @_s.required ServiceNamespace serviceNamespace,
    int maxResults,
    String nextToken,
    String resourceId,
    ScalableDimension scalableDimension,
  }) async {
    ArgumentError.checkNotNull(serviceNamespace, 'serviceNamespace');
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      1600,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
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
        'ServiceNamespace': serviceNamespace?.toValue(),
        'MaxResults': maxResults,
        'NextToken': nextToken,
        'ResourceId': resourceId,
        'ScalableDimension': scalableDimension?.toValue(),
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
  /// To create a scaling policy or update an existing one, see
  /// <a>PutScalingPolicy</a>. If you are no longer using a scaling policy, you
  /// can delete it using <a>DeleteScalingPolicy</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [FailedResourceAccessException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ConcurrentUpdateException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [serviceNamespace] :
  /// The namespace of the AWS service that provides the resource or
  /// <code>custom-resource</code> for a resource provided by your own
  /// application or service. For more information, see <a
  /// href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">AWS
  /// Service Namespaces</a> in the <i>Amazon Web Services General
  /// Reference</i>.
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
  /// Parameter [policyNames] :
  /// The names of the scaling policies to describe.
  ///
  /// Parameter [resourceId] :
  /// The identifier of the resource associated with the scaling policy. This
  /// string consists of the resource type and unique identifier. If you specify
  /// a scalable dimension, you must also specify a resource ID.
  ///
  /// <ul>
  /// <li>
  /// ECS service - The resource type is <code>service</code> and the unique
  /// identifier is the cluster name and service name. Example:
  /// <code>service/default/sample-webapp</code>.
  /// </li>
  /// <li>
  /// Spot Fleet request - The resource type is <code>spot-fleet-request</code>
  /// and the unique identifier is the Spot Fleet request ID. Example:
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
  /// Amazon SageMaker endpoint variant - The resource type is
  /// <code>variant</code> and the unique identifier is the resource ID.
  /// Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.
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
  /// Lambda provisioned concurrency - The resource type is
  /// <code>function</code> and the unique identifier is the function name with
  /// a function version or alias name suffix that is not <code>$LATEST</code>.
  /// Example: <code>function:my-function:prod</code> or
  /// <code>function:my-function:1</code>.
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
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity
  /// of a Spot Fleet request.
  /// </li>
  /// <li>
  /// <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance
  /// count of an EMR Instance Group.
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
  /// instances for an Amazon SageMaker model endpoint variant.
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
  /// <code>lambda:function:ProvisionedConcurrency</code> - The provisioned
  /// concurrency for a Lambda function.
  /// </li>
  /// </ul>
  Future<DescribeScalingPoliciesResponse> describeScalingPolicies({
    @_s.required ServiceNamespace serviceNamespace,
    int maxResults,
    String nextToken,
    List<String> policyNames,
    String resourceId,
    ScalableDimension scalableDimension,
  }) async {
    ArgumentError.checkNotNull(serviceNamespace, 'serviceNamespace');
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      1600,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
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
        'ServiceNamespace': serviceNamespace?.toValue(),
        'MaxResults': maxResults,
        'NextToken': nextToken,
        'PolicyNames': policyNames,
        'ResourceId': resourceId,
        'ScalableDimension': scalableDimension?.toValue(),
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
  /// To create a scheduled action or update an existing one, see
  /// <a>PutScheduledAction</a>. If you are no longer using a scheduled action,
  /// you can delete it using <a>DeleteScheduledAction</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ConcurrentUpdateException].
  /// May throw [InternalServiceException].
  ///
  /// Parameter [serviceNamespace] :
  /// The namespace of the AWS service that provides the resource or
  /// <code>custom-resource</code> for a resource provided by your own
  /// application or service. For more information, see <a
  /// href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">AWS
  /// Service Namespaces</a> in the <i>Amazon Web Services General
  /// Reference</i>.
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
  /// string consists of the resource type and unique identifier. If you specify
  /// a scalable dimension, you must also specify a resource ID.
  ///
  /// <ul>
  /// <li>
  /// ECS service - The resource type is <code>service</code> and the unique
  /// identifier is the cluster name and service name. Example:
  /// <code>service/default/sample-webapp</code>.
  /// </li>
  /// <li>
  /// Spot Fleet request - The resource type is <code>spot-fleet-request</code>
  /// and the unique identifier is the Spot Fleet request ID. Example:
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
  /// Amazon SageMaker endpoint variant - The resource type is
  /// <code>variant</code> and the unique identifier is the resource ID.
  /// Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.
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
  /// Lambda provisioned concurrency - The resource type is
  /// <code>function</code> and the unique identifier is the function name with
  /// a function version or alias name suffix that is not <code>$LATEST</code>.
  /// Example: <code>function:my-function:prod</code> or
  /// <code>function:my-function:1</code>.
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
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity
  /// of a Spot Fleet request.
  /// </li>
  /// <li>
  /// <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance
  /// count of an EMR Instance Group.
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
  /// instances for an Amazon SageMaker model endpoint variant.
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
  /// <code>lambda:function:ProvisionedConcurrency</code> - The provisioned
  /// concurrency for a Lambda function.
  /// </li>
  /// </ul>
  ///
  /// Parameter [scheduledActionNames] :
  /// The names of the scheduled actions to describe.
  Future<DescribeScheduledActionsResponse> describeScheduledActions({
    @_s.required ServiceNamespace serviceNamespace,
    int maxResults,
    String nextToken,
    String resourceId,
    ScalableDimension scalableDimension,
    List<String> scheduledActionNames,
  }) async {
    ArgumentError.checkNotNull(serviceNamespace, 'serviceNamespace');
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      1600,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
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
        'ServiceNamespace': serviceNamespace?.toValue(),
        'MaxResults': maxResults,
        'NextToken': nextToken,
        'ResourceId': resourceId,
        'ScalableDimension': scalableDimension?.toValue(),
        'ScheduledActionNames': scheduledActionNames,
      },
    );

    return DescribeScheduledActionsResponse.fromJson(jsonResponse.body);
  }

  /// Creates or updates a policy for an Application Auto Scaling scalable
  /// target.
  ///
  /// Each scalable target is identified by a service namespace, resource ID,
  /// and scalable dimension. A scaling policy applies to the scalable target
  /// identified by those three attributes. You cannot create a scaling policy
  /// until you have registered the resource as a scalable target using
  /// <a>RegisterScalableTarget</a>.
  ///
  /// To update a policy, specify its policy name and the parameters that you
  /// want to change. Any parameters that you don't specify are not changed by
  /// this update request.
  ///
  /// You can view the scaling policies for a service namespace using
  /// <a>DescribeScalingPolicies</a>. If you are no longer using a scaling
  /// policy, you can delete it using <a>DeleteScalingPolicy</a>.
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
  /// Learn more about how to work with scaling policies in the <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/what-is-application-auto-scaling.html">Application
  /// Auto Scaling User Guide</a>.
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
  /// Spot Fleet request - The resource type is <code>spot-fleet-request</code>
  /// and the unique identifier is the Spot Fleet request ID. Example:
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
  /// Amazon SageMaker endpoint variant - The resource type is
  /// <code>variant</code> and the unique identifier is the resource ID.
  /// Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.
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
  /// Lambda provisioned concurrency - The resource type is
  /// <code>function</code> and the unique identifier is the function name with
  /// a function version or alias name suffix that is not <code>$LATEST</code>.
  /// Example: <code>function:my-function:prod</code> or
  /// <code>function:my-function:1</code>.
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
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity
  /// of a Spot Fleet request.
  /// </li>
  /// <li>
  /// <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance
  /// count of an EMR Instance Group.
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
  /// instances for an Amazon SageMaker model endpoint variant.
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
  /// <code>lambda:function:ProvisionedConcurrency</code> - The provisioned
  /// concurrency for a Lambda function.
  /// </li>
  /// </ul>
  ///
  /// Parameter [serviceNamespace] :
  /// The namespace of the AWS service that provides the resource or
  /// <code>custom-resource</code> for a resource provided by your own
  /// application or service. For more information, see <a
  /// href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">AWS
  /// Service Namespaces</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  ///
  /// Parameter [policyType] :
  /// The policy type. This parameter is required if you are creating a scaling
  /// policy.
  ///
  /// The following policy types are supported:
  ///
  /// <code>TargetTrackingScaling</code>—Not supported for Amazon EMR
  ///
  /// <code>StepScaling</code>—Not supported for DynamoDB, Amazon Comprehend, or
  /// AWS Lambda
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-target-tracking.html">Target
  /// Tracking Scaling Policies</a> and <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-step-scaling-policies.html">Step
  /// Scaling Policies</a> in the <i>Application Auto Scaling User Guide</i>.
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
    @_s.required String policyName,
    @_s.required String resourceId,
    @_s.required ScalableDimension scalableDimension,
    @_s.required ServiceNamespace serviceNamespace,
    PolicyType policyType,
    StepScalingPolicyConfiguration stepScalingPolicyConfiguration,
    TargetTrackingScalingPolicyConfiguration
        targetTrackingScalingPolicyConfiguration,
  }) async {
    ArgumentError.checkNotNull(policyName, 'policyName');
    _s.validateStringLength(
      'policyName',
      policyName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'policyName',
      policyName,
      r'''\p{Print}+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scalableDimension, 'scalableDimension');
    ArgumentError.checkNotNull(serviceNamespace, 'serviceNamespace');
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
        'ScalableDimension': scalableDimension?.toValue(),
        'ServiceNamespace': serviceNamespace?.toValue(),
        'PolicyType': policyType?.toValue(),
        'StepScalingPolicyConfiguration': stepScalingPolicyConfiguration,
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
  /// until you have registered the resource as a scalable target using
  /// <a>RegisterScalableTarget</a>.
  ///
  /// To update an action, specify its name and the parameters that you want to
  /// change. If you don't specify start and end times, the old values are
  /// deleted. Any other parameters that you don't specify are not changed by
  /// this update request.
  ///
  /// You can view the scheduled actions using <a>DescribeScheduledActions</a>.
  /// If you are no longer using a scheduled action, you can delete it using
  /// <a>DeleteScheduledAction</a>.
  ///
  /// Learn more about how to work with scheduled actions in the <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/what-is-application-auto-scaling.html">Application
  /// Auto Scaling User Guide</a>.
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
  /// Spot Fleet request - The resource type is <code>spot-fleet-request</code>
  /// and the unique identifier is the Spot Fleet request ID. Example:
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
  /// Amazon SageMaker endpoint variant - The resource type is
  /// <code>variant</code> and the unique identifier is the resource ID.
  /// Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.
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
  /// Lambda provisioned concurrency - The resource type is
  /// <code>function</code> and the unique identifier is the function name with
  /// a function version or alias name suffix that is not <code>$LATEST</code>.
  /// Example: <code>function:my-function:prod</code> or
  /// <code>function:my-function:1</code>.
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
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity
  /// of a Spot Fleet request.
  /// </li>
  /// <li>
  /// <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance
  /// count of an EMR Instance Group.
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
  /// instances for an Amazon SageMaker model endpoint variant.
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
  /// <code>lambda:function:ProvisionedConcurrency</code> - The provisioned
  /// concurrency for a Lambda function.
  /// </li>
  /// </ul>
  ///
  /// Parameter [scheduledActionName] :
  /// The name of the scheduled action.
  ///
  /// Parameter [serviceNamespace] :
  /// The namespace of the AWS service that provides the resource or
  /// <code>custom-resource</code> for a resource provided by your own
  /// application or service. For more information, see <a
  /// href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">AWS
  /// Service Namespaces</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  ///
  /// Parameter [endTime] :
  /// The date and time for the scheduled action to end.
  ///
  /// Parameter [scalableTargetAction] :
  /// The new minimum and maximum capacity. You can set both values or just one.
  /// During the scheduled time, if the current capacity is below the minimum
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
  /// At expressions are useful for one-time schedules. Specify the time, in
  /// UTC.
  ///
  /// For rate expressions, <i>value</i> is a positive integer and <i>unit</i>
  /// is <code>minute</code> | <code>minutes</code> | <code>hour</code> |
  /// <code>hours</code> | <code>day</code> | <code>days</code>.
  ///
  /// For more information about cron expressions, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html#CronExpressions">Cron
  /// Expressions</a> in the <i>Amazon CloudWatch Events User Guide</i>.
  ///
  /// Parameter [startTime] :
  /// The date and time for the scheduled action to start.
  Future<void> putScheduledAction({
    @_s.required String resourceId,
    @_s.required ScalableDimension scalableDimension,
    @_s.required String scheduledActionName,
    @_s.required ServiceNamespace serviceNamespace,
    DateTime endTime,
    ScalableTargetAction scalableTargetAction,
    String schedule,
    DateTime startTime,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scalableDimension, 'scalableDimension');
    ArgumentError.checkNotNull(scheduledActionName, 'scheduledActionName');
    _s.validateStringLength(
      'scheduledActionName',
      scheduledActionName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'scheduledActionName',
      scheduledActionName,
      r'''(?!((^[ ]+.*)|(.*([\u0000-\u001f]|[\u007f-\u009f]|[:/|])+.*)|(.*[ ]+$))).+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(serviceNamespace, 'serviceNamespace');
    _s.validateStringLength(
      'schedule',
      schedule,
      1,
      1600,
    );
    _s.validateStringPattern(
      'schedule',
      schedule,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AnyScaleFrontendService.PutScheduledAction'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceId': resourceId,
        'ScalableDimension': scalableDimension?.toValue(),
        'ScheduledActionName': scheduledActionName,
        'ServiceNamespace': serviceNamespace?.toValue(),
        'EndTime': endTime,
        'ScalableTargetAction': scalableTargetAction,
        'Schedule': schedule,
        'StartTime': startTime,
      },
    );

    return PutScheduledActionResponse.fromJson(jsonResponse.body);
  }

  /// Registers or updates a scalable target. A scalable target is a resource
  /// that Application Auto Scaling can scale out and scale in. Scalable targets
  /// are uniquely identified by the combination of resource ID, scalable
  /// dimension, and namespace.
  ///
  /// When you register a new scalable target, you must specify values for
  /// minimum and maximum capacity. Application Auto Scaling will not scale
  /// capacity to values that are outside of this range.
  ///
  /// To update a scalable target, specify the parameter that you want to change
  /// as well as the following parameters that identify the scalable target:
  /// resource ID, scalable dimension, and namespace. Any parameters that you
  /// don't specify are not changed by this update request.
  ///
  /// After you register a scalable target, you do not need to register it again
  /// to use other Application Auto Scaling operations. To see which resources
  /// have been registered, use <a>DescribeScalableTargets</a>. You can also
  /// view the scaling policies for a service namespace by using
  /// <a>DescribeScalableTargets</a>.
  ///
  /// If you no longer need a scalable target, you can deregister it by using
  /// <a>DeregisterScalableTarget</a>.
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
  /// Spot Fleet request - The resource type is <code>spot-fleet-request</code>
  /// and the unique identifier is the Spot Fleet request ID. Example:
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
  /// Amazon SageMaker endpoint variant - The resource type is
  /// <code>variant</code> and the unique identifier is the resource ID.
  /// Example: <code>endpoint/my-end-point/variant/KMeansClustering</code>.
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
  /// Lambda provisioned concurrency - The resource type is
  /// <code>function</code> and the unique identifier is the function name with
  /// a function version or alias name suffix that is not <code>$LATEST</code>.
  /// Example: <code>function:my-function:prod</code> or
  /// <code>function:my-function:1</code>.
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
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity
  /// of a Spot Fleet request.
  /// </li>
  /// <li>
  /// <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance
  /// count of an EMR Instance Group.
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
  /// instances for an Amazon SageMaker model endpoint variant.
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
  /// <code>lambda:function:ProvisionedConcurrency</code> - The provisioned
  /// concurrency for a Lambda function.
  /// </li>
  /// </ul>
  ///
  /// Parameter [serviceNamespace] :
  /// The namespace of the AWS service that provides the resource or
  /// <code>custom-resource</code> for a resource provided by your own
  /// application or service. For more information, see <a
  /// href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">AWS
  /// Service Namespaces</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  ///
  /// Parameter [maxCapacity] :
  /// The maximum value to scale to in response to a scale-out event.
  /// <code>MaxCapacity</code> is required to register a scalable target.
  ///
  /// Parameter [minCapacity] :
  /// The minimum value to scale to in response to a scale-in event.
  /// <code>MinCapacity</code> is required to register a scalable target.
  ///
  /// Parameter [roleARN] :
  /// Application Auto Scaling creates a service-linked role that grants it
  /// permissions to modify the scalable target on your behalf. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/autoscaling/application/userguide/application-auto-scaling-service-linked-roles.html">Service-Linked
  /// Roles for Application Auto Scaling</a>.
  ///
  /// For Amazon EMR, this parameter is required, and it must specify the ARN of
  /// an IAM role that allows Application Auto Scaling to modify the scalable
  /// target on your behalf.
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
  /// and Resuming Scaling</a> in the <i>Application Auto Scaling User
  /// Guide</i>.
  Future<void> registerScalableTarget({
    @_s.required String resourceId,
    @_s.required ScalableDimension scalableDimension,
    @_s.required ServiceNamespace serviceNamespace,
    int maxCapacity,
    int minCapacity,
    String roleARN,
    SuspendedState suspendedState,
  }) async {
    ArgumentError.checkNotNull(resourceId, 'resourceId');
    _s.validateStringLength(
      'resourceId',
      resourceId,
      1,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceId',
      resourceId,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(scalableDimension, 'scalableDimension');
    ArgumentError.checkNotNull(serviceNamespace, 'serviceNamespace');
    _s.validateStringLength(
      'roleARN',
      roleARN,
      1,
      1600,
    );
    _s.validateStringPattern(
      'roleARN',
      roleARN,
      r'''[\u0020-\uD7FF\uE000-\uFFFD\uD800\uDC00-\uDBFF\uDFFF\r\n\t]*''',
    );
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
        'ScalableDimension': scalableDimension?.toValue(),
        'ServiceNamespace': serviceNamespace?.toValue(),
        'MaxCapacity': maxCapacity,
        'MinCapacity': minCapacity,
        'RoleARN': roleARN,
        'SuspendedState': suspendedState,
      },
    );

    return RegisterScalableTargetResponse.fromJson(jsonResponse.body);
  }
}

enum AdjustmentType {
  @_s.JsonValue('ChangeInCapacity')
  changeInCapacity,
  @_s.JsonValue('PercentChangeInCapacity')
  percentChangeInCapacity,
  @_s.JsonValue('ExactCapacity')
  exactCapacity,
}

/// Represents a CloudWatch alarm associated with a scaling policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Alarm {
  /// The Amazon Resource Name (ARN) of the alarm.
  @_s.JsonKey(name: 'AlarmARN')
  final String alarmARN;

  /// The name of the alarm.
  @_s.JsonKey(name: 'AlarmName')
  final String alarmName;

  Alarm({
    @_s.required this.alarmARN,
    @_s.required this.alarmName,
  });
  factory Alarm.fromJson(Map<String, dynamic> json) => _$AlarmFromJson(json);
}

/// Represents a CloudWatch metric of your choosing for a target tracking
/// scaling policy to use with Application Auto Scaling.
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
/// Custom Metrics</a> in the <i>Amazon CloudWatch User Guide</i>.
/// </li>
/// <li>
/// Choose a metric that changes proportionally with capacity. The value of the
/// metric should increase or decrease in inverse proportion to the number of
/// capacity units. That is, the value of the metric should decrease when
/// capacity increases.
/// </li>
/// </ul>
/// For more information about CloudWatch, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html">Amazon
/// CloudWatch Concepts</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CustomizedMetricSpecification {
  /// The name of the metric.
  @_s.JsonKey(name: 'MetricName')
  final String metricName;

  /// The namespace of the metric.
  @_s.JsonKey(name: 'Namespace')
  final String namespace;

  /// The statistic of the metric.
  @_s.JsonKey(name: 'Statistic')
  final MetricStatistic statistic;

  /// The dimensions of the metric.
  ///
  /// Conditional: If you published your metric with dimensions, you must specify
  /// the same dimensions in your scaling policy.
  @_s.JsonKey(name: 'Dimensions')
  final List<MetricDimension> dimensions;

  /// The unit of the metric.
  @_s.JsonKey(name: 'Unit')
  final String unit;

  CustomizedMetricSpecification({
    @_s.required this.metricName,
    @_s.required this.namespace,
    @_s.required this.statistic,
    this.dimensions,
    this.unit,
  });
  factory CustomizedMetricSpecification.fromJson(Map<String, dynamic> json) =>
      _$CustomizedMetricSpecificationFromJson(json);

  Map<String, dynamic> toJson() => _$CustomizedMetricSpecificationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteScalingPolicyResponse {
  DeleteScalingPolicyResponse();
  factory DeleteScalingPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteScalingPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteScheduledActionResponse {
  DeleteScheduledActionResponse();
  factory DeleteScheduledActionResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteScheduledActionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeregisterScalableTargetResponse {
  DeregisterScalableTargetResponse();
  factory DeregisterScalableTargetResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeregisterScalableTargetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeScalableTargetsResponse {
  /// The token required to get the next set of results. This value is
  /// <code>null</code> if there are no more results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The scalable targets that match the request parameters.
  @_s.JsonKey(name: 'ScalableTargets')
  final List<ScalableTarget> scalableTargets;

  DescribeScalableTargetsResponse({
    this.nextToken,
    this.scalableTargets,
  });
  factory DescribeScalableTargetsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeScalableTargetsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeScalingActivitiesResponse {
  /// The token required to get the next set of results. This value is
  /// <code>null</code> if there are no more results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of scaling activity objects.
  @_s.JsonKey(name: 'ScalingActivities')
  final List<ScalingActivity> scalingActivities;

  DescribeScalingActivitiesResponse({
    this.nextToken,
    this.scalingActivities,
  });
  factory DescribeScalingActivitiesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeScalingActivitiesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeScalingPoliciesResponse {
  /// The token required to get the next set of results. This value is
  /// <code>null</code> if there are no more results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the scaling policies.
  @_s.JsonKey(name: 'ScalingPolicies')
  final List<ScalingPolicy> scalingPolicies;

  DescribeScalingPoliciesResponse({
    this.nextToken,
    this.scalingPolicies,
  });
  factory DescribeScalingPoliciesResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeScalingPoliciesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeScheduledActionsResponse {
  /// The token required to get the next set of results. This value is
  /// <code>null</code> if there are no more results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the scheduled actions.
  @_s.JsonKey(name: 'ScheduledActions')
  final List<ScheduledAction> scheduledActions;

  DescribeScheduledActionsResponse({
    this.nextToken,
    this.scheduledActions,
  });
  factory DescribeScheduledActionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeScheduledActionsResponseFromJson(json);
}

enum MetricAggregationType {
  @_s.JsonValue('Average')
  average,
  @_s.JsonValue('Minimum')
  minimum,
  @_s.JsonValue('Maximum')
  maximum,
}

/// Describes the dimension names and values associated with a metric.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MetricDimension {
  /// The name of the dimension.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The value of the dimension.
  @_s.JsonKey(name: 'Value')
  final String value;

  MetricDimension({
    @_s.required this.name,
    @_s.required this.value,
  });
  factory MetricDimension.fromJson(Map<String, dynamic> json) =>
      _$MetricDimensionFromJson(json);

  Map<String, dynamic> toJson() => _$MetricDimensionToJson(this);
}

enum MetricStatistic {
  @_s.JsonValue('Average')
  average,
  @_s.JsonValue('Minimum')
  minimum,
  @_s.JsonValue('Maximum')
  maximum,
  @_s.JsonValue('SampleCount')
  sampleCount,
  @_s.JsonValue('Sum')
  sum,
}

enum MetricType {
  @_s.JsonValue('DynamoDBReadCapacityUtilization')
  dynamoDBReadCapacityUtilization,
  @_s.JsonValue('DynamoDBWriteCapacityUtilization')
  dynamoDBWriteCapacityUtilization,
  @_s.JsonValue('ALBRequestCountPerTarget')
  aLBRequestCountPerTarget,
  @_s.JsonValue('RDSReaderAverageCPUUtilization')
  rDSReaderAverageCPUUtilization,
  @_s.JsonValue('RDSReaderAverageDatabaseConnections')
  rDSReaderAverageDatabaseConnections,
  @_s.JsonValue('EC2SpotFleetRequestAverageCPUUtilization')
  eC2SpotFleetRequestAverageCPUUtilization,
  @_s.JsonValue('EC2SpotFleetRequestAverageNetworkIn')
  eC2SpotFleetRequestAverageNetworkIn,
  @_s.JsonValue('EC2SpotFleetRequestAverageNetworkOut')
  eC2SpotFleetRequestAverageNetworkOut,
  @_s.JsonValue('SageMakerVariantInvocationsPerInstance')
  sageMakerVariantInvocationsPerInstance,
  @_s.JsonValue('ECSServiceAverageCPUUtilization')
  eCSServiceAverageCPUUtilization,
  @_s.JsonValue('ECSServiceAverageMemoryUtilization')
  eCSServiceAverageMemoryUtilization,
  @_s.JsonValue('AppStreamAverageCapacityUtilization')
  appStreamAverageCapacityUtilization,
  @_s.JsonValue('ComprehendInferenceUtilization')
  comprehendInferenceUtilization,
  @_s.JsonValue('LambdaProvisionedConcurrencyUtilization')
  lambdaProvisionedConcurrencyUtilization,
}

enum PolicyType {
  @_s.JsonValue('StepScaling')
  stepScaling,
  @_s.JsonValue('TargetTrackingScaling')
  targetTrackingScaling,
}

extension on PolicyType {
  String toValue() {
    switch (this) {
      case PolicyType.stepScaling:
        return 'StepScaling';
      case PolicyType.targetTrackingScaling:
        return 'TargetTrackingScaling';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents a predefined metric for a target tracking scaling policy to use
/// with Application Auto Scaling.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PredefinedMetricSpecification {
  /// The metric type. The <code>ALBRequestCountPerTarget</code> metric type
  /// applies only to Spot Fleet requests and ECS services.
  @_s.JsonKey(name: 'PredefinedMetricType')
  final MetricType predefinedMetricType;

  /// Identifies the resource associated with the metric type. You can't specify a
  /// resource label unless the metric type is
  /// <code>ALBRequestCountPerTarget</code> and there is a target group attached
  /// to the Spot Fleet request or ECS service.
  ///
  /// The format is
  /// app/&lt;load-balancer-name&gt;/&lt;load-balancer-id&gt;/targetgroup/&lt;target-group-name&gt;/&lt;target-group-id&gt;,
  /// where:
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
  @_s.JsonKey(name: 'ResourceLabel')
  final String resourceLabel;

  PredefinedMetricSpecification({
    @_s.required this.predefinedMetricType,
    this.resourceLabel,
  });
  factory PredefinedMetricSpecification.fromJson(Map<String, dynamic> json) =>
      _$PredefinedMetricSpecificationFromJson(json);

  Map<String, dynamic> toJson() => _$PredefinedMetricSpecificationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutScalingPolicyResponse {
  /// The Amazon Resource Name (ARN) of the resulting scaling policy.
  @_s.JsonKey(name: 'PolicyARN')
  final String policyARN;

  /// The CloudWatch alarms created for the target tracking scaling policy.
  @_s.JsonKey(name: 'Alarms')
  final List<Alarm> alarms;

  PutScalingPolicyResponse({
    @_s.required this.policyARN,
    this.alarms,
  });
  factory PutScalingPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$PutScalingPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutScheduledActionResponse {
  PutScheduledActionResponse();
  factory PutScheduledActionResponse.fromJson(Map<String, dynamic> json) =>
      _$PutScheduledActionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterScalableTargetResponse {
  RegisterScalableTargetResponse();
  factory RegisterScalableTargetResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterScalableTargetResponseFromJson(json);
}

enum ScalableDimension {
  @_s.JsonValue('ecs:service:DesiredCount')
  ecsServiceDesiredCount,
  @_s.JsonValue('ec2:spot-fleet-request:TargetCapacity')
  ec2SpotFleetRequestTargetCapacity,
  @_s.JsonValue('elasticmapreduce:instancegroup:InstanceCount')
  elasticmapreduceInstancegroupInstanceCount,
  @_s.JsonValue('appstream:fleet:DesiredCapacity')
  appstreamFleetDesiredCapacity,
  @_s.JsonValue('dynamodb:table:ReadCapacityUnits')
  dynamodbTableReadCapacityUnits,
  @_s.JsonValue('dynamodb:table:WriteCapacityUnits')
  dynamodbTableWriteCapacityUnits,
  @_s.JsonValue('dynamodb:index:ReadCapacityUnits')
  dynamodbIndexReadCapacityUnits,
  @_s.JsonValue('dynamodb:index:WriteCapacityUnits')
  dynamodbIndexWriteCapacityUnits,
  @_s.JsonValue('rds:cluster:ReadReplicaCount')
  rdsClusterReadReplicaCount,
  @_s.JsonValue('sagemaker:variant:DesiredInstanceCount')
  sagemakerVariantDesiredInstanceCount,
  @_s.JsonValue('custom-resource:ResourceType:Property')
  customResourceResourceTypeProperty,
  @_s.JsonValue('comprehend:document-classifier-endpoint:DesiredInferenceUnits')
  comprehendDocumentClassifierEndpointDesiredInferenceUnits,
  @_s.JsonValue('lambda:function:ProvisionedConcurrency')
  lambdaFunctionProvisionedConcurrency,
}

extension on ScalableDimension {
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
      case ScalableDimension.lambdaFunctionProvisionedConcurrency:
        return 'lambda:function:ProvisionedConcurrency';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents a scalable target.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ScalableTarget {
  /// The Unix timestamp for when the scalable target was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The maximum value to scale to in response to a scale-out event.
  @_s.JsonKey(name: 'MaxCapacity')
  final int maxCapacity;

  /// The minimum value to scale to in response to a scale-in event.
  @_s.JsonKey(name: 'MinCapacity')
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
  /// Spot Fleet request - The resource type is <code>spot-fleet-request</code>
  /// and the unique identifier is the Spot Fleet request ID. Example:
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
  /// Amazon SageMaker endpoint variant - The resource type is
  /// <code>variant</code> and the unique identifier is the resource ID. Example:
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
  /// Lambda provisioned concurrency - The resource type is <code>function</code>
  /// and the unique identifier is the function name with a function version or
  /// alias name suffix that is not <code>$LATEST</code>. Example:
  /// <code>function:my-function:prod</code> or
  /// <code>function:my-function:1</code>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ResourceId')
  final String resourceId;

  /// The ARN of an IAM role that allows Application Auto Scaling to modify the
  /// scalable target on your behalf.
  @_s.JsonKey(name: 'RoleARN')
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
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of
  /// a Spot Fleet request.
  /// </li>
  /// <li>
  /// <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance
  /// count of an EMR Instance Group.
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
  /// instances for an Amazon SageMaker model endpoint variant.
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
  /// <code>lambda:function:ProvisionedConcurrency</code> - The provisioned
  /// concurrency for a Lambda function.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ScalableDimension')
  final ScalableDimension scalableDimension;

  /// The namespace of the AWS service that provides the resource or
  /// <code>custom-resource</code> for a resource provided by your own application
  /// or service. For more information, see <a
  /// href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">AWS
  /// Service Namespaces</a> in the <i>Amazon Web Services General Reference</i>.
  @_s.JsonKey(name: 'ServiceNamespace')
  final ServiceNamespace serviceNamespace;
  @_s.JsonKey(name: 'SuspendedState')
  final SuspendedState suspendedState;

  ScalableTarget({
    @_s.required this.creationTime,
    @_s.required this.maxCapacity,
    @_s.required this.minCapacity,
    @_s.required this.resourceId,
    @_s.required this.roleARN,
    @_s.required this.scalableDimension,
    @_s.required this.serviceNamespace,
    this.suspendedState,
  });
  factory ScalableTarget.fromJson(Map<String, dynamic> json) =>
      _$ScalableTargetFromJson(json);
}

/// Represents the minimum and maximum capacity for a scheduled action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ScalableTargetAction {
  /// The maximum capacity.
  @_s.JsonKey(name: 'MaxCapacity')
  final int maxCapacity;

  /// The minimum capacity.
  @_s.JsonKey(name: 'MinCapacity')
  final int minCapacity;

  ScalableTargetAction({
    this.maxCapacity,
    this.minCapacity,
  });
  factory ScalableTargetAction.fromJson(Map<String, dynamic> json) =>
      _$ScalableTargetActionFromJson(json);

  Map<String, dynamic> toJson() => _$ScalableTargetActionToJson(this);
}

/// Represents a scaling activity.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ScalingActivity {
  /// The unique identifier of the scaling activity.
  @_s.JsonKey(name: 'ActivityId')
  final String activityId;

  /// A simple description of what caused the scaling activity to happen.
  @_s.JsonKey(name: 'Cause')
  final String cause;

  /// A simple description of what action the scaling activity intends to
  /// accomplish.
  @_s.JsonKey(name: 'Description')
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
  /// Spot Fleet request - The resource type is <code>spot-fleet-request</code>
  /// and the unique identifier is the Spot Fleet request ID. Example:
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
  /// Amazon SageMaker endpoint variant - The resource type is
  /// <code>variant</code> and the unique identifier is the resource ID. Example:
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
  /// Lambda provisioned concurrency - The resource type is <code>function</code>
  /// and the unique identifier is the function name with a function version or
  /// alias name suffix that is not <code>$LATEST</code>. Example:
  /// <code>function:my-function:prod</code> or
  /// <code>function:my-function:1</code>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ResourceId')
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
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of
  /// a Spot Fleet request.
  /// </li>
  /// <li>
  /// <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance
  /// count of an EMR Instance Group.
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
  /// instances for an Amazon SageMaker model endpoint variant.
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
  /// <code>lambda:function:ProvisionedConcurrency</code> - The provisioned
  /// concurrency for a Lambda function.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ScalableDimension')
  final ScalableDimension scalableDimension;

  /// The namespace of the AWS service that provides the resource or
  /// <code>custom-resource</code> for a resource provided by your own application
  /// or service. For more information, see <a
  /// href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">AWS
  /// Service Namespaces</a> in the <i>Amazon Web Services General Reference</i>.
  @_s.JsonKey(name: 'ServiceNamespace')
  final ServiceNamespace serviceNamespace;

  /// The Unix timestamp for when the scaling activity began.
  @_s.JsonKey(name: 'StartTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime startTime;

  /// Indicates the status of the scaling activity.
  @_s.JsonKey(name: 'StatusCode')
  final ScalingActivityStatusCode statusCode;

  /// The details about the scaling activity.
  @_s.JsonKey(name: 'Details')
  final String details;

  /// The Unix timestamp for when the scaling activity ended.
  @_s.JsonKey(name: 'EndTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime endTime;

  /// A simple message about the current status of the scaling activity.
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  ScalingActivity({
    @_s.required this.activityId,
    @_s.required this.cause,
    @_s.required this.description,
    @_s.required this.resourceId,
    @_s.required this.scalableDimension,
    @_s.required this.serviceNamespace,
    @_s.required this.startTime,
    @_s.required this.statusCode,
    this.details,
    this.endTime,
    this.statusMessage,
  });
  factory ScalingActivity.fromJson(Map<String, dynamic> json) =>
      _$ScalingActivityFromJson(json);
}

enum ScalingActivityStatusCode {
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Successful')
  successful,
  @_s.JsonValue('Overridden')
  overridden,
  @_s.JsonValue('Unfulfilled')
  unfulfilled,
  @_s.JsonValue('Failed')
  failed,
}

/// Represents a scaling policy to use with Application Auto Scaling.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ScalingPolicy {
  /// The Unix timestamp for when the scaling policy was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the scaling policy.
  @_s.JsonKey(name: 'PolicyARN')
  final String policyARN;

  /// The name of the scaling policy.
  @_s.JsonKey(name: 'PolicyName')
  final String policyName;

  /// The scaling policy type.
  @_s.JsonKey(name: 'PolicyType')
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
  /// Spot Fleet request - The resource type is <code>spot-fleet-request</code>
  /// and the unique identifier is the Spot Fleet request ID. Example:
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
  /// Amazon SageMaker endpoint variant - The resource type is
  /// <code>variant</code> and the unique identifier is the resource ID. Example:
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
  /// Lambda provisioned concurrency - The resource type is <code>function</code>
  /// and the unique identifier is the function name with a function version or
  /// alias name suffix that is not <code>$LATEST</code>. Example:
  /// <code>function:my-function:prod</code> or
  /// <code>function:my-function:1</code>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ResourceId')
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
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of
  /// a Spot Fleet request.
  /// </li>
  /// <li>
  /// <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance
  /// count of an EMR Instance Group.
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
  /// instances for an Amazon SageMaker model endpoint variant.
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
  /// <code>lambda:function:ProvisionedConcurrency</code> - The provisioned
  /// concurrency for a Lambda function.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ScalableDimension')
  final ScalableDimension scalableDimension;

  /// The namespace of the AWS service that provides the resource or
  /// <code>custom-resource</code> for a resource provided by your own application
  /// or service. For more information, see <a
  /// href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">AWS
  /// Service Namespaces</a> in the <i>Amazon Web Services General Reference</i>.
  @_s.JsonKey(name: 'ServiceNamespace')
  final ServiceNamespace serviceNamespace;

  /// The CloudWatch alarms associated with the scaling policy.
  @_s.JsonKey(name: 'Alarms')
  final List<Alarm> alarms;

  /// A step scaling policy.
  @_s.JsonKey(name: 'StepScalingPolicyConfiguration')
  final StepScalingPolicyConfiguration stepScalingPolicyConfiguration;

  /// A target tracking scaling policy.
  @_s.JsonKey(name: 'TargetTrackingScalingPolicyConfiguration')
  final TargetTrackingScalingPolicyConfiguration
      targetTrackingScalingPolicyConfiguration;

  ScalingPolicy({
    @_s.required this.creationTime,
    @_s.required this.policyARN,
    @_s.required this.policyName,
    @_s.required this.policyType,
    @_s.required this.resourceId,
    @_s.required this.scalableDimension,
    @_s.required this.serviceNamespace,
    this.alarms,
    this.stepScalingPolicyConfiguration,
    this.targetTrackingScalingPolicyConfiguration,
  });
  factory ScalingPolicy.fromJson(Map<String, dynamic> json) =>
      _$ScalingPolicyFromJson(json);
}

/// Represents a scheduled action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ScheduledAction {
  /// The date and time that the scheduled action was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
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
  /// Spot Fleet request - The resource type is <code>spot-fleet-request</code>
  /// and the unique identifier is the Spot Fleet request ID. Example:
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
  /// Amazon SageMaker endpoint variant - The resource type is
  /// <code>variant</code> and the unique identifier is the resource ID. Example:
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
  /// Lambda provisioned concurrency - The resource type is <code>function</code>
  /// and the unique identifier is the function name with a function version or
  /// alias name suffix that is not <code>$LATEST</code>. Example:
  /// <code>function:my-function:prod</code> or
  /// <code>function:my-function:1</code>.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ResourceId')
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
  /// At expressions are useful for one-time schedules. Specify the time, in UTC.
  ///
  /// For rate expressions, <i>value</i> is a positive integer and <i>unit</i> is
  /// <code>minute</code> | <code>minutes</code> | <code>hour</code> |
  /// <code>hours</code> | <code>day</code> | <code>days</code>.
  ///
  /// For more information about cron expressions, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/ScheduledEvents.html#CronExpressions">Cron
  /// Expressions</a> in the <i>Amazon CloudWatch Events User Guide</i>.
  @_s.JsonKey(name: 'Schedule')
  final String schedule;

  /// The Amazon Resource Name (ARN) of the scheduled action.
  @_s.JsonKey(name: 'ScheduledActionARN')
  final String scheduledActionARN;

  /// The name of the scheduled action.
  @_s.JsonKey(name: 'ScheduledActionName')
  final String scheduledActionName;

  /// The namespace of the AWS service that provides the resource or
  /// <code>custom-resource</code> for a resource provided by your own application
  /// or service. For more information, see <a
  /// href="http://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#genref-aws-service-namespaces">AWS
  /// Service Namespaces</a> in the <i>Amazon Web Services General Reference</i>.
  @_s.JsonKey(name: 'ServiceNamespace')
  final ServiceNamespace serviceNamespace;

  /// The date and time that the action is scheduled to end.
  @_s.JsonKey(name: 'EndTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime endTime;

  /// The scalable dimension. This string consists of the service namespace,
  /// resource type, and scaling property.
  ///
  /// <ul>
  /// <li>
  /// <code>ecs:service:DesiredCount</code> - The desired task count of an ECS
  /// service.
  /// </li>
  /// <li>
  /// <code>ec2:spot-fleet-request:TargetCapacity</code> - The target capacity of
  /// a Spot Fleet request.
  /// </li>
  /// <li>
  /// <code>elasticmapreduce:instancegroup:InstanceCount</code> - The instance
  /// count of an EMR Instance Group.
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
  /// instances for an Amazon SageMaker model endpoint variant.
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
  /// <code>lambda:function:ProvisionedConcurrency</code> - The provisioned
  /// concurrency for a Lambda function.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ScalableDimension')
  final ScalableDimension scalableDimension;

  /// The new minimum and maximum capacity. You can set both values or just one.
  /// During the scheduled time, if the current capacity is below the minimum
  /// capacity, Application Auto Scaling scales out to the minimum capacity. If
  /// the current capacity is above the maximum capacity, Application Auto Scaling
  /// scales in to the maximum capacity.
  @_s.JsonKey(name: 'ScalableTargetAction')
  final ScalableTargetAction scalableTargetAction;

  /// The date and time that the action is scheduled to begin.
  @_s.JsonKey(name: 'StartTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime startTime;

  ScheduledAction({
    @_s.required this.creationTime,
    @_s.required this.resourceId,
    @_s.required this.schedule,
    @_s.required this.scheduledActionARN,
    @_s.required this.scheduledActionName,
    @_s.required this.serviceNamespace,
    this.endTime,
    this.scalableDimension,
    this.scalableTargetAction,
    this.startTime,
  });
  factory ScheduledAction.fromJson(Map<String, dynamic> json) =>
      _$ScheduledActionFromJson(json);
}

enum ServiceNamespace {
  @_s.JsonValue('ecs')
  ecs,
  @_s.JsonValue('elasticmapreduce')
  elasticmapreduce,
  @_s.JsonValue('ec2')
  ec2,
  @_s.JsonValue('appstream')
  appstream,
  @_s.JsonValue('dynamodb')
  dynamodb,
  @_s.JsonValue('rds')
  rds,
  @_s.JsonValue('sagemaker')
  sagemaker,
  @_s.JsonValue('custom-resource')
  customResource,
  @_s.JsonValue('comprehend')
  comprehend,
  @_s.JsonValue('lambda')
  lambda,
}

extension on ServiceNamespace {
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
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Represents a step adjustment for a <a>StepScalingPolicyConfiguration</a>.
/// Describes an adjustment based on the difference between the value of the
/// aggregated CloudWatch metric and the breach threshold that you've defined
/// for the alarm.
///
/// For the following examples, suppose that you have an alarm with a breach
/// threshold of 50:
///
/// <ul>
/// <li>
/// To trigger the adjustment when the metric is greater than or equal to 50 and
/// less than 60, specify a lower bound of 0 and an upper bound of 10.
/// </li>
/// <li>
/// To trigger the adjustment when the metric is greater than 40 and less than
/// or equal to 50, specify a lower bound of -10 and an upper bound of 0.
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StepAdjustment {
  /// The amount by which to scale, based on the specified adjustment type. A
  /// positive value adds to the current scalable dimension while a negative
  /// number removes from the current scalable dimension.
  @_s.JsonKey(name: 'ScalingAdjustment')
  final int scalingAdjustment;

  /// The lower bound for the difference between the alarm threshold and the
  /// CloudWatch metric. If the metric value is above the breach threshold, the
  /// lower bound is inclusive (the metric must be greater than or equal to the
  /// threshold plus the lower bound). Otherwise, it is exclusive (the metric must
  /// be greater than the threshold plus the lower bound). A null value indicates
  /// negative infinity.
  @_s.JsonKey(name: 'MetricIntervalLowerBound')
  final double metricIntervalLowerBound;

  /// The upper bound for the difference between the alarm threshold and the
  /// CloudWatch metric. If the metric value is above the breach threshold, the
  /// upper bound is exclusive (the metric must be less than the threshold plus
  /// the upper bound). Otherwise, it is inclusive (the metric must be less than
  /// or equal to the threshold plus the upper bound). A null value indicates
  /// positive infinity.
  ///
  /// The upper bound must be greater than the lower bound.
  @_s.JsonKey(name: 'MetricIntervalUpperBound')
  final double metricIntervalUpperBound;

  StepAdjustment({
    @_s.required this.scalingAdjustment,
    this.metricIntervalLowerBound,
    this.metricIntervalUpperBound,
  });
  factory StepAdjustment.fromJson(Map<String, dynamic> json) =>
      _$StepAdjustmentFromJson(json);

  Map<String, dynamic> toJson() => _$StepAdjustmentToJson(this);
}

/// Represents a step scaling policy configuration to use with Application Auto
/// Scaling.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StepScalingPolicyConfiguration {
  /// Specifies whether the <code>ScalingAdjustment</code> value in a
  /// <a>StepAdjustment</a> is an absolute number or a percentage of the current
  /// capacity.
  @_s.JsonKey(name: 'AdjustmentType')
  final AdjustmentType adjustmentType;

  /// The amount of time, in seconds, after a scaling activity completes where
  /// previous trigger-related scaling activities can influence future scaling
  /// events.
  ///
  /// For scale-out policies, while the cooldown period is in effect, the capacity
  /// that has been added by the previous scale-out event that initiated the
  /// cooldown is calculated as part of the desired capacity for the next scale
  /// out. The intention is to continuously (but not excessively) scale out. For
  /// example, an alarm triggers a step scaling policy to scale out an Amazon ECS
  /// service by 2 tasks, the scaling activity completes successfully, and a
  /// cooldown period of 5 minutes starts. During the cooldown period, if the
  /// alarm triggers the same policy again but at a more aggressive step
  /// adjustment to scale out the service by 3 tasks, the 2 tasks that were added
  /// in the previous scale-out event are considered part of that capacity and
  /// only 1 additional task is added to the desired count.
  ///
  /// For scale-in policies, the cooldown period is used to block subsequent
  /// scale-in requests until it has expired. The intention is to scale in
  /// conservatively to protect your application's availability. However, if
  /// another alarm triggers a scale-out policy during the cooldown period after a
  /// scale-in, Application Auto Scaling scales out your scalable target
  /// immediately.
  @_s.JsonKey(name: 'Cooldown')
  final int cooldown;

  /// The aggregation type for the CloudWatch metrics. Valid values are
  /// <code>Minimum</code>, <code>Maximum</code>, and <code>Average</code>. If the
  /// aggregation type is null, the value is treated as <code>Average</code>.
  @_s.JsonKey(name: 'MetricAggregationType')
  final MetricAggregationType metricAggregationType;

  /// The minimum number to adjust your scalable dimension as a result of a
  /// scaling activity. If the adjustment type is
  /// <code>PercentChangeInCapacity</code>, the scaling policy changes the
  /// scalable dimension of the scalable target by this amount.
  ///
  /// For example, suppose that you create a step scaling policy to scale out an
  /// Amazon ECS service by 25 percent and you specify a
  /// <code>MinAdjustmentMagnitude</code> of 2. If the service has 4 tasks and the
  /// scaling policy is performed, 25 percent of 4 is 1. However, because you
  /// specified a <code>MinAdjustmentMagnitude</code> of 2, Application Auto
  /// Scaling scales out the service by 2 tasks.
  @_s.JsonKey(name: 'MinAdjustmentMagnitude')
  final int minAdjustmentMagnitude;

  /// A set of adjustments that enable you to scale based on the size of the alarm
  /// breach.
  @_s.JsonKey(name: 'StepAdjustments')
  final List<StepAdjustment> stepAdjustments;

  StepScalingPolicyConfiguration({
    this.adjustmentType,
    this.cooldown,
    this.metricAggregationType,
    this.minAdjustmentMagnitude,
    this.stepAdjustments,
  });
  factory StepScalingPolicyConfiguration.fromJson(Map<String, dynamic> json) =>
      _$StepScalingPolicyConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$StepScalingPolicyConfigurationToJson(this);
}

/// Specifies whether the scaling activities for a scalable target are in a
/// suspended state.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SuspendedState {
  /// Whether scale in by a target tracking scaling policy or a step scaling
  /// policy is suspended. Set the value to <code>true</code> if you don't want
  /// Application Auto Scaling to remove capacity when a scaling policy is
  /// triggered. The default is <code>false</code>.
  @_s.JsonKey(name: 'DynamicScalingInSuspended')
  final bool dynamicScalingInSuspended;

  /// Whether scale out by a target tracking scaling policy or a step scaling
  /// policy is suspended. Set the value to <code>true</code> if you don't want
  /// Application Auto Scaling to add capacity when a scaling policy is triggered.
  /// The default is <code>false</code>.
  @_s.JsonKey(name: 'DynamicScalingOutSuspended')
  final bool dynamicScalingOutSuspended;

  /// Whether scheduled scaling is suspended. Set the value to <code>true</code>
  /// if you don't want Application Auto Scaling to add or remove capacity by
  /// initiating scheduled actions. The default is <code>false</code>.
  @_s.JsonKey(name: 'ScheduledScalingSuspended')
  final bool scheduledScalingSuspended;

  SuspendedState({
    this.dynamicScalingInSuspended,
    this.dynamicScalingOutSuspended,
    this.scheduledScalingSuspended,
  });
  factory SuspendedState.fromJson(Map<String, dynamic> json) =>
      _$SuspendedStateFromJson(json);

  Map<String, dynamic> toJson() => _$SuspendedStateToJson(this);
}

/// Represents a target tracking scaling policy configuration to use with
/// Application Auto Scaling.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TargetTrackingScalingPolicyConfiguration {
  /// The target value for the metric. The range is 8.515920e-109 to 1.174271e+108
  /// (Base 10) or 2e-360 to 2e360 (Base 2).
  @_s.JsonKey(name: 'TargetValue')
  final double targetValue;

  /// A customized metric. You can specify either a predefined metric or a
  /// customized metric.
  @_s.JsonKey(name: 'CustomizedMetricSpecification')
  final CustomizedMetricSpecification customizedMetricSpecification;

  /// Indicates whether scale in by the target tracking scaling policy is
  /// disabled. If the value is <code>true</code>, scale in is disabled and the
  /// target tracking scaling policy won't remove capacity from the scalable
  /// resource. Otherwise, scale in is enabled and the target tracking scaling
  /// policy can remove capacity from the scalable resource. The default value is
  /// <code>false</code>.
  @_s.JsonKey(name: 'DisableScaleIn')
  final bool disableScaleIn;

  /// A predefined metric. You can specify either a predefined metric or a
  /// customized metric.
  @_s.JsonKey(name: 'PredefinedMetricSpecification')
  final PredefinedMetricSpecification predefinedMetricSpecification;

  /// The amount of time, in seconds, after a scale-in activity completes before
  /// another scale in activity can start.
  ///
  /// The cooldown period is used to block subsequent scale-in requests until it
  /// has expired. The intention is to scale in conservatively to protect your
  /// application's availability. However, if another alarm triggers a scale-out
  /// policy during the cooldown period after a scale-in, Application Auto Scaling
  /// scales out your scalable target immediately.
  @_s.JsonKey(name: 'ScaleInCooldown')
  final int scaleInCooldown;

  /// The amount of time, in seconds, after a scale-out activity completes before
  /// another scale-out activity can start.
  ///
  /// While the cooldown period is in effect, the capacity that has been added by
  /// the previous scale-out event that initiated the cooldown is calculated as
  /// part of the desired capacity for the next scale out. The intention is to
  /// continuously (but not excessively) scale out.
  @_s.JsonKey(name: 'ScaleOutCooldown')
  final int scaleOutCooldown;

  TargetTrackingScalingPolicyConfiguration({
    @_s.required this.targetValue,
    this.customizedMetricSpecification,
    this.disableScaleIn,
    this.predefinedMetricSpecification,
    this.scaleInCooldown,
    this.scaleOutCooldown,
  });
  factory TargetTrackingScalingPolicyConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$TargetTrackingScalingPolicyConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$TargetTrackingScalingPolicyConfigurationToJson(this);
}

class ConcurrentUpdateException extends _s.GenericAwsException {
  ConcurrentUpdateException({String type, String message})
      : super(type: type, code: 'ConcurrentUpdateException', message: message);
}

class FailedResourceAccessException extends _s.GenericAwsException {
  FailedResourceAccessException({String type, String message})
      : super(
            type: type,
            code: 'FailedResourceAccessException',
            message: message);
}

class InternalServiceException extends _s.GenericAwsException {
  InternalServiceException({String type, String message})
      : super(type: type, code: 'InternalServiceException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String type, String message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ObjectNotFoundException extends _s.GenericAwsException {
  ObjectNotFoundException({String type, String message})
      : super(type: type, code: 'ObjectNotFoundException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
