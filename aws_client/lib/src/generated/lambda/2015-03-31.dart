// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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

/// This is the <i>Lambda API Reference</i>. The Lambda Developer Guide provides
/// additional information. For the service overview, see <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/welcome.html">What is
/// Lambda</a>, and for information about how the service works, see <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-introduction.html">Lambda:
/// How it Works</a> in the <b>Lambda Developer Guide</b>.
class Lambda {
  final _s.RestJsonProtocol _protocol;
  Lambda({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'lambda',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Adds permissions to the resource-based policy of a version of an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda
  /// layer</a>. Use this action to grant layer usage permission to other
  /// accounts. You can grant permission to a single account, all accounts in an
  /// organization, or all Amazon Web Services accounts.
  ///
  /// To revoke permission, call <a>RemoveLayerVersionPermission</a> with the
  /// statement ID that you specified when you added it.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidParameterValueException].
  /// May throw [PolicyLengthExceededException].
  /// May throw [PreconditionFailedException].
  ///
  /// Parameter [action] :
  /// The API action that grants access to the layer. For example,
  /// <code>lambda:GetLayerVersion</code>.
  ///
  /// Parameter [layerName] :
  /// The name or Amazon Resource Name (ARN) of the layer.
  ///
  /// Parameter [principal] :
  /// An account ID, or <code>*</code> to grant layer usage permission to all
  /// accounts in an organization, or all Amazon Web Services accounts (if
  /// <code>organizationId</code> is not specified). For the last case, make
  /// sure that you really do want all Amazon Web Services accounts to have
  /// usage permission to this layer.
  ///
  /// Parameter [statementId] :
  /// An identifier that distinguishes the policy from others on the same layer
  /// version.
  ///
  /// Parameter [versionNumber] :
  /// The version number.
  ///
  /// Parameter [organizationId] :
  /// With the principal set to <code>*</code>, grant permission to all accounts
  /// in the specified organization.
  ///
  /// Parameter [revisionId] :
  /// Only update the policy if the revision ID matches the ID specified. Use
  /// this option to avoid modifying a policy that has changed since you last
  /// read it.
  Future<AddLayerVersionPermissionResponse> addLayerVersionPermission({
    required String action,
    required String layerName,
    required String principal,
    required String statementId,
    required int versionNumber,
    String? organizationId,
    String? revisionId,
  }) async {
    ArgumentError.checkNotNull(action, 'action');
    _s.validateStringLength(
      'action',
      action,
      0,
      22,
      isRequired: true,
    );
    ArgumentError.checkNotNull(layerName, 'layerName');
    _s.validateStringLength(
      'layerName',
      layerName,
      1,
      140,
      isRequired: true,
    );
    ArgumentError.checkNotNull(principal, 'principal');
    ArgumentError.checkNotNull(statementId, 'statementId');
    _s.validateStringLength(
      'statementId',
      statementId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(versionNumber, 'versionNumber');
    _s.validateStringLength(
      'organizationId',
      organizationId,
      0,
      34,
    );
    final $query = <String, List<String>>{
      if (revisionId != null) 'RevisionId': [revisionId],
    };
    final $payload = <String, dynamic>{
      'Action': action,
      'Principal': principal,
      'StatementId': statementId,
      if (organizationId != null) 'OrganizationId': organizationId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2018-10-31/layers/${Uri.encodeComponent(layerName)}/versions/${Uri.encodeComponent(versionNumber.toString())}/policy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return AddLayerVersionPermissionResponse.fromJson(response);
  }

  /// Grants an Amazon Web Services service or another account permission to use
  /// a function. You can apply the policy at the function level, or specify a
  /// qualifier to restrict access to a single version or alias. If you use a
  /// qualifier, the invoker must use the full Amazon Resource Name (ARN) of
  /// that version or alias to invoke the function.
  ///
  /// To grant permission to another account, specify the account ID as the
  /// <code>Principal</code>. For Amazon Web Services services, the principal is
  /// a domain-style identifier defined by the service, like
  /// <code>s3.amazonaws.com</code> or <code>sns.amazonaws.com</code>. For
  /// Amazon Web Services services, you can also specify the ARN of the
  /// associated resource as the <code>SourceArn</code>. If you grant permission
  /// to a service principal without specifying the source, other accounts could
  /// potentially configure resources in their account to invoke your Lambda
  /// function.
  ///
  /// This action adds a statement to a resource-based permissions policy for
  /// the function. For more information about function policies, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html">Lambda
  /// Function Policies</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceConflictException].
  /// May throw [InvalidParameterValueException].
  /// May throw [PolicyLengthExceededException].
  /// May throw [TooManyRequestsException].
  /// May throw [PreconditionFailedException].
  ///
  /// Parameter [action] :
  /// The action that the principal can use on the function. For example,
  /// <code>lambda:InvokeFunction</code> or <code>lambda:GetFunction</code>.
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function, version, or alias.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>my-function</code> (name-only),
  /// <code>my-function:v1</code> (with alias).
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// Parameter [principal] :
  /// The Amazon Web Services service or account that invokes the function. If
  /// you specify a service, use <code>SourceArn</code> or
  /// <code>SourceAccount</code> to limit who can invoke the function through
  /// that service.
  ///
  /// Parameter [statementId] :
  /// A statement identifier that differentiates the statement from others in
  /// the same policy.
  ///
  /// Parameter [eventSourceToken] :
  /// For Alexa Smart Home functions, a token that must be supplied by the
  /// invoker.
  ///
  /// Parameter [qualifier] :
  /// Specify a version or alias to add permissions to a published version of
  /// the function.
  ///
  /// Parameter [revisionId] :
  /// Only update the policy if the revision ID matches the ID that's specified.
  /// Use this option to avoid modifying a policy that has changed since you
  /// last read it.
  ///
  /// Parameter [sourceAccount] :
  /// For Amazon S3, the ID of the account that owns the resource. Use this
  /// together with <code>SourceArn</code> to ensure that the resource is owned
  /// by the specified account. It is possible for an Amazon S3 bucket to be
  /// deleted by its owner and recreated by another account.
  ///
  /// Parameter [sourceArn] :
  /// For Amazon Web Services services, the ARN of the Amazon Web Services
  /// resource that invokes the function. For example, an Amazon S3 bucket or
  /// Amazon SNS topic.
  Future<AddPermissionResponse> addPermission({
    required String action,
    required String functionName,
    required String principal,
    required String statementId,
    String? eventSourceToken,
    String? qualifier,
    String? revisionId,
    String? sourceAccount,
    String? sourceArn,
  }) async {
    ArgumentError.checkNotNull(action, 'action');
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    ArgumentError.checkNotNull(principal, 'principal');
    ArgumentError.checkNotNull(statementId, 'statementId');
    _s.validateStringLength(
      'statementId',
      statementId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'eventSourceToken',
      eventSourceToken,
      0,
      256,
    );
    _s.validateStringLength(
      'qualifier',
      qualifier,
      1,
      128,
    );
    _s.validateStringLength(
      'sourceAccount',
      sourceAccount,
      0,
      12,
    );
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
    };
    final $payload = <String, dynamic>{
      'Action': action,
      'Principal': principal,
      'StatementId': statementId,
      if (eventSourceToken != null) 'EventSourceToken': eventSourceToken,
      if (revisionId != null) 'RevisionId': revisionId,
      if (sourceAccount != null) 'SourceAccount': sourceAccount,
      if (sourceArn != null) 'SourceArn': sourceArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2015-03-31/functions/${Uri.encodeComponent(functionName)}/policy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return AddPermissionResponse.fromJson(response);
  }

  /// Creates an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">alias</a>
  /// for a Lambda function version. Use aliases to provide clients with a
  /// function identifier that you can update to invoke a different version.
  ///
  /// You can also map an alias to split invocation requests between two
  /// versions. Use the <code>RoutingConfig</code> parameter to specify a second
  /// version and the percentage of invocation requests that it receives.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceConflictException].
  /// May throw [InvalidParameterValueException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [functionVersion] :
  /// The function version that the alias invokes.
  ///
  /// Parameter [name] :
  /// The name of the alias.
  ///
  /// Parameter [description] :
  /// A description of the alias.
  ///
  /// Parameter [routingConfig] :
  /// The <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-aliases.html#configuring-alias-routing">routing
  /// configuration</a> of the alias.
  Future<AliasConfiguration> createAlias({
    required String functionName,
    required String functionVersion,
    required String name,
    String? description,
    AliasRoutingConfiguration? routingConfig,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    ArgumentError.checkNotNull(functionVersion, 'functionVersion');
    _s.validateStringLength(
      'functionVersion',
      functionVersion,
      1,
      1024,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
    );
    final $payload = <String, dynamic>{
      'FunctionVersion': functionVersion,
      'Name': name,
      if (description != null) 'Description': description,
      if (routingConfig != null) 'RoutingConfig': routingConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2015-03-31/functions/${Uri.encodeComponent(functionName)}/aliases',
      exceptionFnMap: _exceptionFns,
    );
    return AliasConfiguration.fromJson(response);
  }

  /// Creates a code signing configuration. A <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-trustedcode.html">code
  /// signing configuration</a> defines a list of allowed signing profiles and
  /// defines the code-signing validation policy (action to be taken if
  /// deployment validation checks fail).
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [allowedPublishers] :
  /// Signing profiles for this code signing configuration.
  ///
  /// Parameter [codeSigningPolicies] :
  /// The code signing policies define the actions to take if the validation
  /// checks fail.
  ///
  /// Parameter [description] :
  /// Descriptive name for this code signing configuration.
  Future<CreateCodeSigningConfigResponse> createCodeSigningConfig({
    required AllowedPublishers allowedPublishers,
    CodeSigningPolicies? codeSigningPolicies,
    String? description,
  }) async {
    ArgumentError.checkNotNull(allowedPublishers, 'allowedPublishers');
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
    );
    final $payload = <String, dynamic>{
      'AllowedPublishers': allowedPublishers,
      if (codeSigningPolicies != null)
        'CodeSigningPolicies': codeSigningPolicies,
      if (description != null) 'Description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2020-04-22/code-signing-configs/',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCodeSigningConfigResponse.fromJson(response);
  }

  /// Creates a mapping between an event source and an Lambda function. Lambda
  /// reads items from the event source and triggers the function.
  ///
  /// For details about each event source type, see the following topics. In
  /// particular, each of the topics describes the required and optional
  /// parameters for the specific event source.
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-ddb.html#services-dynamodb-eventsourcemapping">
  /// Configuring a Dynamo DB stream as an event source</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-kinesis.html#services-kinesis-eventsourcemapping">
  /// Configuring a Kinesis stream as an event source</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html#events-sqs-eventsource">
  /// Configuring an SQS queue as an event source</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-mq.html#services-mq-eventsourcemapping">
  /// Configuring an MQ broker as an event source</a>
  /// </li>
  /// <li>
  /// <a href="https://docs.aws.amazon.com/lambda/latest/dg/with-msk.html">
  /// Configuring MSK as an event source</a>
  /// </li>
  /// <li>
  /// <a href="https://docs.aws.amazon.com/lambda/latest/dg/kafka-smaa.html">
  /// Configuring Self-Managed Apache Kafka as an event source</a>
  /// </li>
  /// </ul>
  /// The following error handling options are only available for stream sources
  /// (DynamoDB and Kinesis):
  ///
  /// <ul>
  /// <li>
  /// <code>BisectBatchOnFunctionError</code> - If the function returns an
  /// error, split the batch in two and retry.
  /// </li>
  /// <li>
  /// <code>DestinationConfig</code> - Send discarded records to an Amazon SQS
  /// queue or Amazon SNS topic.
  /// </li>
  /// <li>
  /// <code>MaximumRecordAgeInSeconds</code> - Discard records older than the
  /// specified age. The default value is infinite (-1). When set to infinite
  /// (-1), failed records are retried until the record expires
  /// </li>
  /// <li>
  /// <code>MaximumRetryAttempts</code> - Discard records after the specified
  /// number of retries. The default value is infinite (-1). When set to
  /// infinite (-1), failed records are retried until the record expires.
  /// </li>
  /// <li>
  /// <code>ParallelizationFactor</code> - Process multiple batches from each
  /// shard concurrently.
  /// </li>
  /// </ul>
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Version or Alias ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it's limited to 64 characters in length.
  ///
  /// Parameter [batchSize] :
  /// The maximum number of items to retrieve in a single batch.
  ///
  /// <ul>
  /// <li>
  /// <b>Amazon Kinesis</b> - Default 100. Max 10,000.
  /// </li>
  /// <li>
  /// <b>Amazon DynamoDB Streams</b> - Default 100. Max 1,000.
  /// </li>
  /// <li>
  /// <b>Amazon Simple Queue Service</b> - Default 10. For standard queues the
  /// max is 10,000. For FIFO queues the max is 10.
  /// </li>
  /// <li>
  /// <b>Amazon Managed Streaming for Apache Kafka</b> - Default 100. Max
  /// 10,000.
  /// </li>
  /// <li>
  /// <b>Self-Managed Apache Kafka</b> - Default 100. Max 10,000.
  /// </li>
  /// </ul>
  ///
  /// Parameter [bisectBatchOnFunctionError] :
  /// (Streams only) If the function returns an error, split the batch in two
  /// and retry.
  ///
  /// Parameter [destinationConfig] :
  /// (Streams only) An Amazon SQS queue or Amazon SNS topic destination for
  /// discarded records.
  ///
  /// Parameter [enabled] :
  /// If true, the event source mapping is active. Set to false to pause polling
  /// and invocation.
  ///
  /// Parameter [eventSourceArn] :
  /// The Amazon Resource Name (ARN) of the event source.
  ///
  /// <ul>
  /// <li>
  /// <b>Amazon Kinesis</b> - The ARN of the data stream or a stream consumer.
  /// </li>
  /// <li>
  /// <b>Amazon DynamoDB Streams</b> - The ARN of the stream.
  /// </li>
  /// <li>
  /// <b>Amazon Simple Queue Service</b> - The ARN of the queue.
  /// </li>
  /// <li>
  /// <b>Amazon Managed Streaming for Apache Kafka</b> - The ARN of the cluster.
  /// </li>
  /// </ul>
  ///
  /// Parameter [functionResponseTypes] :
  /// (Streams only) A list of current response type enums applied to the event
  /// source mapping.
  ///
  /// Parameter [maximumBatchingWindowInSeconds] :
  /// (Streams and SQS standard queues) The maximum amount of time to gather
  /// records before invoking the function, in seconds.
  ///
  /// Parameter [maximumRecordAgeInSeconds] :
  /// (Streams only) Discard records older than the specified age. The default
  /// value is infinite (-1).
  ///
  /// Parameter [maximumRetryAttempts] :
  /// (Streams only) Discard records after the specified number of retries. The
  /// default value is infinite (-1). When set to infinite (-1), failed records
  /// will be retried until the record expires.
  ///
  /// Parameter [parallelizationFactor] :
  /// (Streams only) The number of batches to process from each shard
  /// concurrently.
  ///
  /// Parameter [queues] :
  /// (MQ) The name of the Amazon MQ broker destination queue to consume.
  ///
  /// Parameter [selfManagedEventSource] :
  /// The Self-Managed Apache Kafka cluster to send records.
  ///
  /// Parameter [sourceAccessConfigurations] :
  /// An array of the authentication protocol, or the VPC components to secure
  /// your event source.
  ///
  /// Parameter [startingPosition] :
  /// The position in a stream from which to start reading. Required for Amazon
  /// Kinesis, Amazon DynamoDB, and Amazon MSK Streams sources.
  /// <code>AT_TIMESTAMP</code> is only supported for Amazon Kinesis streams.
  ///
  /// Parameter [startingPositionTimestamp] :
  /// With <code>StartingPosition</code> set to <code>AT_TIMESTAMP</code>, the
  /// time from which to start reading.
  ///
  /// Parameter [topics] :
  /// The name of the Kafka topic.
  ///
  /// Parameter [tumblingWindowInSeconds] :
  /// (Streams only) The duration in seconds of a processing window. The range
  /// is between 1 second up to 900 seconds.
  Future<EventSourceMappingConfiguration> createEventSourceMapping({
    required String functionName,
    int? batchSize,
    bool? bisectBatchOnFunctionError,
    DestinationConfig? destinationConfig,
    bool? enabled,
    String? eventSourceArn,
    List<FunctionResponseType>? functionResponseTypes,
    int? maximumBatchingWindowInSeconds,
    int? maximumRecordAgeInSeconds,
    int? maximumRetryAttempts,
    int? parallelizationFactor,
    List<String>? queues,
    SelfManagedEventSource? selfManagedEventSource,
    List<SourceAccessConfiguration>? sourceAccessConfigurations,
    EventSourcePosition? startingPosition,
    DateTime? startingPositionTimestamp,
    List<String>? topics,
    int? tumblingWindowInSeconds,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateNumRange(
      'batchSize',
      batchSize,
      1,
      10000,
    );
    _s.validateNumRange(
      'maximumBatchingWindowInSeconds',
      maximumBatchingWindowInSeconds,
      0,
      300,
    );
    _s.validateNumRange(
      'maximumRecordAgeInSeconds',
      maximumRecordAgeInSeconds,
      -1,
      604800,
    );
    _s.validateNumRange(
      'maximumRetryAttempts',
      maximumRetryAttempts,
      -1,
      10000,
    );
    _s.validateNumRange(
      'parallelizationFactor',
      parallelizationFactor,
      1,
      10,
    );
    _s.validateNumRange(
      'tumblingWindowInSeconds',
      tumblingWindowInSeconds,
      0,
      900,
    );
    final $payload = <String, dynamic>{
      'FunctionName': functionName,
      if (batchSize != null) 'BatchSize': batchSize,
      if (bisectBatchOnFunctionError != null)
        'BisectBatchOnFunctionError': bisectBatchOnFunctionError,
      if (destinationConfig != null) 'DestinationConfig': destinationConfig,
      if (enabled != null) 'Enabled': enabled,
      if (eventSourceArn != null) 'EventSourceArn': eventSourceArn,
      if (functionResponseTypes != null)
        'FunctionResponseTypes':
            functionResponseTypes.map((e) => e.toValue()).toList(),
      if (maximumBatchingWindowInSeconds != null)
        'MaximumBatchingWindowInSeconds': maximumBatchingWindowInSeconds,
      if (maximumRecordAgeInSeconds != null)
        'MaximumRecordAgeInSeconds': maximumRecordAgeInSeconds,
      if (maximumRetryAttempts != null)
        'MaximumRetryAttempts': maximumRetryAttempts,
      if (parallelizationFactor != null)
        'ParallelizationFactor': parallelizationFactor,
      if (queues != null) 'Queues': queues,
      if (selfManagedEventSource != null)
        'SelfManagedEventSource': selfManagedEventSource,
      if (sourceAccessConfigurations != null)
        'SourceAccessConfigurations': sourceAccessConfigurations,
      if (startingPosition != null)
        'StartingPosition': startingPosition.toValue(),
      if (startingPositionTimestamp != null)
        'StartingPositionTimestamp':
            unixTimestampToJson(startingPositionTimestamp),
      if (topics != null) 'Topics': topics,
      if (tumblingWindowInSeconds != null)
        'TumblingWindowInSeconds': tumblingWindowInSeconds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2015-03-31/event-source-mappings/',
      exceptionFnMap: _exceptionFns,
    );
    return EventSourceMappingConfiguration.fromJson(response);
  }

  /// Creates a Lambda function. To create a function, you need a <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/gettingstarted-package.html">deployment
  /// package</a> and an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/intro-permission-model.html#lambda-intro-execution-role">execution
  /// role</a>. The deployment package is a .zip file archive or container image
  /// that contains your function code. The execution role grants the function
  /// permission to use Amazon Web Services services, such as Amazon CloudWatch
  /// Logs for log streaming and X-Ray for request tracing.
  ///
  /// You set the package type to <code>Image</code> if the deployment package
  /// is a <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-images.html">container
  /// image</a>. For a container image, the code property must include the URI
  /// of a container image in the Amazon ECR registry. You do not need to
  /// specify the handler and runtime properties.
  ///
  /// You set the package type to <code>Zip</code> if the deployment package is
  /// a <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/gettingstarted-package.html#gettingstarted-package-zip">.zip
  /// file archive</a>. For a .zip file archive, the code property specifies the
  /// location of the .zip file. You must also specify the handler and runtime
  /// properties.
  ///
  /// When you create a function, Lambda provisions an instance of the function
  /// and its supporting resources. If your function connects to a VPC, this
  /// process can take a minute or so. During this time, you can't invoke or
  /// modify the function. The <code>State</code>, <code>StateReason</code>, and
  /// <code>StateReasonCode</code> fields in the response from
  /// <a>GetFunctionConfiguration</a> indicate when the function is ready to
  /// invoke. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/functions-states.html">Function
  /// States</a>.
  ///
  /// A function has an unpublished version, and can have published versions and
  /// aliases. The unpublished version changes when you update your function's
  /// code and configuration. A published version is a snapshot of your function
  /// code and configuration that can't be changed. An alias is a named resource
  /// that maps to a version, and can be changed to map to a different version.
  /// Use the <code>Publish</code> parameter to create version <code>1</code> of
  /// your function from its initial configuration.
  ///
  /// The other parameters let you configure version-specific and function-level
  /// settings. You can modify version-specific settings later with
  /// <a>UpdateFunctionConfiguration</a>. Function-level settings apply to both
  /// the unpublished and published versions of the function, and include tags
  /// (<a>TagResource</a>) and per-function concurrency limits
  /// (<a>PutFunctionConcurrency</a>).
  ///
  /// You can use code signing if your deployment package is a .zip file
  /// archive. To enable code signing for this function, specify the ARN of a
  /// code-signing configuration. When a user attempts to deploy a code package
  /// with <a>UpdateFunctionCode</a>, Lambda checks that the code package has a
  /// valid signature from a trusted publisher. The code-signing configuration
  /// includes set set of signing profiles, which define the trusted publishers
  /// for this function.
  ///
  /// If another account or an Amazon Web Services service invokes your
  /// function, use <a>AddPermission</a> to grant permission by creating a
  /// resource-based IAM policy. You can grant permissions at the function
  /// level, on a version, or on an alias.
  ///
  /// To invoke your function directly, use <a>Invoke</a>. To invoke your
  /// function in response to events in other Amazon Web Services services,
  /// create an event source mapping (<a>CreateEventSourceMapping</a>), or
  /// configure a function trigger in the other service. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-invocation.html">Invoking
  /// Functions</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [CodeStorageExceededException].
  /// May throw [CodeVerificationFailedException].
  /// May throw [InvalidCodeSignatureException].
  /// May throw [CodeSigningConfigNotFoundException].
  ///
  /// Parameter [code] :
  /// The code for the function.
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [role] :
  /// The Amazon Resource Name (ARN) of the function's execution role.
  ///
  /// Parameter [codeSigningConfigArn] :
  /// To enable code signing for this function, specify the ARN of a
  /// code-signing configuration. A code-signing configuration includes a set of
  /// signing profiles, which define the trusted publishers for this function.
  ///
  /// Parameter [deadLetterConfig] :
  /// A dead letter queue configuration that specifies the queue or topic where
  /// Lambda sends asynchronous events when they fail processing. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#dlq">Dead
  /// Letter Queues</a>.
  ///
  /// Parameter [description] :
  /// A description of the function.
  ///
  /// Parameter [environment] :
  /// Environment variables that are accessible from function code during
  /// execution.
  ///
  /// Parameter [fileSystemConfigs] :
  /// Connection settings for an Amazon EFS file system.
  ///
  /// Parameter [handler] :
  /// The name of the method within your code that Lambda calls to execute your
  /// function. The format includes the file name. It can also include
  /// namespaces and other qualifiers, depending on the runtime. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/programming-model-v2.html">Programming
  /// Model</a>.
  ///
  /// Parameter [imageConfig] :
  /// Container image <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-images.html#configuration-images-settings">configuration
  /// values</a> that override the values in the container image Dockerfile.
  ///
  /// Parameter [kMSKeyArn] :
  /// The ARN of the Amazon Web Services Key Management Service (KMS) key that's
  /// used to encrypt your function's environment variables. If it's not
  /// provided, Lambda uses a default service key.
  ///
  /// Parameter [layers] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">function
  /// layers</a> to add to the function's execution environment. Specify each
  /// layer by its ARN, including the version.
  ///
  /// Parameter [memorySize] :
  /// The amount of <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-memory.html">memory
  /// available to the function</a> at runtime. Increasing the function memory
  /// also increases its CPU allocation. The default value is 128 MB. The value
  /// can be any multiple of 1 MB.
  ///
  /// Parameter [packageType] :
  /// The type of deployment package. Set to <code>Image</code> for container
  /// image and set <code>Zip</code> for ZIP archive.
  ///
  /// Parameter [publish] :
  /// Set to true to publish the first version of the function during creation.
  ///
  /// Parameter [runtime] :
  /// The identifier of the function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html">runtime</a>.
  ///
  /// Parameter [tags] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/tagging.html">tags</a>
  /// to apply to the function.
  ///
  /// Parameter [timeout] :
  /// The amount of time that Lambda allows a function to run before stopping
  /// it. The default is 3 seconds. The maximum allowed value is 900 seconds.
  /// For additional information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/runtimes-context.html">Lambda
  /// execution environment</a>.
  ///
  /// Parameter [tracingConfig] :
  /// Set <code>Mode</code> to <code>Active</code> to sample and trace a subset
  /// of incoming requests with <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/services-xray.html">X-Ray</a>.
  ///
  /// Parameter [vpcConfig] :
  /// For network connectivity to Amazon Web Services resources in a VPC,
  /// specify a list of security groups and subnets in the VPC. When you connect
  /// a function to a VPC, it can only access resources and the internet through
  /// that VPC. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-vpc.html">VPC
  /// Settings</a>.
  Future<FunctionConfiguration> createFunction({
    required FunctionCode code,
    required String functionName,
    required String role,
    String? codeSigningConfigArn,
    DeadLetterConfig? deadLetterConfig,
    String? description,
    Environment? environment,
    List<FileSystemConfig>? fileSystemConfigs,
    String? handler,
    ImageConfig? imageConfig,
    String? kMSKeyArn,
    List<String>? layers,
    int? memorySize,
    PackageType? packageType,
    bool? publish,
    Runtime? runtime,
    Map<String, String>? tags,
    int? timeout,
    TracingConfig? tracingConfig,
    VpcConfig? vpcConfig,
  }) async {
    ArgumentError.checkNotNull(code, 'code');
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    ArgumentError.checkNotNull(role, 'role');
    _s.validateStringLength(
      'codeSigningConfigArn',
      codeSigningConfigArn,
      0,
      200,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
    );
    _s.validateStringLength(
      'handler',
      handler,
      0,
      128,
    );
    _s.validateNumRange(
      'memorySize',
      memorySize,
      128,
      10240,
    );
    _s.validateNumRange(
      'timeout',
      timeout,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'Code': code,
      'FunctionName': functionName,
      'Role': role,
      if (codeSigningConfigArn != null)
        'CodeSigningConfigArn': codeSigningConfigArn,
      if (deadLetterConfig != null) 'DeadLetterConfig': deadLetterConfig,
      if (description != null) 'Description': description,
      if (environment != null) 'Environment': environment,
      if (fileSystemConfigs != null) 'FileSystemConfigs': fileSystemConfigs,
      if (handler != null) 'Handler': handler,
      if (imageConfig != null) 'ImageConfig': imageConfig,
      if (kMSKeyArn != null) 'KMSKeyArn': kMSKeyArn,
      if (layers != null) 'Layers': layers,
      if (memorySize != null) 'MemorySize': memorySize,
      if (packageType != null) 'PackageType': packageType.toValue(),
      if (publish != null) 'Publish': publish,
      if (runtime != null) 'Runtime': runtime.toValue(),
      if (tags != null) 'Tags': tags,
      if (timeout != null) 'Timeout': timeout,
      if (tracingConfig != null) 'TracingConfig': tracingConfig,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2015-03-31/functions',
      exceptionFnMap: _exceptionFns,
    );
    return FunctionConfiguration.fromJson(response);
  }

  /// Deletes a Lambda function <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">alias</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [name] :
  /// The name of the alias.
  Future<void> deleteAlias({
    required String functionName,
    required String name,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2015-03-31/functions/${Uri.encodeComponent(functionName)}/aliases/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the code signing configuration. You can delete the code signing
  /// configuration only if no function is using it.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceConflictException].
  ///
  /// Parameter [codeSigningConfigArn] :
  /// The The Amazon Resource Name (ARN) of the code signing configuration.
  Future<void> deleteCodeSigningConfig({
    required String codeSigningConfigArn,
  }) async {
    ArgumentError.checkNotNull(codeSigningConfigArn, 'codeSigningConfigArn');
    _s.validateStringLength(
      'codeSigningConfigArn',
      codeSigningConfigArn,
      0,
      200,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2020-04-22/code-signing-configs/${Uri.encodeComponent(codeSigningConfigArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/intro-invocation-modes.html">event
  /// source mapping</a>. You can get the identifier of a mapping from the
  /// output of <a>ListEventSourceMappings</a>.
  ///
  /// When you delete an event source mapping, it enters a <code>Deleting</code>
  /// state and might not be completely deleted for several seconds.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [uuid] :
  /// The identifier of the event source mapping.
  Future<EventSourceMappingConfiguration> deleteEventSourceMapping({
    required String uuid,
  }) async {
    ArgumentError.checkNotNull(uuid, 'uuid');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2015-03-31/event-source-mappings/${Uri.encodeComponent(uuid)}',
      exceptionFnMap: _exceptionFns,
    );
    return EventSourceMappingConfiguration.fromJson(response);
  }

  /// Deletes a Lambda function. To delete a specific function version, use the
  /// <code>Qualifier</code> parameter. Otherwise, all versions and aliases are
  /// deleted.
  ///
  /// To delete Lambda event source mappings that invoke a function, use
  /// <a>DeleteEventSourceMapping</a>. For Amazon Web Services services and
  /// resources that invoke your function directly, delete the trigger in the
  /// service where you originally configured it.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function or version.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>my-function</code> (name-only),
  /// <code>my-function:1</code> (with version).
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// Parameter [qualifier] :
  /// Specify a version to delete. You can't delete a version that's referenced
  /// by an alias.
  Future<void> deleteFunction({
    required String functionName,
    String? qualifier,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringLength(
      'qualifier',
      qualifier,
      1,
      128,
    );
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2015-03-31/functions/${Uri.encodeComponent(functionName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the code signing configuration from the function.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [CodeSigningConfigNotFoundException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceConflictException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  Future<void> deleteFunctionCodeSigningConfig({
    required String functionName,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2020-06-30/functions/${Uri.encodeComponent(functionName)}/code-signing-config',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a concurrent execution limit from a function.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  Future<void> deleteFunctionConcurrency({
    required String functionName,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2017-10-31/functions/${Uri.encodeComponent(functionName)}/concurrency',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the configuration for asynchronous invocation for a function,
  /// version, or alias.
  ///
  /// To configure options for asynchronous invocation, use
  /// <a>PutFunctionEventInvokeConfig</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function, version, or alias.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>my-function</code> (name-only),
  /// <code>my-function:v1</code> (with alias).
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// Parameter [qualifier] :
  /// A version number or alias name.
  Future<void> deleteFunctionEventInvokeConfig({
    required String functionName,
    String? qualifier,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringLength(
      'qualifier',
      qualifier,
      1,
      128,
    );
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2019-09-25/functions/${Uri.encodeComponent(functionName)}/event-invoke-config',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a version of an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda
  /// layer</a>. Deleted versions can no longer be viewed or added to functions.
  /// To avoid breaking functions, a copy of the version remains in Lambda until
  /// no functions refer to it.
  ///
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [layerName] :
  /// The name or Amazon Resource Name (ARN) of the layer.
  ///
  /// Parameter [versionNumber] :
  /// The version number.
  Future<void> deleteLayerVersion({
    required String layerName,
    required int versionNumber,
  }) async {
    ArgumentError.checkNotNull(layerName, 'layerName');
    _s.validateStringLength(
      'layerName',
      layerName,
      1,
      140,
      isRequired: true,
    );
    ArgumentError.checkNotNull(versionNumber, 'versionNumber');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2018-10-31/layers/${Uri.encodeComponent(layerName)}/versions/${Uri.encodeComponent(versionNumber.toString())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the provisioned concurrency configuration for a function.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ServiceException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [qualifier] :
  /// The version number or alias name.
  Future<void> deleteProvisionedConcurrencyConfig({
    required String functionName,
    required String qualifier,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    ArgumentError.checkNotNull(qualifier, 'qualifier');
    _s.validateStringLength(
      'qualifier',
      qualifier,
      1,
      128,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      'Qualifier': [qualifier],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2019-09-30/functions/${Uri.encodeComponent(functionName)}/provisioned-concurrency',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves details about your account's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/limits.html">limits</a>
  /// and usage in an Amazon Web Services Region.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [ServiceException].
  Future<GetAccountSettingsResponse> getAccountSettings() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2016-08-19/account-settings/',
      exceptionFnMap: _exceptionFns,
    );
    return GetAccountSettingsResponse.fromJson(response);
  }

  /// Returns details about a Lambda function <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">alias</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [name] :
  /// The name of the alias.
  Future<AliasConfiguration> getAlias({
    required String functionName,
    required String name,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2015-03-31/functions/${Uri.encodeComponent(functionName)}/aliases/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return AliasConfiguration.fromJson(response);
  }

  /// Returns information about the specified code signing configuration.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [codeSigningConfigArn] :
  /// The The Amazon Resource Name (ARN) of the code signing configuration.
  Future<GetCodeSigningConfigResponse> getCodeSigningConfig({
    required String codeSigningConfigArn,
  }) async {
    ArgumentError.checkNotNull(codeSigningConfigArn, 'codeSigningConfigArn');
    _s.validateStringLength(
      'codeSigningConfigArn',
      codeSigningConfigArn,
      0,
      200,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2020-04-22/code-signing-configs/${Uri.encodeComponent(codeSigningConfigArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCodeSigningConfigResponse.fromJson(response);
  }

  /// Returns details about an event source mapping. You can get the identifier
  /// of a mapping from the output of <a>ListEventSourceMappings</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [uuid] :
  /// The identifier of the event source mapping.
  Future<EventSourceMappingConfiguration> getEventSourceMapping({
    required String uuid,
  }) async {
    ArgumentError.checkNotNull(uuid, 'uuid');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2015-03-31/event-source-mappings/${Uri.encodeComponent(uuid)}',
      exceptionFnMap: _exceptionFns,
    );
    return EventSourceMappingConfiguration.fromJson(response);
  }

  /// Returns information about the function or function version, with a link to
  /// download the deployment package that's valid for 10 minutes. If you
  /// specify a function version, only details that are specific to that version
  /// are returned.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function, version, or alias.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>my-function</code> (name-only),
  /// <code>my-function:v1</code> (with alias).
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// Parameter [qualifier] :
  /// Specify a version or alias to get details about a published version of the
  /// function.
  Future<GetFunctionResponse> getFunction({
    required String functionName,
    String? qualifier,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      170,
      isRequired: true,
    );
    _s.validateStringLength(
      'qualifier',
      qualifier,
      1,
      128,
    );
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2015-03-31/functions/${Uri.encodeComponent(functionName)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetFunctionResponse.fromJson(response);
  }

  /// Returns the code signing configuration for the specified function.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  Future<GetFunctionCodeSigningConfigResponse> getFunctionCodeSigningConfig({
    required String functionName,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2020-06-30/functions/${Uri.encodeComponent(functionName)}/code-signing-config',
      exceptionFnMap: _exceptionFns,
    );
    return GetFunctionCodeSigningConfigResponse.fromJson(response);
  }

  /// Returns details about the reserved concurrency configuration for a
  /// function. To set a concurrency limit for a function, use
  /// <a>PutFunctionConcurrency</a>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ServiceException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  Future<GetFunctionConcurrencyResponse> getFunctionConcurrency({
    required String functionName,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2019-09-30/functions/${Uri.encodeComponent(functionName)}/concurrency',
      exceptionFnMap: _exceptionFns,
    );
    return GetFunctionConcurrencyResponse.fromJson(response);
  }

  /// Returns the version-specific settings of a Lambda function or version. The
  /// output includes only options that can vary between versions of a function.
  /// To modify these settings, use <a>UpdateFunctionConfiguration</a>.
  ///
  /// To get all of a function's details, including function-level settings, use
  /// <a>GetFunction</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function, version, or alias.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>my-function</code> (name-only),
  /// <code>my-function:v1</code> (with alias).
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// Parameter [qualifier] :
  /// Specify a version or alias to get details about a published version of the
  /// function.
  Future<FunctionConfiguration> getFunctionConfiguration({
    required String functionName,
    String? qualifier,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      170,
      isRequired: true,
    );
    _s.validateStringLength(
      'qualifier',
      qualifier,
      1,
      128,
    );
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2015-03-31/functions/${Uri.encodeComponent(functionName)}/configuration',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return FunctionConfiguration.fromJson(response);
  }

  /// Retrieves the configuration for asynchronous invocation for a function,
  /// version, or alias.
  ///
  /// To configure options for asynchronous invocation, use
  /// <a>PutFunctionEventInvokeConfig</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function, version, or alias.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>my-function</code> (name-only),
  /// <code>my-function:v1</code> (with alias).
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// Parameter [qualifier] :
  /// A version number or alias name.
  Future<FunctionEventInvokeConfig> getFunctionEventInvokeConfig({
    required String functionName,
    String? qualifier,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringLength(
      'qualifier',
      qualifier,
      1,
      128,
    );
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2019-09-25/functions/${Uri.encodeComponent(functionName)}/event-invoke-config',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return FunctionEventInvokeConfig.fromJson(response);
  }

  /// Returns information about a version of an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda
  /// layer</a>, with a link to download the layer archive that's valid for 10
  /// minutes.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidParameterValueException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [layerName] :
  /// The name or Amazon Resource Name (ARN) of the layer.
  ///
  /// Parameter [versionNumber] :
  /// The version number.
  Future<GetLayerVersionResponse> getLayerVersion({
    required String layerName,
    required int versionNumber,
  }) async {
    ArgumentError.checkNotNull(layerName, 'layerName');
    _s.validateStringLength(
      'layerName',
      layerName,
      1,
      140,
      isRequired: true,
    );
    ArgumentError.checkNotNull(versionNumber, 'versionNumber');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2018-10-31/layers/${Uri.encodeComponent(layerName)}/versions/${Uri.encodeComponent(versionNumber.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetLayerVersionResponse.fromJson(response);
  }

  /// Returns information about a version of an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda
  /// layer</a>, with a link to download the layer archive that's valid for 10
  /// minutes.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidParameterValueException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The ARN of the layer version.
  Future<GetLayerVersionResponse> getLayerVersionByArn({
    required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      1,
      140,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      'Arn': [arn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2018-10-31/layers?find=LayerVersion',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetLayerVersionResponse.fromJson(response);
  }

  /// Returns the permission policy for a version of an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda
  /// layer</a>. For more information, see <a>AddLayerVersionPermission</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [layerName] :
  /// The name or Amazon Resource Name (ARN) of the layer.
  ///
  /// Parameter [versionNumber] :
  /// The version number.
  Future<GetLayerVersionPolicyResponse> getLayerVersionPolicy({
    required String layerName,
    required int versionNumber,
  }) async {
    ArgumentError.checkNotNull(layerName, 'layerName');
    _s.validateStringLength(
      'layerName',
      layerName,
      1,
      140,
      isRequired: true,
    );
    ArgumentError.checkNotNull(versionNumber, 'versionNumber');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2018-10-31/layers/${Uri.encodeComponent(layerName)}/versions/${Uri.encodeComponent(versionNumber.toString())}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return GetLayerVersionPolicyResponse.fromJson(response);
  }

  /// Returns the <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html">resource-based
  /// IAM policy</a> for a function, version, or alias.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function, version, or alias.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>my-function</code> (name-only),
  /// <code>my-function:v1</code> (with alias).
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// Parameter [qualifier] :
  /// Specify a version or alias to get the policy for that resource.
  Future<GetPolicyResponse> getPolicy({
    required String functionName,
    String? qualifier,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      170,
      isRequired: true,
    );
    _s.validateStringLength(
      'qualifier',
      qualifier,
      1,
      128,
    );
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2015-03-31/functions/${Uri.encodeComponent(functionName)}/policy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetPolicyResponse.fromJson(response);
  }

  /// Retrieves the provisioned concurrency configuration for a function's alias
  /// or version.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ServiceException].
  /// May throw [ProvisionedConcurrencyConfigNotFoundException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [qualifier] :
  /// The version number or alias name.
  Future<GetProvisionedConcurrencyConfigResponse>
      getProvisionedConcurrencyConfig({
    required String functionName,
    required String qualifier,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    ArgumentError.checkNotNull(qualifier, 'qualifier');
    _s.validateStringLength(
      'qualifier',
      qualifier,
      1,
      128,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      'Qualifier': [qualifier],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2019-09-30/functions/${Uri.encodeComponent(functionName)}/provisioned-concurrency',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetProvisionedConcurrencyConfigResponse.fromJson(response);
  }

  /// Invokes a Lambda function. You can invoke a function synchronously (and
  /// wait for the response), or asynchronously. To invoke a function
  /// asynchronously, set <code>InvocationType</code> to <code>Event</code>.
  ///
  /// For <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-sync.html">synchronous
  /// invocation</a>, details about the function response, including errors, are
  /// included in the response body and headers. For either invocation type, you
  /// can find more information in the <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/monitoring-functions.html">execution
  /// log</a> and <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-x-ray.html">trace</a>.
  ///
  /// When an error occurs, your function may be invoked multiple times. Retry
  /// behavior varies by error type, client, event source, and invocation type.
  /// For example, if you invoke a function asynchronously and it returns an
  /// error, Lambda executes the function up to two more times. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/retries-on-errors.html">Retry
  /// Behavior</a>.
  ///
  /// For <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html">asynchronous
  /// invocation</a>, Lambda adds events to a queue before sending them to your
  /// function. If your function does not have enough capacity to keep up with
  /// the queue, events may be lost. Occasionally, your function may receive the
  /// same event multiple times, even if no error occurs. To retain events that
  /// were not processed, configure your function with a <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#dlq">dead-letter
  /// queue</a>.
  ///
  /// The status code in the API response doesn't reflect function errors. Error
  /// codes are reserved for errors that prevent your function from executing,
  /// such as permissions errors, <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/limits.html">limit
  /// errors</a>, or issues with your function's code and configuration. For
  /// example, Lambda returns <code>TooManyRequestsException</code> if executing
  /// the function would cause you to exceed a concurrency limit at either the
  /// account level (<code>ConcurrentInvocationLimitExceeded</code>) or function
  /// level (<code>ReservedFunctionConcurrentInvocationLimitExceeded</code>).
  ///
  /// For functions with a long timeout, your client might be disconnected
  /// during synchronous invocation while it waits for a response. Configure
  /// your HTTP client, SDK, firewall, proxy, or operating system to allow for
  /// long connections with timeout or keep-alive settings.
  ///
  /// This operation requires permission for the <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/list_awslambda.html">lambda:InvokeFunction</a>
  /// action.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestContentException].
  /// May throw [RequestTooLargeException].
  /// May throw [UnsupportedMediaTypeException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidParameterValueException].
  /// May throw [EC2UnexpectedException].
  /// May throw [SubnetIPAddressLimitReachedException].
  /// May throw [ENILimitReachedException].
  /// May throw [EFSMountConnectivityException].
  /// May throw [EFSMountFailureException].
  /// May throw [EFSMountTimeoutException].
  /// May throw [EFSIOException].
  /// May throw [EC2ThrottledException].
  /// May throw [EC2AccessDeniedException].
  /// May throw [InvalidSubnetIDException].
  /// May throw [InvalidSecurityGroupIDException].
  /// May throw [InvalidZipFileException].
  /// May throw [KMSDisabledException].
  /// May throw [KMSInvalidStateException].
  /// May throw [KMSAccessDeniedException].
  /// May throw [KMSNotFoundException].
  /// May throw [InvalidRuntimeException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceNotReadyException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function, version, or alias.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>my-function</code> (name-only),
  /// <code>my-function:v1</code> (with alias).
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// Parameter [clientContext] :
  /// Up to 3583 bytes of base64-encoded data about the invoking client to pass
  /// to the function in the context object.
  ///
  /// Parameter [invocationType] :
  /// Choose from the following options.
  ///
  /// <ul>
  /// <li>
  /// <code>RequestResponse</code> (default) - Invoke the function
  /// synchronously. Keep the connection open until the function returns a
  /// response or times out. The API response includes the function response and
  /// additional data.
  /// </li>
  /// <li>
  /// <code>Event</code> - Invoke the function asynchronously. Send events that
  /// fail multiple times to the function's dead-letter queue (if it's
  /// configured). The API response only includes a status code.
  /// </li>
  /// <li>
  /// <code>DryRun</code> - Validate parameter values and verify that the user
  /// or role has permission to invoke the function.
  /// </li>
  /// </ul>
  ///
  /// Parameter [logType] :
  /// Set to <code>Tail</code> to include the execution log in the response.
  ///
  /// Parameter [payload] :
  /// The JSON that you want to provide to your Lambda function as input.
  ///
  /// Parameter [qualifier] :
  /// Specify a version or alias to invoke a published version of the function.
  Future<InvocationResponse> invoke({
    required String functionName,
    String? clientContext,
    InvocationType? invocationType,
    LogType? logType,
    Uint8List? payload,
    String? qualifier,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      170,
      isRequired: true,
    );
    _s.validateStringLength(
      'qualifier',
      qualifier,
      1,
      128,
    );
    final headers = <String, String>{
      if (clientContext != null)
        'X-Amz-Client-Context': clientContext.toString(),
      if (invocationType != null)
        'X-Amz-Invocation-Type': invocationType.toValue(),
      if (logType != null) 'X-Amz-Log-Type': logType.toValue(),
    };
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
    };
    final response = await _protocol.sendRaw(
      payload: payload,
      method: 'POST',
      requestUri:
          '/2015-03-31/functions/${Uri.encodeComponent(functionName)}/invocations',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return InvocationResponse(
      payload: await response.stream.toBytes(),
      executedVersion: _s.extractHeaderStringValue(
          response.headers, 'X-Amz-Executed-Version'),
      functionError:
          _s.extractHeaderStringValue(response.headers, 'X-Amz-Function-Error'),
      logResult:
          _s.extractHeaderStringValue(response.headers, 'X-Amz-Log-Result'),
      statusCode: response.statusCode,
    );
  }

  /// <important>
  /// For asynchronous function invocation, use <a>Invoke</a>.
  /// </important>
  /// Invokes a function asynchronously.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestContentException].
  /// May throw [InvalidRuntimeException].
  /// May throw [ResourceConflictException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [invokeArgs] :
  /// The JSON that you want to provide to your Lambda function as input.
  @Deprecated('Deprecated')
  Future<InvokeAsyncResponse> invokeAsync({
    required String functionName,
    required Uint8List invokeArgs,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      170,
      isRequired: true,
    );
    ArgumentError.checkNotNull(invokeArgs, 'invokeArgs');
    final response = await _protocol.send(
      payload: invokeArgs,
      method: 'POST',
      requestUri:
          '/2014-11-13/functions/${Uri.encodeComponent(functionName)}/invoke-async/',
      exceptionFnMap: _exceptionFns,
    );
    return InvokeAsyncResponse.fromJson(response);
  }

  /// Returns a list of <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">aliases</a>
  /// for a Lambda function.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [functionVersion] :
  /// Specify a function version to only list aliases that invoke that version.
  ///
  /// Parameter [marker] :
  /// Specify the pagination token that's returned by a previous request to
  /// retrieve the next page of results.
  ///
  /// Parameter [maxItems] :
  /// Limit the number of aliases returned.
  Future<ListAliasesResponse> listAliases({
    required String functionName,
    String? functionVersion,
    String? marker,
    int? maxItems,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringLength(
      'functionVersion',
      functionVersion,
      1,
      1024,
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      10000,
    );
    final $query = <String, List<String>>{
      if (functionVersion != null) 'FunctionVersion': [functionVersion],
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2015-03-31/functions/${Uri.encodeComponent(functionName)}/aliases',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAliasesResponse.fromJson(response);
  }

  /// Returns a list of <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuring-codesigning.html">code
  /// signing configurations</a>. A request returns up to 10,000 configurations
  /// per call. You can use the <code>MaxItems</code> parameter to return fewer
  /// configurations per call.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [marker] :
  /// Specify the pagination token that's returned by a previous request to
  /// retrieve the next page of results.
  ///
  /// Parameter [maxItems] :
  /// Maximum number of items to return.
  Future<ListCodeSigningConfigsResponse> listCodeSigningConfigs({
    String? marker,
    int? maxItems,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      10000,
    );
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2020-04-22/code-signing-configs/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCodeSigningConfigsResponse.fromJson(response);
  }

  /// Lists event source mappings. Specify an <code>EventSourceArn</code> to
  /// only show event source mappings for a single event source.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [eventSourceArn] :
  /// The Amazon Resource Name (ARN) of the event source.
  ///
  /// <ul>
  /// <li>
  /// <b>Amazon Kinesis</b> - The ARN of the data stream or a stream consumer.
  /// </li>
  /// <li>
  /// <b>Amazon DynamoDB Streams</b> - The ARN of the stream.
  /// </li>
  /// <li>
  /// <b>Amazon Simple Queue Service</b> - The ARN of the queue.
  /// </li>
  /// <li>
  /// <b>Amazon Managed Streaming for Apache Kafka</b> - The ARN of the cluster.
  /// </li>
  /// </ul>
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Version or Alias ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it's limited to 64 characters in length.
  ///
  /// Parameter [marker] :
  /// A pagination token returned by a previous call.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of event source mappings to return.
  Future<ListEventSourceMappingsResponse> listEventSourceMappings({
    String? eventSourceArn,
    String? functionName,
    String? marker,
    int? maxItems,
  }) async {
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      10000,
    );
    final $query = <String, List<String>>{
      if (eventSourceArn != null) 'EventSourceArn': [eventSourceArn],
      if (functionName != null) 'FunctionName': [functionName],
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2015-03-31/event-source-mappings/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEventSourceMappingsResponse.fromJson(response);
  }

  /// Retrieves a list of configurations for asynchronous invocation for a
  /// function.
  ///
  /// To configure options for asynchronous invocation, use
  /// <a>PutFunctionEventInvokeConfig</a>.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ServiceException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [marker] :
  /// Specify the pagination token that's returned by a previous request to
  /// retrieve the next page of results.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of configurations to return.
  Future<ListFunctionEventInvokeConfigsResponse>
      listFunctionEventInvokeConfigs({
    required String functionName,
    String? marker,
    int? maxItems,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2019-09-25/functions/${Uri.encodeComponent(functionName)}/event-invoke-config/list',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFunctionEventInvokeConfigsResponse.fromJson(response);
  }

  /// Returns a list of Lambda functions, with the version-specific
  /// configuration of each. Lambda returns up to 50 functions per call.
  ///
  /// Set <code>FunctionVersion</code> to <code>ALL</code> to include all
  /// published versions of each function in addition to the unpublished
  /// version.
  /// <note>
  /// The <code>ListFunctions</code> action returns a subset of the
  /// <a>FunctionConfiguration</a> fields. To get the additional fields (State,
  /// StateReasonCode, StateReason, LastUpdateStatus, LastUpdateStatusReason,
  /// LastUpdateStatusReasonCode) for a function or version, use
  /// <a>GetFunction</a>.
  /// </note>
  ///
  /// May throw [ServiceException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidParameterValueException].
  ///
  /// Parameter [functionVersion] :
  /// Set to <code>ALL</code> to include entries for all published versions of
  /// each function.
  ///
  /// Parameter [marker] :
  /// Specify the pagination token that's returned by a previous request to
  /// retrieve the next page of results.
  ///
  /// Parameter [masterRegion] :
  /// For Lambda@Edge functions, the Region of the master function. For example,
  /// <code>us-east-1</code> filters the list of functions to only include
  /// Lambda@Edge functions replicated from a master function in US East (N.
  /// Virginia). If specified, you must set <code>FunctionVersion</code> to
  /// <code>ALL</code>.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of functions to return in the response. Note that
  /// <code>ListFunctions</code> returns a maximum of 50 items in each response,
  /// even if you set the number higher.
  Future<ListFunctionsResponse> listFunctions({
    FunctionVersion? functionVersion,
    String? marker,
    String? masterRegion,
    int? maxItems,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      10000,
    );
    final $query = <String, List<String>>{
      if (functionVersion != null)
        'FunctionVersion': [functionVersion.toValue()],
      if (marker != null) 'Marker': [marker],
      if (masterRegion != null) 'MasterRegion': [masterRegion],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2015-03-31/functions/',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFunctionsResponse.fromJson(response);
  }

  /// List the functions that use the specified code signing configuration. You
  /// can use this method prior to deleting a code signing configuration, to
  /// verify that no functions are using it.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [codeSigningConfigArn] :
  /// The The Amazon Resource Name (ARN) of the code signing configuration.
  ///
  /// Parameter [marker] :
  /// Specify the pagination token that's returned by a previous request to
  /// retrieve the next page of results.
  ///
  /// Parameter [maxItems] :
  /// Maximum number of items to return.
  Future<ListFunctionsByCodeSigningConfigResponse>
      listFunctionsByCodeSigningConfig({
    required String codeSigningConfigArn,
    String? marker,
    int? maxItems,
  }) async {
    ArgumentError.checkNotNull(codeSigningConfigArn, 'codeSigningConfigArn');
    _s.validateStringLength(
      'codeSigningConfigArn',
      codeSigningConfigArn,
      0,
      200,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      10000,
    );
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2020-04-22/code-signing-configs/${Uri.encodeComponent(codeSigningConfigArn)}/functions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFunctionsByCodeSigningConfigResponse.fromJson(response);
  }

  /// Lists the versions of an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda
  /// layer</a>. Versions that have been deleted aren't listed. Specify a <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html">runtime
  /// identifier</a> to list only versions that indicate that they're compatible
  /// with that runtime.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [layerName] :
  /// The name or Amazon Resource Name (ARN) of the layer.
  ///
  /// Parameter [compatibleRuntime] :
  /// A runtime identifier. For example, <code>go1.x</code>.
  ///
  /// Parameter [marker] :
  /// A pagination token returned by a previous call.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of versions to return.
  Future<ListLayerVersionsResponse> listLayerVersions({
    required String layerName,
    Runtime? compatibleRuntime,
    String? marker,
    int? maxItems,
  }) async {
    ArgumentError.checkNotNull(layerName, 'layerName');
    _s.validateStringLength(
      'layerName',
      layerName,
      1,
      140,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (compatibleRuntime != null)
        'CompatibleRuntime': [compatibleRuntime.toValue()],
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2018-10-31/layers/${Uri.encodeComponent(layerName)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLayerVersionsResponse.fromJson(response);
  }

  /// Lists <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda
  /// layers</a> and shows information about the latest version of each. Specify
  /// a <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html">runtime
  /// identifier</a> to list only layers that indicate that they're compatible
  /// with that runtime.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidParameterValueException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [compatibleRuntime] :
  /// A runtime identifier. For example, <code>go1.x</code>.
  ///
  /// Parameter [marker] :
  /// A pagination token returned by a previous call.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of layers to return.
  Future<ListLayersResponse> listLayers({
    Runtime? compatibleRuntime,
    String? marker,
    int? maxItems,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (compatibleRuntime != null)
        'CompatibleRuntime': [compatibleRuntime.toValue()],
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2018-10-31/layers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLayersResponse.fromJson(response);
  }

  /// Retrieves a list of provisioned concurrency configurations for a function.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ServiceException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [marker] :
  /// Specify the pagination token that's returned by a previous request to
  /// retrieve the next page of results.
  ///
  /// Parameter [maxItems] :
  /// Specify a number to limit the number of configurations returned.
  Future<ListProvisionedConcurrencyConfigsResponse>
      listProvisionedConcurrencyConfigs({
    required String functionName,
    String? marker,
    int? maxItems,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2019-09-30/functions/${Uri.encodeComponent(functionName)}/provisioned-concurrency?List=ALL',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProvisionedConcurrencyConfigsResponse.fromJson(response);
  }

  /// Returns a function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/tagging.html">tags</a>.
  /// You can also view tags with <a>GetFunction</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resource] :
  /// The function's Amazon Resource Name (ARN).
  Future<ListTagsResponse> listTags({
    required String resource,
  }) async {
    ArgumentError.checkNotNull(resource, 'resource');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2017-03-31/tags/${Uri.encodeComponent(resource)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsResponse.fromJson(response);
  }

  /// Returns a list of <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">versions</a>,
  /// with the version-specific configuration of each. Lambda returns up to 50
  /// versions per call.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [marker] :
  /// Specify the pagination token that's returned by a previous request to
  /// retrieve the next page of results.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of versions to return. Note that
  /// <code>ListVersionsByFunction</code> returns a maximum of 50 items in each
  /// response, even if you set the number higher.
  Future<ListVersionsByFunctionResponse> listVersionsByFunction({
    required String functionName,
    String? marker,
    int? maxItems,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      170,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      10000,
    );
    final $query = <String, List<String>>{
      if (marker != null) 'Marker': [marker],
      if (maxItems != null) 'MaxItems': [maxItems.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2015-03-31/functions/${Uri.encodeComponent(functionName)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVersionsByFunctionResponse.fromJson(response);
  }

  /// Creates an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda
  /// layer</a> from a ZIP archive. Each time you call
  /// <code>PublishLayerVersion</code> with the same layer name, a new version
  /// is created.
  ///
  /// Add layers to your function with <a>CreateFunction</a> or
  /// <a>UpdateFunctionConfiguration</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidParameterValueException].
  /// May throw [CodeStorageExceededException].
  ///
  /// Parameter [content] :
  /// The function layer archive.
  ///
  /// Parameter [layerName] :
  /// The name or Amazon Resource Name (ARN) of the layer.
  ///
  /// Parameter [compatibleRuntimes] :
  /// A list of compatible <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html">function
  /// runtimes</a>. Used for filtering with <a>ListLayers</a> and
  /// <a>ListLayerVersions</a>.
  ///
  /// Parameter [description] :
  /// The description of the version.
  ///
  /// Parameter [licenseInfo] :
  /// The layer's software license. It can be any of the following:
  ///
  /// <ul>
  /// <li>
  /// An <a href="https://spdx.org/licenses/">SPDX license identifier</a>. For
  /// example, <code>MIT</code>.
  /// </li>
  /// <li>
  /// The URL of a license hosted on the internet. For example,
  /// <code>https://opensource.org/licenses/MIT</code>.
  /// </li>
  /// <li>
  /// The full text of the license.
  /// </li>
  /// </ul>
  Future<PublishLayerVersionResponse> publishLayerVersion({
    required LayerVersionContentInput content,
    required String layerName,
    List<Runtime>? compatibleRuntimes,
    String? description,
    String? licenseInfo,
  }) async {
    ArgumentError.checkNotNull(content, 'content');
    ArgumentError.checkNotNull(layerName, 'layerName');
    _s.validateStringLength(
      'layerName',
      layerName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
    );
    _s.validateStringLength(
      'licenseInfo',
      licenseInfo,
      0,
      512,
    );
    final $payload = <String, dynamic>{
      'Content': content,
      if (compatibleRuntimes != null)
        'CompatibleRuntimes':
            compatibleRuntimes.map((e) => e.toValue()).toList(),
      if (description != null) 'Description': description,
      if (licenseInfo != null) 'LicenseInfo': licenseInfo,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2018-10-31/layers/${Uri.encodeComponent(layerName)}/versions',
      exceptionFnMap: _exceptionFns,
    );
    return PublishLayerVersionResponse.fromJson(response);
  }

  /// Creates a <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">version</a>
  /// from the current code and configuration of a function. Use versions to
  /// create a snapshot of your function code and configuration that doesn't
  /// change.
  ///
  /// Lambda doesn't publish a version if the function's configuration and code
  /// haven't changed since the last version. Use <a>UpdateFunctionCode</a> or
  /// <a>UpdateFunctionConfiguration</a> to update the function before
  /// publishing a version.
  ///
  /// Clients can invoke versions directly or with an alias. To create an alias,
  /// use <a>CreateAlias</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [TooManyRequestsException].
  /// May throw [CodeStorageExceededException].
  /// May throw [PreconditionFailedException].
  /// May throw [ResourceConflictException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [codeSha256] :
  /// Only publish a version if the hash value matches the value that's
  /// specified. Use this option to avoid publishing a version if the function
  /// code has changed since you last updated it. You can get the hash for the
  /// version that you uploaded from the output of <a>UpdateFunctionCode</a>.
  ///
  /// Parameter [description] :
  /// A description for the version to override the description in the function
  /// configuration.
  ///
  /// Parameter [revisionId] :
  /// Only update the function if the revision ID matches the ID that's
  /// specified. Use this option to avoid publishing a version if the function
  /// configuration has changed since you last updated it.
  Future<FunctionConfiguration> publishVersion({
    required String functionName,
    String? codeSha256,
    String? description,
    String? revisionId,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
    );
    final $payload = <String, dynamic>{
      if (codeSha256 != null) 'CodeSha256': codeSha256,
      if (description != null) 'Description': description,
      if (revisionId != null) 'RevisionId': revisionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2015-03-31/functions/${Uri.encodeComponent(functionName)}/versions',
      exceptionFnMap: _exceptionFns,
    );
    return FunctionConfiguration.fromJson(response);
  }

  /// Update the code signing configuration for the function. Changes to the
  /// code signing configuration take effect the next time a user tries to
  /// deploy a code package to the function.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceConflictException].
  /// May throw [CodeSigningConfigNotFoundException].
  ///
  /// Parameter [codeSigningConfigArn] :
  /// The The Amazon Resource Name (ARN) of the code signing configuration.
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  Future<PutFunctionCodeSigningConfigResponse> putFunctionCodeSigningConfig({
    required String codeSigningConfigArn,
    required String functionName,
  }) async {
    ArgumentError.checkNotNull(codeSigningConfigArn, 'codeSigningConfigArn');
    _s.validateStringLength(
      'codeSigningConfigArn',
      codeSigningConfigArn,
      0,
      200,
      isRequired: true,
    );
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'CodeSigningConfigArn': codeSigningConfigArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2020-06-30/functions/${Uri.encodeComponent(functionName)}/code-signing-config',
      exceptionFnMap: _exceptionFns,
    );
    return PutFunctionCodeSigningConfigResponse.fromJson(response);
  }

  /// Sets the maximum number of simultaneous executions for a function, and
  /// reserves capacity for that concurrency level.
  ///
  /// Concurrency settings apply to the function as a whole, including all
  /// published versions and the unpublished version. Reserving concurrency both
  /// ensures that your function has capacity to process the specified number of
  /// events simultaneously, and prevents it from scaling beyond that level. Use
  /// <a>GetFunction</a> to see the current setting for a function.
  ///
  /// Use <a>GetAccountSettings</a> to see your Regional concurrency limit. You
  /// can reserve concurrency for as many functions as you like, as long as you
  /// leave at least 100 simultaneous executions unreserved for functions that
  /// aren't configured with a per-function limit. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html">Managing
  /// Concurrency</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceConflictException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [reservedConcurrentExecutions] :
  /// The number of simultaneous executions to reserve for the function.
  Future<Concurrency> putFunctionConcurrency({
    required String functionName,
    required int reservedConcurrentExecutions,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        reservedConcurrentExecutions, 'reservedConcurrentExecutions');
    _s.validateNumRange(
      'reservedConcurrentExecutions',
      reservedConcurrentExecutions,
      0,
      1152921504606846976,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'ReservedConcurrentExecutions': reservedConcurrentExecutions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2017-10-31/functions/${Uri.encodeComponent(functionName)}/concurrency',
      exceptionFnMap: _exceptionFns,
    );
    return Concurrency.fromJson(response);
  }

  /// Configures options for <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html">asynchronous
  /// invocation</a> on a function, version, or alias. If a configuration
  /// already exists for a function, version, or alias, this operation
  /// overwrites it. If you exclude any settings, they are removed. To set one
  /// option without affecting existing settings for other options, use
  /// <a>UpdateFunctionEventInvokeConfig</a>.
  ///
  /// By default, Lambda retries an asynchronous invocation twice if the
  /// function returns an error. It retains events in a queue for up to six
  /// hours. When an event fails all processing attempts or stays in the
  /// asynchronous invocation queue for too long, Lambda discards it. To retain
  /// discarded events, configure a dead-letter queue with
  /// <a>UpdateFunctionConfiguration</a>.
  ///
  /// To send an invocation record to a queue, topic, function, or event bus,
  /// specify a <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#invocation-async-destinations">destination</a>.
  /// You can configure separate destinations for successful invocations
  /// (on-success) and events that fail all processing attempts (on-failure).
  /// You can configure destinations in addition to or instead of a dead-letter
  /// queue.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function, version, or alias.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>my-function</code> (name-only),
  /// <code>my-function:v1</code> (with alias).
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// Parameter [destinationConfig] :
  /// A destination for events after they have been sent to a function for
  /// processing.
  /// <p class="title"> <b>Destinations</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function</b> - The Amazon Resource Name (ARN) of a Lambda function.
  /// </li>
  /// <li>
  /// <b>Queue</b> - The ARN of an SQS queue.
  /// </li>
  /// <li>
  /// <b>Topic</b> - The ARN of an SNS topic.
  /// </li>
  /// <li>
  /// <b>Event Bus</b> - The ARN of an Amazon EventBridge event bus.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maximumEventAgeInSeconds] :
  /// The maximum age of a request that Lambda sends to a function for
  /// processing.
  ///
  /// Parameter [maximumRetryAttempts] :
  /// The maximum number of times to retry when the function returns an error.
  ///
  /// Parameter [qualifier] :
  /// A version number or alias name.
  Future<FunctionEventInvokeConfig> putFunctionEventInvokeConfig({
    required String functionName,
    DestinationConfig? destinationConfig,
    int? maximumEventAgeInSeconds,
    int? maximumRetryAttempts,
    String? qualifier,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateNumRange(
      'maximumEventAgeInSeconds',
      maximumEventAgeInSeconds,
      60,
      21600,
    );
    _s.validateNumRange(
      'maximumRetryAttempts',
      maximumRetryAttempts,
      0,
      2,
    );
    _s.validateStringLength(
      'qualifier',
      qualifier,
      1,
      128,
    );
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
    };
    final $payload = <String, dynamic>{
      if (destinationConfig != null) 'DestinationConfig': destinationConfig,
      if (maximumEventAgeInSeconds != null)
        'MaximumEventAgeInSeconds': maximumEventAgeInSeconds,
      if (maximumRetryAttempts != null)
        'MaximumRetryAttempts': maximumRetryAttempts,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2019-09-25/functions/${Uri.encodeComponent(functionName)}/event-invoke-config',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return FunctionEventInvokeConfig.fromJson(response);
  }

  /// Adds a provisioned concurrency configuration to a function's alias or
  /// version.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [ServiceException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [provisionedConcurrentExecutions] :
  /// The amount of provisioned concurrency to allocate for the version or
  /// alias.
  ///
  /// Parameter [qualifier] :
  /// The version number or alias name.
  Future<PutProvisionedConcurrencyConfigResponse>
      putProvisionedConcurrencyConfig({
    required String functionName,
    required int provisionedConcurrentExecutions,
    required String qualifier,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        provisionedConcurrentExecutions, 'provisionedConcurrentExecutions');
    _s.validateNumRange(
      'provisionedConcurrentExecutions',
      provisionedConcurrentExecutions,
      1,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(qualifier, 'qualifier');
    _s.validateStringLength(
      'qualifier',
      qualifier,
      1,
      128,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      'Qualifier': [qualifier],
    };
    final $payload = <String, dynamic>{
      'ProvisionedConcurrentExecutions': provisionedConcurrentExecutions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2019-09-30/functions/${Uri.encodeComponent(functionName)}/provisioned-concurrency',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return PutProvisionedConcurrencyConfigResponse.fromJson(response);
  }

  /// Removes a statement from the permissions policy for a version of an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda
  /// layer</a>. For more information, see <a>AddLayerVersionPermission</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [TooManyRequestsException].
  /// May throw [PreconditionFailedException].
  ///
  /// Parameter [layerName] :
  /// The name or Amazon Resource Name (ARN) of the layer.
  ///
  /// Parameter [statementId] :
  /// The identifier that was specified when the statement was added.
  ///
  /// Parameter [versionNumber] :
  /// The version number.
  ///
  /// Parameter [revisionId] :
  /// Only update the policy if the revision ID matches the ID specified. Use
  /// this option to avoid modifying a policy that has changed since you last
  /// read it.
  Future<void> removeLayerVersionPermission({
    required String layerName,
    required String statementId,
    required int versionNumber,
    String? revisionId,
  }) async {
    ArgumentError.checkNotNull(layerName, 'layerName');
    _s.validateStringLength(
      'layerName',
      layerName,
      1,
      140,
      isRequired: true,
    );
    ArgumentError.checkNotNull(statementId, 'statementId');
    _s.validateStringLength(
      'statementId',
      statementId,
      1,
      100,
      isRequired: true,
    );
    ArgumentError.checkNotNull(versionNumber, 'versionNumber');
    final $query = <String, List<String>>{
      if (revisionId != null) 'RevisionId': [revisionId],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2018-10-31/layers/${Uri.encodeComponent(layerName)}/versions/${Uri.encodeComponent(versionNumber.toString())}/policy/${Uri.encodeComponent(statementId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Revokes function-use permission from an Amazon Web Services service or
  /// another account. You can get the ID of the statement from the output of
  /// <a>GetPolicy</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [TooManyRequestsException].
  /// May throw [PreconditionFailedException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function, version, or alias.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>my-function</code> (name-only),
  /// <code>my-function:v1</code> (with alias).
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// Parameter [statementId] :
  /// Statement ID of the permission to remove.
  ///
  /// Parameter [qualifier] :
  /// Specify a version or alias to remove permissions from a published version
  /// of the function.
  ///
  /// Parameter [revisionId] :
  /// Only update the policy if the revision ID matches the ID that's specified.
  /// Use this option to avoid modifying a policy that has changed since you
  /// last read it.
  Future<void> removePermission({
    required String functionName,
    required String statementId,
    String? qualifier,
    String? revisionId,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    ArgumentError.checkNotNull(statementId, 'statementId');
    _s.validateStringLength(
      'statementId',
      statementId,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'qualifier',
      qualifier,
      1,
      128,
    );
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
      if (revisionId != null) 'RevisionId': [revisionId],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2015-03-31/functions/${Uri.encodeComponent(functionName)}/policy/${Uri.encodeComponent(statementId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/tagging.html">tags</a>
  /// to a function.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceConflictException].
  ///
  /// Parameter [resource] :
  /// The function's Amazon Resource Name (ARN).
  ///
  /// Parameter [tags] :
  /// A list of tags to apply to the function.
  Future<void> tagResource({
    required String resource,
    required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resource, 'resource');
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2017-03-31/tags/${Uri.encodeComponent(resource)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/tagging.html">tags</a>
  /// from a function.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceConflictException].
  ///
  /// Parameter [resource] :
  /// The function's Amazon Resource Name (ARN).
  ///
  /// Parameter [tagKeys] :
  /// A list of tag keys to remove from the function.
  Future<void> untagResource({
    required String resource,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resource, 'resource');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2017-03-31/tags/${Uri.encodeComponent(resource)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the configuration of a Lambda function <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">alias</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [TooManyRequestsException].
  /// May throw [PreconditionFailedException].
  /// May throw [ResourceConflictException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [name] :
  /// The name of the alias.
  ///
  /// Parameter [description] :
  /// A description of the alias.
  ///
  /// Parameter [functionVersion] :
  /// The function version that the alias invokes.
  ///
  /// Parameter [revisionId] :
  /// Only update the alias if the revision ID matches the ID that's specified.
  /// Use this option to avoid modifying an alias that has changed since you
  /// last read it.
  ///
  /// Parameter [routingConfig] :
  /// The <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-aliases.html#configuring-alias-routing">routing
  /// configuration</a> of the alias.
  Future<AliasConfiguration> updateAlias({
    required String functionName,
    required String name,
    String? description,
    String? functionVersion,
    String? revisionId,
    AliasRoutingConfiguration? routingConfig,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
    );
    _s.validateStringLength(
      'functionVersion',
      functionVersion,
      1,
      1024,
    );
    final $payload = <String, dynamic>{
      if (description != null) 'Description': description,
      if (functionVersion != null) 'FunctionVersion': functionVersion,
      if (revisionId != null) 'RevisionId': revisionId,
      if (routingConfig != null) 'RoutingConfig': routingConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2015-03-31/functions/${Uri.encodeComponent(functionName)}/aliases/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return AliasConfiguration.fromJson(response);
  }

  /// Update the code signing configuration. Changes to the code signing
  /// configuration take effect the next time a user tries to deploy a code
  /// package to the function.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [codeSigningConfigArn] :
  /// The The Amazon Resource Name (ARN) of the code signing configuration.
  ///
  /// Parameter [allowedPublishers] :
  /// Signing profiles for this code signing configuration.
  ///
  /// Parameter [codeSigningPolicies] :
  /// The code signing policy.
  ///
  /// Parameter [description] :
  /// Descriptive name for this code signing configuration.
  Future<UpdateCodeSigningConfigResponse> updateCodeSigningConfig({
    required String codeSigningConfigArn,
    AllowedPublishers? allowedPublishers,
    CodeSigningPolicies? codeSigningPolicies,
    String? description,
  }) async {
    ArgumentError.checkNotNull(codeSigningConfigArn, 'codeSigningConfigArn');
    _s.validateStringLength(
      'codeSigningConfigArn',
      codeSigningConfigArn,
      0,
      200,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
    );
    final $payload = <String, dynamic>{
      if (allowedPublishers != null) 'AllowedPublishers': allowedPublishers,
      if (codeSigningPolicies != null)
        'CodeSigningPolicies': codeSigningPolicies,
      if (description != null) 'Description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2020-04-22/code-signing-configs/${Uri.encodeComponent(codeSigningConfigArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateCodeSigningConfigResponse.fromJson(response);
  }

  /// Updates an event source mapping. You can change the function that Lambda
  /// invokes, or pause invocation and resume later from the same location.
  ///
  /// The following error handling options are only available for stream sources
  /// (DynamoDB and Kinesis):
  ///
  /// <ul>
  /// <li>
  /// <code>BisectBatchOnFunctionError</code> - If the function returns an
  /// error, split the batch in two and retry.
  /// </li>
  /// <li>
  /// <code>DestinationConfig</code> - Send discarded records to an Amazon SQS
  /// queue or Amazon SNS topic.
  /// </li>
  /// <li>
  /// <code>MaximumRecordAgeInSeconds</code> - Discard records older than the
  /// specified age. The default value is infinite (-1). When set to infinite
  /// (-1), failed records are retried until the record expires
  /// </li>
  /// <li>
  /// <code>MaximumRetryAttempts</code> - Discard records after the specified
  /// number of retries. The default value is infinite (-1). When set to
  /// infinite (-1), failed records are retried until the record expires.
  /// </li>
  /// <li>
  /// <code>ParallelizationFactor</code> - Process multiple batches from each
  /// shard concurrently.
  /// </li>
  /// </ul>
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceConflictException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [uuid] :
  /// The identifier of the event source mapping.
  ///
  /// Parameter [batchSize] :
  /// The maximum number of items to retrieve in a single batch.
  ///
  /// <ul>
  /// <li>
  /// <b>Amazon Kinesis</b> - Default 100. Max 10,000.
  /// </li>
  /// <li>
  /// <b>Amazon DynamoDB Streams</b> - Default 100. Max 1,000.
  /// </li>
  /// <li>
  /// <b>Amazon Simple Queue Service</b> - Default 10. For standard queues the
  /// max is 10,000. For FIFO queues the max is 10.
  /// </li>
  /// <li>
  /// <b>Amazon Managed Streaming for Apache Kafka</b> - Default 100. Max
  /// 10,000.
  /// </li>
  /// <li>
  /// <b>Self-Managed Apache Kafka</b> - Default 100. Max 10,000.
  /// </li>
  /// </ul>
  ///
  /// Parameter [bisectBatchOnFunctionError] :
  /// (Streams only) If the function returns an error, split the batch in two
  /// and retry.
  ///
  /// Parameter [destinationConfig] :
  /// (Streams only) An Amazon SQS queue or Amazon SNS topic destination for
  /// discarded records.
  ///
  /// Parameter [enabled] :
  /// If true, the event source mapping is active. Set to false to pause polling
  /// and invocation.
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Version or Alias ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it's limited to 64 characters in length.
  ///
  /// Parameter [functionResponseTypes] :
  /// (Streams only) A list of current response type enums applied to the event
  /// source mapping.
  ///
  /// Parameter [maximumBatchingWindowInSeconds] :
  /// (Streams and SQS standard queues) The maximum amount of time to gather
  /// records before invoking the function, in seconds.
  ///
  /// Parameter [maximumRecordAgeInSeconds] :
  /// (Streams only) Discard records older than the specified age. The default
  /// value is infinite (-1).
  ///
  /// Parameter [maximumRetryAttempts] :
  /// (Streams only) Discard records after the specified number of retries. The
  /// default value is infinite (-1). When set to infinite (-1), failed records
  /// will be retried until the record expires.
  ///
  /// Parameter [parallelizationFactor] :
  /// (Streams only) The number of batches to process from each shard
  /// concurrently.
  ///
  /// Parameter [sourceAccessConfigurations] :
  /// An array of the authentication protocol, or the VPC components to secure
  /// your event source.
  ///
  /// Parameter [tumblingWindowInSeconds] :
  /// (Streams only) The duration in seconds of a processing window. The range
  /// is between 1 second up to 900 seconds.
  Future<EventSourceMappingConfiguration> updateEventSourceMapping({
    required String uuid,
    int? batchSize,
    bool? bisectBatchOnFunctionError,
    DestinationConfig? destinationConfig,
    bool? enabled,
    String? functionName,
    List<FunctionResponseType>? functionResponseTypes,
    int? maximumBatchingWindowInSeconds,
    int? maximumRecordAgeInSeconds,
    int? maximumRetryAttempts,
    int? parallelizationFactor,
    List<SourceAccessConfiguration>? sourceAccessConfigurations,
    int? tumblingWindowInSeconds,
  }) async {
    ArgumentError.checkNotNull(uuid, 'uuid');
    _s.validateNumRange(
      'batchSize',
      batchSize,
      1,
      10000,
    );
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
    );
    _s.validateNumRange(
      'maximumBatchingWindowInSeconds',
      maximumBatchingWindowInSeconds,
      0,
      300,
    );
    _s.validateNumRange(
      'maximumRecordAgeInSeconds',
      maximumRecordAgeInSeconds,
      -1,
      604800,
    );
    _s.validateNumRange(
      'maximumRetryAttempts',
      maximumRetryAttempts,
      -1,
      10000,
    );
    _s.validateNumRange(
      'parallelizationFactor',
      parallelizationFactor,
      1,
      10,
    );
    _s.validateNumRange(
      'tumblingWindowInSeconds',
      tumblingWindowInSeconds,
      0,
      900,
    );
    final $payload = <String, dynamic>{
      if (batchSize != null) 'BatchSize': batchSize,
      if (bisectBatchOnFunctionError != null)
        'BisectBatchOnFunctionError': bisectBatchOnFunctionError,
      if (destinationConfig != null) 'DestinationConfig': destinationConfig,
      if (enabled != null) 'Enabled': enabled,
      if (functionName != null) 'FunctionName': functionName,
      if (functionResponseTypes != null)
        'FunctionResponseTypes':
            functionResponseTypes.map((e) => e.toValue()).toList(),
      if (maximumBatchingWindowInSeconds != null)
        'MaximumBatchingWindowInSeconds': maximumBatchingWindowInSeconds,
      if (maximumRecordAgeInSeconds != null)
        'MaximumRecordAgeInSeconds': maximumRecordAgeInSeconds,
      if (maximumRetryAttempts != null)
        'MaximumRetryAttempts': maximumRetryAttempts,
      if (parallelizationFactor != null)
        'ParallelizationFactor': parallelizationFactor,
      if (sourceAccessConfigurations != null)
        'SourceAccessConfigurations': sourceAccessConfigurations,
      if (tumblingWindowInSeconds != null)
        'TumblingWindowInSeconds': tumblingWindowInSeconds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2015-03-31/event-source-mappings/${Uri.encodeComponent(uuid)}',
      exceptionFnMap: _exceptionFns,
    );
    return EventSourceMappingConfiguration.fromJson(response);
  }

  /// Updates a Lambda function's code. If code signing is enabled for the
  /// function, the code package must be signed by a trusted publisher. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-trustedcode.html">Configuring
  /// code signing</a>.
  ///
  /// The function's code is locked when you publish a version. You can't modify
  /// the code of a published version, only the unpublished version.
  /// <note>
  /// For a function defined as a container image, Lambda resolves the image tag
  /// to an image digest. In Amazon ECR, if you update the image tag to a new
  /// image, Lambda does not automatically update the function.
  /// </note>
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [TooManyRequestsException].
  /// May throw [CodeStorageExceededException].
  /// May throw [PreconditionFailedException].
  /// May throw [ResourceConflictException].
  /// May throw [CodeVerificationFailedException].
  /// May throw [InvalidCodeSignatureException].
  /// May throw [CodeSigningConfigNotFoundException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [dryRun] :
  /// Set to true to validate the request parameters and access permissions
  /// without modifying the function code.
  ///
  /// Parameter [imageUri] :
  /// URI of a container image in the Amazon ECR registry.
  ///
  /// Parameter [publish] :
  /// Set to true to publish a new version of the function after updating the
  /// code. This has the same effect as calling <a>PublishVersion</a>
  /// separately.
  ///
  /// Parameter [revisionId] :
  /// Only update the function if the revision ID matches the ID that's
  /// specified. Use this option to avoid modifying a function that has changed
  /// since you last read it.
  ///
  /// Parameter [s3Bucket] :
  /// An Amazon S3 bucket in the same Amazon Web Services Region as your
  /// function. The bucket can be in a different Amazon Web Services account.
  ///
  /// Parameter [s3Key] :
  /// The Amazon S3 key of the deployment package.
  ///
  /// Parameter [s3ObjectVersion] :
  /// For versioned objects, the version of the deployment package object to
  /// use.
  ///
  /// Parameter [zipFile] :
  /// The base64-encoded contents of the deployment package. Amazon Web Services
  /// SDK and Amazon Web Services CLI clients handle the encoding for you.
  Future<FunctionConfiguration> updateFunctionCode({
    required String functionName,
    bool? dryRun,
    String? imageUri,
    bool? publish,
    String? revisionId,
    String? s3Bucket,
    String? s3Key,
    String? s3ObjectVersion,
    Uint8List? zipFile,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringLength(
      's3Bucket',
      s3Bucket,
      3,
      63,
    );
    _s.validateStringLength(
      's3Key',
      s3Key,
      1,
      1024,
    );
    _s.validateStringLength(
      's3ObjectVersion',
      s3ObjectVersion,
      1,
      1024,
    );
    final $payload = <String, dynamic>{
      if (dryRun != null) 'DryRun': dryRun,
      if (imageUri != null) 'ImageUri': imageUri,
      if (publish != null) 'Publish': publish,
      if (revisionId != null) 'RevisionId': revisionId,
      if (s3Bucket != null) 'S3Bucket': s3Bucket,
      if (s3Key != null) 'S3Key': s3Key,
      if (s3ObjectVersion != null) 'S3ObjectVersion': s3ObjectVersion,
      if (zipFile != null) 'ZipFile': base64Encode(zipFile),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2015-03-31/functions/${Uri.encodeComponent(functionName)}/code',
      exceptionFnMap: _exceptionFns,
    );
    return FunctionConfiguration.fromJson(response);
  }

  /// Modify the version-specific settings of a Lambda function.
  ///
  /// When you update a function, Lambda provisions an instance of the function
  /// and its supporting resources. If your function connects to a VPC, this
  /// process can take a minute. During this time, you can't modify the
  /// function, but you can still invoke it. The <code>LastUpdateStatus</code>,
  /// <code>LastUpdateStatusReason</code>, and
  /// <code>LastUpdateStatusReasonCode</code> fields in the response from
  /// <a>GetFunctionConfiguration</a> indicate when the update is complete and
  /// the function is processing events with the new configuration. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/functions-states.html">Function
  /// States</a>.
  ///
  /// These settings can vary between versions of a function and are locked when
  /// you publish a version. You can't modify the configuration of a published
  /// version, only the unpublished version.
  ///
  /// To configure function concurrency, use <a>PutFunctionConcurrency</a>. To
  /// grant invoke permissions to an account or Amazon Web Services service, use
  /// <a>AddPermission</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceConflictException].
  /// May throw [PreconditionFailedException].
  /// May throw [CodeVerificationFailedException].
  /// May throw [InvalidCodeSignatureException].
  /// May throw [CodeSigningConfigNotFoundException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>my-function</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only
  /// the function name, it is limited to 64 characters in length.
  ///
  /// Parameter [deadLetterConfig] :
  /// A dead letter queue configuration that specifies the queue or topic where
  /// Lambda sends asynchronous events when they fail processing. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#dlq">Dead
  /// Letter Queues</a>.
  ///
  /// Parameter [description] :
  /// A description of the function.
  ///
  /// Parameter [environment] :
  /// Environment variables that are accessible from function code during
  /// execution.
  ///
  /// Parameter [fileSystemConfigs] :
  /// Connection settings for an Amazon EFS file system.
  ///
  /// Parameter [handler] :
  /// The name of the method within your code that Lambda calls to execute your
  /// function. The format includes the file name. It can also include
  /// namespaces and other qualifiers, depending on the runtime. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/programming-model-v2.html">Programming
  /// Model</a>.
  ///
  /// Parameter [imageConfig] :
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/images-parms.html">Container
  /// image configuration values</a> that override the values in the container
  /// image Dockerfile.
  ///
  /// Parameter [kMSKeyArn] :
  /// The ARN of the Amazon Web Services Key Management Service (KMS) key that's
  /// used to encrypt your function's environment variables. If it's not
  /// provided, Lambda uses a default service key.
  ///
  /// Parameter [layers] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">function
  /// layers</a> to add to the function's execution environment. Specify each
  /// layer by its ARN, including the version.
  ///
  /// Parameter [memorySize] :
  /// The amount of <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-memory.html">memory
  /// available to the function</a> at runtime. Increasing the function memory
  /// also increases its CPU allocation. The default value is 128 MB. The value
  /// can be any multiple of 1 MB.
  ///
  /// Parameter [revisionId] :
  /// Only update the function if the revision ID matches the ID that's
  /// specified. Use this option to avoid modifying a function that has changed
  /// since you last read it.
  ///
  /// Parameter [role] :
  /// The Amazon Resource Name (ARN) of the function's execution role.
  ///
  /// Parameter [runtime] :
  /// The identifier of the function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html">runtime</a>.
  ///
  /// Parameter [timeout] :
  /// The amount of time that Lambda allows a function to run before stopping
  /// it. The default is 3 seconds. The maximum allowed value is 900 seconds.
  /// For additional information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/runtimes-context.html">Lambda
  /// execution environment</a>.
  ///
  /// Parameter [tracingConfig] :
  /// Set <code>Mode</code> to <code>Active</code> to sample and trace a subset
  /// of incoming requests with <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/services-xray.html">X-Ray</a>.
  ///
  /// Parameter [vpcConfig] :
  /// For network connectivity to Amazon Web Services resources in a VPC,
  /// specify a list of security groups and subnets in the VPC. When you connect
  /// a function to a VPC, it can only access resources and the internet through
  /// that VPC. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-vpc.html">VPC
  /// Settings</a>.
  Future<FunctionConfiguration> updateFunctionConfiguration({
    required String functionName,
    DeadLetterConfig? deadLetterConfig,
    String? description,
    Environment? environment,
    List<FileSystemConfig>? fileSystemConfigs,
    String? handler,
    ImageConfig? imageConfig,
    String? kMSKeyArn,
    List<String>? layers,
    int? memorySize,
    String? revisionId,
    String? role,
    Runtime? runtime,
    int? timeout,
    TracingConfig? tracingConfig,
    VpcConfig? vpcConfig,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
    );
    _s.validateStringLength(
      'handler',
      handler,
      0,
      128,
    );
    _s.validateNumRange(
      'memorySize',
      memorySize,
      128,
      10240,
    );
    _s.validateNumRange(
      'timeout',
      timeout,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      if (deadLetterConfig != null) 'DeadLetterConfig': deadLetterConfig,
      if (description != null) 'Description': description,
      if (environment != null) 'Environment': environment,
      if (fileSystemConfigs != null) 'FileSystemConfigs': fileSystemConfigs,
      if (handler != null) 'Handler': handler,
      if (imageConfig != null) 'ImageConfig': imageConfig,
      if (kMSKeyArn != null) 'KMSKeyArn': kMSKeyArn,
      if (layers != null) 'Layers': layers,
      if (memorySize != null) 'MemorySize': memorySize,
      if (revisionId != null) 'RevisionId': revisionId,
      if (role != null) 'Role': role,
      if (runtime != null) 'Runtime': runtime.toValue(),
      if (timeout != null) 'Timeout': timeout,
      if (tracingConfig != null) 'TracingConfig': tracingConfig,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2015-03-31/functions/${Uri.encodeComponent(functionName)}/configuration',
      exceptionFnMap: _exceptionFns,
    );
    return FunctionConfiguration.fromJson(response);
  }

  /// Updates the configuration for asynchronous invocation for a function,
  /// version, or alias.
  ///
  /// To configure options for asynchronous invocation, use
  /// <a>PutFunctionEventInvokeConfig</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [functionName] :
  /// The name of the Lambda function, version, or alias.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>my-function</code> (name-only),
  /// <code>my-function:v1</code> (with alias).
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:my-function</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:my-function</code>.
  /// </li>
  /// </ul>
  /// You can append a version number or alias to any of the formats. The length
  /// constraint applies only to the full ARN. If you specify only the function
  /// name, it is limited to 64 characters in length.
  ///
  /// Parameter [destinationConfig] :
  /// A destination for events after they have been sent to a function for
  /// processing.
  /// <p class="title"> <b>Destinations</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function</b> - The Amazon Resource Name (ARN) of a Lambda function.
  /// </li>
  /// <li>
  /// <b>Queue</b> - The ARN of an SQS queue.
  /// </li>
  /// <li>
  /// <b>Topic</b> - The ARN of an SNS topic.
  /// </li>
  /// <li>
  /// <b>Event Bus</b> - The ARN of an Amazon EventBridge event bus.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maximumEventAgeInSeconds] :
  /// The maximum age of a request that Lambda sends to a function for
  /// processing.
  ///
  /// Parameter [maximumRetryAttempts] :
  /// The maximum number of times to retry when the function returns an error.
  ///
  /// Parameter [qualifier] :
  /// A version number or alias name.
  Future<FunctionEventInvokeConfig> updateFunctionEventInvokeConfig({
    required String functionName,
    DestinationConfig? destinationConfig,
    int? maximumEventAgeInSeconds,
    int? maximumRetryAttempts,
    String? qualifier,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateNumRange(
      'maximumEventAgeInSeconds',
      maximumEventAgeInSeconds,
      60,
      21600,
    );
    _s.validateNumRange(
      'maximumRetryAttempts',
      maximumRetryAttempts,
      0,
      2,
    );
    _s.validateStringLength(
      'qualifier',
      qualifier,
      1,
      128,
    );
    final $query = <String, List<String>>{
      if (qualifier != null) 'Qualifier': [qualifier],
    };
    final $payload = <String, dynamic>{
      if (destinationConfig != null) 'DestinationConfig': destinationConfig,
      if (maximumEventAgeInSeconds != null)
        'MaximumEventAgeInSeconds': maximumEventAgeInSeconds,
      if (maximumRetryAttempts != null)
        'MaximumRetryAttempts': maximumRetryAttempts,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2019-09-25/functions/${Uri.encodeComponent(functionName)}/event-invoke-config',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return FunctionEventInvokeConfig.fromJson(response);
  }
}

/// Limits that are related to concurrency and storage. All file and storage
/// sizes are in bytes.
class AccountLimit {
  /// The maximum size of a function's deployment package and layers when they're
  /// extracted.
  final int? codeSizeUnzipped;

  /// The maximum size of a deployment package when it's uploaded directly to
  /// Lambda. Use Amazon S3 for larger files.
  final int? codeSizeZipped;

  /// The maximum number of simultaneous function executions.
  final int? concurrentExecutions;

  /// The amount of storage space that you can use for all deployment packages and
  /// layer archives.
  final int? totalCodeSize;

  /// The maximum number of simultaneous function executions, minus the capacity
  /// that's reserved for individual functions with <a>PutFunctionConcurrency</a>.
  final int? unreservedConcurrentExecutions;

  AccountLimit({
    this.codeSizeUnzipped,
    this.codeSizeZipped,
    this.concurrentExecutions,
    this.totalCodeSize,
    this.unreservedConcurrentExecutions,
  });

  factory AccountLimit.fromJson(Map<String, dynamic> json) {
    return AccountLimit(
      codeSizeUnzipped: json['CodeSizeUnzipped'] as int?,
      codeSizeZipped: json['CodeSizeZipped'] as int?,
      concurrentExecutions: json['ConcurrentExecutions'] as int?,
      totalCodeSize: json['TotalCodeSize'] as int?,
      unreservedConcurrentExecutions:
          json['UnreservedConcurrentExecutions'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final codeSizeUnzipped = this.codeSizeUnzipped;
    final codeSizeZipped = this.codeSizeZipped;
    final concurrentExecutions = this.concurrentExecutions;
    final totalCodeSize = this.totalCodeSize;
    final unreservedConcurrentExecutions = this.unreservedConcurrentExecutions;
    return {
      if (codeSizeUnzipped != null) 'CodeSizeUnzipped': codeSizeUnzipped,
      if (codeSizeZipped != null) 'CodeSizeZipped': codeSizeZipped,
      if (concurrentExecutions != null)
        'ConcurrentExecutions': concurrentExecutions,
      if (totalCodeSize != null) 'TotalCodeSize': totalCodeSize,
      if (unreservedConcurrentExecutions != null)
        'UnreservedConcurrentExecutions': unreservedConcurrentExecutions,
    };
  }
}

/// The number of functions and amount of storage in use.
class AccountUsage {
  /// The number of Lambda functions.
  final int? functionCount;

  /// The amount of storage space, in bytes, that's being used by deployment
  /// packages and layer archives.
  final int? totalCodeSize;

  AccountUsage({
    this.functionCount,
    this.totalCodeSize,
  });

  factory AccountUsage.fromJson(Map<String, dynamic> json) {
    return AccountUsage(
      functionCount: json['FunctionCount'] as int?,
      totalCodeSize: json['TotalCodeSize'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final functionCount = this.functionCount;
    final totalCodeSize = this.totalCodeSize;
    return {
      if (functionCount != null) 'FunctionCount': functionCount,
      if (totalCodeSize != null) 'TotalCodeSize': totalCodeSize,
    };
  }
}

class AddLayerVersionPermissionResponse {
  /// A unique identifier for the current revision of the policy.
  final String? revisionId;

  /// The permission statement.
  final String? statement;

  AddLayerVersionPermissionResponse({
    this.revisionId,
    this.statement,
  });

  factory AddLayerVersionPermissionResponse.fromJson(
      Map<String, dynamic> json) {
    return AddLayerVersionPermissionResponse(
      revisionId: json['RevisionId'] as String?,
      statement: json['Statement'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final revisionId = this.revisionId;
    final statement = this.statement;
    return {
      if (revisionId != null) 'RevisionId': revisionId,
      if (statement != null) 'Statement': statement,
    };
  }
}

class AddPermissionResponse {
  /// The permission statement that's added to the function policy.
  final String? statement;

  AddPermissionResponse({
    this.statement,
  });

  factory AddPermissionResponse.fromJson(Map<String, dynamic> json) {
    return AddPermissionResponse(
      statement: json['Statement'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final statement = this.statement;
    return {
      if (statement != null) 'Statement': statement,
    };
  }
}

/// Provides configuration information about a Lambda function <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">alias</a>.
class AliasConfiguration {
  /// The Amazon Resource Name (ARN) of the alias.
  final String? aliasArn;

  /// A description of the alias.
  final String? description;

  /// The function version that the alias invokes.
  final String? functionVersion;

  /// The name of the alias.
  final String? name;

  /// A unique identifier that changes when you update the alias.
  final String? revisionId;

  /// The <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-traffic-shifting-using-aliases.html">routing
  /// configuration</a> of the alias.
  final AliasRoutingConfiguration? routingConfig;

  AliasConfiguration({
    this.aliasArn,
    this.description,
    this.functionVersion,
    this.name,
    this.revisionId,
    this.routingConfig,
  });

  factory AliasConfiguration.fromJson(Map<String, dynamic> json) {
    return AliasConfiguration(
      aliasArn: json['AliasArn'] as String?,
      description: json['Description'] as String?,
      functionVersion: json['FunctionVersion'] as String?,
      name: json['Name'] as String?,
      revisionId: json['RevisionId'] as String?,
      routingConfig: json['RoutingConfig'] != null
          ? AliasRoutingConfiguration.fromJson(
              json['RoutingConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aliasArn = this.aliasArn;
    final description = this.description;
    final functionVersion = this.functionVersion;
    final name = this.name;
    final revisionId = this.revisionId;
    final routingConfig = this.routingConfig;
    return {
      if (aliasArn != null) 'AliasArn': aliasArn,
      if (description != null) 'Description': description,
      if (functionVersion != null) 'FunctionVersion': functionVersion,
      if (name != null) 'Name': name,
      if (revisionId != null) 'RevisionId': revisionId,
      if (routingConfig != null) 'RoutingConfig': routingConfig,
    };
  }
}

/// The <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-traffic-shifting-using-aliases.html">traffic-shifting</a>
/// configuration of a Lambda function alias.
class AliasRoutingConfiguration {
  /// The second version, and the percentage of traffic that's routed to it.
  final Map<String, double>? additionalVersionWeights;

  AliasRoutingConfiguration({
    this.additionalVersionWeights,
  });

  factory AliasRoutingConfiguration.fromJson(Map<String, dynamic> json) {
    return AliasRoutingConfiguration(
      additionalVersionWeights:
          (json['AdditionalVersionWeights'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as double)),
    );
  }

  Map<String, dynamic> toJson() {
    final additionalVersionWeights = this.additionalVersionWeights;
    return {
      if (additionalVersionWeights != null)
        'AdditionalVersionWeights': additionalVersionWeights,
    };
  }
}

/// List of signing profiles that can sign a code package.
class AllowedPublishers {
  /// The Amazon Resource Name (ARN) for each of the signing profiles. A signing
  /// profile defines a trusted user who can sign a code package.
  final List<String> signingProfileVersionArns;

  AllowedPublishers({
    required this.signingProfileVersionArns,
  });

  factory AllowedPublishers.fromJson(Map<String, dynamic> json) {
    return AllowedPublishers(
      signingProfileVersionArns: (json['SigningProfileVersionArns'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final signingProfileVersionArns = this.signingProfileVersionArns;
    return {
      'SigningProfileVersionArns': signingProfileVersionArns,
    };
  }
}

/// Details about a <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-codesigning.html">Code
/// signing configuration</a>.
class CodeSigningConfig {
  /// List of allowed publishers.
  final AllowedPublishers allowedPublishers;

  /// The Amazon Resource Name (ARN) of the Code signing configuration.
  final String codeSigningConfigArn;

  /// Unique identifer for the Code signing configuration.
  final String codeSigningConfigId;

  /// The code signing policy controls the validation failure action for signature
  /// mismatch or expiry.
  final CodeSigningPolicies codeSigningPolicies;

  /// The date and time that the Code signing configuration was last modified, in
  /// ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
  final String lastModified;

  /// Code signing configuration description.
  final String? description;

  CodeSigningConfig({
    required this.allowedPublishers,
    required this.codeSigningConfigArn,
    required this.codeSigningConfigId,
    required this.codeSigningPolicies,
    required this.lastModified,
    this.description,
  });

  factory CodeSigningConfig.fromJson(Map<String, dynamic> json) {
    return CodeSigningConfig(
      allowedPublishers: AllowedPublishers.fromJson(
          json['AllowedPublishers'] as Map<String, dynamic>),
      codeSigningConfigArn: json['CodeSigningConfigArn'] as String,
      codeSigningConfigId: json['CodeSigningConfigId'] as String,
      codeSigningPolicies: CodeSigningPolicies.fromJson(
          json['CodeSigningPolicies'] as Map<String, dynamic>),
      lastModified: json['LastModified'] as String,
      description: json['Description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowedPublishers = this.allowedPublishers;
    final codeSigningConfigArn = this.codeSigningConfigArn;
    final codeSigningConfigId = this.codeSigningConfigId;
    final codeSigningPolicies = this.codeSigningPolicies;
    final lastModified = this.lastModified;
    final description = this.description;
    return {
      'AllowedPublishers': allowedPublishers,
      'CodeSigningConfigArn': codeSigningConfigArn,
      'CodeSigningConfigId': codeSigningConfigId,
      'CodeSigningPolicies': codeSigningPolicies,
      'LastModified': lastModified,
      if (description != null) 'Description': description,
    };
  }
}

/// Code signing configuration <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-codesigning.html#config-codesigning-policies">policies</a>
/// specify the validation failure action for signature mismatch or expiry.
class CodeSigningPolicies {
  /// Code signing configuration policy for deployment validation failure. If you
  /// set the policy to <code>Enforce</code>, Lambda blocks the deployment request
  /// if signature validation checks fail. If you set the policy to
  /// <code>Warn</code>, Lambda allows the deployment and creates a CloudWatch
  /// log.
  ///
  /// Default value: <code>Warn</code>
  final CodeSigningPolicy? untrustedArtifactOnDeployment;

  CodeSigningPolicies({
    this.untrustedArtifactOnDeployment,
  });

  factory CodeSigningPolicies.fromJson(Map<String, dynamic> json) {
    return CodeSigningPolicies(
      untrustedArtifactOnDeployment:
          (json['UntrustedArtifactOnDeployment'] as String?)
              ?.toCodeSigningPolicy(),
    );
  }

  Map<String, dynamic> toJson() {
    final untrustedArtifactOnDeployment = this.untrustedArtifactOnDeployment;
    return {
      if (untrustedArtifactOnDeployment != null)
        'UntrustedArtifactOnDeployment':
            untrustedArtifactOnDeployment.toValue(),
    };
  }
}

enum CodeSigningPolicy {
  warn,
  enforce,
}

extension on CodeSigningPolicy {
  String toValue() {
    switch (this) {
      case CodeSigningPolicy.warn:
        return 'Warn';
      case CodeSigningPolicy.enforce:
        return 'Enforce';
    }
  }
}

extension on String {
  CodeSigningPolicy toCodeSigningPolicy() {
    switch (this) {
      case 'Warn':
        return CodeSigningPolicy.warn;
      case 'Enforce':
        return CodeSigningPolicy.enforce;
    }
    throw Exception('$this is not known in enum CodeSigningPolicy');
  }
}

class Concurrency {
  /// The number of concurrent executions that are reserved for this function. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html">Managing
  /// Concurrency</a>.
  final int? reservedConcurrentExecutions;

  Concurrency({
    this.reservedConcurrentExecutions,
  });

  factory Concurrency.fromJson(Map<String, dynamic> json) {
    return Concurrency(
      reservedConcurrentExecutions:
          json['ReservedConcurrentExecutions'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final reservedConcurrentExecutions = this.reservedConcurrentExecutions;
    return {
      if (reservedConcurrentExecutions != null)
        'ReservedConcurrentExecutions': reservedConcurrentExecutions,
    };
  }
}

class CreateCodeSigningConfigResponse {
  /// The code signing configuration.
  final CodeSigningConfig codeSigningConfig;

  CreateCodeSigningConfigResponse({
    required this.codeSigningConfig,
  });

  factory CreateCodeSigningConfigResponse.fromJson(Map<String, dynamic> json) {
    return CreateCodeSigningConfigResponse(
      codeSigningConfig: CodeSigningConfig.fromJson(
          json['CodeSigningConfig'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final codeSigningConfig = this.codeSigningConfig;
    return {
      'CodeSigningConfig': codeSigningConfig,
    };
  }
}

/// The <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#dlq">dead-letter
/// queue</a> for failed asynchronous invocations.
class DeadLetterConfig {
  /// The Amazon Resource Name (ARN) of an Amazon SQS queue or Amazon SNS topic.
  final String? targetArn;

  DeadLetterConfig({
    this.targetArn,
  });

  factory DeadLetterConfig.fromJson(Map<String, dynamic> json) {
    return DeadLetterConfig(
      targetArn: json['TargetArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final targetArn = this.targetArn;
    return {
      if (targetArn != null) 'TargetArn': targetArn,
    };
  }
}

class DeleteCodeSigningConfigResponse {
  DeleteCodeSigningConfigResponse();

  factory DeleteCodeSigningConfigResponse.fromJson(Map<String, dynamic> _) {
    return DeleteCodeSigningConfigResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A configuration object that specifies the destination of an event after
/// Lambda processes it.
class DestinationConfig {
  /// The destination configuration for failed invocations.
  final OnFailure? onFailure;

  /// The destination configuration for successful invocations.
  final OnSuccess? onSuccess;

  DestinationConfig({
    this.onFailure,
    this.onSuccess,
  });

  factory DestinationConfig.fromJson(Map<String, dynamic> json) {
    return DestinationConfig(
      onFailure: json['OnFailure'] != null
          ? OnFailure.fromJson(json['OnFailure'] as Map<String, dynamic>)
          : null,
      onSuccess: json['OnSuccess'] != null
          ? OnSuccess.fromJson(json['OnSuccess'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final onFailure = this.onFailure;
    final onSuccess = this.onSuccess;
    return {
      if (onFailure != null) 'OnFailure': onFailure,
      if (onSuccess != null) 'OnSuccess': onSuccess,
    };
  }
}

enum EndPointType {
  kafkaBootstrapServers,
}

extension on EndPointType {
  String toValue() {
    switch (this) {
      case EndPointType.kafkaBootstrapServers:
        return 'KAFKA_BOOTSTRAP_SERVERS';
    }
  }
}

extension on String {
  EndPointType toEndPointType() {
    switch (this) {
      case 'KAFKA_BOOTSTRAP_SERVERS':
        return EndPointType.kafkaBootstrapServers;
    }
    throw Exception('$this is not known in enum EndPointType');
  }
}

/// A function's environment variable settings. You can use environment
/// variables to adjust your function's behavior without updating code. An
/// environment variable is a pair of strings that are stored in a function's
/// version-specific configuration.
class Environment {
  /// Environment variable key-value pairs. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-envvars.html">Using
  /// Lambda environment variables</a>.
  final Map<String, String>? variables;

  Environment({
    this.variables,
  });

  factory Environment.fromJson(Map<String, dynamic> json) {
    return Environment(
      variables: (json['Variables'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final variables = this.variables;
    return {
      if (variables != null) 'Variables': variables,
    };
  }
}

/// Error messages for environment variables that couldn't be applied.
class EnvironmentError {
  /// The error code.
  final String? errorCode;

  /// The error message.
  final String? message;

  EnvironmentError({
    this.errorCode,
    this.message,
  });

  factory EnvironmentError.fromJson(Map<String, dynamic> json) {
    return EnvironmentError(
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final message = this.message;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (message != null) 'Message': message,
    };
  }
}

/// The results of an operation to update or read environment variables. If the
/// operation is successful, the response contains the environment variables. If
/// it failed, the response contains details about the error.
class EnvironmentResponse {
  /// Error messages for environment variables that couldn't be applied.
  final EnvironmentError? error;

  /// Environment variable key-value pairs.
  final Map<String, String>? variables;

  EnvironmentResponse({
    this.error,
    this.variables,
  });

  factory EnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return EnvironmentResponse(
      error: json['Error'] != null
          ? EnvironmentError.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
      variables: (json['Variables'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final variables = this.variables;
    return {
      if (error != null) 'Error': error,
      if (variables != null) 'Variables': variables,
    };
  }
}

/// A mapping between an Amazon Web Services resource and an Lambda function.
/// See <a>CreateEventSourceMapping</a> for details.
class EventSourceMappingConfiguration {
  /// The maximum number of items to retrieve in a single batch.
  final int? batchSize;

  /// (Streams only) If the function returns an error, split the batch in two and
  /// retry. The default value is false.
  final bool? bisectBatchOnFunctionError;

  /// (Streams only) An Amazon SQS queue or Amazon SNS topic destination for
  /// discarded records.
  final DestinationConfig? destinationConfig;

  /// The Amazon Resource Name (ARN) of the event source.
  final String? eventSourceArn;

  /// The ARN of the Lambda function.
  final String? functionArn;

  /// (Streams only) A list of current response type enums applied to the event
  /// source mapping.
  final List<FunctionResponseType>? functionResponseTypes;

  /// The date that the event source mapping was last updated, or its state
  /// changed.
  final DateTime? lastModified;

  /// The result of the last Lambda invocation of your Lambda function.
  final String? lastProcessingResult;

  /// (Streams and SQS standard queues) The maximum amount of time to gather
  /// records before invoking the function, in seconds. The default value is zero.
  final int? maximumBatchingWindowInSeconds;

  /// (Streams only) Discard records older than the specified age. The default
  /// value is -1, which sets the maximum age to infinite. When the value is set
  /// to infinite, Lambda never discards old records.
  final int? maximumRecordAgeInSeconds;

  /// (Streams only) Discard records after the specified number of retries. The
  /// default value is -1, which sets the maximum number of retries to infinite.
  /// When MaximumRetryAttempts is infinite, Lambda retries failed records until
  /// the record expires in the event source.
  final int? maximumRetryAttempts;

  /// (Streams only) The number of batches to process from each shard
  /// concurrently. The default value is 1.
  final int? parallelizationFactor;

  /// (MQ) The name of the Amazon MQ broker destination queue to consume.
  final List<String>? queues;

  /// The Self-Managed Apache Kafka cluster for your event source.
  final SelfManagedEventSource? selfManagedEventSource;

  /// An array of the authentication protocol, or the VPC components to secure
  /// your event source.
  final List<SourceAccessConfiguration>? sourceAccessConfigurations;

  /// The position in a stream from which to start reading. Required for Amazon
  /// Kinesis, Amazon DynamoDB, and Amazon MSK Streams sources.
  /// <code>AT_TIMESTAMP</code> is only supported for Amazon Kinesis streams.
  final EventSourcePosition? startingPosition;

  /// With <code>StartingPosition</code> set to <code>AT_TIMESTAMP</code>, the
  /// time from which to start reading.
  final DateTime? startingPositionTimestamp;

  /// The state of the event source mapping. It can be one of the following:
  /// <code>Creating</code>, <code>Enabling</code>, <code>Enabled</code>,
  /// <code>Disabling</code>, <code>Disabled</code>, <code>Updating</code>, or
  /// <code>Deleting</code>.
  final String? state;

  /// Indicates whether the last change to the event source mapping was made by a
  /// user, or by the Lambda service.
  final String? stateTransitionReason;

  /// The name of the Kafka topic.
  final List<String>? topics;

  /// (Streams only) The duration in seconds of a processing window. The range is
  /// between 1 second up to 900 seconds.
  final int? tumblingWindowInSeconds;

  /// The identifier of the event source mapping.
  final String? uuid;

  EventSourceMappingConfiguration({
    this.batchSize,
    this.bisectBatchOnFunctionError,
    this.destinationConfig,
    this.eventSourceArn,
    this.functionArn,
    this.functionResponseTypes,
    this.lastModified,
    this.lastProcessingResult,
    this.maximumBatchingWindowInSeconds,
    this.maximumRecordAgeInSeconds,
    this.maximumRetryAttempts,
    this.parallelizationFactor,
    this.queues,
    this.selfManagedEventSource,
    this.sourceAccessConfigurations,
    this.startingPosition,
    this.startingPositionTimestamp,
    this.state,
    this.stateTransitionReason,
    this.topics,
    this.tumblingWindowInSeconds,
    this.uuid,
  });

  factory EventSourceMappingConfiguration.fromJson(Map<String, dynamic> json) {
    return EventSourceMappingConfiguration(
      batchSize: json['BatchSize'] as int?,
      bisectBatchOnFunctionError: json['BisectBatchOnFunctionError'] as bool?,
      destinationConfig: json['DestinationConfig'] != null
          ? DestinationConfig.fromJson(
              json['DestinationConfig'] as Map<String, dynamic>)
          : null,
      eventSourceArn: json['EventSourceArn'] as String?,
      functionArn: json['FunctionArn'] as String?,
      functionResponseTypes: (json['FunctionResponseTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toFunctionResponseType())
          .toList(),
      lastModified: timeStampFromJson(json['LastModified']),
      lastProcessingResult: json['LastProcessingResult'] as String?,
      maximumBatchingWindowInSeconds:
          json['MaximumBatchingWindowInSeconds'] as int?,
      maximumRecordAgeInSeconds: json['MaximumRecordAgeInSeconds'] as int?,
      maximumRetryAttempts: json['MaximumRetryAttempts'] as int?,
      parallelizationFactor: json['ParallelizationFactor'] as int?,
      queues: (json['Queues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      selfManagedEventSource: json['SelfManagedEventSource'] != null
          ? SelfManagedEventSource.fromJson(
              json['SelfManagedEventSource'] as Map<String, dynamic>)
          : null,
      sourceAccessConfigurations: (json['SourceAccessConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SourceAccessConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      startingPosition:
          (json['StartingPosition'] as String?)?.toEventSourcePosition(),
      startingPositionTimestamp:
          timeStampFromJson(json['StartingPositionTimestamp']),
      state: json['State'] as String?,
      stateTransitionReason: json['StateTransitionReason'] as String?,
      topics: (json['Topics'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      tumblingWindowInSeconds: json['TumblingWindowInSeconds'] as int?,
      uuid: json['UUID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final batchSize = this.batchSize;
    final bisectBatchOnFunctionError = this.bisectBatchOnFunctionError;
    final destinationConfig = this.destinationConfig;
    final eventSourceArn = this.eventSourceArn;
    final functionArn = this.functionArn;
    final functionResponseTypes = this.functionResponseTypes;
    final lastModified = this.lastModified;
    final lastProcessingResult = this.lastProcessingResult;
    final maximumBatchingWindowInSeconds = this.maximumBatchingWindowInSeconds;
    final maximumRecordAgeInSeconds = this.maximumRecordAgeInSeconds;
    final maximumRetryAttempts = this.maximumRetryAttempts;
    final parallelizationFactor = this.parallelizationFactor;
    final queues = this.queues;
    final selfManagedEventSource = this.selfManagedEventSource;
    final sourceAccessConfigurations = this.sourceAccessConfigurations;
    final startingPosition = this.startingPosition;
    final startingPositionTimestamp = this.startingPositionTimestamp;
    final state = this.state;
    final stateTransitionReason = this.stateTransitionReason;
    final topics = this.topics;
    final tumblingWindowInSeconds = this.tumblingWindowInSeconds;
    final uuid = this.uuid;
    return {
      if (batchSize != null) 'BatchSize': batchSize,
      if (bisectBatchOnFunctionError != null)
        'BisectBatchOnFunctionError': bisectBatchOnFunctionError,
      if (destinationConfig != null) 'DestinationConfig': destinationConfig,
      if (eventSourceArn != null) 'EventSourceArn': eventSourceArn,
      if (functionArn != null) 'FunctionArn': functionArn,
      if (functionResponseTypes != null)
        'FunctionResponseTypes':
            functionResponseTypes.map((e) => e.toValue()).toList(),
      if (lastModified != null)
        'LastModified': unixTimestampToJson(lastModified),
      if (lastProcessingResult != null)
        'LastProcessingResult': lastProcessingResult,
      if (maximumBatchingWindowInSeconds != null)
        'MaximumBatchingWindowInSeconds': maximumBatchingWindowInSeconds,
      if (maximumRecordAgeInSeconds != null)
        'MaximumRecordAgeInSeconds': maximumRecordAgeInSeconds,
      if (maximumRetryAttempts != null)
        'MaximumRetryAttempts': maximumRetryAttempts,
      if (parallelizationFactor != null)
        'ParallelizationFactor': parallelizationFactor,
      if (queues != null) 'Queues': queues,
      if (selfManagedEventSource != null)
        'SelfManagedEventSource': selfManagedEventSource,
      if (sourceAccessConfigurations != null)
        'SourceAccessConfigurations': sourceAccessConfigurations,
      if (startingPosition != null)
        'StartingPosition': startingPosition.toValue(),
      if (startingPositionTimestamp != null)
        'StartingPositionTimestamp':
            unixTimestampToJson(startingPositionTimestamp),
      if (state != null) 'State': state,
      if (stateTransitionReason != null)
        'StateTransitionReason': stateTransitionReason,
      if (topics != null) 'Topics': topics,
      if (tumblingWindowInSeconds != null)
        'TumblingWindowInSeconds': tumblingWindowInSeconds,
      if (uuid != null) 'UUID': uuid,
    };
  }
}

enum EventSourcePosition {
  trimHorizon,
  latest,
  atTimestamp,
}

extension on EventSourcePosition {
  String toValue() {
    switch (this) {
      case EventSourcePosition.trimHorizon:
        return 'TRIM_HORIZON';
      case EventSourcePosition.latest:
        return 'LATEST';
      case EventSourcePosition.atTimestamp:
        return 'AT_TIMESTAMP';
    }
  }
}

extension on String {
  EventSourcePosition toEventSourcePosition() {
    switch (this) {
      case 'TRIM_HORIZON':
        return EventSourcePosition.trimHorizon;
      case 'LATEST':
        return EventSourcePosition.latest;
      case 'AT_TIMESTAMP':
        return EventSourcePosition.atTimestamp;
    }
    throw Exception('$this is not known in enum EventSourcePosition');
  }
}

/// Details about the connection between a Lambda function and an <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-filesystem.html">Amazon
/// EFS file system</a>.
class FileSystemConfig {
  /// The Amazon Resource Name (ARN) of the Amazon EFS access point that provides
  /// access to the file system.
  final String arn;

  /// The path where the function can access the file system, starting with
  /// <code>/mnt/</code>.
  final String localMountPath;

  FileSystemConfig({
    required this.arn,
    required this.localMountPath,
  });

  factory FileSystemConfig.fromJson(Map<String, dynamic> json) {
    return FileSystemConfig(
      arn: json['Arn'] as String,
      localMountPath: json['LocalMountPath'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final localMountPath = this.localMountPath;
    return {
      'Arn': arn,
      'LocalMountPath': localMountPath,
    };
  }
}

/// The code for the Lambda function. You can specify either an object in Amazon
/// S3, upload a .zip file archive deployment package directly, or specify the
/// URI of a container image.
class FunctionCode {
  /// URI of a <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-images.html">container
  /// image</a> in the Amazon ECR registry.
  final String? imageUri;

  /// An Amazon S3 bucket in the same Amazon Web Services Region as your function.
  /// The bucket can be in a different Amazon Web Services account.
  final String? s3Bucket;

  /// The Amazon S3 key of the deployment package.
  final String? s3Key;

  /// For versioned objects, the version of the deployment package object to use.
  final String? s3ObjectVersion;

  /// The base64-encoded contents of the deployment package. Amazon Web Services
  /// SDK and Amazon Web Services CLI clients handle the encoding for you.
  final Uint8List? zipFile;

  FunctionCode({
    this.imageUri,
    this.s3Bucket,
    this.s3Key,
    this.s3ObjectVersion,
    this.zipFile,
  });

  factory FunctionCode.fromJson(Map<String, dynamic> json) {
    return FunctionCode(
      imageUri: json['ImageUri'] as String?,
      s3Bucket: json['S3Bucket'] as String?,
      s3Key: json['S3Key'] as String?,
      s3ObjectVersion: json['S3ObjectVersion'] as String?,
      zipFile: _s.decodeNullableUint8List(json['ZipFile'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    final imageUri = this.imageUri;
    final s3Bucket = this.s3Bucket;
    final s3Key = this.s3Key;
    final s3ObjectVersion = this.s3ObjectVersion;
    final zipFile = this.zipFile;
    return {
      if (imageUri != null) 'ImageUri': imageUri,
      if (s3Bucket != null) 'S3Bucket': s3Bucket,
      if (s3Key != null) 'S3Key': s3Key,
      if (s3ObjectVersion != null) 'S3ObjectVersion': s3ObjectVersion,
      if (zipFile != null) 'ZipFile': base64Encode(zipFile),
    };
  }
}

/// Details about a function's deployment package.
class FunctionCodeLocation {
  /// URI of a container image in the Amazon ECR registry.
  final String? imageUri;

  /// A presigned URL that you can use to download the deployment package.
  final String? location;

  /// The service that's hosting the file.
  final String? repositoryType;

  /// The resolved URI for the image.
  final String? resolvedImageUri;

  FunctionCodeLocation({
    this.imageUri,
    this.location,
    this.repositoryType,
    this.resolvedImageUri,
  });

  factory FunctionCodeLocation.fromJson(Map<String, dynamic> json) {
    return FunctionCodeLocation(
      imageUri: json['ImageUri'] as String?,
      location: json['Location'] as String?,
      repositoryType: json['RepositoryType'] as String?,
      resolvedImageUri: json['ResolvedImageUri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageUri = this.imageUri;
    final location = this.location;
    final repositoryType = this.repositoryType;
    final resolvedImageUri = this.resolvedImageUri;
    return {
      if (imageUri != null) 'ImageUri': imageUri,
      if (location != null) 'Location': location,
      if (repositoryType != null) 'RepositoryType': repositoryType,
      if (resolvedImageUri != null) 'ResolvedImageUri': resolvedImageUri,
    };
  }
}

/// Details about a function's configuration.
class FunctionConfiguration {
  /// The SHA256 hash of the function's deployment package.
  final String? codeSha256;

  /// The size of the function's deployment package, in bytes.
  final int? codeSize;

  /// The function's dead letter queue.
  final DeadLetterConfig? deadLetterConfig;

  /// The function's description.
  final String? description;

  /// The function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-envvars.html">environment
  /// variables</a>.
  final EnvironmentResponse? environment;

  /// Connection settings for an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-filesystem.html">Amazon
  /// EFS file system</a>.
  final List<FileSystemConfig>? fileSystemConfigs;

  /// The function's Amazon Resource Name (ARN).
  final String? functionArn;

  /// The name of the function.
  final String? functionName;

  /// The function that Lambda calls to begin executing your function.
  final String? handler;

  /// The function's image configuration values.
  final ImageConfigResponse? imageConfigResponse;

  /// The KMS key that's used to encrypt the function's environment variables.
  /// This key is only returned if you've configured a customer managed CMK.
  final String? kMSKeyArn;

  /// The date and time that the function was last updated, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final String? lastModified;

  /// The status of the last update that was performed on the function. This is
  /// first set to <code>Successful</code> after function creation completes.
  final LastUpdateStatus? lastUpdateStatus;

  /// The reason for the last update that was performed on the function.
  final String? lastUpdateStatusReason;

  /// The reason code for the last update that was performed on the function.
  final LastUpdateStatusReasonCode? lastUpdateStatusReasonCode;

  /// The function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">
  /// layers</a>.
  final List<Layer>? layers;

  /// For Lambda@Edge functions, the ARN of the master function.
  final String? masterArn;

  /// The amount of memory available to the function at runtime.
  final int? memorySize;

  /// The type of deployment package. Set to <code>Image</code> for container
  /// image and set <code>Zip</code> for .zip file archive.
  final PackageType? packageType;

  /// The latest updated revision of the function or alias.
  final String? revisionId;

  /// The function's execution role.
  final String? role;

  /// The runtime environment for the Lambda function.
  final Runtime? runtime;

  /// The ARN of the signing job.
  final String? signingJobArn;

  /// The ARN of the signing profile version.
  final String? signingProfileVersionArn;

  /// The current state of the function. When the state is <code>Inactive</code>,
  /// you can reactivate the function by invoking it.
  final State? state;

  /// The reason for the function's current state.
  final String? stateReason;

  /// The reason code for the function's current state. When the code is
  /// <code>Creating</code>, you can't invoke or modify the function.
  final StateReasonCode? stateReasonCode;

  /// The amount of time in seconds that Lambda allows a function to run before
  /// stopping it.
  final int? timeout;

  /// The function's X-Ray tracing configuration.
  final TracingConfigResponse? tracingConfig;

  /// The version of the Lambda function.
  final String? version;

  /// The function's networking configuration.
  final VpcConfigResponse? vpcConfig;

  FunctionConfiguration({
    this.codeSha256,
    this.codeSize,
    this.deadLetterConfig,
    this.description,
    this.environment,
    this.fileSystemConfigs,
    this.functionArn,
    this.functionName,
    this.handler,
    this.imageConfigResponse,
    this.kMSKeyArn,
    this.lastModified,
    this.lastUpdateStatus,
    this.lastUpdateStatusReason,
    this.lastUpdateStatusReasonCode,
    this.layers,
    this.masterArn,
    this.memorySize,
    this.packageType,
    this.revisionId,
    this.role,
    this.runtime,
    this.signingJobArn,
    this.signingProfileVersionArn,
    this.state,
    this.stateReason,
    this.stateReasonCode,
    this.timeout,
    this.tracingConfig,
    this.version,
    this.vpcConfig,
  });

  factory FunctionConfiguration.fromJson(Map<String, dynamic> json) {
    return FunctionConfiguration(
      codeSha256: json['CodeSha256'] as String?,
      codeSize: json['CodeSize'] as int?,
      deadLetterConfig: json['DeadLetterConfig'] != null
          ? DeadLetterConfig.fromJson(
              json['DeadLetterConfig'] as Map<String, dynamic>)
          : null,
      description: json['Description'] as String?,
      environment: json['Environment'] != null
          ? EnvironmentResponse.fromJson(
              json['Environment'] as Map<String, dynamic>)
          : null,
      fileSystemConfigs: (json['FileSystemConfigs'] as List?)
          ?.whereNotNull()
          .map((e) => FileSystemConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      functionArn: json['FunctionArn'] as String?,
      functionName: json['FunctionName'] as String?,
      handler: json['Handler'] as String?,
      imageConfigResponse: json['ImageConfigResponse'] != null
          ? ImageConfigResponse.fromJson(
              json['ImageConfigResponse'] as Map<String, dynamic>)
          : null,
      kMSKeyArn: json['KMSKeyArn'] as String?,
      lastModified: json['LastModified'] as String?,
      lastUpdateStatus:
          (json['LastUpdateStatus'] as String?)?.toLastUpdateStatus(),
      lastUpdateStatusReason: json['LastUpdateStatusReason'] as String?,
      lastUpdateStatusReasonCode:
          (json['LastUpdateStatusReasonCode'] as String?)
              ?.toLastUpdateStatusReasonCode(),
      layers: (json['Layers'] as List?)
          ?.whereNotNull()
          .map((e) => Layer.fromJson(e as Map<String, dynamic>))
          .toList(),
      masterArn: json['MasterArn'] as String?,
      memorySize: json['MemorySize'] as int?,
      packageType: (json['PackageType'] as String?)?.toPackageType(),
      revisionId: json['RevisionId'] as String?,
      role: json['Role'] as String?,
      runtime: (json['Runtime'] as String?)?.toRuntime(),
      signingJobArn: json['SigningJobArn'] as String?,
      signingProfileVersionArn: json['SigningProfileVersionArn'] as String?,
      state: (json['State'] as String?)?.toState(),
      stateReason: json['StateReason'] as String?,
      stateReasonCode:
          (json['StateReasonCode'] as String?)?.toStateReasonCode(),
      timeout: json['Timeout'] as int?,
      tracingConfig: json['TracingConfig'] != null
          ? TracingConfigResponse.fromJson(
              json['TracingConfig'] as Map<String, dynamic>)
          : null,
      version: json['Version'] as String?,
      vpcConfig: json['VpcConfig'] != null
          ? VpcConfigResponse.fromJson(
              json['VpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final codeSha256 = this.codeSha256;
    final codeSize = this.codeSize;
    final deadLetterConfig = this.deadLetterConfig;
    final description = this.description;
    final environment = this.environment;
    final fileSystemConfigs = this.fileSystemConfigs;
    final functionArn = this.functionArn;
    final functionName = this.functionName;
    final handler = this.handler;
    final imageConfigResponse = this.imageConfigResponse;
    final kMSKeyArn = this.kMSKeyArn;
    final lastModified = this.lastModified;
    final lastUpdateStatus = this.lastUpdateStatus;
    final lastUpdateStatusReason = this.lastUpdateStatusReason;
    final lastUpdateStatusReasonCode = this.lastUpdateStatusReasonCode;
    final layers = this.layers;
    final masterArn = this.masterArn;
    final memorySize = this.memorySize;
    final packageType = this.packageType;
    final revisionId = this.revisionId;
    final role = this.role;
    final runtime = this.runtime;
    final signingJobArn = this.signingJobArn;
    final signingProfileVersionArn = this.signingProfileVersionArn;
    final state = this.state;
    final stateReason = this.stateReason;
    final stateReasonCode = this.stateReasonCode;
    final timeout = this.timeout;
    final tracingConfig = this.tracingConfig;
    final version = this.version;
    final vpcConfig = this.vpcConfig;
    return {
      if (codeSha256 != null) 'CodeSha256': codeSha256,
      if (codeSize != null) 'CodeSize': codeSize,
      if (deadLetterConfig != null) 'DeadLetterConfig': deadLetterConfig,
      if (description != null) 'Description': description,
      if (environment != null) 'Environment': environment,
      if (fileSystemConfigs != null) 'FileSystemConfigs': fileSystemConfigs,
      if (functionArn != null) 'FunctionArn': functionArn,
      if (functionName != null) 'FunctionName': functionName,
      if (handler != null) 'Handler': handler,
      if (imageConfigResponse != null)
        'ImageConfigResponse': imageConfigResponse,
      if (kMSKeyArn != null) 'KMSKeyArn': kMSKeyArn,
      if (lastModified != null) 'LastModified': lastModified,
      if (lastUpdateStatus != null)
        'LastUpdateStatus': lastUpdateStatus.toValue(),
      if (lastUpdateStatusReason != null)
        'LastUpdateStatusReason': lastUpdateStatusReason,
      if (lastUpdateStatusReasonCode != null)
        'LastUpdateStatusReasonCode': lastUpdateStatusReasonCode.toValue(),
      if (layers != null) 'Layers': layers,
      if (masterArn != null) 'MasterArn': masterArn,
      if (memorySize != null) 'MemorySize': memorySize,
      if (packageType != null) 'PackageType': packageType.toValue(),
      if (revisionId != null) 'RevisionId': revisionId,
      if (role != null) 'Role': role,
      if (runtime != null) 'Runtime': runtime.toValue(),
      if (signingJobArn != null) 'SigningJobArn': signingJobArn,
      if (signingProfileVersionArn != null)
        'SigningProfileVersionArn': signingProfileVersionArn,
      if (state != null) 'State': state.toValue(),
      if (stateReason != null) 'StateReason': stateReason,
      if (stateReasonCode != null) 'StateReasonCode': stateReasonCode.toValue(),
      if (timeout != null) 'Timeout': timeout,
      if (tracingConfig != null) 'TracingConfig': tracingConfig,
      if (version != null) 'Version': version,
      if (vpcConfig != null) 'VpcConfig': vpcConfig,
    };
  }
}

class FunctionEventInvokeConfig {
  /// A destination for events after they have been sent to a function for
  /// processing.
  /// <p class="title"> <b>Destinations</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function</b> - The Amazon Resource Name (ARN) of a Lambda function.
  /// </li>
  /// <li>
  /// <b>Queue</b> - The ARN of an SQS queue.
  /// </li>
  /// <li>
  /// <b>Topic</b> - The ARN of an SNS topic.
  /// </li>
  /// <li>
  /// <b>Event Bus</b> - The ARN of an Amazon EventBridge event bus.
  /// </li>
  /// </ul>
  final DestinationConfig? destinationConfig;

  /// The Amazon Resource Name (ARN) of the function.
  final String? functionArn;

  /// The date and time that the configuration was last updated.
  final DateTime? lastModified;

  /// The maximum age of a request that Lambda sends to a function for processing.
  final int? maximumEventAgeInSeconds;

  /// The maximum number of times to retry when the function returns an error.
  final int? maximumRetryAttempts;

  FunctionEventInvokeConfig({
    this.destinationConfig,
    this.functionArn,
    this.lastModified,
    this.maximumEventAgeInSeconds,
    this.maximumRetryAttempts,
  });

  factory FunctionEventInvokeConfig.fromJson(Map<String, dynamic> json) {
    return FunctionEventInvokeConfig(
      destinationConfig: json['DestinationConfig'] != null
          ? DestinationConfig.fromJson(
              json['DestinationConfig'] as Map<String, dynamic>)
          : null,
      functionArn: json['FunctionArn'] as String?,
      lastModified: timeStampFromJson(json['LastModified']),
      maximumEventAgeInSeconds: json['MaximumEventAgeInSeconds'] as int?,
      maximumRetryAttempts: json['MaximumRetryAttempts'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationConfig = this.destinationConfig;
    final functionArn = this.functionArn;
    final lastModified = this.lastModified;
    final maximumEventAgeInSeconds = this.maximumEventAgeInSeconds;
    final maximumRetryAttempts = this.maximumRetryAttempts;
    return {
      if (destinationConfig != null) 'DestinationConfig': destinationConfig,
      if (functionArn != null) 'FunctionArn': functionArn,
      if (lastModified != null)
        'LastModified': unixTimestampToJson(lastModified),
      if (maximumEventAgeInSeconds != null)
        'MaximumEventAgeInSeconds': maximumEventAgeInSeconds,
      if (maximumRetryAttempts != null)
        'MaximumRetryAttempts': maximumRetryAttempts,
    };
  }
}

enum FunctionResponseType {
  reportBatchItemFailures,
}

extension on FunctionResponseType {
  String toValue() {
    switch (this) {
      case FunctionResponseType.reportBatchItemFailures:
        return 'ReportBatchItemFailures';
    }
  }
}

extension on String {
  FunctionResponseType toFunctionResponseType() {
    switch (this) {
      case 'ReportBatchItemFailures':
        return FunctionResponseType.reportBatchItemFailures;
    }
    throw Exception('$this is not known in enum FunctionResponseType');
  }
}

enum FunctionVersion {
  all,
}

extension on FunctionVersion {
  String toValue() {
    switch (this) {
      case FunctionVersion.all:
        return 'ALL';
    }
  }
}

extension on String {
  FunctionVersion toFunctionVersion() {
    switch (this) {
      case 'ALL':
        return FunctionVersion.all;
    }
    throw Exception('$this is not known in enum FunctionVersion');
  }
}

class GetAccountSettingsResponse {
  /// Limits that are related to concurrency and code storage.
  final AccountLimit? accountLimit;

  /// The number of functions and amount of storage in use.
  final AccountUsage? accountUsage;

  GetAccountSettingsResponse({
    this.accountLimit,
    this.accountUsage,
  });

  factory GetAccountSettingsResponse.fromJson(Map<String, dynamic> json) {
    return GetAccountSettingsResponse(
      accountLimit: json['AccountLimit'] != null
          ? AccountLimit.fromJson(json['AccountLimit'] as Map<String, dynamic>)
          : null,
      accountUsage: json['AccountUsage'] != null
          ? AccountUsage.fromJson(json['AccountUsage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountLimit = this.accountLimit;
    final accountUsage = this.accountUsage;
    return {
      if (accountLimit != null) 'AccountLimit': accountLimit,
      if (accountUsage != null) 'AccountUsage': accountUsage,
    };
  }
}

class GetCodeSigningConfigResponse {
  /// The code signing configuration
  final CodeSigningConfig codeSigningConfig;

  GetCodeSigningConfigResponse({
    required this.codeSigningConfig,
  });

  factory GetCodeSigningConfigResponse.fromJson(Map<String, dynamic> json) {
    return GetCodeSigningConfigResponse(
      codeSigningConfig: CodeSigningConfig.fromJson(
          json['CodeSigningConfig'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final codeSigningConfig = this.codeSigningConfig;
    return {
      'CodeSigningConfig': codeSigningConfig,
    };
  }
}

class GetFunctionCodeSigningConfigResponse {
  /// The The Amazon Resource Name (ARN) of the code signing configuration.
  final String codeSigningConfigArn;

  /// The name of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only the
  /// function name, it is limited to 64 characters in length.
  final String functionName;

  GetFunctionCodeSigningConfigResponse({
    required this.codeSigningConfigArn,
    required this.functionName,
  });

  factory GetFunctionCodeSigningConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return GetFunctionCodeSigningConfigResponse(
      codeSigningConfigArn: json['CodeSigningConfigArn'] as String,
      functionName: json['FunctionName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final codeSigningConfigArn = this.codeSigningConfigArn;
    final functionName = this.functionName;
    return {
      'CodeSigningConfigArn': codeSigningConfigArn,
      'FunctionName': functionName,
    };
  }
}

class GetFunctionConcurrencyResponse {
  /// The number of simultaneous executions that are reserved for the function.
  final int? reservedConcurrentExecutions;

  GetFunctionConcurrencyResponse({
    this.reservedConcurrentExecutions,
  });

  factory GetFunctionConcurrencyResponse.fromJson(Map<String, dynamic> json) {
    return GetFunctionConcurrencyResponse(
      reservedConcurrentExecutions:
          json['ReservedConcurrentExecutions'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final reservedConcurrentExecutions = this.reservedConcurrentExecutions;
    return {
      if (reservedConcurrentExecutions != null)
        'ReservedConcurrentExecutions': reservedConcurrentExecutions,
    };
  }
}

class GetFunctionResponse {
  /// The deployment package of the function or version.
  final FunctionCodeLocation? code;

  /// The function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html">reserved
  /// concurrency</a>.
  final Concurrency? concurrency;

  /// The configuration of the function or version.
  final FunctionConfiguration? configuration;

  /// The function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/tagging.html">tags</a>.
  final Map<String, String>? tags;

  GetFunctionResponse({
    this.code,
    this.concurrency,
    this.configuration,
    this.tags,
  });

  factory GetFunctionResponse.fromJson(Map<String, dynamic> json) {
    return GetFunctionResponse(
      code: json['Code'] != null
          ? FunctionCodeLocation.fromJson(json['Code'] as Map<String, dynamic>)
          : null,
      concurrency: json['Concurrency'] != null
          ? Concurrency.fromJson(json['Concurrency'] as Map<String, dynamic>)
          : null,
      configuration: json['Configuration'] != null
          ? FunctionConfiguration.fromJson(
              json['Configuration'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final concurrency = this.concurrency;
    final configuration = this.configuration;
    final tags = this.tags;
    return {
      if (code != null) 'Code': code,
      if (concurrency != null) 'Concurrency': concurrency,
      if (configuration != null) 'Configuration': configuration,
      if (tags != null) 'Tags': tags,
    };
  }
}

class GetLayerVersionPolicyResponse {
  /// The policy document.
  final String? policy;

  /// A unique identifier for the current revision of the policy.
  final String? revisionId;

  GetLayerVersionPolicyResponse({
    this.policy,
    this.revisionId,
  });

  factory GetLayerVersionPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetLayerVersionPolicyResponse(
      policy: json['Policy'] as String?,
      revisionId: json['RevisionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    final revisionId = this.revisionId;
    return {
      if (policy != null) 'Policy': policy,
      if (revisionId != null) 'RevisionId': revisionId,
    };
  }
}

class GetLayerVersionResponse {
  /// The layer's compatible runtimes.
  final List<Runtime>? compatibleRuntimes;

  /// Details about the layer version.
  final LayerVersionContentOutput? content;

  /// The date that the layer version was created, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final String? createdDate;

  /// The description of the version.
  final String? description;

  /// The ARN of the layer.
  final String? layerArn;

  /// The ARN of the layer version.
  final String? layerVersionArn;

  /// The layer's software license.
  final String? licenseInfo;

  /// The version number.
  final int? version;

  GetLayerVersionResponse({
    this.compatibleRuntimes,
    this.content,
    this.createdDate,
    this.description,
    this.layerArn,
    this.layerVersionArn,
    this.licenseInfo,
    this.version,
  });

  factory GetLayerVersionResponse.fromJson(Map<String, dynamic> json) {
    return GetLayerVersionResponse(
      compatibleRuntimes: (json['CompatibleRuntimes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toRuntime())
          .toList(),
      content: json['Content'] != null
          ? LayerVersionContentOutput.fromJson(
              json['Content'] as Map<String, dynamic>)
          : null,
      createdDate: json['CreatedDate'] as String?,
      description: json['Description'] as String?,
      layerArn: json['LayerArn'] as String?,
      layerVersionArn: json['LayerVersionArn'] as String?,
      licenseInfo: json['LicenseInfo'] as String?,
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final compatibleRuntimes = this.compatibleRuntimes;
    final content = this.content;
    final createdDate = this.createdDate;
    final description = this.description;
    final layerArn = this.layerArn;
    final layerVersionArn = this.layerVersionArn;
    final licenseInfo = this.licenseInfo;
    final version = this.version;
    return {
      if (compatibleRuntimes != null)
        'CompatibleRuntimes':
            compatibleRuntimes.map((e) => e.toValue()).toList(),
      if (content != null) 'Content': content,
      if (createdDate != null) 'CreatedDate': createdDate,
      if (description != null) 'Description': description,
      if (layerArn != null) 'LayerArn': layerArn,
      if (layerVersionArn != null) 'LayerVersionArn': layerVersionArn,
      if (licenseInfo != null) 'LicenseInfo': licenseInfo,
      if (version != null) 'Version': version,
    };
  }
}

class GetPolicyResponse {
  /// The resource-based policy.
  final String? policy;

  /// A unique identifier for the current revision of the policy.
  final String? revisionId;

  GetPolicyResponse({
    this.policy,
    this.revisionId,
  });

  factory GetPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetPolicyResponse(
      policy: json['Policy'] as String?,
      revisionId: json['RevisionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    final revisionId = this.revisionId;
    return {
      if (policy != null) 'Policy': policy,
      if (revisionId != null) 'RevisionId': revisionId,
    };
  }
}

class GetProvisionedConcurrencyConfigResponse {
  /// The amount of provisioned concurrency allocated.
  final int? allocatedProvisionedConcurrentExecutions;

  /// The amount of provisioned concurrency available.
  final int? availableProvisionedConcurrentExecutions;

  /// The date and time that a user last updated the configuration, in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601
  /// format</a>.
  final String? lastModified;

  /// The amount of provisioned concurrency requested.
  final int? requestedProvisionedConcurrentExecutions;

  /// The status of the allocation process.
  final ProvisionedConcurrencyStatusEnum? status;

  /// For failed allocations, the reason that provisioned concurrency could not be
  /// allocated.
  final String? statusReason;

  GetProvisionedConcurrencyConfigResponse({
    this.allocatedProvisionedConcurrentExecutions,
    this.availableProvisionedConcurrentExecutions,
    this.lastModified,
    this.requestedProvisionedConcurrentExecutions,
    this.status,
    this.statusReason,
  });

  factory GetProvisionedConcurrencyConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return GetProvisionedConcurrencyConfigResponse(
      allocatedProvisionedConcurrentExecutions:
          json['AllocatedProvisionedConcurrentExecutions'] as int?,
      availableProvisionedConcurrentExecutions:
          json['AvailableProvisionedConcurrentExecutions'] as int?,
      lastModified: json['LastModified'] as String?,
      requestedProvisionedConcurrentExecutions:
          json['RequestedProvisionedConcurrentExecutions'] as int?,
      status: (json['Status'] as String?)?.toProvisionedConcurrencyStatusEnum(),
      statusReason: json['StatusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedProvisionedConcurrentExecutions =
        this.allocatedProvisionedConcurrentExecutions;
    final availableProvisionedConcurrentExecutions =
        this.availableProvisionedConcurrentExecutions;
    final lastModified = this.lastModified;
    final requestedProvisionedConcurrentExecutions =
        this.requestedProvisionedConcurrentExecutions;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (allocatedProvisionedConcurrentExecutions != null)
        'AllocatedProvisionedConcurrentExecutions':
            allocatedProvisionedConcurrentExecutions,
      if (availableProvisionedConcurrentExecutions != null)
        'AvailableProvisionedConcurrentExecutions':
            availableProvisionedConcurrentExecutions,
      if (lastModified != null) 'LastModified': lastModified,
      if (requestedProvisionedConcurrentExecutions != null)
        'RequestedProvisionedConcurrentExecutions':
            requestedProvisionedConcurrentExecutions,
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

/// Configuration values that override the container image Dockerfile settings.
/// See <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/images-create.html#images-parms">Container
/// settings</a>.
class ImageConfig {
  /// Specifies parameters that you want to pass in with ENTRYPOINT.
  final List<String>? command;

  /// Specifies the entry point to their application, which is typically the
  /// location of the runtime executable.
  final List<String>? entryPoint;

  /// Specifies the working directory.
  final String? workingDirectory;

  ImageConfig({
    this.command,
    this.entryPoint,
    this.workingDirectory,
  });

  factory ImageConfig.fromJson(Map<String, dynamic> json) {
    return ImageConfig(
      command: (json['Command'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      entryPoint: (json['EntryPoint'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      workingDirectory: json['WorkingDirectory'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final command = this.command;
    final entryPoint = this.entryPoint;
    final workingDirectory = this.workingDirectory;
    return {
      if (command != null) 'Command': command,
      if (entryPoint != null) 'EntryPoint': entryPoint,
      if (workingDirectory != null) 'WorkingDirectory': workingDirectory,
    };
  }
}

/// Error response to GetFunctionConfiguration.
class ImageConfigError {
  /// Error code.
  final String? errorCode;

  /// Error message.
  final String? message;

  ImageConfigError({
    this.errorCode,
    this.message,
  });

  factory ImageConfigError.fromJson(Map<String, dynamic> json) {
    return ImageConfigError(
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final message = this.message;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (message != null) 'Message': message,
    };
  }
}

/// Response to GetFunctionConfiguration request.
class ImageConfigResponse {
  /// Error response to GetFunctionConfiguration.
  final ImageConfigError? error;

  /// Configuration values that override the container image Dockerfile.
  final ImageConfig? imageConfig;

  ImageConfigResponse({
    this.error,
    this.imageConfig,
  });

  factory ImageConfigResponse.fromJson(Map<String, dynamic> json) {
    return ImageConfigResponse(
      error: json['Error'] != null
          ? ImageConfigError.fromJson(json['Error'] as Map<String, dynamic>)
          : null,
      imageConfig: json['ImageConfig'] != null
          ? ImageConfig.fromJson(json['ImageConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final imageConfig = this.imageConfig;
    return {
      if (error != null) 'Error': error,
      if (imageConfig != null) 'ImageConfig': imageConfig,
    };
  }
}

class InvocationResponse {
  /// The version of the function that executed. When you invoke a function with
  /// an alias, this indicates which version the alias resolved to.
  final String? executedVersion;

  /// If present, indicates that an error occurred during function execution.
  /// Details about the error are included in the response payload.
  final String? functionError;

  /// The last 4 KB of the execution log, which is base64 encoded.
  final String? logResult;

  /// The response from the function, or an error object.
  final Uint8List? payload;

  /// The HTTP status code is in the 200 range for a successful request. For the
  /// <code>RequestResponse</code> invocation type, this status code is 200. For
  /// the <code>Event</code> invocation type, this status code is 202. For the
  /// <code>DryRun</code> invocation type, the status code is 204.
  final int? statusCode;

  InvocationResponse({
    this.executedVersion,
    this.functionError,
    this.logResult,
    this.payload,
    this.statusCode,
  });

  factory InvocationResponse.fromJson(Map<String, dynamic> json) {
    return InvocationResponse(
      executedVersion: json['X-Amz-Executed-Version'] as String?,
      functionError: json['X-Amz-Function-Error'] as String?,
      logResult: json['X-Amz-Log-Result'] as String?,
      payload: _s.decodeNullableUint8List(json['Payload'] as String?),
      statusCode: json['StatusCode'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final executedVersion = this.executedVersion;
    final functionError = this.functionError;
    final logResult = this.logResult;
    final payload = this.payload;
    final statusCode = this.statusCode;
    return {
      if (payload != null) 'Payload': base64Encode(payload),
    };
  }
}

enum InvocationType {
  event,
  requestResponse,
  dryRun,
}

extension on InvocationType {
  String toValue() {
    switch (this) {
      case InvocationType.event:
        return 'Event';
      case InvocationType.requestResponse:
        return 'RequestResponse';
      case InvocationType.dryRun:
        return 'DryRun';
    }
  }
}

extension on String {
  InvocationType toInvocationType() {
    switch (this) {
      case 'Event':
        return InvocationType.event;
      case 'RequestResponse':
        return InvocationType.requestResponse;
      case 'DryRun':
        return InvocationType.dryRun;
    }
    throw Exception('$this is not known in enum InvocationType');
  }
}

/// A success response (<code>202 Accepted</code>) indicates that the request is
/// queued for invocation.
@deprecated
class InvokeAsyncResponse {
  /// The status code.
  final int? status;

  InvokeAsyncResponse({
    this.status,
  });

  factory InvokeAsyncResponse.fromJson(Map<String, dynamic> json) {
    return InvokeAsyncResponse(
      status: json['Status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {};
  }
}

enum LastUpdateStatus {
  successful,
  failed,
  inProgress,
}

extension on LastUpdateStatus {
  String toValue() {
    switch (this) {
      case LastUpdateStatus.successful:
        return 'Successful';
      case LastUpdateStatus.failed:
        return 'Failed';
      case LastUpdateStatus.inProgress:
        return 'InProgress';
    }
  }
}

extension on String {
  LastUpdateStatus toLastUpdateStatus() {
    switch (this) {
      case 'Successful':
        return LastUpdateStatus.successful;
      case 'Failed':
        return LastUpdateStatus.failed;
      case 'InProgress':
        return LastUpdateStatus.inProgress;
    }
    throw Exception('$this is not known in enum LastUpdateStatus');
  }
}

enum LastUpdateStatusReasonCode {
  eniLimitExceeded,
  insufficientRolePermissions,
  invalidConfiguration,
  internalError,
  subnetOutOfIPAddresses,
  invalidSubnet,
  invalidSecurityGroup,
  imageDeleted,
  imageAccessDenied,
  invalidImage,
}

extension on LastUpdateStatusReasonCode {
  String toValue() {
    switch (this) {
      case LastUpdateStatusReasonCode.eniLimitExceeded:
        return 'EniLimitExceeded';
      case LastUpdateStatusReasonCode.insufficientRolePermissions:
        return 'InsufficientRolePermissions';
      case LastUpdateStatusReasonCode.invalidConfiguration:
        return 'InvalidConfiguration';
      case LastUpdateStatusReasonCode.internalError:
        return 'InternalError';
      case LastUpdateStatusReasonCode.subnetOutOfIPAddresses:
        return 'SubnetOutOfIPAddresses';
      case LastUpdateStatusReasonCode.invalidSubnet:
        return 'InvalidSubnet';
      case LastUpdateStatusReasonCode.invalidSecurityGroup:
        return 'InvalidSecurityGroup';
      case LastUpdateStatusReasonCode.imageDeleted:
        return 'ImageDeleted';
      case LastUpdateStatusReasonCode.imageAccessDenied:
        return 'ImageAccessDenied';
      case LastUpdateStatusReasonCode.invalidImage:
        return 'InvalidImage';
    }
  }
}

extension on String {
  LastUpdateStatusReasonCode toLastUpdateStatusReasonCode() {
    switch (this) {
      case 'EniLimitExceeded':
        return LastUpdateStatusReasonCode.eniLimitExceeded;
      case 'InsufficientRolePermissions':
        return LastUpdateStatusReasonCode.insufficientRolePermissions;
      case 'InvalidConfiguration':
        return LastUpdateStatusReasonCode.invalidConfiguration;
      case 'InternalError':
        return LastUpdateStatusReasonCode.internalError;
      case 'SubnetOutOfIPAddresses':
        return LastUpdateStatusReasonCode.subnetOutOfIPAddresses;
      case 'InvalidSubnet':
        return LastUpdateStatusReasonCode.invalidSubnet;
      case 'InvalidSecurityGroup':
        return LastUpdateStatusReasonCode.invalidSecurityGroup;
      case 'ImageDeleted':
        return LastUpdateStatusReasonCode.imageDeleted;
      case 'ImageAccessDenied':
        return LastUpdateStatusReasonCode.imageAccessDenied;
      case 'InvalidImage':
        return LastUpdateStatusReasonCode.invalidImage;
    }
    throw Exception('$this is not known in enum LastUpdateStatusReasonCode');
  }
}

/// An <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda
/// layer</a>.
class Layer {
  /// The Amazon Resource Name (ARN) of the function layer.
  final String? arn;

  /// The size of the layer archive in bytes.
  final int? codeSize;

  /// The Amazon Resource Name (ARN) of a signing job.
  final String? signingJobArn;

  /// The Amazon Resource Name (ARN) for a signing profile version.
  final String? signingProfileVersionArn;

  Layer({
    this.arn,
    this.codeSize,
    this.signingJobArn,
    this.signingProfileVersionArn,
  });

  factory Layer.fromJson(Map<String, dynamic> json) {
    return Layer(
      arn: json['Arn'] as String?,
      codeSize: json['CodeSize'] as int?,
      signingJobArn: json['SigningJobArn'] as String?,
      signingProfileVersionArn: json['SigningProfileVersionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final codeSize = this.codeSize;
    final signingJobArn = this.signingJobArn;
    final signingProfileVersionArn = this.signingProfileVersionArn;
    return {
      if (arn != null) 'Arn': arn,
      if (codeSize != null) 'CodeSize': codeSize,
      if (signingJobArn != null) 'SigningJobArn': signingJobArn,
      if (signingProfileVersionArn != null)
        'SigningProfileVersionArn': signingProfileVersionArn,
    };
  }
}

/// A ZIP archive that contains the contents of an <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda
/// layer</a>. You can specify either an Amazon S3 location, or upload a layer
/// archive directly.
class LayerVersionContentInput {
  /// The Amazon S3 bucket of the layer archive.
  final String? s3Bucket;

  /// The Amazon S3 key of the layer archive.
  final String? s3Key;

  /// For versioned objects, the version of the layer archive object to use.
  final String? s3ObjectVersion;

  /// The base64-encoded contents of the layer archive. Amazon Web Services SDK
  /// and Amazon Web Services CLI clients handle the encoding for you.
  final Uint8List? zipFile;

  LayerVersionContentInput({
    this.s3Bucket,
    this.s3Key,
    this.s3ObjectVersion,
    this.zipFile,
  });

  factory LayerVersionContentInput.fromJson(Map<String, dynamic> json) {
    return LayerVersionContentInput(
      s3Bucket: json['S3Bucket'] as String?,
      s3Key: json['S3Key'] as String?,
      s3ObjectVersion: json['S3ObjectVersion'] as String?,
      zipFile: _s.decodeNullableUint8List(json['ZipFile'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    final s3Key = this.s3Key;
    final s3ObjectVersion = this.s3ObjectVersion;
    final zipFile = this.zipFile;
    return {
      if (s3Bucket != null) 'S3Bucket': s3Bucket,
      if (s3Key != null) 'S3Key': s3Key,
      if (s3ObjectVersion != null) 'S3ObjectVersion': s3ObjectVersion,
      if (zipFile != null) 'ZipFile': base64Encode(zipFile),
    };
  }
}

/// Details about a version of an <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda
/// layer</a>.
class LayerVersionContentOutput {
  /// The SHA-256 hash of the layer archive.
  final String? codeSha256;

  /// The size of the layer archive in bytes.
  final int? codeSize;

  /// A link to the layer archive in Amazon S3 that is valid for 10 minutes.
  final String? location;

  /// The Amazon Resource Name (ARN) of a signing job.
  final String? signingJobArn;

  /// The Amazon Resource Name (ARN) for a signing profile version.
  final String? signingProfileVersionArn;

  LayerVersionContentOutput({
    this.codeSha256,
    this.codeSize,
    this.location,
    this.signingJobArn,
    this.signingProfileVersionArn,
  });

  factory LayerVersionContentOutput.fromJson(Map<String, dynamic> json) {
    return LayerVersionContentOutput(
      codeSha256: json['CodeSha256'] as String?,
      codeSize: json['CodeSize'] as int?,
      location: json['Location'] as String?,
      signingJobArn: json['SigningJobArn'] as String?,
      signingProfileVersionArn: json['SigningProfileVersionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final codeSha256 = this.codeSha256;
    final codeSize = this.codeSize;
    final location = this.location;
    final signingJobArn = this.signingJobArn;
    final signingProfileVersionArn = this.signingProfileVersionArn;
    return {
      if (codeSha256 != null) 'CodeSha256': codeSha256,
      if (codeSize != null) 'CodeSize': codeSize,
      if (location != null) 'Location': location,
      if (signingJobArn != null) 'SigningJobArn': signingJobArn,
      if (signingProfileVersionArn != null)
        'SigningProfileVersionArn': signingProfileVersionArn,
    };
  }
}

/// Details about a version of an <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda
/// layer</a>.
class LayerVersionsListItem {
  /// The layer's compatible runtimes.
  final List<Runtime>? compatibleRuntimes;

  /// The date that the version was created, in ISO 8601 format. For example,
  /// <code>2018-11-27T15:10:45.123+0000</code>.
  final String? createdDate;

  /// The description of the version.
  final String? description;

  /// The ARN of the layer version.
  final String? layerVersionArn;

  /// The layer's open-source license.
  final String? licenseInfo;

  /// The version number.
  final int? version;

  LayerVersionsListItem({
    this.compatibleRuntimes,
    this.createdDate,
    this.description,
    this.layerVersionArn,
    this.licenseInfo,
    this.version,
  });

  factory LayerVersionsListItem.fromJson(Map<String, dynamic> json) {
    return LayerVersionsListItem(
      compatibleRuntimes: (json['CompatibleRuntimes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toRuntime())
          .toList(),
      createdDate: json['CreatedDate'] as String?,
      description: json['Description'] as String?,
      layerVersionArn: json['LayerVersionArn'] as String?,
      licenseInfo: json['LicenseInfo'] as String?,
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final compatibleRuntimes = this.compatibleRuntimes;
    final createdDate = this.createdDate;
    final description = this.description;
    final layerVersionArn = this.layerVersionArn;
    final licenseInfo = this.licenseInfo;
    final version = this.version;
    return {
      if (compatibleRuntimes != null)
        'CompatibleRuntimes':
            compatibleRuntimes.map((e) => e.toValue()).toList(),
      if (createdDate != null) 'CreatedDate': createdDate,
      if (description != null) 'Description': description,
      if (layerVersionArn != null) 'LayerVersionArn': layerVersionArn,
      if (licenseInfo != null) 'LicenseInfo': licenseInfo,
      if (version != null) 'Version': version,
    };
  }
}

/// Details about an <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">Lambda
/// layer</a>.
class LayersListItem {
  /// The newest version of the layer.
  final LayerVersionsListItem? latestMatchingVersion;

  /// The Amazon Resource Name (ARN) of the function layer.
  final String? layerArn;

  /// The name of the layer.
  final String? layerName;

  LayersListItem({
    this.latestMatchingVersion,
    this.layerArn,
    this.layerName,
  });

  factory LayersListItem.fromJson(Map<String, dynamic> json) {
    return LayersListItem(
      latestMatchingVersion: json['LatestMatchingVersion'] != null
          ? LayerVersionsListItem.fromJson(
              json['LatestMatchingVersion'] as Map<String, dynamic>)
          : null,
      layerArn: json['LayerArn'] as String?,
      layerName: json['LayerName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final latestMatchingVersion = this.latestMatchingVersion;
    final layerArn = this.layerArn;
    final layerName = this.layerName;
    return {
      if (latestMatchingVersion != null)
        'LatestMatchingVersion': latestMatchingVersion,
      if (layerArn != null) 'LayerArn': layerArn,
      if (layerName != null) 'LayerName': layerName,
    };
  }
}

class ListAliasesResponse {
  /// A list of aliases.
  final List<AliasConfiguration>? aliases;

  /// The pagination token that's included if more results are available.
  final String? nextMarker;

  ListAliasesResponse({
    this.aliases,
    this.nextMarker,
  });

  factory ListAliasesResponse.fromJson(Map<String, dynamic> json) {
    return ListAliasesResponse(
      aliases: (json['Aliases'] as List?)
          ?.whereNotNull()
          .map((e) => AliasConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aliases = this.aliases;
    final nextMarker = this.nextMarker;
    return {
      if (aliases != null) 'Aliases': aliases,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

class ListCodeSigningConfigsResponse {
  /// The code signing configurations
  final List<CodeSigningConfig>? codeSigningConfigs;

  /// The pagination token that's included if more results are available.
  final String? nextMarker;

  ListCodeSigningConfigsResponse({
    this.codeSigningConfigs,
    this.nextMarker,
  });

  factory ListCodeSigningConfigsResponse.fromJson(Map<String, dynamic> json) {
    return ListCodeSigningConfigsResponse(
      codeSigningConfigs: (json['CodeSigningConfigs'] as List?)
          ?.whereNotNull()
          .map((e) => CodeSigningConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final codeSigningConfigs = this.codeSigningConfigs;
    final nextMarker = this.nextMarker;
    return {
      if (codeSigningConfigs != null) 'CodeSigningConfigs': codeSigningConfigs,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

class ListEventSourceMappingsResponse {
  /// A list of event source mappings.
  final List<EventSourceMappingConfiguration>? eventSourceMappings;

  /// A pagination token that's returned when the response doesn't contain all
  /// event source mappings.
  final String? nextMarker;

  ListEventSourceMappingsResponse({
    this.eventSourceMappings,
    this.nextMarker,
  });

  factory ListEventSourceMappingsResponse.fromJson(Map<String, dynamic> json) {
    return ListEventSourceMappingsResponse(
      eventSourceMappings: (json['EventSourceMappings'] as List?)
          ?.whereNotNull()
          .map((e) => EventSourceMappingConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventSourceMappings = this.eventSourceMappings;
    final nextMarker = this.nextMarker;
    return {
      if (eventSourceMappings != null)
        'EventSourceMappings': eventSourceMappings,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

class ListFunctionEventInvokeConfigsResponse {
  /// A list of configurations.
  final List<FunctionEventInvokeConfig>? functionEventInvokeConfigs;

  /// The pagination token that's included if more results are available.
  final String? nextMarker;

  ListFunctionEventInvokeConfigsResponse({
    this.functionEventInvokeConfigs,
    this.nextMarker,
  });

  factory ListFunctionEventInvokeConfigsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListFunctionEventInvokeConfigsResponse(
      functionEventInvokeConfigs: (json['FunctionEventInvokeConfigs'] as List?)
          ?.whereNotNull()
          .map((e) =>
              FunctionEventInvokeConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final functionEventInvokeConfigs = this.functionEventInvokeConfigs;
    final nextMarker = this.nextMarker;
    return {
      if (functionEventInvokeConfigs != null)
        'FunctionEventInvokeConfigs': functionEventInvokeConfigs,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

class ListFunctionsByCodeSigningConfigResponse {
  /// The function ARNs.
  final List<String>? functionArns;

  /// The pagination token that's included if more results are available.
  final String? nextMarker;

  ListFunctionsByCodeSigningConfigResponse({
    this.functionArns,
    this.nextMarker,
  });

  factory ListFunctionsByCodeSigningConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return ListFunctionsByCodeSigningConfigResponse(
      functionArns: (json['FunctionArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final functionArns = this.functionArns;
    final nextMarker = this.nextMarker;
    return {
      if (functionArns != null) 'FunctionArns': functionArns,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

/// A list of Lambda functions.
class ListFunctionsResponse {
  /// A list of Lambda functions.
  final List<FunctionConfiguration>? functions;

  /// The pagination token that's included if more results are available.
  final String? nextMarker;

  ListFunctionsResponse({
    this.functions,
    this.nextMarker,
  });

  factory ListFunctionsResponse.fromJson(Map<String, dynamic> json) {
    return ListFunctionsResponse(
      functions: (json['Functions'] as List?)
          ?.whereNotNull()
          .map((e) => FunctionConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final functions = this.functions;
    final nextMarker = this.nextMarker;
    return {
      if (functions != null) 'Functions': functions,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

class ListLayerVersionsResponse {
  /// A list of versions.
  final List<LayerVersionsListItem>? layerVersions;

  /// A pagination token returned when the response doesn't contain all versions.
  final String? nextMarker;

  ListLayerVersionsResponse({
    this.layerVersions,
    this.nextMarker,
  });

  factory ListLayerVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListLayerVersionsResponse(
      layerVersions: (json['LayerVersions'] as List?)
          ?.whereNotNull()
          .map((e) => LayerVersionsListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final layerVersions = this.layerVersions;
    final nextMarker = this.nextMarker;
    return {
      if (layerVersions != null) 'LayerVersions': layerVersions,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

class ListLayersResponse {
  /// A list of function layers.
  final List<LayersListItem>? layers;

  /// A pagination token returned when the response doesn't contain all layers.
  final String? nextMarker;

  ListLayersResponse({
    this.layers,
    this.nextMarker,
  });

  factory ListLayersResponse.fromJson(Map<String, dynamic> json) {
    return ListLayersResponse(
      layers: (json['Layers'] as List?)
          ?.whereNotNull()
          .map((e) => LayersListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextMarker: json['NextMarker'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final layers = this.layers;
    final nextMarker = this.nextMarker;
    return {
      if (layers != null) 'Layers': layers,
      if (nextMarker != null) 'NextMarker': nextMarker,
    };
  }
}

class ListProvisionedConcurrencyConfigsResponse {
  /// The pagination token that's included if more results are available.
  final String? nextMarker;

  /// A list of provisioned concurrency configurations.
  final List<ProvisionedConcurrencyConfigListItem>?
      provisionedConcurrencyConfigs;

  ListProvisionedConcurrencyConfigsResponse({
    this.nextMarker,
    this.provisionedConcurrencyConfigs,
  });

  factory ListProvisionedConcurrencyConfigsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListProvisionedConcurrencyConfigsResponse(
      nextMarker: json['NextMarker'] as String?,
      provisionedConcurrencyConfigs:
          (json['ProvisionedConcurrencyConfigs'] as List?)
              ?.whereNotNull()
              .map((e) => ProvisionedConcurrencyConfigListItem.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextMarker = this.nextMarker;
    final provisionedConcurrencyConfigs = this.provisionedConcurrencyConfigs;
    return {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (provisionedConcurrencyConfigs != null)
        'ProvisionedConcurrencyConfigs': provisionedConcurrencyConfigs,
    };
  }
}

class ListTagsResponse {
  /// The function's tags.
  final Map<String, String>? tags;

  ListTagsResponse({
    this.tags,
  });

  factory ListTagsResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsResponse(
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

class ListVersionsByFunctionResponse {
  /// The pagination token that's included if more results are available.
  final String? nextMarker;

  /// A list of Lambda function versions.
  final List<FunctionConfiguration>? versions;

  ListVersionsByFunctionResponse({
    this.nextMarker,
    this.versions,
  });

  factory ListVersionsByFunctionResponse.fromJson(Map<String, dynamic> json) {
    return ListVersionsByFunctionResponse(
      nextMarker: json['NextMarker'] as String?,
      versions: (json['Versions'] as List?)
          ?.whereNotNull()
          .map((e) => FunctionConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextMarker = this.nextMarker;
    final versions = this.versions;
    return {
      if (nextMarker != null) 'NextMarker': nextMarker,
      if (versions != null) 'Versions': versions,
    };
  }
}

enum LogType {
  none,
  tail,
}

extension on LogType {
  String toValue() {
    switch (this) {
      case LogType.none:
        return 'None';
      case LogType.tail:
        return 'Tail';
    }
  }
}

extension on String {
  LogType toLogType() {
    switch (this) {
      case 'None':
        return LogType.none;
      case 'Tail':
        return LogType.tail;
    }
    throw Exception('$this is not known in enum LogType');
  }
}

/// A destination for events that failed processing.
class OnFailure {
  /// The Amazon Resource Name (ARN) of the destination resource.
  final String? destination;

  OnFailure({
    this.destination,
  });

  factory OnFailure.fromJson(Map<String, dynamic> json) {
    return OnFailure(
      destination: json['Destination'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    return {
      if (destination != null) 'Destination': destination,
    };
  }
}

/// A destination for events that were processed successfully.
class OnSuccess {
  /// The Amazon Resource Name (ARN) of the destination resource.
  final String? destination;

  OnSuccess({
    this.destination,
  });

  factory OnSuccess.fromJson(Map<String, dynamic> json) {
    return OnSuccess(
      destination: json['Destination'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    return {
      if (destination != null) 'Destination': destination,
    };
  }
}

enum PackageType {
  zip,
  image,
}

extension on PackageType {
  String toValue() {
    switch (this) {
      case PackageType.zip:
        return 'Zip';
      case PackageType.image:
        return 'Image';
    }
  }
}

extension on String {
  PackageType toPackageType() {
    switch (this) {
      case 'Zip':
        return PackageType.zip;
      case 'Image':
        return PackageType.image;
    }
    throw Exception('$this is not known in enum PackageType');
  }
}

/// Details about the provisioned concurrency configuration for a function alias
/// or version.
class ProvisionedConcurrencyConfigListItem {
  /// The amount of provisioned concurrency allocated.
  final int? allocatedProvisionedConcurrentExecutions;

  /// The amount of provisioned concurrency available.
  final int? availableProvisionedConcurrentExecutions;

  /// The Amazon Resource Name (ARN) of the alias or version.
  final String? functionArn;

  /// The date and time that a user last updated the configuration, in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601
  /// format</a>.
  final String? lastModified;

  /// The amount of provisioned concurrency requested.
  final int? requestedProvisionedConcurrentExecutions;

  /// The status of the allocation process.
  final ProvisionedConcurrencyStatusEnum? status;

  /// For failed allocations, the reason that provisioned concurrency could not be
  /// allocated.
  final String? statusReason;

  ProvisionedConcurrencyConfigListItem({
    this.allocatedProvisionedConcurrentExecutions,
    this.availableProvisionedConcurrentExecutions,
    this.functionArn,
    this.lastModified,
    this.requestedProvisionedConcurrentExecutions,
    this.status,
    this.statusReason,
  });

  factory ProvisionedConcurrencyConfigListItem.fromJson(
      Map<String, dynamic> json) {
    return ProvisionedConcurrencyConfigListItem(
      allocatedProvisionedConcurrentExecutions:
          json['AllocatedProvisionedConcurrentExecutions'] as int?,
      availableProvisionedConcurrentExecutions:
          json['AvailableProvisionedConcurrentExecutions'] as int?,
      functionArn: json['FunctionArn'] as String?,
      lastModified: json['LastModified'] as String?,
      requestedProvisionedConcurrentExecutions:
          json['RequestedProvisionedConcurrentExecutions'] as int?,
      status: (json['Status'] as String?)?.toProvisionedConcurrencyStatusEnum(),
      statusReason: json['StatusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedProvisionedConcurrentExecutions =
        this.allocatedProvisionedConcurrentExecutions;
    final availableProvisionedConcurrentExecutions =
        this.availableProvisionedConcurrentExecutions;
    final functionArn = this.functionArn;
    final lastModified = this.lastModified;
    final requestedProvisionedConcurrentExecutions =
        this.requestedProvisionedConcurrentExecutions;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (allocatedProvisionedConcurrentExecutions != null)
        'AllocatedProvisionedConcurrentExecutions':
            allocatedProvisionedConcurrentExecutions,
      if (availableProvisionedConcurrentExecutions != null)
        'AvailableProvisionedConcurrentExecutions':
            availableProvisionedConcurrentExecutions,
      if (functionArn != null) 'FunctionArn': functionArn,
      if (lastModified != null) 'LastModified': lastModified,
      if (requestedProvisionedConcurrentExecutions != null)
        'RequestedProvisionedConcurrentExecutions':
            requestedProvisionedConcurrentExecutions,
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

enum ProvisionedConcurrencyStatusEnum {
  inProgress,
  ready,
  failed,
}

extension on ProvisionedConcurrencyStatusEnum {
  String toValue() {
    switch (this) {
      case ProvisionedConcurrencyStatusEnum.inProgress:
        return 'IN_PROGRESS';
      case ProvisionedConcurrencyStatusEnum.ready:
        return 'READY';
      case ProvisionedConcurrencyStatusEnum.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  ProvisionedConcurrencyStatusEnum toProvisionedConcurrencyStatusEnum() {
    switch (this) {
      case 'IN_PROGRESS':
        return ProvisionedConcurrencyStatusEnum.inProgress;
      case 'READY':
        return ProvisionedConcurrencyStatusEnum.ready;
      case 'FAILED':
        return ProvisionedConcurrencyStatusEnum.failed;
    }
    throw Exception(
        '$this is not known in enum ProvisionedConcurrencyStatusEnum');
  }
}

class PublishLayerVersionResponse {
  /// The layer's compatible runtimes.
  final List<Runtime>? compatibleRuntimes;

  /// Details about the layer version.
  final LayerVersionContentOutput? content;

  /// The date that the layer version was created, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  final String? createdDate;

  /// The description of the version.
  final String? description;

  /// The ARN of the layer.
  final String? layerArn;

  /// The ARN of the layer version.
  final String? layerVersionArn;

  /// The layer's software license.
  final String? licenseInfo;

  /// The version number.
  final int? version;

  PublishLayerVersionResponse({
    this.compatibleRuntimes,
    this.content,
    this.createdDate,
    this.description,
    this.layerArn,
    this.layerVersionArn,
    this.licenseInfo,
    this.version,
  });

  factory PublishLayerVersionResponse.fromJson(Map<String, dynamic> json) {
    return PublishLayerVersionResponse(
      compatibleRuntimes: (json['CompatibleRuntimes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toRuntime())
          .toList(),
      content: json['Content'] != null
          ? LayerVersionContentOutput.fromJson(
              json['Content'] as Map<String, dynamic>)
          : null,
      createdDate: json['CreatedDate'] as String?,
      description: json['Description'] as String?,
      layerArn: json['LayerArn'] as String?,
      layerVersionArn: json['LayerVersionArn'] as String?,
      licenseInfo: json['LicenseInfo'] as String?,
      version: json['Version'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final compatibleRuntimes = this.compatibleRuntimes;
    final content = this.content;
    final createdDate = this.createdDate;
    final description = this.description;
    final layerArn = this.layerArn;
    final layerVersionArn = this.layerVersionArn;
    final licenseInfo = this.licenseInfo;
    final version = this.version;
    return {
      if (compatibleRuntimes != null)
        'CompatibleRuntimes':
            compatibleRuntimes.map((e) => e.toValue()).toList(),
      if (content != null) 'Content': content,
      if (createdDate != null) 'CreatedDate': createdDate,
      if (description != null) 'Description': description,
      if (layerArn != null) 'LayerArn': layerArn,
      if (layerVersionArn != null) 'LayerVersionArn': layerVersionArn,
      if (licenseInfo != null) 'LicenseInfo': licenseInfo,
      if (version != null) 'Version': version,
    };
  }
}

class PutFunctionCodeSigningConfigResponse {
  /// The The Amazon Resource Name (ARN) of the code signing configuration.
  final String codeSigningConfigArn;

  /// The name of the Lambda function.
  /// <p class="title"> <b>Name formats</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Function name</b> - <code>MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Function ARN</b> -
  /// <code>arn:aws:lambda:us-west-2:123456789012:function:MyFunction</code>.
  /// </li>
  /// <li>
  /// <b>Partial ARN</b> - <code>123456789012:function:MyFunction</code>.
  /// </li>
  /// </ul>
  /// The length constraint applies only to the full ARN. If you specify only the
  /// function name, it is limited to 64 characters in length.
  final String functionName;

  PutFunctionCodeSigningConfigResponse({
    required this.codeSigningConfigArn,
    required this.functionName,
  });

  factory PutFunctionCodeSigningConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return PutFunctionCodeSigningConfigResponse(
      codeSigningConfigArn: json['CodeSigningConfigArn'] as String,
      functionName: json['FunctionName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final codeSigningConfigArn = this.codeSigningConfigArn;
    final functionName = this.functionName;
    return {
      'CodeSigningConfigArn': codeSigningConfigArn,
      'FunctionName': functionName,
    };
  }
}

class PutProvisionedConcurrencyConfigResponse {
  /// The amount of provisioned concurrency allocated.
  final int? allocatedProvisionedConcurrentExecutions;

  /// The amount of provisioned concurrency available.
  final int? availableProvisionedConcurrentExecutions;

  /// The date and time that a user last updated the configuration, in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601
  /// format</a>.
  final String? lastModified;

  /// The amount of provisioned concurrency requested.
  final int? requestedProvisionedConcurrentExecutions;

  /// The status of the allocation process.
  final ProvisionedConcurrencyStatusEnum? status;

  /// For failed allocations, the reason that provisioned concurrency could not be
  /// allocated.
  final String? statusReason;

  PutProvisionedConcurrencyConfigResponse({
    this.allocatedProvisionedConcurrentExecutions,
    this.availableProvisionedConcurrentExecutions,
    this.lastModified,
    this.requestedProvisionedConcurrentExecutions,
    this.status,
    this.statusReason,
  });

  factory PutProvisionedConcurrencyConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return PutProvisionedConcurrencyConfigResponse(
      allocatedProvisionedConcurrentExecutions:
          json['AllocatedProvisionedConcurrentExecutions'] as int?,
      availableProvisionedConcurrentExecutions:
          json['AvailableProvisionedConcurrentExecutions'] as int?,
      lastModified: json['LastModified'] as String?,
      requestedProvisionedConcurrentExecutions:
          json['RequestedProvisionedConcurrentExecutions'] as int?,
      status: (json['Status'] as String?)?.toProvisionedConcurrencyStatusEnum(),
      statusReason: json['StatusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedProvisionedConcurrentExecutions =
        this.allocatedProvisionedConcurrentExecutions;
    final availableProvisionedConcurrentExecutions =
        this.availableProvisionedConcurrentExecutions;
    final lastModified = this.lastModified;
    final requestedProvisionedConcurrentExecutions =
        this.requestedProvisionedConcurrentExecutions;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (allocatedProvisionedConcurrentExecutions != null)
        'AllocatedProvisionedConcurrentExecutions':
            allocatedProvisionedConcurrentExecutions,
      if (availableProvisionedConcurrentExecutions != null)
        'AvailableProvisionedConcurrentExecutions':
            availableProvisionedConcurrentExecutions,
      if (lastModified != null) 'LastModified': lastModified,
      if (requestedProvisionedConcurrentExecutions != null)
        'RequestedProvisionedConcurrentExecutions':
            requestedProvisionedConcurrentExecutions,
      if (status != null) 'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason,
    };
  }
}

enum Runtime {
  nodejs,
  nodejs4_3,
  nodejs6_10,
  nodejs8_10,
  nodejs10X,
  nodejs12X,
  nodejs14X,
  java8,
  java8Al2,
  java11,
  python2_7,
  python3_6,
  python3_7,
  python3_8,
  dotnetcore1_0,
  dotnetcore2_0,
  dotnetcore2_1,
  dotnetcore3_1,
  nodejs4_3Edge,
  go1X,
  ruby2_5,
  ruby2_7,
  provided,
  providedAl2,
}

extension on Runtime {
  String toValue() {
    switch (this) {
      case Runtime.nodejs:
        return 'nodejs';
      case Runtime.nodejs4_3:
        return 'nodejs4.3';
      case Runtime.nodejs6_10:
        return 'nodejs6.10';
      case Runtime.nodejs8_10:
        return 'nodejs8.10';
      case Runtime.nodejs10X:
        return 'nodejs10.x';
      case Runtime.nodejs12X:
        return 'nodejs12.x';
      case Runtime.nodejs14X:
        return 'nodejs14.x';
      case Runtime.java8:
        return 'java8';
      case Runtime.java8Al2:
        return 'java8.al2';
      case Runtime.java11:
        return 'java11';
      case Runtime.python2_7:
        return 'python2.7';
      case Runtime.python3_6:
        return 'python3.6';
      case Runtime.python3_7:
        return 'python3.7';
      case Runtime.python3_8:
        return 'python3.8';
      case Runtime.dotnetcore1_0:
        return 'dotnetcore1.0';
      case Runtime.dotnetcore2_0:
        return 'dotnetcore2.0';
      case Runtime.dotnetcore2_1:
        return 'dotnetcore2.1';
      case Runtime.dotnetcore3_1:
        return 'dotnetcore3.1';
      case Runtime.nodejs4_3Edge:
        return 'nodejs4.3-edge';
      case Runtime.go1X:
        return 'go1.x';
      case Runtime.ruby2_5:
        return 'ruby2.5';
      case Runtime.ruby2_7:
        return 'ruby2.7';
      case Runtime.provided:
        return 'provided';
      case Runtime.providedAl2:
        return 'provided.al2';
    }
  }
}

extension on String {
  Runtime toRuntime() {
    switch (this) {
      case 'nodejs':
        return Runtime.nodejs;
      case 'nodejs4.3':
        return Runtime.nodejs4_3;
      case 'nodejs6.10':
        return Runtime.nodejs6_10;
      case 'nodejs8.10':
        return Runtime.nodejs8_10;
      case 'nodejs10.x':
        return Runtime.nodejs10X;
      case 'nodejs12.x':
        return Runtime.nodejs12X;
      case 'nodejs14.x':
        return Runtime.nodejs14X;
      case 'java8':
        return Runtime.java8;
      case 'java8.al2':
        return Runtime.java8Al2;
      case 'java11':
        return Runtime.java11;
      case 'python2.7':
        return Runtime.python2_7;
      case 'python3.6':
        return Runtime.python3_6;
      case 'python3.7':
        return Runtime.python3_7;
      case 'python3.8':
        return Runtime.python3_8;
      case 'dotnetcore1.0':
        return Runtime.dotnetcore1_0;
      case 'dotnetcore2.0':
        return Runtime.dotnetcore2_0;
      case 'dotnetcore2.1':
        return Runtime.dotnetcore2_1;
      case 'dotnetcore3.1':
        return Runtime.dotnetcore3_1;
      case 'nodejs4.3-edge':
        return Runtime.nodejs4_3Edge;
      case 'go1.x':
        return Runtime.go1X;
      case 'ruby2.5':
        return Runtime.ruby2_5;
      case 'ruby2.7':
        return Runtime.ruby2_7;
      case 'provided':
        return Runtime.provided;
      case 'provided.al2':
        return Runtime.providedAl2;
    }
    throw Exception('$this is not known in enum Runtime');
  }
}

/// The Self-Managed Apache Kafka cluster for your event source.
class SelfManagedEventSource {
  /// The list of bootstrap servers for your Kafka brokers in the following
  /// format: <code>"KAFKA_BOOTSTRAP_SERVERS":
  /// ["abc.xyz.com:xxxx","abc2.xyz.com:xxxx"]</code>.
  final Map<EndPointType, List<String>>? endpoints;

  SelfManagedEventSource({
    this.endpoints,
  });

  factory SelfManagedEventSource.fromJson(Map<String, dynamic> json) {
    return SelfManagedEventSource(
      endpoints: (json['Endpoints'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k.toEndPointType(),
              (e as List).whereNotNull().map((e) => e as String).toList())),
    );
  }

  Map<String, dynamic> toJson() {
    final endpoints = this.endpoints;
    return {
      if (endpoints != null)
        'Endpoints': endpoints.map((k, e) => MapEntry(k.toValue(), e)),
    };
  }
}

/// You can specify the authentication protocol, or the VPC components to secure
/// access to your event source.
class SourceAccessConfiguration {
  /// The type of authentication protocol or the VPC components for your event
  /// source. For example: <code>"Type":"SASL_SCRAM_512_AUTH"</code>.
  ///
  /// <ul>
  /// <li>
  /// <code>BASIC_AUTH</code> - (MQ) The Secrets Manager secret that stores your
  /// broker credentials.
  /// </li>
  /// <li>
  /// <code>VPC_SUBNET</code> - The subnets associated with your VPC. Lambda
  /// connects to these subnets to fetch data from your Self-Managed Apache Kafka
  /// cluster.
  /// </li>
  /// <li>
  /// <code>VPC_SECURITY_GROUP</code> - The VPC security group used to manage
  /// access to your Self-Managed Apache Kafka brokers.
  /// </li>
  /// <li>
  /// <code>SASL_SCRAM_256_AUTH</code> - The Secrets Manager ARN of your secret
  /// key used for SASL SCRAM-256 authentication of your Self-Managed Apache Kafka
  /// brokers.
  /// </li>
  /// <li>
  /// <code>SASL_SCRAM_512_AUTH</code> - The Secrets Manager ARN of your secret
  /// key used for SASL SCRAM-512 authentication of your Self-Managed Apache Kafka
  /// brokers.
  /// </li>
  /// <li>
  /// <code>VIRTUAL_HOST</code> - The name of the virtual host in your RabbitMQ
  /// broker. Lambda will use this host as the event source.
  /// </li>
  /// </ul>
  final SourceAccessType? type;

  /// The value for your chosen configuration in <code>Type</code>. For example:
  /// <code>"URI":
  /// "arn:aws:secretsmanager:us-east-1:01234567890:secret:MyBrokerSecretName"</code>.
  final String? uri;

  SourceAccessConfiguration({
    this.type,
    this.uri,
  });

  factory SourceAccessConfiguration.fromJson(Map<String, dynamic> json) {
    return SourceAccessConfiguration(
      type: (json['Type'] as String?)?.toSourceAccessType(),
      uri: json['URI'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final uri = this.uri;
    return {
      if (type != null) 'Type': type.toValue(),
      if (uri != null) 'URI': uri,
    };
  }
}

enum SourceAccessType {
  basicAuth,
  vpcSubnet,
  vpcSecurityGroup,
  saslScram_512Auth,
  saslScram_256Auth,
  virtualHost,
}

extension on SourceAccessType {
  String toValue() {
    switch (this) {
      case SourceAccessType.basicAuth:
        return 'BASIC_AUTH';
      case SourceAccessType.vpcSubnet:
        return 'VPC_SUBNET';
      case SourceAccessType.vpcSecurityGroup:
        return 'VPC_SECURITY_GROUP';
      case SourceAccessType.saslScram_512Auth:
        return 'SASL_SCRAM_512_AUTH';
      case SourceAccessType.saslScram_256Auth:
        return 'SASL_SCRAM_256_AUTH';
      case SourceAccessType.virtualHost:
        return 'VIRTUAL_HOST';
    }
  }
}

extension on String {
  SourceAccessType toSourceAccessType() {
    switch (this) {
      case 'BASIC_AUTH':
        return SourceAccessType.basicAuth;
      case 'VPC_SUBNET':
        return SourceAccessType.vpcSubnet;
      case 'VPC_SECURITY_GROUP':
        return SourceAccessType.vpcSecurityGroup;
      case 'SASL_SCRAM_512_AUTH':
        return SourceAccessType.saslScram_512Auth;
      case 'SASL_SCRAM_256_AUTH':
        return SourceAccessType.saslScram_256Auth;
      case 'VIRTUAL_HOST':
        return SourceAccessType.virtualHost;
    }
    throw Exception('$this is not known in enum SourceAccessType');
  }
}

enum State {
  pending,
  active,
  inactive,
  failed,
}

extension on State {
  String toValue() {
    switch (this) {
      case State.pending:
        return 'Pending';
      case State.active:
        return 'Active';
      case State.inactive:
        return 'Inactive';
      case State.failed:
        return 'Failed';
    }
  }
}

extension on String {
  State toState() {
    switch (this) {
      case 'Pending':
        return State.pending;
      case 'Active':
        return State.active;
      case 'Inactive':
        return State.inactive;
      case 'Failed':
        return State.failed;
    }
    throw Exception('$this is not known in enum State');
  }
}

enum StateReasonCode {
  idle,
  creating,
  restoring,
  eniLimitExceeded,
  insufficientRolePermissions,
  invalidConfiguration,
  internalError,
  subnetOutOfIPAddresses,
  invalidSubnet,
  invalidSecurityGroup,
  imageDeleted,
  imageAccessDenied,
  invalidImage,
}

extension on StateReasonCode {
  String toValue() {
    switch (this) {
      case StateReasonCode.idle:
        return 'Idle';
      case StateReasonCode.creating:
        return 'Creating';
      case StateReasonCode.restoring:
        return 'Restoring';
      case StateReasonCode.eniLimitExceeded:
        return 'EniLimitExceeded';
      case StateReasonCode.insufficientRolePermissions:
        return 'InsufficientRolePermissions';
      case StateReasonCode.invalidConfiguration:
        return 'InvalidConfiguration';
      case StateReasonCode.internalError:
        return 'InternalError';
      case StateReasonCode.subnetOutOfIPAddresses:
        return 'SubnetOutOfIPAddresses';
      case StateReasonCode.invalidSubnet:
        return 'InvalidSubnet';
      case StateReasonCode.invalidSecurityGroup:
        return 'InvalidSecurityGroup';
      case StateReasonCode.imageDeleted:
        return 'ImageDeleted';
      case StateReasonCode.imageAccessDenied:
        return 'ImageAccessDenied';
      case StateReasonCode.invalidImage:
        return 'InvalidImage';
    }
  }
}

extension on String {
  StateReasonCode toStateReasonCode() {
    switch (this) {
      case 'Idle':
        return StateReasonCode.idle;
      case 'Creating':
        return StateReasonCode.creating;
      case 'Restoring':
        return StateReasonCode.restoring;
      case 'EniLimitExceeded':
        return StateReasonCode.eniLimitExceeded;
      case 'InsufficientRolePermissions':
        return StateReasonCode.insufficientRolePermissions;
      case 'InvalidConfiguration':
        return StateReasonCode.invalidConfiguration;
      case 'InternalError':
        return StateReasonCode.internalError;
      case 'SubnetOutOfIPAddresses':
        return StateReasonCode.subnetOutOfIPAddresses;
      case 'InvalidSubnet':
        return StateReasonCode.invalidSubnet;
      case 'InvalidSecurityGroup':
        return StateReasonCode.invalidSecurityGroup;
      case 'ImageDeleted':
        return StateReasonCode.imageDeleted;
      case 'ImageAccessDenied':
        return StateReasonCode.imageAccessDenied;
      case 'InvalidImage':
        return StateReasonCode.invalidImage;
    }
    throw Exception('$this is not known in enum StateReasonCode');
  }
}

/// The function's <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/services-xray.html">X-Ray</a>
/// tracing configuration. To sample and record incoming requests, set
/// <code>Mode</code> to <code>Active</code>.
class TracingConfig {
  /// The tracing mode.
  final TracingMode? mode;

  TracingConfig({
    this.mode,
  });

  factory TracingConfig.fromJson(Map<String, dynamic> json) {
    return TracingConfig(
      mode: (json['Mode'] as String?)?.toTracingMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    return {
      if (mode != null) 'Mode': mode.toValue(),
    };
  }
}

/// The function's X-Ray tracing configuration.
class TracingConfigResponse {
  /// The tracing mode.
  final TracingMode? mode;

  TracingConfigResponse({
    this.mode,
  });

  factory TracingConfigResponse.fromJson(Map<String, dynamic> json) {
    return TracingConfigResponse(
      mode: (json['Mode'] as String?)?.toTracingMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    return {
      if (mode != null) 'Mode': mode.toValue(),
    };
  }
}

enum TracingMode {
  active,
  passThrough,
}

extension on TracingMode {
  String toValue() {
    switch (this) {
      case TracingMode.active:
        return 'Active';
      case TracingMode.passThrough:
        return 'PassThrough';
    }
  }
}

extension on String {
  TracingMode toTracingMode() {
    switch (this) {
      case 'Active':
        return TracingMode.active;
      case 'PassThrough':
        return TracingMode.passThrough;
    }
    throw Exception('$this is not known in enum TracingMode');
  }
}

class UpdateCodeSigningConfigResponse {
  /// The code signing configuration
  final CodeSigningConfig codeSigningConfig;

  UpdateCodeSigningConfigResponse({
    required this.codeSigningConfig,
  });

  factory UpdateCodeSigningConfigResponse.fromJson(Map<String, dynamic> json) {
    return UpdateCodeSigningConfigResponse(
      codeSigningConfig: CodeSigningConfig.fromJson(
          json['CodeSigningConfig'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final codeSigningConfig = this.codeSigningConfig;
    return {
      'CodeSigningConfig': codeSigningConfig,
    };
  }
}

/// The VPC security groups and subnets that are attached to a Lambda function.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-vpc.html">VPC
/// Settings</a>.
class VpcConfig {
  /// A list of VPC security groups IDs.
  final List<String>? securityGroupIds;

  /// A list of VPC subnet IDs.
  final List<String>? subnetIds;

  VpcConfig({
    this.securityGroupIds,
    this.subnetIds,
  });

  factory VpcConfig.fromJson(Map<String, dynamic> json) {
    return VpcConfig(
      securityGroupIds: (json['SecurityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['SubnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    return {
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (subnetIds != null) 'SubnetIds': subnetIds,
    };
  }
}

/// The VPC security groups and subnets that are attached to a Lambda function.
class VpcConfigResponse {
  /// A list of VPC security groups IDs.
  final List<String>? securityGroupIds;

  /// A list of VPC subnet IDs.
  final List<String>? subnetIds;

  /// The ID of the VPC.
  final String? vpcId;

  VpcConfigResponse({
    this.securityGroupIds,
    this.subnetIds,
    this.vpcId,
  });

  factory VpcConfigResponse.fromJson(Map<String, dynamic> json) {
    return VpcConfigResponse(
      securityGroupIds: (json['SecurityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['SubnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcId: json['VpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    return {
      if (securityGroupIds != null) 'SecurityGroupIds': securityGroupIds,
      if (subnetIds != null) 'SubnetIds': subnetIds,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

class CodeSigningConfigNotFoundException extends _s.GenericAwsException {
  CodeSigningConfigNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'CodeSigningConfigNotFoundException',
            message: message);
}

class CodeStorageExceededException extends _s.GenericAwsException {
  CodeStorageExceededException({String? type, String? message})
      : super(
            type: type, code: 'CodeStorageExceededException', message: message);
}

class CodeVerificationFailedException extends _s.GenericAwsException {
  CodeVerificationFailedException({String? type, String? message})
      : super(
            type: type,
            code: 'CodeVerificationFailedException',
            message: message);
}

class EC2AccessDeniedException extends _s.GenericAwsException {
  EC2AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'EC2AccessDeniedException', message: message);
}

class EC2ThrottledException extends _s.GenericAwsException {
  EC2ThrottledException({String? type, String? message})
      : super(type: type, code: 'EC2ThrottledException', message: message);
}

class EC2UnexpectedException extends _s.GenericAwsException {
  EC2UnexpectedException({String? type, String? message})
      : super(type: type, code: 'EC2UnexpectedException', message: message);
}

class EFSIOException extends _s.GenericAwsException {
  EFSIOException({String? type, String? message})
      : super(type: type, code: 'EFSIOException', message: message);
}

class EFSMountConnectivityException extends _s.GenericAwsException {
  EFSMountConnectivityException({String? type, String? message})
      : super(
            type: type,
            code: 'EFSMountConnectivityException',
            message: message);
}

class EFSMountFailureException extends _s.GenericAwsException {
  EFSMountFailureException({String? type, String? message})
      : super(type: type, code: 'EFSMountFailureException', message: message);
}

class EFSMountTimeoutException extends _s.GenericAwsException {
  EFSMountTimeoutException({String? type, String? message})
      : super(type: type, code: 'EFSMountTimeoutException', message: message);
}

class ENILimitReachedException extends _s.GenericAwsException {
  ENILimitReachedException({String? type, String? message})
      : super(type: type, code: 'ENILimitReachedException', message: message);
}

class InvalidCodeSignatureException extends _s.GenericAwsException {
  InvalidCodeSignatureException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidCodeSignatureException',
            message: message);
}

class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

class InvalidRequestContentException extends _s.GenericAwsException {
  InvalidRequestContentException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidRequestContentException',
            message: message);
}

class InvalidRuntimeException extends _s.GenericAwsException {
  InvalidRuntimeException({String? type, String? message})
      : super(type: type, code: 'InvalidRuntimeException', message: message);
}

class InvalidSecurityGroupIDException extends _s.GenericAwsException {
  InvalidSecurityGroupIDException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidSecurityGroupIDException',
            message: message);
}

class InvalidSubnetIDException extends _s.GenericAwsException {
  InvalidSubnetIDException({String? type, String? message})
      : super(type: type, code: 'InvalidSubnetIDException', message: message);
}

class InvalidZipFileException extends _s.GenericAwsException {
  InvalidZipFileException({String? type, String? message})
      : super(type: type, code: 'InvalidZipFileException', message: message);
}

class KMSAccessDeniedException extends _s.GenericAwsException {
  KMSAccessDeniedException({String? type, String? message})
      : super(type: type, code: 'KMSAccessDeniedException', message: message);
}

class KMSDisabledException extends _s.GenericAwsException {
  KMSDisabledException({String? type, String? message})
      : super(type: type, code: 'KMSDisabledException', message: message);
}

class KMSInvalidStateException extends _s.GenericAwsException {
  KMSInvalidStateException({String? type, String? message})
      : super(type: type, code: 'KMSInvalidStateException', message: message);
}

class KMSNotFoundException extends _s.GenericAwsException {
  KMSNotFoundException({String? type, String? message})
      : super(type: type, code: 'KMSNotFoundException', message: message);
}

class PolicyLengthExceededException extends _s.GenericAwsException {
  PolicyLengthExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'PolicyLengthExceededException',
            message: message);
}

class PreconditionFailedException extends _s.GenericAwsException {
  PreconditionFailedException({String? type, String? message})
      : super(
            type: type, code: 'PreconditionFailedException', message: message);
}

class ProvisionedConcurrencyConfigNotFoundException
    extends _s.GenericAwsException {
  ProvisionedConcurrencyConfigNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'ProvisionedConcurrencyConfigNotFoundException',
            message: message);
}

class RequestTooLargeException extends _s.GenericAwsException {
  RequestTooLargeException({String? type, String? message})
      : super(type: type, code: 'RequestTooLargeException', message: message);
}

class ResourceConflictException extends _s.GenericAwsException {
  ResourceConflictException({String? type, String? message})
      : super(type: type, code: 'ResourceConflictException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourceNotReadyException extends _s.GenericAwsException {
  ResourceNotReadyException({String? type, String? message})
      : super(type: type, code: 'ResourceNotReadyException', message: message);
}

class ServiceException extends _s.GenericAwsException {
  ServiceException({String? type, String? message})
      : super(type: type, code: 'ServiceException', message: message);
}

class SubnetIPAddressLimitReachedException extends _s.GenericAwsException {
  SubnetIPAddressLimitReachedException({String? type, String? message})
      : super(
            type: type,
            code: 'SubnetIPAddressLimitReachedException',
            message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class UnsupportedMediaTypeException extends _s.GenericAwsException {
  UnsupportedMediaTypeException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedMediaTypeException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'CodeSigningConfigNotFoundException': (type, message) =>
      CodeSigningConfigNotFoundException(type: type, message: message),
  'CodeStorageExceededException': (type, message) =>
      CodeStorageExceededException(type: type, message: message),
  'CodeVerificationFailedException': (type, message) =>
      CodeVerificationFailedException(type: type, message: message),
  'EC2AccessDeniedException': (type, message) =>
      EC2AccessDeniedException(type: type, message: message),
  'EC2ThrottledException': (type, message) =>
      EC2ThrottledException(type: type, message: message),
  'EC2UnexpectedException': (type, message) =>
      EC2UnexpectedException(type: type, message: message),
  'EFSIOException': (type, message) =>
      EFSIOException(type: type, message: message),
  'EFSMountConnectivityException': (type, message) =>
      EFSMountConnectivityException(type: type, message: message),
  'EFSMountFailureException': (type, message) =>
      EFSMountFailureException(type: type, message: message),
  'EFSMountTimeoutException': (type, message) =>
      EFSMountTimeoutException(type: type, message: message),
  'ENILimitReachedException': (type, message) =>
      ENILimitReachedException(type: type, message: message),
  'InvalidCodeSignatureException': (type, message) =>
      InvalidCodeSignatureException(type: type, message: message),
  'InvalidParameterValueException': (type, message) =>
      InvalidParameterValueException(type: type, message: message),
  'InvalidRequestContentException': (type, message) =>
      InvalidRequestContentException(type: type, message: message),
  'InvalidRuntimeException': (type, message) =>
      InvalidRuntimeException(type: type, message: message),
  'InvalidSecurityGroupIDException': (type, message) =>
      InvalidSecurityGroupIDException(type: type, message: message),
  'InvalidSubnetIDException': (type, message) =>
      InvalidSubnetIDException(type: type, message: message),
  'InvalidZipFileException': (type, message) =>
      InvalidZipFileException(type: type, message: message),
  'KMSAccessDeniedException': (type, message) =>
      KMSAccessDeniedException(type: type, message: message),
  'KMSDisabledException': (type, message) =>
      KMSDisabledException(type: type, message: message),
  'KMSInvalidStateException': (type, message) =>
      KMSInvalidStateException(type: type, message: message),
  'KMSNotFoundException': (type, message) =>
      KMSNotFoundException(type: type, message: message),
  'PolicyLengthExceededException': (type, message) =>
      PolicyLengthExceededException(type: type, message: message),
  'PreconditionFailedException': (type, message) =>
      PreconditionFailedException(type: type, message: message),
  'ProvisionedConcurrencyConfigNotFoundException': (type, message) =>
      ProvisionedConcurrencyConfigNotFoundException(
          type: type, message: message),
  'RequestTooLargeException': (type, message) =>
      RequestTooLargeException(type: type, message: message),
  'ResourceConflictException': (type, message) =>
      ResourceConflictException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ResourceNotReadyException': (type, message) =>
      ResourceNotReadyException(type: type, message: message),
  'ServiceException': (type, message) =>
      ServiceException(type: type, message: message),
  'SubnetIPAddressLimitReachedException': (type, message) =>
      SubnetIPAddressLimitReachedException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'UnsupportedMediaTypeException': (type, message) =>
      UnsupportedMediaTypeException(type: type, message: message),
};
