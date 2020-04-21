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

part 'lambda-2015-03-31.g.dart';

/// This is the <i>AWS Lambda API Reference</i>. The AWS Lambda Developer Guide
/// provides additional information. For the service overview, see <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/welcome.html">What is AWS
/// Lambda</a>, and for information about how the service works, see <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-introduction.html">AWS
/// Lambda: How it Works</a> in the <b>AWS Lambda Developer Guide</b>.
class Lambda {
  final _s.RestJsonProtocol _protocol;
  Lambda({
    @_s.required String region,
    @_s.required _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: 'lambda',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Adds permissions to the resource-based policy of a version of an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS
  /// Lambda layer</a>. Use this action to grant layer usage permission to other
  /// accounts. You can grant permission to a single account, all AWS accounts,
  /// or all accounts in an organization.
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
  /// An account ID, or <code>*</code> to grant permission to all AWS accounts.
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
    @_s.required String action,
    @_s.required String layerName,
    @_s.required String principal,
    @_s.required String statementId,
    @_s.required int versionNumber,
    String organizationId,
    String revisionId,
  }) async {
    ArgumentError.checkNotNull(action, 'action');
    _s.validateStringPattern(
      'action',
      action,
      r'''lambda:GetLayerVersion''',
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
    _s.validateStringPattern(
      'layerName',
      layerName,
      r'''(arn:[a-zA-Z0-9-]+:lambda:[a-zA-Z0-9-]+:\d{12}:layer:[a-zA-Z0-9-_]+)|[a-zA-Z0-9-_]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(principal, 'principal');
    _s.validateStringPattern(
      'principal',
      principal,
      r'''\d{12}|\*|arn:(aws[a-zA-Z-]*):iam::\d{12}:root''',
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
    _s.validateStringPattern(
      'statementId',
      statementId,
      r'''([a-zA-Z0-9-_]+)''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(versionNumber, 'versionNumber');
    _s.validateStringPattern(
      'organizationId',
      organizationId,
      r'''o-[a-z0-9]{10,32}''',
      isRequired: false,
    );
    final $payload = <String, dynamic>{
      'Action': action,
      'Principal': principal,
      'StatementId': statementId,
      'OrganizationId': organizationId,
    };
    await _protocol.send(
      $payload,
      method: 'POST',
      requestUri:
          '/2018-10-31/layers/$layerName/versions/$versionNumber/policy',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
  }

  /// Grants an AWS service or another account permission to use a function. You
  /// can apply the policy at the function level, or specify a qualifier to
  /// restrict access to a single version or alias. If you use a qualifier, the
  /// invoker must use the full Amazon Resource Name (ARN) of that version or
  /// alias to invoke the function.
  ///
  /// To grant permission to another account, specify the account ID as the
  /// <code>Principal</code>. For AWS services, the principal is a domain-style
  /// identifier defined by the service, like <code>s3.amazonaws.com</code> or
  /// <code>sns.amazonaws.com</code>. For AWS services, you can also specify the
  /// ARN of the associated resource as the <code>SourceArn</code>. If you grant
  /// permission to a service principal without specifying the source, other
  /// accounts could potentially configure resources in their account to invoke
  /// your Lambda function.
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
  /// The AWS service or account that invokes the function. If you specify a
  /// service, use <code>SourceArn</code> or <code>SourceAccount</code> to limit
  /// who can invoke the function through that service.
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
  /// For AWS services, the ARN of the AWS resource that invokes the function.
  /// For example, an Amazon S3 bucket or Amazon SNS topic.
  Future<AddPermissionResponse> addPermission({
    @_s.required String action,
    @_s.required String functionName,
    @_s.required String principal,
    @_s.required String statementId,
    String eventSourceToken,
    String qualifier,
    String revisionId,
    String sourceAccount,
    String sourceArn,
  }) async {
    ArgumentError.checkNotNull(action, 'action');
    _s.validateStringPattern(
      'action',
      action,
      r'''(lambda:[*]|lambda:[a-zA-Z]+|[*])''',
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
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(principal, 'principal');
    _s.validateStringPattern(
      'principal',
      principal,
      r'''.*''',
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
    _s.validateStringPattern(
      'statementId',
      statementId,
      r'''([a-zA-Z0-9-_]+)''',
      isRequired: true,
    );
    _s.validateStringLength(
      'eventSourceToken',
      eventSourceToken,
      0,
      256,
      isRequired: false,
    );
    _s.validateStringPattern(
      'eventSourceToken',
      eventSourceToken,
      r'''[a-zA-Z0-9._\-]+''',
      isRequired: false,
    );
    _s.validateStringLength(
      'qualifier',
      qualifier,
      1,
      128,
      isRequired: false,
    );
    _s.validateStringPattern(
      'qualifier',
      qualifier,
      r'''(|[a-zA-Z0-9$_-]+)''',
      isRequired: false,
    );
    _s.validateStringPattern(
      'sourceAccount',
      sourceAccount,
      r'''\d{12}''',
      isRequired: false,
    );
    _s.validateStringPattern(
      'sourceArn',
      sourceArn,
      r'''arn:(aws[a-zA-Z0-9-]*):([a-zA-Z0-9\-])+:([a-z]{2}(-gov)?-[a-z]+-\d{1})?:(\d{12})?:(.*)''',
      isRequired: false,
    );
    final $payload = <String, dynamic>{
      'Action': action,
      'Principal': principal,
      'StatementId': statementId,
      'EventSourceToken': eventSourceToken,
      'RevisionId': revisionId,
      'SourceAccount': sourceAccount,
      'SourceArn': sourceArn,
    };
    await _protocol.send(
      $payload,
      method: 'POST',
      requestUri: '/2015-03-31/functions/$functionName/policy',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-traffic-shifting-using-aliases.html">routing
  /// configuration</a> of the alias.
  Future<AliasConfiguration> createAlias({
    @_s.required String functionName,
    @_s.required String functionVersion,
    @_s.required String name,
    String description,
    AliasRoutingConfiguration routingConfig,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
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
    _s.validateStringPattern(
      'functionVersion',
      functionVersion,
      r'''(\$LATEST|[0-9]+)''',
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
    _s.validateStringPattern(
      'name',
      name,
      r'''(?!^[0-9]+$)([a-zA-Z0-9-_]+)''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
      isRequired: false,
    );
    final $payload = <String, dynamic>{
      'FunctionVersion': functionVersion,
      'Name': name,
      'Description': description,
      'RoutingConfig': routingConfig,
    };
    await _protocol.send(
      $payload,
      method: 'POST',
      requestUri: '/2015-03-31/functions/$functionName/aliases',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
  }

  /// Creates a mapping between an event source and an AWS Lambda function.
  /// Lambda reads items from the event source and triggers the function.
  ///
  /// For details about each event source type, see the following topics.
  ///
  /// <ul>
  /// <li>
  /// <a href="https://docs.aws.amazon.com/lambda/latest/dg/with-ddb.html">Using
  /// AWS Lambda with Amazon DynamoDB</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/with-kinesis.html">Using
  /// AWS Lambda with Amazon Kinesis</a>
  /// </li>
  /// <li>
  /// <a href="https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html">Using
  /// AWS Lambda with Amazon SQS</a>
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
  /// specified age.
  /// </li>
  /// <li>
  /// <code>MaximumRetryAttempts</code> - Discard records after the specified
  /// number of retries.
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
  /// <b>Amazon Simple Queue Service</b> - Default 10. Max 10.
  /// </li>
  /// </ul>
  ///
  /// Parameter [bisectBatchOnFunctionError] :
  /// (Streams) If the function returns an error, split the batch in two and
  /// retry.
  ///
  /// Parameter [destinationConfig] :
  /// (Streams) An Amazon SQS queue or Amazon SNS topic destination for
  /// discarded records.
  ///
  /// Parameter [enabled] :
  /// Disables the event source mapping to pause polling and invocation.
  ///
  /// Parameter [maximumBatchingWindowInSeconds] :
  /// (Streams) The maximum amount of time to gather records before invoking the
  /// function, in seconds.
  ///
  /// Parameter [maximumRecordAgeInSeconds] :
  /// (Streams) The maximum age of a record that Lambda sends to a function for
  /// processing.
  ///
  /// Parameter [maximumRetryAttempts] :
  /// (Streams) The maximum number of times to retry when the function returns
  /// an error.
  ///
  /// Parameter [parallelizationFactor] :
  /// (Streams) The number of batches to process from each shard concurrently.
  ///
  /// Parameter [startingPosition] :
  /// The position in a stream from which to start reading. Required for Amazon
  /// Kinesis and Amazon DynamoDB Streams sources. <code>AT_TIMESTAMP</code> is
  /// only supported for Amazon Kinesis streams.
  ///
  /// Parameter [startingPositionTimestamp] :
  /// With <code>StartingPosition</code> set to <code>AT_TIMESTAMP</code>, the
  /// time from which to start reading.
  Future<EventSourceMappingConfiguration> createEventSourceMapping({
    @_s.required String eventSourceArn,
    @_s.required String functionName,
    int batchSize,
    bool bisectBatchOnFunctionError,
    DestinationConfig destinationConfig,
    bool enabled,
    int maximumBatchingWindowInSeconds,
    int maximumRecordAgeInSeconds,
    int maximumRetryAttempts,
    int parallelizationFactor,
    EventSourcePosition startingPosition,
    DateTime startingPositionTimestamp,
  }) async {
    ArgumentError.checkNotNull(eventSourceArn, 'eventSourceArn');
    _s.validateStringPattern(
      'eventSourceArn',
      eventSourceArn,
      r'''arn:(aws[a-zA-Z0-9-]*):([a-zA-Z0-9\-])+:([a-z]{2}(-gov)?-[a-z]+-\d{1})?:(\d{12})?:(.*)''',
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
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
      isRequired: true,
    );
    _s.validateNumRange(
      'batchSize',
      batchSize,
      1,
      10000,
      isRequired: false,
    );
    _s.validateNumRange(
      'maximumBatchingWindowInSeconds',
      maximumBatchingWindowInSeconds,
      0,
      300,
      isRequired: false,
    );
    _s.validateNumRange(
      'maximumRecordAgeInSeconds',
      maximumRecordAgeInSeconds,
      60,
      604800,
      isRequired: false,
    );
    _s.validateNumRange(
      'maximumRetryAttempts',
      maximumRetryAttempts,
      0,
      10000,
      isRequired: false,
    );
    _s.validateNumRange(
      'parallelizationFactor',
      parallelizationFactor,
      1,
      10,
      isRequired: false,
    );
    final $payload = <String, dynamic>{
      'EventSourceArn': eventSourceArn,
      'FunctionName': functionName,
      'BatchSize': batchSize,
      'BisectBatchOnFunctionError': bisectBatchOnFunctionError,
      'DestinationConfig': destinationConfig,
      'Enabled': enabled,
      'MaximumBatchingWindowInSeconds': maximumBatchingWindowInSeconds,
      'MaximumRecordAgeInSeconds': maximumRecordAgeInSeconds,
      'MaximumRetryAttempts': maximumRetryAttempts,
      'ParallelizationFactor': parallelizationFactor,
      'StartingPosition': startingPosition,
      'StartingPositionTimestamp': startingPositionTimestamp,
    };
    await _protocol.send(
      $payload,
      method: 'POST',
      requestUri: '/2015-03-31/event-source-mappings/',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
  }

  /// Creates a Lambda function. To create a function, you need a <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/deployment-package-v2.html">deployment
  /// package</a> and an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/intro-permission-model.html#lambda-intro-execution-role">execution
  /// role</a>. The deployment package contains your function code. The
  /// execution role grants the function permission to use AWS services, such as
  /// Amazon CloudWatch Logs for log streaming and AWS X-Ray for request
  /// tracing.
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
  /// If another account or an AWS service invokes your function, use
  /// <a>AddPermission</a> to grant permission by creating a resource-based IAM
  /// policy. You can grant permissions at the function level, on a version, or
  /// on an alias.
  ///
  /// To invoke your function directly, use <a>Invoke</a>. To invoke your
  /// function in response to events in other AWS services, create an event
  /// source mapping (<a>CreateEventSourceMapping</a>), or configure a function
  /// trigger in the other service. For more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-invocation.html">Invoking
  /// Functions</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [CodeStorageExceededException].
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
  /// Parameter [handler] :
  /// The name of the method within your code that Lambda calls to execute your
  /// function. The format includes the file name. It can also include
  /// namespaces and other qualifiers, depending on the runtime. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/programming-model-v2.html">Programming
  /// Model</a>.
  ///
  /// Parameter [role] :
  /// The Amazon Resource Name (ARN) of the function's execution role.
  ///
  /// Parameter [runtime] :
  /// The identifier of the function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html">runtime</a>.
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
  /// Parameter [kMSKeyArn] :
  /// The ARN of the AWS Key Management Service (AWS KMS) key that's used to
  /// encrypt your function's environment variables. If it's not provided, AWS
  /// Lambda uses a default service key.
  ///
  /// Parameter [layers] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">function
  /// layers</a> to add to the function's execution environment. Specify each
  /// layer by its ARN, including the version.
  ///
  /// Parameter [memorySize] :
  /// The amount of memory that your function has access to. Increasing the
  /// function's memory also increases its CPU allocation. The default value is
  /// 128 MB. The value must be a multiple of 64 MB.
  ///
  /// Parameter [publish] :
  /// Set to true to publish the first version of the function during creation.
  ///
  /// Parameter [tags] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/tagging.html">tags</a>
  /// to apply to the function.
  ///
  /// Parameter [timeout] :
  /// The amount of time that Lambda allows a function to run before stopping
  /// it. The default is 3 seconds. The maximum allowed value is 900 seconds.
  ///
  /// Parameter [tracingConfig] :
  /// Set <code>Mode</code> to <code>Active</code> to sample and trace a subset
  /// of incoming requests with AWS X-Ray.
  ///
  /// Parameter [vpcConfig] :
  /// For network connectivity to AWS resources in a VPC, specify a list of
  /// security groups and subnets in the VPC. When you connect a function to a
  /// VPC, it can only access resources and the internet through that VPC. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-vpc.html">VPC
  /// Settings</a>.
  Future<FunctionConfiguration> createFunction({
    @_s.required FunctionCode code,
    @_s.required String functionName,
    @_s.required String handler,
    @_s.required String role,
    @_s.required Runtime runtime,
    DeadLetterConfig deadLetterConfig,
    String description,
    Environment environment,
    String kMSKeyArn,
    List<String> layers,
    int memorySize,
    bool publish,
    Map<String, String> tags,
    int timeout,
    TracingConfig tracingConfig,
    VpcConfig vpcConfig,
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
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(handler, 'handler');
    _s.validateStringLength(
      'handler',
      handler,
      0,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'handler',
      handler,
      r'''[^\s]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(role, 'role');
    _s.validateStringPattern(
      'role',
      role,
      r'''arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(runtime, 'runtime');
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
      isRequired: false,
    );
    _s.validateStringPattern(
      'kMSKeyArn',
      kMSKeyArn,
      r'''(arn:(aws[a-zA-Z-]*)?:[a-z0-9-.]+:.*)|()''',
      isRequired: false,
    );
    _s.validateNumRange(
      'memorySize',
      memorySize,
      128,
      3008,
      isRequired: false,
    );
    _s.validateNumRange(
      'timeout',
      timeout,
      1,
      1152921504606846976,
      isRequired: false,
    );
    final $payload = <String, dynamic>{
      'Code': code,
      'FunctionName': functionName,
      'Handler': handler,
      'Role': role,
      'Runtime': runtime,
      'DeadLetterConfig': deadLetterConfig,
      'Description': description,
      'Environment': environment,
      'KMSKeyArn': kMSKeyArn,
      'Layers': layers,
      'MemorySize': memorySize,
      'Publish': publish,
      'Tags': tags,
      'Timeout': timeout,
      'TracingConfig': tracingConfig,
      'VpcConfig': vpcConfig,
    };
    await _protocol.send(
      $payload,
      method: 'POST',
      requestUri: '/2015-03-31/functions',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
    @_s.required String functionName,
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
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
    _s.validateStringPattern(
      'name',
      name,
      r'''(?!^[0-9]+$)([a-zA-Z0-9-_]+)''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{};
    await _protocol.send(
      $payload,
      method: 'DELETE',
      requestUri: '/2015-03-31/functions/$functionName/aliases/$name',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
    @_s.required String uuid,
  }) async {
    ArgumentError.checkNotNull(uuid, 'uuid');
    final $payload = <String, dynamic>{};
    await _protocol.send(
      $payload,
      method: 'DELETE',
      requestUri: '/2015-03-31/event-source-mappings/$uuid',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
  }

  /// Deletes a Lambda function. To delete a specific function version, use the
  /// <code>Qualifier</code> parameter. Otherwise, all versions and aliases are
  /// deleted.
  ///
  /// To delete Lambda event source mappings that invoke a function, use
  /// <a>DeleteEventSourceMapping</a>. For AWS services and resources that
  /// invoke your function directly, delete the trigger in the service where you
  /// originally configured it.
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
    @_s.required String functionName,
    String qualifier,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
      isRequired: true,
    );
    _s.validateStringLength(
      'qualifier',
      qualifier,
      1,
      128,
      isRequired: false,
    );
    _s.validateStringPattern(
      'qualifier',
      qualifier,
      r'''(|[a-zA-Z0-9$_-]+)''',
      isRequired: false,
    );
    final $payload = <String, dynamic>{};
    await _protocol.send(
      $payload,
      method: 'DELETE',
      requestUri: '/2015-03-31/functions/$functionName',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
    @_s.required String functionName,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{};
    await _protocol.send(
      $payload,
      method: 'DELETE',
      requestUri: '/2017-10-31/functions/$functionName/concurrency',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
    @_s.required String functionName,
    String qualifier,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
      isRequired: true,
    );
    _s.validateStringLength(
      'qualifier',
      qualifier,
      1,
      128,
      isRequired: false,
    );
    _s.validateStringPattern(
      'qualifier',
      qualifier,
      r'''(|[a-zA-Z0-9$_-]+)''',
      isRequired: false,
    );
    final $payload = <String, dynamic>{};
    await _protocol.send(
      $payload,
      method: 'DELETE',
      requestUri: '/2019-09-25/functions/$functionName/event-invoke-config',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
  }

  /// Deletes a version of an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS
  /// Lambda layer</a>. Deleted versions can no longer be viewed or added to
  /// functions. To avoid breaking functions, a copy of the version remains in
  /// Lambda until no functions refer to it.
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
    @_s.required String layerName,
    @_s.required int versionNumber,
  }) async {
    ArgumentError.checkNotNull(layerName, 'layerName');
    _s.validateStringLength(
      'layerName',
      layerName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringPattern(
      'layerName',
      layerName,
      r'''(arn:[a-zA-Z0-9-]+:lambda:[a-zA-Z0-9-]+:\d{12}:layer:[a-zA-Z0-9-_]+)|[a-zA-Z0-9-_]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(versionNumber, 'versionNumber');
    final $payload = <String, dynamic>{};
    await _protocol.send(
      $payload,
      method: 'DELETE',
      requestUri: '/2018-10-31/layers/$layerName/versions/$versionNumber',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
    @_s.required String functionName,
    @_s.required String qualifier,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
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
    _s.validateStringPattern(
      'qualifier',
      qualifier,
      r'''(|[a-zA-Z0-9$_-]+)''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{};
    await _protocol.send(
      $payload,
      method: 'DELETE',
      requestUri: '/2019-09-30/functions/$functionName/provisioned-concurrency',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
  }

  /// Retrieves details about your account's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/limits.html">limits</a>
  /// and usage in an AWS Region.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [ServiceException].
  Future<GetAccountSettingsResponse> getAccountSettings() async {
    await _protocol.send(
      null,
      method: 'GET',
      requestUri: '/2016-08-19/account-settings/',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
    @_s.required String functionName,
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
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
    _s.validateStringPattern(
      'name',
      name,
      r'''(?!^[0-9]+$)([a-zA-Z0-9-_]+)''',
      isRequired: true,
    );
    await _protocol.send(
      null,
      method: 'GET',
      requestUri: '/2015-03-31/functions/$functionName/aliases/$name',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
    @_s.required String uuid,
  }) async {
    ArgumentError.checkNotNull(uuid, 'uuid');
    await _protocol.send(
      null,
      method: 'GET',
      requestUri: '/2015-03-31/event-source-mappings/$uuid',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
    @_s.required String functionName,
    String qualifier,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      170,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_\.]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
      isRequired: true,
    );
    _s.validateStringLength(
      'qualifier',
      qualifier,
      1,
      128,
      isRequired: false,
    );
    _s.validateStringPattern(
      'qualifier',
      qualifier,
      r'''(|[a-zA-Z0-9$_-]+)''',
      isRequired: false,
    );
    await _protocol.send(
      null,
      method: 'GET',
      requestUri: '/2015-03-31/functions/$functionName',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
    @_s.required String functionName,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
      isRequired: true,
    );
    await _protocol.send(
      null,
      method: 'GET',
      requestUri: '/2019-09-30/functions/$functionName/concurrency',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
    @_s.required String functionName,
    String qualifier,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      170,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_\.]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
      isRequired: true,
    );
    _s.validateStringLength(
      'qualifier',
      qualifier,
      1,
      128,
      isRequired: false,
    );
    _s.validateStringPattern(
      'qualifier',
      qualifier,
      r'''(|[a-zA-Z0-9$_-]+)''',
      isRequired: false,
    );
    await _protocol.send(
      null,
      method: 'GET',
      requestUri: '/2015-03-31/functions/$functionName/configuration',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
    @_s.required String functionName,
    String qualifier,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
      isRequired: true,
    );
    _s.validateStringLength(
      'qualifier',
      qualifier,
      1,
      128,
      isRequired: false,
    );
    _s.validateStringPattern(
      'qualifier',
      qualifier,
      r'''(|[a-zA-Z0-9$_-]+)''',
      isRequired: false,
    );
    await _protocol.send(
      null,
      method: 'GET',
      requestUri: '/2019-09-25/functions/$functionName/event-invoke-config',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
  }

  /// Returns information about a version of an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS
  /// Lambda layer</a>, with a link to download the layer archive that's valid
  /// for 10 minutes.
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
    @_s.required String layerName,
    @_s.required int versionNumber,
  }) async {
    ArgumentError.checkNotNull(layerName, 'layerName');
    _s.validateStringLength(
      'layerName',
      layerName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringPattern(
      'layerName',
      layerName,
      r'''(arn:[a-zA-Z0-9-]+:lambda:[a-zA-Z0-9-]+:\d{12}:layer:[a-zA-Z0-9-_]+)|[a-zA-Z0-9-_]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(versionNumber, 'versionNumber');
    await _protocol.send(
      null,
      method: 'GET',
      requestUri: '/2018-10-31/layers/$layerName/versions/$versionNumber',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
  }

  /// Returns information about a version of an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS
  /// Lambda layer</a>, with a link to download the layer archive that's valid
  /// for 10 minutes.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidParameterValueException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// The ARN of the layer version.
  Future<GetLayerVersionResponse> getLayerVersionByArn({
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''arn:[a-zA-Z0-9-]+:lambda:[a-zA-Z0-9-]+:\d{12}:layer:[a-zA-Z0-9-_]+:[0-9]+''',
      isRequired: true,
    );
    await _protocol.send(
      null,
      method: 'GET',
      requestUri: '/2018-10-31/layers?find=LayerVersion',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
  }

  /// Returns the permission policy for a version of an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS
  /// Lambda layer</a>. For more information, see
  /// <a>AddLayerVersionPermission</a>.
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
    @_s.required String layerName,
    @_s.required int versionNumber,
  }) async {
    ArgumentError.checkNotNull(layerName, 'layerName');
    _s.validateStringLength(
      'layerName',
      layerName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringPattern(
      'layerName',
      layerName,
      r'''(arn:[a-zA-Z0-9-]+:lambda:[a-zA-Z0-9-]+:\d{12}:layer:[a-zA-Z0-9-_]+)|[a-zA-Z0-9-_]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(versionNumber, 'versionNumber');
    await _protocol.send(
      null,
      method: 'GET',
      requestUri:
          '/2018-10-31/layers/$layerName/versions/$versionNumber/policy',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
    @_s.required String functionName,
    String qualifier,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      170,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_\.]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
      isRequired: true,
    );
    _s.validateStringLength(
      'qualifier',
      qualifier,
      1,
      128,
      isRequired: false,
    );
    _s.validateStringPattern(
      'qualifier',
      qualifier,
      r'''(|[a-zA-Z0-9$_-]+)''',
      isRequired: false,
    );
    await _protocol.send(
      null,
      method: 'GET',
      requestUri: '/2015-03-31/functions/$functionName/policy',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
    @_s.required String functionName,
    @_s.required String qualifier,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
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
    _s.validateStringPattern(
      'qualifier',
      qualifier,
      r'''(|[a-zA-Z0-9$_-]+)''',
      isRequired: true,
    );
    await _protocol.send(
      null,
      method: 'GET',
      requestUri: '/2019-09-30/functions/$functionName/provisioned-concurrency',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
    @_s.required String functionName,
    String clientContext,
    InvocationType invocationType,
    LogType logType,
    Uint8List payload,
    String qualifier,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      170,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_\.]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
      isRequired: true,
    );
    _s.validateStringLength(
      'qualifier',
      qualifier,
      1,
      128,
      isRequired: false,
    );
    _s.validateStringPattern(
      'qualifier',
      qualifier,
      r'''(|[a-zA-Z0-9$_-]+)''',
      isRequired: false,
    );
    final headers = <String, String>{};
    clientContext?.let((v) => headers['X-Amz-Client-Context'] = v.toString());
    invocationType?.let((v) => headers['X-Amz-Invocation-Type'] = v.toString());
    logType?.let((v) => headers['X-Amz-Log-Type'] = v.toString());
    await _protocol.send(
      payload,
      headers: headers,
      method: 'POST',
      requestUri: '/2015-03-31/functions/$functionName/invocations',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
    @_s.required String functionName,
    @_s.required Uint8List invokeArgs,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      170,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_\.]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(invokeArgs, 'invokeArgs');
    await _protocol.send(
      invokeArgs,
      method: 'POST',
      requestUri: '/2014-11-13/functions/$functionName/invoke-async/',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
    @_s.required String functionName,
    String functionVersion,
    String marker,
    int maxItems,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
      isRequired: true,
    );
    _s.validateStringLength(
      'functionVersion',
      functionVersion,
      1,
      1024,
      isRequired: false,
    );
    _s.validateStringPattern(
      'functionVersion',
      functionVersion,
      r'''(\$LATEST|[0-9]+)''',
      isRequired: false,
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      10000,
      isRequired: false,
    );
    await _protocol.send(
      null,
      method: 'GET',
      requestUri: '/2015-03-31/functions/$functionName/aliases',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
    String eventSourceArn,
    String functionName,
    String marker,
    int maxItems,
  }) async {
    _s.validateStringPattern(
      'eventSourceArn',
      eventSourceArn,
      r'''arn:(aws[a-zA-Z0-9-]*):([a-zA-Z0-9\-])+:([a-z]{2}(-gov)?-[a-z]+-\d{1})?:(\d{12})?:(.*)''',
      isRequired: false,
    );
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: false,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
      isRequired: false,
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      10000,
      isRequired: false,
    );
    await _protocol.send(
      null,
      method: 'GET',
      requestUri: '/2015-03-31/event-source-mappings/',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
    @_s.required String functionName,
    String marker,
    int maxItems,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      50,
      isRequired: false,
    );
    await _protocol.send(
      null,
      method: 'GET',
      requestUri:
          '/2019-09-25/functions/$functionName/event-invoke-config/list',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
  }

  /// Returns a list of Lambda functions, with the version-specific
  /// configuration of each. Lambda returns up to 50 functions per call.
  ///
  /// Set <code>FunctionVersion</code> to <code>ALL</code> to include all
  /// published versions of each function in addition to the unpublished
  /// version. To get more information about a function or version, use
  /// <a>GetFunction</a>.
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
  /// For Lambda@Edge functions, the AWS Region of the master function. For
  /// example, <code>us-east-1</code> filters the list of functions to only
  /// include Lambda@Edge functions replicated from a master function in US East
  /// (N. Virginia). If specified, you must set <code>FunctionVersion</code> to
  /// <code>ALL</code>.
  ///
  /// Parameter [maxItems] :
  /// The maximum number of functions to return.
  Future<ListFunctionsResponse> listFunctions({
    FunctionVersion functionVersion,
    String marker,
    String masterRegion,
    int maxItems,
  }) async {
    _s.validateStringPattern(
      'masterRegion',
      masterRegion,
      r'''ALL|[a-z]{2}(-gov)?-[a-z]+-\d{1}''',
      isRequired: false,
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      10000,
      isRequired: false,
    );
    await _protocol.send(
      null,
      method: 'GET',
      requestUri: '/2015-03-31/functions/',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
  }

  /// Lists the versions of an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS
  /// Lambda layer</a>. Versions that have been deleted aren't listed. Specify a
  /// <a
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
    @_s.required String layerName,
    Runtime compatibleRuntime,
    String marker,
    int maxItems,
  }) async {
    ArgumentError.checkNotNull(layerName, 'layerName');
    _s.validateStringLength(
      'layerName',
      layerName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringPattern(
      'layerName',
      layerName,
      r'''(arn:[a-zA-Z0-9-]+:lambda:[a-zA-Z0-9-]+:\d{12}:layer:[a-zA-Z0-9-_]+)|[a-zA-Z0-9-_]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      50,
      isRequired: false,
    );
    await _protocol.send(
      null,
      method: 'GET',
      requestUri: '/2018-10-31/layers/$layerName/versions',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
  }

  /// Lists <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS
  /// Lambda layers</a> and shows information about the latest version of each.
  /// Specify a <a
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
    Runtime compatibleRuntime,
    String marker,
    int maxItems,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      50,
      isRequired: false,
    );
    await _protocol.send(
      null,
      method: 'GET',
      requestUri: '/2018-10-31/layers',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
    @_s.required String functionName,
    String marker,
    int maxItems,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      50,
      isRequired: false,
    );
    await _protocol.send(
      null,
      method: 'GET',
      requestUri:
          '/2019-09-30/functions/$functionName/provisioned-concurrency?List=ALL',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
    @_s.required String resource,
  }) async {
    ArgumentError.checkNotNull(resource, 'resource');
    _s.validateStringPattern(
      'resource',
      resource,
      r'''arn:(aws[a-zA-Z-]*)?:lambda:[a-z]{2}(-gov)?-[a-z]+-\d{1}:\d{12}:function:[a-zA-Z0-9-_]+(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
      isRequired: true,
    );
    await _protocol.send(
      null,
      method: 'GET',
      requestUri: '/2017-03-31/tags/$resource',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
  /// The maximum number of versions to return.
  Future<ListVersionsByFunctionResponse> listVersionsByFunction({
    @_s.required String functionName,
    String marker,
    int maxItems,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      170,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_\.]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      10000,
      isRequired: false,
    );
    await _protocol.send(
      null,
      method: 'GET',
      requestUri: '/2015-03-31/functions/$functionName/versions',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
  }

  /// Creates an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS
  /// Lambda layer</a> from a ZIP archive. Each time you call
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
    @_s.required LayerVersionContentInput content,
    @_s.required String layerName,
    List<String> compatibleRuntimes,
    String description,
    String licenseInfo,
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
    _s.validateStringPattern(
      'layerName',
      layerName,
      r'''(arn:[a-zA-Z0-9-]+:lambda:[a-zA-Z0-9-]+:\d{12}:layer:[a-zA-Z0-9-_]+)|[a-zA-Z0-9-_]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
      isRequired: false,
    );
    _s.validateStringLength(
      'licenseInfo',
      licenseInfo,
      0,
      512,
      isRequired: false,
    );
    final $payload = <String, dynamic>{
      'Content': content,
      'CompatibleRuntimes': compatibleRuntimes,
      'Description': description,
      'LicenseInfo': licenseInfo,
    };
    await _protocol.send(
      $payload,
      method: 'POST',
      requestUri: '/2018-10-31/layers/$layerName/versions',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
  }

  /// Creates a <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">version</a>
  /// from the current code and configuration of a function. Use versions to
  /// create a snapshot of your function code and configuration that doesn't
  /// change.
  ///
  /// AWS Lambda doesn't publish a version if the function's configuration and
  /// code haven't changed since the last version. Use <a>UpdateFunctionCode</a>
  /// or <a>UpdateFunctionConfiguration</a> to update the function before
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
    @_s.required String functionName,
    String codeSha256,
    String description,
    String revisionId,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
      isRequired: false,
    );
    final $payload = <String, dynamic>{
      'CodeSha256': codeSha256,
      'Description': description,
      'RevisionId': revisionId,
    };
    await _protocol.send(
      $payload,
      method: 'POST',
      requestUri: '/2015-03-31/functions/$functionName/versions',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
    @_s.required String functionName,
    @_s.required int reservedConcurrentExecutions,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
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
    await _protocol.send(
      $payload,
      method: 'PUT',
      requestUri: '/2017-10-31/functions/$functionName/concurrency',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
  }

  /// Configures options for <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html">asynchronous
  /// invocation</a> on a function, version, or alias. If a configuration
  /// already exists for a function, version, or alias, this operation
  /// overwrites it. If you exclude any settings, they are removed. To set one
  /// option without affecting existing settings for other options, use
  /// <a>PutFunctionEventInvokeConfig</a>.
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
    @_s.required String functionName,
    DestinationConfig destinationConfig,
    int maximumEventAgeInSeconds,
    int maximumRetryAttempts,
    String qualifier,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maximumEventAgeInSeconds',
      maximumEventAgeInSeconds,
      60,
      21600,
      isRequired: false,
    );
    _s.validateNumRange(
      'maximumRetryAttempts',
      maximumRetryAttempts,
      0,
      2,
      isRequired: false,
    );
    _s.validateStringLength(
      'qualifier',
      qualifier,
      1,
      128,
      isRequired: false,
    );
    _s.validateStringPattern(
      'qualifier',
      qualifier,
      r'''(|[a-zA-Z0-9$_-]+)''',
      isRequired: false,
    );
    final $payload = <String, dynamic>{
      'DestinationConfig': destinationConfig,
      'MaximumEventAgeInSeconds': maximumEventAgeInSeconds,
      'MaximumRetryAttempts': maximumRetryAttempts,
    };
    await _protocol.send(
      $payload,
      method: 'PUT',
      requestUri: '/2019-09-25/functions/$functionName/event-invoke-config',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
    @_s.required String functionName,
    @_s.required int provisionedConcurrentExecutions,
    @_s.required String qualifier,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
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
    _s.validateStringPattern(
      'qualifier',
      qualifier,
      r'''(|[a-zA-Z0-9$_-]+)''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'ProvisionedConcurrentExecutions': provisionedConcurrentExecutions,
    };
    await _protocol.send(
      $payload,
      method: 'PUT',
      requestUri: '/2019-09-30/functions/$functionName/provisioned-concurrency',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
  }

  /// Removes a statement from the permissions policy for a version of an <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS
  /// Lambda layer</a>. For more information, see
  /// <a>AddLayerVersionPermission</a>.
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
    @_s.required String layerName,
    @_s.required String statementId,
    @_s.required int versionNumber,
    String revisionId,
  }) async {
    ArgumentError.checkNotNull(layerName, 'layerName');
    _s.validateStringLength(
      'layerName',
      layerName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringPattern(
      'layerName',
      layerName,
      r'''(arn:[a-zA-Z0-9-]+:lambda:[a-zA-Z0-9-]+:\d{12}:layer:[a-zA-Z0-9-_]+)|[a-zA-Z0-9-_]+''',
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
    _s.validateStringPattern(
      'statementId',
      statementId,
      r'''([a-zA-Z0-9-_]+)''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(versionNumber, 'versionNumber');
    final $payload = <String, dynamic>{};
    await _protocol.send(
      $payload,
      method: 'DELETE',
      requestUri:
          '/2018-10-31/layers/$layerName/versions/$versionNumber/policy/$statementId',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
  }

  /// Revokes function-use permission from an AWS service or another account.
  /// You can get the ID of the statement from the output of <a>GetPolicy</a>.
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
    @_s.required String functionName,
    @_s.required String statementId,
    String qualifier,
    String revisionId,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
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
    _s.validateStringPattern(
      'statementId',
      statementId,
      r'''([a-zA-Z0-9-_.]+)''',
      isRequired: true,
    );
    _s.validateStringLength(
      'qualifier',
      qualifier,
      1,
      128,
      isRequired: false,
    );
    _s.validateStringPattern(
      'qualifier',
      qualifier,
      r'''(|[a-zA-Z0-9$_-]+)''',
      isRequired: false,
    );
    final $payload = <String, dynamic>{};
    await _protocol.send(
      $payload,
      method: 'DELETE',
      requestUri: '/2015-03-31/functions/$functionName/policy/$statementId',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
    @_s.required String resource,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resource, 'resource');
    _s.validateStringPattern(
      'resource',
      resource,
      r'''arn:(aws[a-zA-Z-]*)?:lambda:[a-z]{2}(-gov)?-[a-z]+-\d{1}:\d{12}:function:[a-zA-Z0-9-_]+(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    await _protocol.send(
      $payload,
      method: 'POST',
      requestUri: '/2017-03-31/tags/$resource',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
    @_s.required String resource,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resource, 'resource');
    _s.validateStringPattern(
      'resource',
      resource,
      r'''arn:(aws[a-zA-Z-]*)?:lambda:[a-z]{2}(-gov)?-[a-z]+-\d{1}:\d{12}:function:[a-zA-Z0-9-_]+(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $payload = <String, dynamic>{};
    await _protocol.send(
      $payload,
      method: 'DELETE',
      requestUri: '/2017-03-31/tags/$resource',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-traffic-shifting-using-aliases.html">routing
  /// configuration</a> of the alias.
  Future<AliasConfiguration> updateAlias({
    @_s.required String functionName,
    @_s.required String name,
    String description,
    String functionVersion,
    String revisionId,
    AliasRoutingConfiguration routingConfig,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
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
    _s.validateStringPattern(
      'name',
      name,
      r'''(?!^[0-9]+$)([a-zA-Z0-9-_]+)''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
      isRequired: false,
    );
    _s.validateStringLength(
      'functionVersion',
      functionVersion,
      1,
      1024,
      isRequired: false,
    );
    _s.validateStringPattern(
      'functionVersion',
      functionVersion,
      r'''(\$LATEST|[0-9]+)''',
      isRequired: false,
    );
    final $payload = <String, dynamic>{
      'Description': description,
      'FunctionVersion': functionVersion,
      'RevisionId': revisionId,
      'RoutingConfig': routingConfig,
    };
    await _protocol.send(
      $payload,
      method: 'PUT',
      requestUri: '/2015-03-31/functions/$functionName/aliases/$name',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
  }

  /// Updates an event source mapping. You can change the function that AWS
  /// Lambda invokes, or pause invocation and resume later from the same
  /// location.
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
  /// specified age.
  /// </li>
  /// <li>
  /// <code>MaximumRetryAttempts</code> - Discard records after the specified
  /// number of retries.
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
  /// <b>Amazon Simple Queue Service</b> - Default 10. Max 10.
  /// </li>
  /// </ul>
  ///
  /// Parameter [bisectBatchOnFunctionError] :
  /// (Streams) If the function returns an error, split the batch in two and
  /// retry.
  ///
  /// Parameter [destinationConfig] :
  /// (Streams) An Amazon SQS queue or Amazon SNS topic destination for
  /// discarded records.
  ///
  /// Parameter [enabled] :
  /// Disables the event source mapping to pause polling and invocation.
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
  /// Parameter [maximumBatchingWindowInSeconds] :
  /// (Streams) The maximum amount of time to gather records before invoking the
  /// function, in seconds.
  ///
  /// Parameter [maximumRecordAgeInSeconds] :
  /// (Streams) The maximum age of a record that Lambda sends to a function for
  /// processing.
  ///
  /// Parameter [maximumRetryAttempts] :
  /// (Streams) The maximum number of times to retry when the function returns
  /// an error.
  ///
  /// Parameter [parallelizationFactor] :
  /// (Streams) The number of batches to process from each shard concurrently.
  Future<EventSourceMappingConfiguration> updateEventSourceMapping({
    @_s.required String uuid,
    int batchSize,
    bool bisectBatchOnFunctionError,
    DestinationConfig destinationConfig,
    bool enabled,
    String functionName,
    int maximumBatchingWindowInSeconds,
    int maximumRecordAgeInSeconds,
    int maximumRetryAttempts,
    int parallelizationFactor,
  }) async {
    ArgumentError.checkNotNull(uuid, 'uuid');
    _s.validateNumRange(
      'batchSize',
      batchSize,
      1,
      10000,
      isRequired: false,
    );
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: false,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
      isRequired: false,
    );
    _s.validateNumRange(
      'maximumBatchingWindowInSeconds',
      maximumBatchingWindowInSeconds,
      0,
      300,
      isRequired: false,
    );
    _s.validateNumRange(
      'maximumRecordAgeInSeconds',
      maximumRecordAgeInSeconds,
      60,
      604800,
      isRequired: false,
    );
    _s.validateNumRange(
      'maximumRetryAttempts',
      maximumRetryAttempts,
      0,
      10000,
      isRequired: false,
    );
    _s.validateNumRange(
      'parallelizationFactor',
      parallelizationFactor,
      1,
      10,
      isRequired: false,
    );
    final $payload = <String, dynamic>{
      'BatchSize': batchSize,
      'BisectBatchOnFunctionError': bisectBatchOnFunctionError,
      'DestinationConfig': destinationConfig,
      'Enabled': enabled,
      'FunctionName': functionName,
      'MaximumBatchingWindowInSeconds': maximumBatchingWindowInSeconds,
      'MaximumRecordAgeInSeconds': maximumRecordAgeInSeconds,
      'MaximumRetryAttempts': maximumRetryAttempts,
      'ParallelizationFactor': parallelizationFactor,
    };
    await _protocol.send(
      $payload,
      method: 'PUT',
      requestUri: '/2015-03-31/event-source-mappings/$uuid',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
  }

  /// Updates a Lambda function's code.
  ///
  /// The function's code is locked when you publish a version. You can't modify
  /// the code of a published version, only the unpublished version.
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
  /// An Amazon S3 bucket in the same AWS Region as your function. The bucket
  /// can be in a different AWS account.
  ///
  /// Parameter [s3Key] :
  /// The Amazon S3 key of the deployment package.
  ///
  /// Parameter [s3ObjectVersion] :
  /// For versioned objects, the version of the deployment package object to
  /// use.
  ///
  /// Parameter [zipFile] :
  /// The base64-encoded contents of the deployment package. AWS SDK and AWS CLI
  /// clients handle the encoding for you.
  Future<FunctionConfiguration> updateFunctionCode({
    @_s.required String functionName,
    bool dryRun,
    bool publish,
    String revisionId,
    String s3Bucket,
    String s3Key,
    String s3ObjectVersion,
    Uint8List zipFile,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
      isRequired: true,
    );
    _s.validateStringLength(
      's3Bucket',
      s3Bucket,
      3,
      63,
      isRequired: false,
    );
    _s.validateStringPattern(
      's3Bucket',
      s3Bucket,
      r'''^[0-9A-Za-z\.\-_]*(?<!\.)$''',
      isRequired: false,
    );
    _s.validateStringLength(
      's3Key',
      s3Key,
      1,
      1024,
      isRequired: false,
    );
    _s.validateStringLength(
      's3ObjectVersion',
      s3ObjectVersion,
      1,
      1024,
      isRequired: false,
    );
    final $payload = <String, dynamic>{
      'DryRun': dryRun,
      'Publish': publish,
      'RevisionId': revisionId,
      'S3Bucket': s3Bucket,
      'S3Key': s3Key,
      'S3ObjectVersion': s3ObjectVersion,
      'ZipFile': zipFile,
    };
    await _protocol.send(
      $payload,
      method: 'PUT',
      requestUri: '/2015-03-31/functions/$functionName/code',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
  /// grant invoke permissions to an account or AWS service, use
  /// <a>AddPermission</a>.
  ///
  /// May throw [ServiceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceConflictException].
  /// May throw [PreconditionFailedException].
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
  /// Parameter [handler] :
  /// The name of the method within your code that Lambda calls to execute your
  /// function. The format includes the file name. It can also include
  /// namespaces and other qualifiers, depending on the runtime. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/programming-model-v2.html">Programming
  /// Model</a>.
  ///
  /// Parameter [kMSKeyArn] :
  /// The ARN of the AWS Key Management Service (AWS KMS) key that's used to
  /// encrypt your function's environment variables. If it's not provided, AWS
  /// Lambda uses a default service key.
  ///
  /// Parameter [layers] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">function
  /// layers</a> to add to the function's execution environment. Specify each
  /// layer by its ARN, including the version.
  ///
  /// Parameter [memorySize] :
  /// The amount of memory that your function has access to. Increasing the
  /// function's memory also increases its CPU allocation. The default value is
  /// 128 MB. The value must be a multiple of 64 MB.
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
  ///
  /// Parameter [tracingConfig] :
  /// Set <code>Mode</code> to <code>Active</code> to sample and trace a subset
  /// of incoming requests with AWS X-Ray.
  ///
  /// Parameter [vpcConfig] :
  /// For network connectivity to AWS resources in a VPC, specify a list of
  /// security groups and subnets in the VPC. When you connect a function to a
  /// VPC, it can only access resources and the internet through that VPC. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-vpc.html">VPC
  /// Settings</a>.
  Future<FunctionConfiguration> updateFunctionConfiguration({
    @_s.required String functionName,
    DeadLetterConfig deadLetterConfig,
    String description,
    Environment environment,
    String handler,
    String kMSKeyArn,
    List<String> layers,
    int memorySize,
    String revisionId,
    String role,
    Runtime runtime,
    int timeout,
    TracingConfig tracingConfig,
    VpcConfig vpcConfig,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
      isRequired: false,
    );
    _s.validateStringLength(
      'handler',
      handler,
      0,
      128,
      isRequired: false,
    );
    _s.validateStringPattern(
      'handler',
      handler,
      r'''[^\s]+''',
      isRequired: false,
    );
    _s.validateStringPattern(
      'kMSKeyArn',
      kMSKeyArn,
      r'''(arn:(aws[a-zA-Z-]*)?:[a-z0-9-.]+:.*)|()''',
      isRequired: false,
    );
    _s.validateNumRange(
      'memorySize',
      memorySize,
      128,
      3008,
      isRequired: false,
    );
    _s.validateStringPattern(
      'role',
      role,
      r'''arn:(aws[a-zA-Z-]*)?:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+''',
      isRequired: false,
    );
    _s.validateNumRange(
      'timeout',
      timeout,
      1,
      1152921504606846976,
      isRequired: false,
    );
    final $payload = <String, dynamic>{
      'DeadLetterConfig': deadLetterConfig,
      'Description': description,
      'Environment': environment,
      'Handler': handler,
      'KMSKeyArn': kMSKeyArn,
      'Layers': layers,
      'MemorySize': memorySize,
      'RevisionId': revisionId,
      'Role': role,
      'Runtime': runtime,
      'Timeout': timeout,
      'TracingConfig': tracingConfig,
      'VpcConfig': vpcConfig,
    };
    await _protocol.send(
      $payload,
      method: 'PUT',
      requestUri: '/2015-03-31/functions/$functionName/configuration',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
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
    @_s.required String functionName,
    DestinationConfig destinationConfig,
    int maximumEventAgeInSeconds,
    int maximumRetryAttempts,
    String qualifier,
  }) async {
    ArgumentError.checkNotNull(functionName, 'functionName');
    _s.validateStringLength(
      'functionName',
      functionName,
      1,
      140,
      isRequired: true,
    );
    _s.validateStringPattern(
      'functionName',
      functionName,
      r'''(arn:(aws[a-zA-Z-]*)?:lambda:)?([a-z]{2}(-gov)?-[a-z]+-\d{1}:)?(\d{12}:)?(function:)?([a-zA-Z0-9-_]+)(:(\$LATEST|[a-zA-Z0-9-_]+))?''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maximumEventAgeInSeconds',
      maximumEventAgeInSeconds,
      60,
      21600,
      isRequired: false,
    );
    _s.validateNumRange(
      'maximumRetryAttempts',
      maximumRetryAttempts,
      0,
      2,
      isRequired: false,
    );
    _s.validateStringLength(
      'qualifier',
      qualifier,
      1,
      128,
      isRequired: false,
    );
    _s.validateStringPattern(
      'qualifier',
      qualifier,
      r'''(|[a-zA-Z0-9$_-]+)''',
      isRequired: false,
    );
    final $payload = <String, dynamic>{
      'DestinationConfig': destinationConfig,
      'MaximumEventAgeInSeconds': maximumEventAgeInSeconds,
      'MaximumRetryAttempts': maximumRetryAttempts,
    };
    await _protocol.send(
      $payload,
      method: 'POST',
      requestUri: '/2019-09-25/functions/$functionName/event-invoke-config',
      exceptionFnMap: _exceptionFns,
    );
// TODO: implement rest-json
    throw UnimplementedError();
  }
}

/// Limits that are related to concurrency and storage. All file and storage
/// sizes are in bytes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AccountLimit {
  /// The maximum size of a function's deployment package and layers when they're
  /// extracted.
  @_s.JsonKey(name: 'CodeSizeUnzipped')
  final int codeSizeUnzipped;

  /// The maximum size of a deployment package when it's uploaded directly to AWS
  /// Lambda. Use Amazon S3 for larger files.
  @_s.JsonKey(name: 'CodeSizeZipped')
  final int codeSizeZipped;

  /// The maximum number of simultaneous function executions.
  @_s.JsonKey(name: 'ConcurrentExecutions')
  final int concurrentExecutions;

  /// The amount of storage space that you can use for all deployment packages and
  /// layer archives.
  @_s.JsonKey(name: 'TotalCodeSize')
  final int totalCodeSize;

  /// The maximum number of simultaneous function executions, minus the capacity
  /// that's reserved for individual functions with <a>PutFunctionConcurrency</a>.
  @_s.JsonKey(name: 'UnreservedConcurrentExecutions')
  final int unreservedConcurrentExecutions;

  AccountLimit({
    this.codeSizeUnzipped,
    this.codeSizeZipped,
    this.concurrentExecutions,
    this.totalCodeSize,
    this.unreservedConcurrentExecutions,
  });
  factory AccountLimit.fromJson(Map<String, dynamic> json) =>
      _$AccountLimitFromJson(json);
}

/// The number of functions and amount of storage in use.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AccountUsage {
  /// The number of Lambda functions.
  @_s.JsonKey(name: 'FunctionCount')
  final int functionCount;

  /// The amount of storage space, in bytes, that's being used by deployment
  /// packages and layer archives.
  @_s.JsonKey(name: 'TotalCodeSize')
  final int totalCodeSize;

  AccountUsage({
    this.functionCount,
    this.totalCodeSize,
  });
  factory AccountUsage.fromJson(Map<String, dynamic> json) =>
      _$AccountUsageFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddLayerVersionPermissionResponse {
  /// A unique identifier for the current revision of the policy.
  @_s.JsonKey(name: 'RevisionId')
  final String revisionId;

  /// The permission statement.
  @_s.JsonKey(name: 'Statement')
  final String statement;

  AddLayerVersionPermissionResponse({
    this.revisionId,
    this.statement,
  });
  factory AddLayerVersionPermissionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AddLayerVersionPermissionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddPermissionResponse {
  /// The permission statement that's added to the function policy.
  @_s.JsonKey(name: 'Statement')
  final String statement;

  AddPermissionResponse({
    this.statement,
  });
  factory AddPermissionResponse.fromJson(Map<String, dynamic> json) =>
      _$AddPermissionResponseFromJson(json);
}

/// Provides configuration information about a Lambda function <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html">alias</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AliasConfiguration {
  /// The Amazon Resource Name (ARN) of the alias.
  @_s.JsonKey(name: 'AliasArn')
  final String aliasArn;

  /// A description of the alias.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The function version that the alias invokes.
  @_s.JsonKey(name: 'FunctionVersion')
  final String functionVersion;

  /// The name of the alias.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A unique identifier that changes when you update the alias.
  @_s.JsonKey(name: 'RevisionId')
  final String revisionId;

  /// The <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-traffic-shifting-using-aliases.html">routing
  /// configuration</a> of the alias.
  @_s.JsonKey(name: 'RoutingConfig')
  final AliasRoutingConfiguration routingConfig;

  AliasConfiguration({
    this.aliasArn,
    this.description,
    this.functionVersion,
    this.name,
    this.revisionId,
    this.routingConfig,
  });
  factory AliasConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AliasConfigurationFromJson(json);
}

/// The <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/lambda-traffic-shifting-using-aliases.html">traffic-shifting</a>
/// configuration of a Lambda function alias.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AliasRoutingConfiguration {
  /// The name of the second alias, and the percentage of traffic that's routed to
  /// it.
  @_s.JsonKey(name: 'AdditionalVersionWeights')
  final Map<String, double> additionalVersionWeights;

  AliasRoutingConfiguration({
    this.additionalVersionWeights,
  });
  factory AliasRoutingConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AliasRoutingConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$AliasRoutingConfigurationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Concurrency {
  /// The number of concurrent executions that are reserved for this function. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html">Managing
  /// Concurrency</a>.
  @_s.JsonKey(name: 'ReservedConcurrentExecutions')
  final int reservedConcurrentExecutions;

  Concurrency({
    this.reservedConcurrentExecutions,
  });
  factory Concurrency.fromJson(Map<String, dynamic> json) =>
      _$ConcurrencyFromJson(json);
}

/// The <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#dlq">dead-letter
/// queue</a> for failed asynchronous invocations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DeadLetterConfig {
  /// The Amazon Resource Name (ARN) of an Amazon SQS queue or Amazon SNS topic.
  @_s.JsonKey(name: 'TargetArn')
  final String targetArn;

  DeadLetterConfig({
    this.targetArn,
  });
  factory DeadLetterConfig.fromJson(Map<String, dynamic> json) =>
      _$DeadLetterConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DeadLetterConfigToJson(this);
}

/// A configuration object that specifies the destination of an event after
/// Lambda processes it.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DestinationConfig {
  /// The destination configuration for failed invocations.
  @_s.JsonKey(name: 'OnFailure')
  final OnFailure onFailure;

  /// The destination configuration for successful invocations.
  @_s.JsonKey(name: 'OnSuccess')
  final OnSuccess onSuccess;

  DestinationConfig({
    this.onFailure,
    this.onSuccess,
  });
  factory DestinationConfig.fromJson(Map<String, dynamic> json) =>
      _$DestinationConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DestinationConfigToJson(this);
}

/// A function's environment variable settings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Environment {
  /// Environment variable key-value pairs.
  @_s.JsonKey(name: 'Variables')
  final Map<String, String> variables;

  Environment({
    this.variables,
  });
  Map<String, dynamic> toJson() => _$EnvironmentToJson(this);
}

/// Error messages for environment variables that couldn't be applied.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EnvironmentError {
  /// The error code.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// The error message.
  @_s.JsonKey(name: 'Message')
  final String message;

  EnvironmentError({
    this.errorCode,
    this.message,
  });
  factory EnvironmentError.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentErrorFromJson(json);
}

/// The results of an operation to update or read environment variables. If the
/// operation is successful, the response contains the environment variables. If
/// it failed, the response contains details about the error.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EnvironmentResponse {
  /// Error messages for environment variables that couldn't be applied.
  @_s.JsonKey(name: 'Error')
  final EnvironmentError error;

  /// Environment variable key-value pairs.
  @_s.JsonKey(name: 'Variables')
  final Map<String, String> variables;

  EnvironmentResponse({
    this.error,
    this.variables,
  });
  factory EnvironmentResponse.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentResponseFromJson(json);
}

/// A mapping between an AWS resource and an AWS Lambda function. See
/// <a>CreateEventSourceMapping</a> for details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EventSourceMappingConfiguration {
  /// The maximum number of items to retrieve in a single batch.
  @_s.JsonKey(name: 'BatchSize')
  final int batchSize;

  /// (Streams) If the function returns an error, split the batch in two and
  /// retry.
  @_s.JsonKey(name: 'BisectBatchOnFunctionError')
  final bool bisectBatchOnFunctionError;

  /// (Streams) An Amazon SQS queue or Amazon SNS topic destination for discarded
  /// records.
  @_s.JsonKey(name: 'DestinationConfig')
  final DestinationConfig destinationConfig;

  /// The Amazon Resource Name (ARN) of the event source.
  @_s.JsonKey(name: 'EventSourceArn')
  final String eventSourceArn;

  /// The ARN of the Lambda function.
  @_s.JsonKey(name: 'FunctionArn')
  final String functionArn;

  /// The date that the event source mapping was last updated, or its state
  /// changed.
  @_s.JsonKey(name: 'LastModified', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModified;

  /// The result of the last AWS Lambda invocation of your Lambda function.
  @_s.JsonKey(name: 'LastProcessingResult')
  final String lastProcessingResult;

  /// (Streams) The maximum amount of time to gather records before invoking the
  /// function, in seconds.
  @_s.JsonKey(name: 'MaximumBatchingWindowInSeconds')
  final int maximumBatchingWindowInSeconds;

  /// (Streams) The maximum age of a record that Lambda sends to a function for
  /// processing.
  @_s.JsonKey(name: 'MaximumRecordAgeInSeconds')
  final int maximumRecordAgeInSeconds;

  /// (Streams) The maximum number of times to retry when the function returns an
  /// error.
  @_s.JsonKey(name: 'MaximumRetryAttempts')
  final int maximumRetryAttempts;

  /// (Streams) The number of batches to process from each shard concurrently.
  @_s.JsonKey(name: 'ParallelizationFactor')
  final int parallelizationFactor;

  /// The state of the event source mapping. It can be one of the following:
  /// <code>Creating</code>, <code>Enabling</code>, <code>Enabled</code>,
  /// <code>Disabling</code>, <code>Disabled</code>, <code>Updating</code>, or
  /// <code>Deleting</code>.
  @_s.JsonKey(name: 'State')
  final String state;

  /// Indicates whether the last change to the event source mapping was made by a
  /// user, or by the Lambda service.
  @_s.JsonKey(name: 'StateTransitionReason')
  final String stateTransitionReason;

  /// The identifier of the event source mapping.
  @_s.JsonKey(name: 'UUID')
  final String uuid;

  EventSourceMappingConfiguration({
    this.batchSize,
    this.bisectBatchOnFunctionError,
    this.destinationConfig,
    this.eventSourceArn,
    this.functionArn,
    this.lastModified,
    this.lastProcessingResult,
    this.maximumBatchingWindowInSeconds,
    this.maximumRecordAgeInSeconds,
    this.maximumRetryAttempts,
    this.parallelizationFactor,
    this.state,
    this.stateTransitionReason,
    this.uuid,
  });
  factory EventSourceMappingConfiguration.fromJson(Map<String, dynamic> json) =>
      _$EventSourceMappingConfigurationFromJson(json);
}

enum EventSourcePosition {
  @_s.JsonValue('TRIM_HORIZON')
  trimHorizon,
  @_s.JsonValue('LATEST')
  latest,
  @_s.JsonValue('AT_TIMESTAMP')
  atTimestamp,
}

/// The code for the Lambda function. You can specify either an object in Amazon
/// S3, or upload a deployment package directly.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class FunctionCode {
  /// An Amazon S3 bucket in the same AWS Region as your function. The bucket can
  /// be in a different AWS account.
  @_s.JsonKey(name: 'S3Bucket')
  final String s3Bucket;

  /// The Amazon S3 key of the deployment package.
  @_s.JsonKey(name: 'S3Key')
  final String s3Key;

  /// For versioned objects, the version of the deployment package object to use.
  @_s.JsonKey(name: 'S3ObjectVersion')
  final String s3ObjectVersion;

  /// The base64-encoded contents of the deployment package. AWS SDK and AWS CLI
  /// clients handle the encoding for you.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'ZipFile')
  final Uint8List zipFile;

  FunctionCode({
    this.s3Bucket,
    this.s3Key,
    this.s3ObjectVersion,
    this.zipFile,
  });
  Map<String, dynamic> toJson() => _$FunctionCodeToJson(this);
}

/// Details about a function's deployment package.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FunctionCodeLocation {
  /// A presigned URL that you can use to download the deployment package.
  @_s.JsonKey(name: 'Location')
  final String location;

  /// The service that's hosting the file.
  @_s.JsonKey(name: 'RepositoryType')
  final String repositoryType;

  FunctionCodeLocation({
    this.location,
    this.repositoryType,
  });
  factory FunctionCodeLocation.fromJson(Map<String, dynamic> json) =>
      _$FunctionCodeLocationFromJson(json);
}

/// Details about a function's configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FunctionConfiguration {
  /// The SHA256 hash of the function's deployment package.
  @_s.JsonKey(name: 'CodeSha256')
  final String codeSha256;

  /// The size of the function's deployment package, in bytes.
  @_s.JsonKey(name: 'CodeSize')
  final int codeSize;

  /// The function's dead letter queue.
  @_s.JsonKey(name: 'DeadLetterConfig')
  final DeadLetterConfig deadLetterConfig;

  /// The function's description.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The function's environment variables.
  @_s.JsonKey(name: 'Environment')
  final EnvironmentResponse environment;

  /// The function's Amazon Resource Name (ARN).
  @_s.JsonKey(name: 'FunctionArn')
  final String functionArn;

  /// The name of the function.
  @_s.JsonKey(name: 'FunctionName')
  final String functionName;

  /// The function that Lambda calls to begin executing your function.
  @_s.JsonKey(name: 'Handler')
  final String handler;

  /// The KMS key that's used to encrypt the function's environment variables.
  /// This key is only returned if you've configured a customer managed CMK.
  @_s.JsonKey(name: 'KMSKeyArn')
  final String kMSKeyArn;

  /// The date and time that the function was last updated, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  @_s.JsonKey(name: 'LastModified')
  final String lastModified;

  /// The status of the last update that was performed on the function. This is
  /// first set to <code>Successful</code> after function creation completes.
  @_s.JsonKey(name: 'LastUpdateStatus')
  final LastUpdateStatus lastUpdateStatus;

  /// The reason for the last update that was performed on the function.
  @_s.JsonKey(name: 'LastUpdateStatusReason')
  final String lastUpdateStatusReason;

  /// The reason code for the last update that was performed on the function.
  @_s.JsonKey(name: 'LastUpdateStatusReasonCode')
  final LastUpdateStatusReasonCode lastUpdateStatusReasonCode;

  /// The function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">
  /// layers</a>.
  @_s.JsonKey(name: 'Layers')
  final List<Layer> layers;

  /// For Lambda@Edge functions, the ARN of the master function.
  @_s.JsonKey(name: 'MasterArn')
  final String masterArn;

  /// The memory that's allocated to the function.
  @_s.JsonKey(name: 'MemorySize')
  final int memorySize;

  /// The latest updated revision of the function or alias.
  @_s.JsonKey(name: 'RevisionId')
  final String revisionId;

  /// The function's execution role.
  @_s.JsonKey(name: 'Role')
  final String role;

  /// The runtime environment for the Lambda function.
  @_s.JsonKey(name: 'Runtime')
  final Runtime runtime;

  /// The current state of the function. When the state is <code>Inactive</code>,
  /// you can reactivate the function by invoking it.
  @_s.JsonKey(name: 'State')
  final State state;

  /// The reason for the function's current state.
  @_s.JsonKey(name: 'StateReason')
  final String stateReason;

  /// The reason code for the function's current state. When the code is
  /// <code>Creating</code>, you can't invoke or modify the function.
  @_s.JsonKey(name: 'StateReasonCode')
  final StateReasonCode stateReasonCode;

  /// The amount of time that Lambda allows a function to run before stopping it.
  @_s.JsonKey(name: 'Timeout')
  final int timeout;

  /// The function's AWS X-Ray tracing configuration.
  @_s.JsonKey(name: 'TracingConfig')
  final TracingConfigResponse tracingConfig;

  /// The version of the Lambda function.
  @_s.JsonKey(name: 'Version')
  final String version;

  /// The function's networking configuration.
  @_s.JsonKey(name: 'VpcConfig')
  final VpcConfigResponse vpcConfig;

  FunctionConfiguration({
    this.codeSha256,
    this.codeSize,
    this.deadLetterConfig,
    this.description,
    this.environment,
    this.functionArn,
    this.functionName,
    this.handler,
    this.kMSKeyArn,
    this.lastModified,
    this.lastUpdateStatus,
    this.lastUpdateStatusReason,
    this.lastUpdateStatusReasonCode,
    this.layers,
    this.masterArn,
    this.memorySize,
    this.revisionId,
    this.role,
    this.runtime,
    this.state,
    this.stateReason,
    this.stateReasonCode,
    this.timeout,
    this.tracingConfig,
    this.version,
    this.vpcConfig,
  });
  factory FunctionConfiguration.fromJson(Map<String, dynamic> json) =>
      _$FunctionConfigurationFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
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
  @_s.JsonKey(name: 'DestinationConfig')
  final DestinationConfig destinationConfig;

  /// The Amazon Resource Name (ARN) of the function.
  @_s.JsonKey(name: 'FunctionArn')
  final String functionArn;

  /// The date and time that the configuration was last updated.
  @_s.JsonKey(name: 'LastModified', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModified;

  /// The maximum age of a request that Lambda sends to a function for processing.
  @_s.JsonKey(name: 'MaximumEventAgeInSeconds')
  final int maximumEventAgeInSeconds;

  /// The maximum number of times to retry when the function returns an error.
  @_s.JsonKey(name: 'MaximumRetryAttempts')
  final int maximumRetryAttempts;

  FunctionEventInvokeConfig({
    this.destinationConfig,
    this.functionArn,
    this.lastModified,
    this.maximumEventAgeInSeconds,
    this.maximumRetryAttempts,
  });
  factory FunctionEventInvokeConfig.fromJson(Map<String, dynamic> json) =>
      _$FunctionEventInvokeConfigFromJson(json);
}

enum FunctionVersion {
  @_s.JsonValue('ALL')
  all,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAccountSettingsResponse {
  /// Limits that are related to concurrency and code storage.
  @_s.JsonKey(name: 'AccountLimit')
  final AccountLimit accountLimit;

  /// The number of functions and amount of storage in use.
  @_s.JsonKey(name: 'AccountUsage')
  final AccountUsage accountUsage;

  GetAccountSettingsResponse({
    this.accountLimit,
    this.accountUsage,
  });
  factory GetAccountSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAccountSettingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetFunctionConcurrencyResponse {
  /// The number of simultaneous executions that are reserved for the function.
  @_s.JsonKey(name: 'ReservedConcurrentExecutions')
  final int reservedConcurrentExecutions;

  GetFunctionConcurrencyResponse({
    this.reservedConcurrentExecutions,
  });
  factory GetFunctionConcurrencyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFunctionConcurrencyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetFunctionResponse {
  /// The deployment package of the function or version.
  @_s.JsonKey(name: 'Code')
  final FunctionCodeLocation code;

  /// The function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/concurrent-executions.html">reserved
  /// concurrency</a>.
  @_s.JsonKey(name: 'Concurrency')
  final Concurrency concurrency;

  /// The configuration of the function or version.
  @_s.JsonKey(name: 'Configuration')
  final FunctionConfiguration configuration;

  /// The function's <a
  /// href="https://docs.aws.amazon.com/lambda/latest/dg/tagging.html">tags</a>.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  GetFunctionResponse({
    this.code,
    this.concurrency,
    this.configuration,
    this.tags,
  });
  factory GetFunctionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFunctionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLayerVersionPolicyResponse {
  /// The policy document.
  @_s.JsonKey(name: 'Policy')
  final String policy;

  /// A unique identifier for the current revision of the policy.
  @_s.JsonKey(name: 'RevisionId')
  final String revisionId;

  GetLayerVersionPolicyResponse({
    this.policy,
    this.revisionId,
  });
  factory GetLayerVersionPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLayerVersionPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLayerVersionResponse {
  /// The layer's compatible runtimes.
  @_s.JsonKey(name: 'CompatibleRuntimes')
  final List<String> compatibleRuntimes;

  /// Details about the layer version.
  @_s.JsonKey(name: 'Content')
  final LayerVersionContentOutput content;

  /// The date that the layer version was created, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  @_s.JsonKey(name: 'CreatedDate')
  final String createdDate;

  /// The description of the version.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The ARN of the layer.
  @_s.JsonKey(name: 'LayerArn')
  final String layerArn;

  /// The ARN of the layer version.
  @_s.JsonKey(name: 'LayerVersionArn')
  final String layerVersionArn;

  /// The layer's software license.
  @_s.JsonKey(name: 'LicenseInfo')
  final String licenseInfo;

  /// The version number.
  @_s.JsonKey(name: 'Version')
  final int version;

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
  factory GetLayerVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLayerVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPolicyResponse {
  /// The resource-based policy.
  @_s.JsonKey(name: 'Policy')
  final String policy;

  /// A unique identifier for the current revision of the policy.
  @_s.JsonKey(name: 'RevisionId')
  final String revisionId;

  GetPolicyResponse({
    this.policy,
    this.revisionId,
  });
  factory GetPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetProvisionedConcurrencyConfigResponse {
  /// The amount of provisioned concurrency allocated.
  @_s.JsonKey(name: 'AllocatedProvisionedConcurrentExecutions')
  final int allocatedProvisionedConcurrentExecutions;

  /// The amount of provisioned concurrency available.
  @_s.JsonKey(name: 'AvailableProvisionedConcurrentExecutions')
  final int availableProvisionedConcurrentExecutions;

  /// The date and time that a user last updated the configuration, in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601
  /// format</a>.
  @_s.JsonKey(name: 'LastModified')
  final String lastModified;

  /// The amount of provisioned concurrency requested.
  @_s.JsonKey(name: 'RequestedProvisionedConcurrentExecutions')
  final int requestedProvisionedConcurrentExecutions;

  /// The status of the allocation process.
  @_s.JsonKey(name: 'Status')
  final ProvisionedConcurrencyStatusEnum status;

  /// For failed allocations, the reason that provisioned concurrency could not be
  /// allocated.
  @_s.JsonKey(name: 'StatusReason')
  final String statusReason;

  GetProvisionedConcurrencyConfigResponse({
    this.allocatedProvisionedConcurrentExecutions,
    this.availableProvisionedConcurrentExecutions,
    this.lastModified,
    this.requestedProvisionedConcurrentExecutions,
    this.status,
    this.statusReason,
  });
  factory GetProvisionedConcurrencyConfigResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetProvisionedConcurrencyConfigResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InvocationResponse {
  /// The version of the function that executed. When you invoke a function with
  /// an alias, this indicates which version the alias resolved to.
  @_s.JsonKey(name: 'ExecutedVersion')
  final String executedVersion;

  /// If present, indicates that an error occurred during function execution.
  /// Details about the error are included in the response payload.
  @_s.JsonKey(name: 'FunctionError')
  final String functionError;

  /// The last 4 KB of the execution log, which is base64 encoded.
  @_s.JsonKey(name: 'LogResult')
  final String logResult;

  /// The response from the function, or an error object.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'Payload')
  final Uint8List payload;

  /// The HTTP status code is in the 200 range for a successful request. For the
  /// <code>RequestResponse</code> invocation type, this status code is 200. For
  /// the <code>Event</code> invocation type, this status code is 202. For the
  /// <code>DryRun</code> invocation type, the status code is 204.
  @_s.JsonKey(name: 'StatusCode')
  final int statusCode;

  InvocationResponse({
    this.executedVersion,
    this.functionError,
    this.logResult,
    this.payload,
    this.statusCode,
  });
  factory InvocationResponse.fromJson(Map<String, dynamic> json) =>
      _$InvocationResponseFromJson(json);
}

enum InvocationType {
  @_s.JsonValue('Event')
  event,
  @_s.JsonValue('RequestResponse')
  requestResponse,
  @_s.JsonValue('DryRun')
  dryRun,
}

/// A success response (<code>202 Accepted</code>) indicates that the request is
/// queued for invocation.
@deprecated
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InvokeAsyncResponse {
  /// The status code.
  @_s.JsonKey(name: 'Status')
  final int status;

  InvokeAsyncResponse({
    this.status,
  });
  factory InvokeAsyncResponse.fromJson(Map<String, dynamic> json) =>
      _$InvokeAsyncResponseFromJson(json);
}

enum LastUpdateStatus {
  @_s.JsonValue('Successful')
  successful,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('InProgress')
  inProgress,
}

enum LastUpdateStatusReasonCode {
  @_s.JsonValue('EniLimitExceeded')
  eniLimitExceeded,
  @_s.JsonValue('InsufficientRolePermissions')
  insufficientRolePermissions,
  @_s.JsonValue('InvalidConfiguration')
  invalidConfiguration,
  @_s.JsonValue('InternalError')
  internalError,
  @_s.JsonValue('SubnetOutOfIPAddresses')
  subnetOutOfIPAddresses,
  @_s.JsonValue('InvalidSubnet')
  invalidSubnet,
  @_s.JsonValue('InvalidSecurityGroup')
  invalidSecurityGroup,
}

/// An <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS
/// Lambda layer</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Layer {
  /// The Amazon Resource Name (ARN) of the function layer.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The size of the layer archive in bytes.
  @_s.JsonKey(name: 'CodeSize')
  final int codeSize;

  Layer({
    this.arn,
    this.codeSize,
  });
  factory Layer.fromJson(Map<String, dynamic> json) => _$LayerFromJson(json);
}

/// A ZIP archive that contains the contents of an <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS
/// Lambda layer</a>. You can specify either an Amazon S3 location, or upload a
/// layer archive directly.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LayerVersionContentInput {
  /// The Amazon S3 bucket of the layer archive.
  @_s.JsonKey(name: 'S3Bucket')
  final String s3Bucket;

  /// The Amazon S3 key of the layer archive.
  @_s.JsonKey(name: 'S3Key')
  final String s3Key;

  /// For versioned objects, the version of the layer archive object to use.
  @_s.JsonKey(name: 'S3ObjectVersion')
  final String s3ObjectVersion;

  /// The base64-encoded contents of the layer archive. AWS SDK and AWS CLI
  /// clients handle the encoding for you.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'ZipFile')
  final Uint8List zipFile;

  LayerVersionContentInput({
    this.s3Bucket,
    this.s3Key,
    this.s3ObjectVersion,
    this.zipFile,
  });
  Map<String, dynamic> toJson() => _$LayerVersionContentInputToJson(this);
}

/// Details about a version of an <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS
/// Lambda layer</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LayerVersionContentOutput {
  /// The SHA-256 hash of the layer archive.
  @_s.JsonKey(name: 'CodeSha256')
  final String codeSha256;

  /// The size of the layer archive in bytes.
  @_s.JsonKey(name: 'CodeSize')
  final int codeSize;

  /// A link to the layer archive in Amazon S3 that is valid for 10 minutes.
  @_s.JsonKey(name: 'Location')
  final String location;

  LayerVersionContentOutput({
    this.codeSha256,
    this.codeSize,
    this.location,
  });
  factory LayerVersionContentOutput.fromJson(Map<String, dynamic> json) =>
      _$LayerVersionContentOutputFromJson(json);
}

/// Details about a version of an <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS
/// Lambda layer</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LayerVersionsListItem {
  /// The layer's compatible runtimes.
  @_s.JsonKey(name: 'CompatibleRuntimes')
  final List<String> compatibleRuntimes;

  /// The date that the version was created, in ISO 8601 format. For example,
  /// <code>2018-11-27T15:10:45.123+0000</code>.
  @_s.JsonKey(name: 'CreatedDate')
  final String createdDate;

  /// The description of the version.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The ARN of the layer version.
  @_s.JsonKey(name: 'LayerVersionArn')
  final String layerVersionArn;

  /// The layer's open-source license.
  @_s.JsonKey(name: 'LicenseInfo')
  final String licenseInfo;

  /// The version number.
  @_s.JsonKey(name: 'Version')
  final int version;

  LayerVersionsListItem({
    this.compatibleRuntimes,
    this.createdDate,
    this.description,
    this.layerVersionArn,
    this.licenseInfo,
    this.version,
  });
  factory LayerVersionsListItem.fromJson(Map<String, dynamic> json) =>
      _$LayerVersionsListItemFromJson(json);
}

/// Details about an <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html">AWS
/// Lambda layer</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LayersListItem {
  /// The newest version of the layer.
  @_s.JsonKey(name: 'LatestMatchingVersion')
  final LayerVersionsListItem latestMatchingVersion;

  /// The Amazon Resource Name (ARN) of the function layer.
  @_s.JsonKey(name: 'LayerArn')
  final String layerArn;

  /// The name of the layer.
  @_s.JsonKey(name: 'LayerName')
  final String layerName;

  LayersListItem({
    this.latestMatchingVersion,
    this.layerArn,
    this.layerName,
  });
  factory LayersListItem.fromJson(Map<String, dynamic> json) =>
      _$LayersListItemFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAliasesResponse {
  /// A list of aliases.
  @_s.JsonKey(name: 'Aliases')
  final List<AliasConfiguration> aliases;

  /// The pagination token that's included if more results are available.
  @_s.JsonKey(name: 'NextMarker')
  final String nextMarker;

  ListAliasesResponse({
    this.aliases,
    this.nextMarker,
  });
  factory ListAliasesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAliasesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListEventSourceMappingsResponse {
  /// A list of event source mappings.
  @_s.JsonKey(name: 'EventSourceMappings')
  final List<EventSourceMappingConfiguration> eventSourceMappings;

  /// A pagination token that's returned when the response doesn't contain all
  /// event source mappings.
  @_s.JsonKey(name: 'NextMarker')
  final String nextMarker;

  ListEventSourceMappingsResponse({
    this.eventSourceMappings,
    this.nextMarker,
  });
  factory ListEventSourceMappingsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListEventSourceMappingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFunctionEventInvokeConfigsResponse {
  /// A list of configurations.
  @_s.JsonKey(name: 'FunctionEventInvokeConfigs')
  final List<FunctionEventInvokeConfig> functionEventInvokeConfigs;

  /// The pagination token that's included if more results are available.
  @_s.JsonKey(name: 'NextMarker')
  final String nextMarker;

  ListFunctionEventInvokeConfigsResponse({
    this.functionEventInvokeConfigs,
    this.nextMarker,
  });
  factory ListFunctionEventInvokeConfigsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListFunctionEventInvokeConfigsResponseFromJson(json);
}

/// A list of Lambda functions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFunctionsResponse {
  /// A list of Lambda functions.
  @_s.JsonKey(name: 'Functions')
  final List<FunctionConfiguration> functions;

  /// The pagination token that's included if more results are available.
  @_s.JsonKey(name: 'NextMarker')
  final String nextMarker;

  ListFunctionsResponse({
    this.functions,
    this.nextMarker,
  });
  factory ListFunctionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFunctionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListLayerVersionsResponse {
  /// A list of versions.
  @_s.JsonKey(name: 'LayerVersions')
  final List<LayerVersionsListItem> layerVersions;

  /// A pagination token returned when the response doesn't contain all versions.
  @_s.JsonKey(name: 'NextMarker')
  final String nextMarker;

  ListLayerVersionsResponse({
    this.layerVersions,
    this.nextMarker,
  });
  factory ListLayerVersionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListLayerVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListLayersResponse {
  /// A list of function layers.
  @_s.JsonKey(name: 'Layers')
  final List<LayersListItem> layers;

  /// A pagination token returned when the response doesn't contain all layers.
  @_s.JsonKey(name: 'NextMarker')
  final String nextMarker;

  ListLayersResponse({
    this.layers,
    this.nextMarker,
  });
  factory ListLayersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListLayersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProvisionedConcurrencyConfigsResponse {
  /// The pagination token that's included if more results are available.
  @_s.JsonKey(name: 'NextMarker')
  final String nextMarker;

  /// A list of provisioned concurrency configurations.
  @_s.JsonKey(name: 'ProvisionedConcurrencyConfigs')
  final List<ProvisionedConcurrencyConfigListItem>
      provisionedConcurrencyConfigs;

  ListProvisionedConcurrencyConfigsResponse({
    this.nextMarker,
    this.provisionedConcurrencyConfigs,
  });
  factory ListProvisionedConcurrencyConfigsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListProvisionedConcurrencyConfigsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsResponse {
  /// The function's tags.
  @_s.JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListTagsResponse({
    this.tags,
  });
  factory ListTagsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListVersionsByFunctionResponse {
  /// The pagination token that's included if more results are available.
  @_s.JsonKey(name: 'NextMarker')
  final String nextMarker;

  /// A list of Lambda function versions.
  @_s.JsonKey(name: 'Versions')
  final List<FunctionConfiguration> versions;

  ListVersionsByFunctionResponse({
    this.nextMarker,
    this.versions,
  });
  factory ListVersionsByFunctionResponse.fromJson(Map<String, dynamic> json) =>
      _$ListVersionsByFunctionResponseFromJson(json);
}

enum LogType {
  @_s.JsonValue('None')
  none,
  @_s.JsonValue('Tail')
  tail,
}

/// A destination for events that failed processing.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OnFailure {
  /// The Amazon Resource Name (ARN) of the destination resource.
  @_s.JsonKey(name: 'Destination')
  final String destination;

  OnFailure({
    this.destination,
  });
  factory OnFailure.fromJson(Map<String, dynamic> json) =>
      _$OnFailureFromJson(json);

  Map<String, dynamic> toJson() => _$OnFailureToJson(this);
}

/// A destination for events that were processed successfully.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OnSuccess {
  /// The Amazon Resource Name (ARN) of the destination resource.
  @_s.JsonKey(name: 'Destination')
  final String destination;

  OnSuccess({
    this.destination,
  });
  factory OnSuccess.fromJson(Map<String, dynamic> json) =>
      _$OnSuccessFromJson(json);

  Map<String, dynamic> toJson() => _$OnSuccessToJson(this);
}

/// Details about the provisioned concurrency configuration for a function alias
/// or version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProvisionedConcurrencyConfigListItem {
  /// The amount of provisioned concurrency allocated.
  @_s.JsonKey(name: 'AllocatedProvisionedConcurrentExecutions')
  final int allocatedProvisionedConcurrentExecutions;

  /// The amount of provisioned concurrency available.
  @_s.JsonKey(name: 'AvailableProvisionedConcurrentExecutions')
  final int availableProvisionedConcurrentExecutions;

  /// The Amazon Resource Name (ARN) of the alias or version.
  @_s.JsonKey(name: 'FunctionArn')
  final String functionArn;

  /// The date and time that a user last updated the configuration, in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601
  /// format</a>.
  @_s.JsonKey(name: 'LastModified')
  final String lastModified;

  /// The amount of provisioned concurrency requested.
  @_s.JsonKey(name: 'RequestedProvisionedConcurrentExecutions')
  final int requestedProvisionedConcurrentExecutions;

  /// The status of the allocation process.
  @_s.JsonKey(name: 'Status')
  final ProvisionedConcurrencyStatusEnum status;

  /// For failed allocations, the reason that provisioned concurrency could not be
  /// allocated.
  @_s.JsonKey(name: 'StatusReason')
  final String statusReason;

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
          Map<String, dynamic> json) =>
      _$ProvisionedConcurrencyConfigListItemFromJson(json);
}

enum ProvisionedConcurrencyStatusEnum {
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('READY')
  ready,
  @_s.JsonValue('FAILED')
  failed,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PublishLayerVersionResponse {
  /// The layer's compatible runtimes.
  @_s.JsonKey(name: 'CompatibleRuntimes')
  final List<String> compatibleRuntimes;

  /// Details about the layer version.
  @_s.JsonKey(name: 'Content')
  final LayerVersionContentOutput content;

  /// The date that the layer version was created, in <a
  /// href="https://www.w3.org/TR/NOTE-datetime">ISO-8601 format</a>
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  @_s.JsonKey(name: 'CreatedDate')
  final String createdDate;

  /// The description of the version.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The ARN of the layer.
  @_s.JsonKey(name: 'LayerArn')
  final String layerArn;

  /// The ARN of the layer version.
  @_s.JsonKey(name: 'LayerVersionArn')
  final String layerVersionArn;

  /// The layer's software license.
  @_s.JsonKey(name: 'LicenseInfo')
  final String licenseInfo;

  /// The version number.
  @_s.JsonKey(name: 'Version')
  final int version;

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
  factory PublishLayerVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$PublishLayerVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutProvisionedConcurrencyConfigResponse {
  /// The amount of provisioned concurrency allocated.
  @_s.JsonKey(name: 'AllocatedProvisionedConcurrentExecutions')
  final int allocatedProvisionedConcurrentExecutions;

  /// The amount of provisioned concurrency available.
  @_s.JsonKey(name: 'AvailableProvisionedConcurrentExecutions')
  final int availableProvisionedConcurrentExecutions;

  /// The date and time that a user last updated the configuration, in <a
  /// href="https://www.iso.org/iso-8601-date-and-time-format.html">ISO 8601
  /// format</a>.
  @_s.JsonKey(name: 'LastModified')
  final String lastModified;

  /// The amount of provisioned concurrency requested.
  @_s.JsonKey(name: 'RequestedProvisionedConcurrentExecutions')
  final int requestedProvisionedConcurrentExecutions;

  /// The status of the allocation process.
  @_s.JsonKey(name: 'Status')
  final ProvisionedConcurrencyStatusEnum status;

  /// For failed allocations, the reason that provisioned concurrency could not be
  /// allocated.
  @_s.JsonKey(name: 'StatusReason')
  final String statusReason;

  PutProvisionedConcurrencyConfigResponse({
    this.allocatedProvisionedConcurrentExecutions,
    this.availableProvisionedConcurrentExecutions,
    this.lastModified,
    this.requestedProvisionedConcurrentExecutions,
    this.status,
    this.statusReason,
  });
  factory PutProvisionedConcurrencyConfigResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutProvisionedConcurrencyConfigResponseFromJson(json);
}

enum Runtime {
  @_s.JsonValue('nodejs')
  nodejs,
  @_s.JsonValue('nodejs4.3')
  nodejs4_3,
  @_s.JsonValue('nodejs6.10')
  nodejs6_10,
  @_s.JsonValue('nodejs8.10')
  nodejs8_10,
  @_s.JsonValue('nodejs10.x')
  nodejs10X,
  @_s.JsonValue('nodejs12.x')
  nodejs12X,
  @_s.JsonValue('java8')
  java8,
  @_s.JsonValue('java11')
  java11,
  @_s.JsonValue('python2.7')
  python2_7,
  @_s.JsonValue('python3.6')
  python3_6,
  @_s.JsonValue('python3.7')
  python3_7,
  @_s.JsonValue('python3.8')
  python3_8,
  @_s.JsonValue('dotnetcore1.0')
  dotnetcore1_0,
  @_s.JsonValue('dotnetcore2.0')
  dotnetcore2_0,
  @_s.JsonValue('dotnetcore2.1')
  dotnetcore2_1,
  @_s.JsonValue('dotnetcore3.1')
  dotnetcore3_1,
  @_s.JsonValue('nodejs4.3-edge')
  nodejs4_3Edge,
  @_s.JsonValue('go1.x')
  go1X,
  @_s.JsonValue('ruby2.5')
  ruby2_5,
  @_s.JsonValue('ruby2.7')
  ruby2_7,
  @_s.JsonValue('provided')
  provided,
}

enum State {
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('Active')
  active,
  @_s.JsonValue('Inactive')
  inactive,
  @_s.JsonValue('Failed')
  failed,
}

enum StateReasonCode {
  @_s.JsonValue('Idle')
  idle,
  @_s.JsonValue('Creating')
  creating,
  @_s.JsonValue('Restoring')
  restoring,
  @_s.JsonValue('EniLimitExceeded')
  eniLimitExceeded,
  @_s.JsonValue('InsufficientRolePermissions')
  insufficientRolePermissions,
  @_s.JsonValue('InvalidConfiguration')
  invalidConfiguration,
  @_s.JsonValue('InternalError')
  internalError,
  @_s.JsonValue('SubnetOutOfIPAddresses')
  subnetOutOfIPAddresses,
  @_s.JsonValue('InvalidSubnet')
  invalidSubnet,
  @_s.JsonValue('InvalidSecurityGroup')
  invalidSecurityGroup,
}

/// The function's AWS X-Ray tracing configuration. To sample and record
/// incoming requests, set <code>Mode</code> to <code>Active</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TracingConfig {
  /// The tracing mode.
  @_s.JsonKey(name: 'Mode')
  final TracingMode mode;

  TracingConfig({
    this.mode,
  });
  Map<String, dynamic> toJson() => _$TracingConfigToJson(this);
}

/// The function's AWS X-Ray tracing configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TracingConfigResponse {
  /// The tracing mode.
  @_s.JsonKey(name: 'Mode')
  final TracingMode mode;

  TracingConfigResponse({
    this.mode,
  });
  factory TracingConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$TracingConfigResponseFromJson(json);
}

enum TracingMode {
  @_s.JsonValue('Active')
  active,
  @_s.JsonValue('PassThrough')
  passThrough,
}

/// The VPC security groups and subnets that are attached to a Lambda function.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/lambda/latest/dg/configuration-vpc.html">VPC
/// Settings</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class VpcConfig {
  /// A list of VPC security groups IDs.
  @_s.JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

  /// A list of VPC subnet IDs.
  @_s.JsonKey(name: 'SubnetIds')
  final List<String> subnetIds;

  VpcConfig({
    this.securityGroupIds,
    this.subnetIds,
  });
  Map<String, dynamic> toJson() => _$VpcConfigToJson(this);
}

/// The VPC security groups and subnets that are attached to a Lambda function.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VpcConfigResponse {
  /// A list of VPC security groups IDs.
  @_s.JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

  /// A list of VPC subnet IDs.
  @_s.JsonKey(name: 'SubnetIds')
  final List<String> subnetIds;

  /// The ID of the VPC.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  VpcConfigResponse({
    this.securityGroupIds,
    this.subnetIds,
    this.vpcId,
  });
  factory VpcConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$VpcConfigResponseFromJson(json);
}

class CodeStorageExceededException extends _s.GenericAwsException {
  CodeStorageExceededException({String type, String message})
      : super(
            type: type, code: 'CodeStorageExceededException', message: message);
}

class EC2AccessDeniedException extends _s.GenericAwsException {
  EC2AccessDeniedException({String type, String message})
      : super(type: type, code: 'EC2AccessDeniedException', message: message);
}

class EC2ThrottledException extends _s.GenericAwsException {
  EC2ThrottledException({String type, String message})
      : super(type: type, code: 'EC2ThrottledException', message: message);
}

class EC2UnexpectedException extends _s.GenericAwsException {
  EC2UnexpectedException({String type, String message})
      : super(type: type, code: 'EC2UnexpectedException', message: message);
}

class ENILimitReachedException extends _s.GenericAwsException {
  ENILimitReachedException({String type, String message})
      : super(type: type, code: 'ENILimitReachedException', message: message);
}

class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String type, String message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

class InvalidRequestContentException extends _s.GenericAwsException {
  InvalidRequestContentException({String type, String message})
      : super(
            type: type,
            code: 'InvalidRequestContentException',
            message: message);
}

class InvalidRuntimeException extends _s.GenericAwsException {
  InvalidRuntimeException({String type, String message})
      : super(type: type, code: 'InvalidRuntimeException', message: message);
}

class InvalidSecurityGroupIDException extends _s.GenericAwsException {
  InvalidSecurityGroupIDException({String type, String message})
      : super(
            type: type,
            code: 'InvalidSecurityGroupIDException',
            message: message);
}

class InvalidSubnetIDException extends _s.GenericAwsException {
  InvalidSubnetIDException({String type, String message})
      : super(type: type, code: 'InvalidSubnetIDException', message: message);
}

class InvalidZipFileException extends _s.GenericAwsException {
  InvalidZipFileException({String type, String message})
      : super(type: type, code: 'InvalidZipFileException', message: message);
}

class KMSAccessDeniedException extends _s.GenericAwsException {
  KMSAccessDeniedException({String type, String message})
      : super(type: type, code: 'KMSAccessDeniedException', message: message);
}

class KMSDisabledException extends _s.GenericAwsException {
  KMSDisabledException({String type, String message})
      : super(type: type, code: 'KMSDisabledException', message: message);
}

class KMSInvalidStateException extends _s.GenericAwsException {
  KMSInvalidStateException({String type, String message})
      : super(type: type, code: 'KMSInvalidStateException', message: message);
}

class KMSNotFoundException extends _s.GenericAwsException {
  KMSNotFoundException({String type, String message})
      : super(type: type, code: 'KMSNotFoundException', message: message);
}

class PolicyLengthExceededException extends _s.GenericAwsException {
  PolicyLengthExceededException({String type, String message})
      : super(
            type: type,
            code: 'PolicyLengthExceededException',
            message: message);
}

class PreconditionFailedException extends _s.GenericAwsException {
  PreconditionFailedException({String type, String message})
      : super(
            type: type, code: 'PreconditionFailedException', message: message);
}

class ProvisionedConcurrencyConfigNotFoundException
    extends _s.GenericAwsException {
  ProvisionedConcurrencyConfigNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'ProvisionedConcurrencyConfigNotFoundException',
            message: message);
}

class RequestTooLargeException extends _s.GenericAwsException {
  RequestTooLargeException({String type, String message})
      : super(type: type, code: 'RequestTooLargeException', message: message);
}

class ResourceConflictException extends _s.GenericAwsException {
  ResourceConflictException({String type, String message})
      : super(type: type, code: 'ResourceConflictException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String type, String message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourceNotReadyException extends _s.GenericAwsException {
  ResourceNotReadyException({String type, String message})
      : super(type: type, code: 'ResourceNotReadyException', message: message);
}

class ServiceException extends _s.GenericAwsException {
  ServiceException({String type, String message})
      : super(type: type, code: 'ServiceException', message: message);
}

class SubnetIPAddressLimitReachedException extends _s.GenericAwsException {
  SubnetIPAddressLimitReachedException({String type, String message})
      : super(
            type: type,
            code: 'SubnetIPAddressLimitReachedException',
            message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String type, String message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class UnsupportedMediaTypeException extends _s.GenericAwsException {
  UnsupportedMediaTypeException({String type, String message})
      : super(
            type: type,
            code: 'UnsupportedMediaTypeException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'CodeStorageExceededException': (type, message) =>
      CodeStorageExceededException(type: type, message: message),
  'EC2AccessDeniedException': (type, message) =>
      EC2AccessDeniedException(type: type, message: message),
  'EC2ThrottledException': (type, message) =>
      EC2ThrottledException(type: type, message: message),
  'EC2UnexpectedException': (type, message) =>
      EC2UnexpectedException(type: type, message: message),
  'ENILimitReachedException': (type, message) =>
      ENILimitReachedException(type: type, message: message),
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
