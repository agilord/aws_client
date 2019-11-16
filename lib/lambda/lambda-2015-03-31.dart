import 'dart:convert';
import 'dart:io';

import 'package:aws_client/src/credentials.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:crypto/crypto.dart';

part 'lambda-2015-03-31.g.dart';

/// AWS Lambda  Overview  This is the AWS Lambda API Reference. The AWS Lambda
/// Developer Guide provides additional information. For the service overview,
/// see What is AWS Lambda, and for information about how the service works,
/// see AWS Lambda: How it Works in the AWS Lambda Developer Guide.
class Lambda {
  static const String apiVersion = '2015-03-31';
  static const String endpointPrefix = 'lambda';
  static const String protocol = 'rest-json';
  static const String serviceFullName = 'AWS Lambda';
  static const String serviceId = 'Lambda';
  static const String signatureVersion = 'v4';
  static const String uid = 'lambda-2015-03-31';
  static const _aws4HmacSha256 = 'AWS4-HMAC-SHA256';
  final String region;
  Dio dio;
  Credentials credentials;
  final Map<String, String> environment = Platform.environment;

  Lambda({this.region = 'eu-west-1', this.credentials, this.dio}) {
    dio ??= Dio()
      ..interceptors.add(InterceptorsWrapper(
        onRequest: (RequestOptions options) async {
          options.headers.putIfAbsent(
            'X-Amz-Date',
            () => DateTime.now()
                .toUtc()
                .toIso8601String()
                .replaceAll('-', '')
                .replaceAll(':', '')
                .split('.')
                .first,
          );

          _sign(credentials, options);

          return options;
        },
      ))
      ..options.baseUrl = 'https://$endpointPrefix.$region.amazonaws.com';

    credentials ??= Credentials(
      accessKey: environment['AWS_ACCESS_KEY_ID'],
      secretKey: environment['AWS_SECRET_ACCESS_KEY'],
      sessionToken: environment['AWS_SESSION_TOKEN'],
    );
  }

  /// Adds permissions to the resource-based policy of a version of an AWS Lambda
  /// layer. Use this action to grant layer usage permission to other accounts.
  /// You can grant permission to a single account, all AWS accounts, or all
  /// accounts in an organization. To revoke permission, call RemoveLayerVersionPermission
  /// with the statement ID that you specified when you added it.
  Future<AddLayerVersionPermissionResponse> addLayerVersionPermission(
      AddLayerVersionPermissionRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 201,
    );
    final Response response = await dio.post(
        '/2018-10-31/layers/${param.layerName}/versions/${param.versionNumber}/policy',
        data: param.toJson(),
        options: options);
    return AddLayerVersionPermissionResponse.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Grants an AWS service or another account permission to use a function.
  /// You can apply the policy at the function level, or specify a qualifier
  /// to restrict access to a single version or alias. If you use a qualifier,
  /// the invoker must use the full Amazon Resource Name (ARN) of that version
  /// or alias to invoke the function. To grant permission to another account,
  /// specify the account ID as the Principal. For AWS services, the principal
  /// is a domain-style identifier defined by the service, like s3.amazonaws.com
  /// or sns.amazonaws.com. For AWS services, you can also specify the ARN or
  /// owning account of the associated resource as the SourceArn or SourceAccount.
  /// If you grant permission to a service principal without specifying the source,
  /// other accounts could potentially configure resources in their account to
  /// invoke your Lambda function. This action adds a statement to a resource-based
  /// permission policy for the function. For more information about function
  /// policies, see Lambda Function Policies.
  Future<AddPermissionResponse> addPermission(
      AddPermissionRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 201,
    );
    final Response response = await dio.post(
        '/2015-03-31/functions/${param.functionName}/policy',
        data: param.toJson(),
        options: options);
    return AddPermissionResponse.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Creates an alias for a Lambda function version. Use aliases to provide
  /// clients with a function identifier that you can update to invoke a different
  /// version. You can also map an alias to split invocation requests between
  /// two versions. Use the RoutingConfig parameter to specify a second version
  /// and the percentage of invocation requests that it receives.
  Future<AliasConfiguration> createAlias(CreateAliasRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 201,
    );
    final Response response = await dio.post(
        '/2015-03-31/functions/${param.functionName}/aliases',
        data: param.toJson(),
        options: options);
    return AliasConfiguration.fromJson(response.data as Map<String, dynamic>);
  }

  /// Creates a mapping between an event source and an AWS Lambda function. Lambda
  /// reads items from the event source and triggers the function. For details
  /// about each event source type, see the following topics.    Using AWS Lambda
  /// with Amazon Kinesis     Using AWS Lambda with Amazon SQS     Using AWS
  /// Lambda with Amazon DynamoDB
  Future<EventSourceMappingConfiguration> createEventSourceMapping(
      CreateEventSourceMappingRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 202,
    );
    final Response response = await dio.post(
        '/2015-03-31/event-source-mappings/',
        data: param.toJson(),
        options: options);
    return EventSourceMappingConfiguration.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Creates a Lambda function. To create a function, you need a deployment
  /// package and an execution role. The deployment package contains your function
  /// code. The execution role grants the function permission to use AWS services,
  /// such as Amazon CloudWatch Logs for log streaming and AWS X-Ray for request
  /// tracing. A function has an unpublished version, and can have published
  /// versions and aliases. The unpublished version changes when you update your
  /// function's code and configuration. A published version is a snapshot of
  /// your function code and configuration that can't be changed. An alias is
  /// a named resource that maps to a version, and can be changed to map to a
  /// different version. Use the Publish parameter to create version 1 of your
  /// function from its initial configuration. The other parameters let you configure
  /// version-specific and function-level settings. You can modify version-specific
  /// settings later with UpdateFunctionConfiguration. Function-level settings
  /// apply to both the unpublished and published versions of the function, and
  /// include tags (TagResource) and per-function concurrency limits (PutFunctionConcurrency).
  /// If another account or an AWS service invokes your function, use AddPermission
  /// to grant permission by creating a resource-based IAM policy. You can grant
  /// permissions at the function level, on a version, or on an alias. To invoke
  /// your function directly, use Invoke. To invoke your function in response
  /// to events in other AWS services, create an event source mapping (CreateEventSourceMapping),
  /// or configure a function trigger in the other service. For more information,
  /// see Invoking Functions.
  Future<FunctionConfiguration> createFunction(
      CreateFunctionRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 201,
    );
    final Response response = await dio.post('/2015-03-31/functions',
        data: param.toJson(), options: options);
    return FunctionConfiguration.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Deletes a Lambda function alias.
  Future<void> deleteAlias(DeleteAliasRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 204,
    );
    await dio.delete(
        '/2015-03-31/functions/${param.functionName}/aliases/${param.name}',
        data: param.toJson(),
        options: options);
  }

  /// Deletes an event source mapping. You can get the identifier of a mapping
  /// from the output of ListEventSourceMappings.
  Future<EventSourceMappingConfiguration> deleteEventSourceMapping(
      DeleteEventSourceMappingRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 202,
    );
    final Response response = await dio.delete(
        '/2015-03-31/event-source-mappings/${param.uUID}',
        data: param.toJson(),
        options: options);
    return EventSourceMappingConfiguration.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Deletes a Lambda function. To delete a specific function version, use the
  /// Qualifier parameter. Otherwise, all versions and aliases are deleted. To
  /// delete Lambda event source mappings that invoke a function, use DeleteEventSourceMapping.
  /// For AWS services and resources that invoke your function directly, delete
  /// the trigger in the service where you originally configured it.
  Future<void> deleteFunction(DeleteFunctionRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 204,
    );
    await dio.delete('/2015-03-31/functions/${param.functionName}',
        data: param.toJson(), options: options);
  }

  /// Removes a concurrent execution limit from a function.
  Future<void> deleteFunctionConcurrency(
      DeleteFunctionConcurrencyRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 204,
    );
    await dio.delete('/2017-10-31/functions/${param.functionName}/concurrency',
        data: param.toJson(), options: options);
  }

  /// Deletes a version of an AWS Lambda layer. Deleted versions can no longer
  /// be viewed or added to functions. To avoid breaking functions, a copy of
  /// the version remains in Lambda until no functions refer to it.
  Future<void> deleteLayerVersion(DeleteLayerVersionRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 204,
    );
    await dio.delete(
        '/2018-10-31/layers/${param.layerName}/versions/${param.versionNumber}',
        data: param.toJson(),
        options: options);
  }

  /// Retrieves details about your account's limits and usage in an AWS Region.
  Future<GetAccountSettingsResponse> getAccountSettings() async {
    final options = Options(
      validateStatus: (status) => status == 200,
    );
    final Response response =
        await dio.get('/2016-08-19/account-settings/', options: options);
    return GetAccountSettingsResponse.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Returns details about a Lambda function alias.
  Future<AliasConfiguration> getAlias(GetAliasRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 200,
    );
    final Response response = await dio.get(
        '/2015-03-31/functions/${param.functionName}/aliases/${param.name}',
        options: options);
    return AliasConfiguration.fromJson(response.data as Map<String, dynamic>);
  }

  /// Returns details about an event source mapping. You can get the identifier
  /// of a mapping from the output of ListEventSourceMappings.
  Future<EventSourceMappingConfiguration> getEventSourceMapping(
      GetEventSourceMappingRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 200,
    );
    final Response response = await dio.get(
        '/2015-03-31/event-source-mappings/${param.uUID}',
        options: options);
    return EventSourceMappingConfiguration.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Returns information about the function or function version, with a link
  /// to download the deployment package that's valid for 10 minutes. If you
  /// specify a function version, only details that are specific to that version
  /// are returned.
  Future<GetFunctionResponse> getFunction(GetFunctionRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 200,
    );
    final Response response = await dio
        .get('/2015-03-31/functions/${param.functionName}', options: options);
    return GetFunctionResponse.fromJson(response.data as Map<String, dynamic>);
  }

  /// Returns the version-specific settings of a Lambda function or version.
  /// The output includes only options that can vary between versions of a function.
  /// To modify these settings, use UpdateFunctionConfiguration. To get all of
  /// a function's details, including function-level settings, use GetFunction.
  Future<FunctionConfiguration> getFunctionConfiguration(
      GetFunctionConfigurationRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 200,
    );
    final Response response = await dio.get(
        '/2015-03-31/functions/${param.functionName}/configuration',
        options: options);
    return FunctionConfiguration.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Returns information about a version of an AWS Lambda layer, with a link
  /// to download the layer archive that's valid for 10 minutes.
  Future<GetLayerVersionResponse> getLayerVersion(
      GetLayerVersionRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 200,
    );
    final Response response = await dio.get(
        '/2018-10-31/layers/${param.layerName}/versions/${param.versionNumber}',
        options: options);
    return GetLayerVersionResponse.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Returns information about a version of an AWS Lambda layer, with a link
  /// to download the layer archive that's valid for 10 minutes.
  Future<GetLayerVersionResponse> getLayerVersionByArn(
      GetLayerVersionByArnRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 200,
    );
    final Response response =
        await dio.get('/2018-10-31/layers?find=LayerVersion', options: options);
    return GetLayerVersionResponse.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Returns the permission policy for a version of an AWS Lambda layer. For
  /// more information, see AddLayerVersionPermission.
  Future<GetLayerVersionPolicyResponse> getLayerVersionPolicy(
      GetLayerVersionPolicyRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 200,
    );
    final Response response = await dio.get(
        '/2018-10-31/layers/${param.layerName}/versions/${param.versionNumber}/policy',
        options: options);
    return GetLayerVersionPolicyResponse.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Returns the resource-based IAM policy for a function, version, or alias.
  Future<GetPolicyResponse> getPolicy(GetPolicyRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 200,
    );
    final Response response = await dio.get(
        '/2015-03-31/functions/${param.functionName}/policy',
        options: options);
    return GetPolicyResponse.fromJson(response.data as Map<String, dynamic>);
  }

  /// Invokes a Lambda function. You can invoke a function synchronously (and
  /// wait for the response), or asynchronously. To invoke a function asynchronously,
  /// set InvocationType to Event. For synchronous invocation, details about
  /// the function response, including errors, are included in the response body
  /// and headers. For either invocation type, you can find more information
  /// in the execution log and trace. To record function errors for asynchronous
  /// invocations, configure your function with a dead letter queue. When an
  /// error occurs, your function may be invoked multiple times. Retry behavior
  /// varies by error type, client, event source, and invocation type. For example,
  /// if you invoke a function asynchronously and it returns an error, Lambda
  /// executes the function up to two more times. For more information, see Retry
  /// Behavior. The status code in the API response doesn't reflect function
  /// errors. Error codes are reserved for errors that prevent your function
  /// from executing, such as permissions errors, limit errors, or issues with
  /// your function's code and configuration. For example, Lambda returns TooManyRequestsException
  /// if executing the function would cause you to exceed a concurrency limit
  /// at either the account level (ConcurrentInvocationLimitExceeded) or function
  /// level (ReservedFunctionConcurrentInvocationLimitExceeded). For functions
  /// with a long timeout, your client might be disconnected during synchronous
  /// invocation while it waits for a response. Configure your HTTP client, SDK,
  /// firewall, proxy, or operating system to allow for long connections with
  /// timeout or keep-alive settings. This operation requires permission for
  /// the lambda:InvokeFunction action.
  Future<InvocationResponse> invoke(InvocationRequest param) async {
    final options = Options(
      headers: {
        'X-Amz-Invocation-Type': param.invocationType,
        'X-Amz-Log-Type': param.logType,
        'X-Amz-Client-Context': param.clientContext,
      },
    );
    final Response response = await dio.post(
        '/2015-03-31/functions/${param.functionName}/invocations',
        data: param.toJson()["Payload"],
        options: options);
    return InvocationResponse.fromJson(response.data as Map<String, dynamic>);
  }

  /// For asynchronous function invocation, use Invoke.  Invokes a function asynchronously.
  @Deprecated("Deprecated")
  Future<InvokeAsyncResponse> invokeAsync(InvokeAsyncRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 202,
    );
    final Response response = await dio.post(
        '/2014-11-13/functions/${param.functionName}/invoke-async/',
        data: param.toJson()["InvokeArgs"],
        options: options);
    return InvokeAsyncResponse.fromJson(response.data as Map<String, dynamic>);
  }

  /// Returns a list of aliases for a Lambda function.
  Future<ListAliasesResponse> listAliases(ListAliasesRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 200,
    );
    final Response response = await dio.get(
        '/2015-03-31/functions/${param.functionName}/aliases',
        options: options);
    return ListAliasesResponse.fromJson(response.data as Map<String, dynamic>);
  }

  /// Lists event source mappings. Specify an EventSourceArn to only show event
  /// source mappings for a single event source.
  Future<ListEventSourceMappingsResponse> listEventSourceMappings(
      ListEventSourceMappingsRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 200,
    );
    final Response response =
        await dio.get('/2015-03-31/event-source-mappings/', options: options);
    return ListEventSourceMappingsResponse.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Returns a list of Lambda functions, with the version-specific configuration
  /// of each. Set FunctionVersion to ALL to include all published versions of
  /// each function in addition to the unpublished version. To get more information
  /// about a function or version, use GetFunction.
  Future<ListFunctionsResponse> listFunctions(
      ListFunctionsRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 200,
    );
    final Response response =
        await dio.get('/2015-03-31/functions/', options: options);
    return ListFunctionsResponse.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Lists the versions of an AWS Lambda layer. Versions that have been deleted
  /// aren't listed. Specify a runtime identifier to list only versions that
  /// indicate that they're compatible with that runtime.
  Future<ListLayerVersionsResponse> listLayerVersions(
      ListLayerVersionsRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 200,
    );
    final Response response = await dio.get(
        '/2018-10-31/layers/${param.layerName}/versions',
        options: options);
    return ListLayerVersionsResponse.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Lists AWS Lambda layers and shows information about the latest version
  /// of each. Specify a runtime identifier to list only layers that indicate
  /// that they're compatible with that runtime.
  Future<ListLayersResponse> listLayers(ListLayersRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 200,
    );
    final Response response =
        await dio.get('/2018-10-31/layers', options: options);
    return ListLayersResponse.fromJson(response.data as Map<String, dynamic>);
  }

  /// Returns a function's tags. You can also view tags with GetFunction.
  Future<ListTagsResponse> listTags(ListTagsRequest param) async {
    final Response response =
        await dio.get('/2017-03-31/tags/${param.resource}');
    return ListTagsResponse.fromJson(response.data as Map<String, dynamic>);
  }

  /// Returns a list of versions, with the version-specific configuration of
  /// each.
  Future<ListVersionsByFunctionResponse> listVersionsByFunction(
      ListVersionsByFunctionRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 200,
    );
    final Response response = await dio.get(
        '/2015-03-31/functions/${param.functionName}/versions',
        options: options);
    return ListVersionsByFunctionResponse.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Creates an AWS Lambda layer from a ZIP archive. Each time you call PublishLayerVersion
  /// with the same version name, a new version is created. Add layers to your
  /// function with CreateFunction or UpdateFunctionConfiguration.
  Future<PublishLayerVersionResponse> publishLayerVersion(
      PublishLayerVersionRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 201,
    );
    final Response response = await dio.post(
        '/2018-10-31/layers/${param.layerName}/versions',
        data: param.toJson(),
        options: options);
    return PublishLayerVersionResponse.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Creates a version from the current code and configuration of a function.
  /// Use versions to create a snapshot of your function code and configuration
  /// that doesn't change. AWS Lambda doesn't publish a version if the function's
  /// configuration and code haven't changed since the last version. Use UpdateFunctionCode
  /// or UpdateFunctionConfiguration to update the function before publishing
  /// a version. Clients can invoke versions directly or with an alias. To create
  /// an alias, use CreateAlias.
  Future<FunctionConfiguration> publishVersion(
      PublishVersionRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 201,
    );
    final Response response = await dio.post(
        '/2015-03-31/functions/${param.functionName}/versions',
        data: param.toJson(),
        options: options);
    return FunctionConfiguration.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Sets the maximum number of simultaneous executions for a function, and
  /// reserves capacity for that concurrency level. Concurrency settings apply
  /// to the function as a whole, including all published versions and the unpublished
  /// version. Reserving concurrency both ensures that your function has capacity
  /// to process the specified number of events simultaneously, and prevents
  /// it from scaling beyond that level. Use GetFunction to see the current setting
  /// for a function. Use GetAccountSettings to see your regional concurrency
  /// limit. You can reserve concurrency for as many functions as you like, as
  /// long as you leave at least 100 simultaneous executions unreserved for functions
  /// that aren't configured with a per-function limit. For more information,
  /// see Managing Concurrency.
  Future<Concurrency> putFunctionConcurrency(
      PutFunctionConcurrencyRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 200,
    );
    final Response response = await dio.put(
        '/2017-10-31/functions/${param.functionName}/concurrency',
        data: param.toJson(),
        options: options);
    return Concurrency.fromJson(response.data as Map<String, dynamic>);
  }

  /// Removes a statement from the permissions policy for a version of an AWS
  /// Lambda layer. For more information, see AddLayerVersionPermission.
  Future<void> removeLayerVersionPermission(
      RemoveLayerVersionPermissionRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 204,
    );
    await dio.delete(
        '/2018-10-31/layers/${param.layerName}/versions/${param.versionNumber}/policy/${param.statementId}',
        data: param.toJson(),
        options: options);
  }

  /// Revokes function-use permission from an AWS service or another account.
  /// You can get the ID of the statement from the output of GetPolicy.
  Future<void> removePermission(RemovePermissionRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 204,
    );
    await dio.delete(
        '/2015-03-31/functions/${param.functionName}/policy/${param.statementId}',
        data: param.toJson(),
        options: options);
  }

  /// Adds tags to a function.
  Future<void> tagResource(TagResourceRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 204,
    );
    await dio.post('/2017-03-31/tags/${param.resource}',
        data: param.toJson(), options: options);
  }

  /// Removes tags from a function.
  Future<void> untagResource(UntagResourceRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 204,
    );
    await dio.delete('/2017-03-31/tags/${param.resource}',
        data: param.toJson(), options: options);
  }

  /// Updates the configuration of a Lambda function alias.
  Future<AliasConfiguration> updateAlias(UpdateAliasRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 200,
    );
    final Response response = await dio.put(
        '/2015-03-31/functions/${param.functionName}/aliases/${param.name}',
        data: param.toJson(),
        options: options);
    return AliasConfiguration.fromJson(response.data as Map<String, dynamic>);
  }

  /// Updates an event source mapping. You can change the function that AWS Lambda
  /// invokes, or pause invocation and resume later from the same location.
  Future<EventSourceMappingConfiguration> updateEventSourceMapping(
      UpdateEventSourceMappingRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 202,
    );
    final Response response = await dio.put(
        '/2015-03-31/event-source-mappings/${param.uUID}',
        data: param.toJson(),
        options: options);
    return EventSourceMappingConfiguration.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Updates a Lambda function's code. The function's code is locked when you
  /// publish a version. You can't modify the code of a published version, only
  /// the unpublished version.
  Future<FunctionConfiguration> updateFunctionCode(
      UpdateFunctionCodeRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 200,
    );
    final Response response = await dio.put(
        '/2015-03-31/functions/${param.functionName}/code',
        data: param.toJson(),
        options: options);
    return FunctionConfiguration.fromJson(
        response.data as Map<String, dynamic>);
  }

  /// Modify the version-specific settings of a Lambda function. These settings
  /// can vary between versions of a function and are locked when you publish
  /// a version. You can't modify the configuration of a published version, only
  /// the unpublished version. To configure function concurrency, use PutFunctionConcurrency.
  /// To grant invoke permissions to an account or AWS service, use AddPermission.
  Future<FunctionConfiguration> updateFunctionConfiguration(
      UpdateFunctionConfigurationRequest param) async {
    final options = Options(
      validateStatus: (status) => status == 200,
    );
    final Response response = await dio.put(
        '/2015-03-31/functions/${param.functionName}/configuration',
        data: param.toJson(),
        options: options);
    return FunctionConfiguration.fromJson(
        response.data as Map<String, dynamic>);
  }

  _sign(Credentials credentials, RequestOptions options) {
    final queryKeys = options.uri.queryParameters.keys.toList()..sort();
    final canonicalQuery = queryKeys
        .map((s) =>
            '${_queryComponent(s)}=${_queryComponent(options.uri.queryParameters[s])}')
        .join('&');
    final canonicalHeaders = options.headers.keys
        .map((key) => '${key.toLowerCase()}:${options.headers[key].trim()}')
        .toList()
          ..sort();
    final signedHeaders = (options.headers.keys.toList()..sort())
        .map((s) => s.toLowerCase())
        .join(';');

    final payloadHash = options.headers['X-Amz-Content-Sha256'] as String ??
        sha256.convert(utf8.encode(jsonEncode(options.data))).toString();

    final canonical = ([
      options.method.toUpperCase(),
      Uri.encodeFull(options.uri.path),
      canonicalQuery,
    ]
          ..addAll(canonicalHeaders)
          ..addAll([
            '',
            signedHeaders,
            payloadHash,
          ]))
        .join('\n');

    final date = options.headers['X-Amz-Date'] as String;
    final List<String> credentialList = [
      date.substring(0, 8),
      region,
      endpointPrefix,
      'aws4_request',
    ];
    final canonicalHash = sha256.convert(utf8.encode(canonical)).toString();
    final toSign = [
      _aws4HmacSha256,
      date,
      credentialList.join('/'),
      canonicalHash,
    ].join('\n');
    final signingKey = credentialList.fold(
        utf8.encode('AWS4${credentials.secretKey}'), (List<int> key, String s) {
      final hmac = Hmac(sha256, key);
      return hmac.convert(utf8.encode(s)).bytes;
    });
    final signature =
        Hmac(sha256, signingKey).convert(utf8.encode(toSign)).toString();
    if (credentials.sessionToken != null) {
      options.headers['X-Amz-Security-Token'] = credentials.sessionToken;
    }

    final auth = '$_aws4HmacSha256 '
        'Credential=${credentials.accessKey}/${credentialList.join('/')}, '
        'SignedHeaders=$signedHeaders, '
        'Signature=$signature';
    options.headers['Authorization'] = auth;
  }

  String _queryComponent(String path) =>
      Uri.encodeQueryComponent(path).replaceAll('+', '%20');
}

/// Limits that are related to concurrency and code storage. All file and storage
/// sizes are in bytes.
@JsonSerializable()
class AccountLimit {
  /// The amount of storage space that you can use for all deployment packages
  /// and layer archives.
  @JsonKey(name: 'TotalCodeSize')
  final int totalCodeSize;

  /// The maximum size of your function's code and layers when they're extracted.
  @JsonKey(name: 'CodeSizeUnzipped')
  final int codeSizeUnzipped;

  /// The maximum size of a deployment package when it's uploaded directly to
  /// AWS Lambda. Use Amazon S3 for larger files.
  @JsonKey(name: 'CodeSizeZipped')
  final int codeSizeZipped;

  /// The maximum number of simultaneous function executions.
  @JsonKey(name: 'ConcurrentExecutions')
  final int concurrentExecutions;

  /// The maximum number of simultaneous function executions, minus the capacity
  /// that's reserved for individual functions with PutFunctionConcurrency.
  @JsonKey(name: 'UnreservedConcurrentExecutions')
  final int unreservedConcurrentExecutions;

  AccountLimit({
    this.totalCodeSize,
    this.codeSizeUnzipped,
    this.codeSizeZipped,
    this.concurrentExecutions,
    this.unreservedConcurrentExecutions,
  });

  factory AccountLimit.fromJson(Map<String, dynamic> json) =>
      _$AccountLimitFromJson(json);

  Map<String, dynamic> toJson() => _$AccountLimitToJson(this);
}

/// The number of functions and amount of storage in use.
@JsonSerializable()
class AccountUsage {
  /// The amount of storage space, in bytes, that's being used by deployment
  /// packages and layer archives.
  @JsonKey(name: 'TotalCodeSize')
  final int totalCodeSize;

  /// The number of Lambda functions.
  @JsonKey(name: 'FunctionCount')
  final int functionCount;

  AccountUsage({
    this.totalCodeSize,
    this.functionCount,
  });

  factory AccountUsage.fromJson(Map<String, dynamic> json) =>
      _$AccountUsageFromJson(json);

  Map<String, dynamic> toJson() => _$AccountUsageToJson(this);
}

@JsonSerializable()
class AddLayerVersionPermissionRequest {
  /// The name or Amazon Resource Name (ARN) of the layer.
  @JsonKey(name: 'LayerName')
  final String layerName;

  /// The version number.
  @JsonKey(name: 'VersionNumber')
  final int versionNumber;

  /// An identifier that distinguishes the policy from others on the same layer
  /// version.
  @JsonKey(name: 'StatementId')
  final String statementId;

  /// The API action that grants access to the layer. For example, lambda:GetLayerVersion.
  @JsonKey(name: 'Action')
  final String action;

  /// An account ID, or * to grant permission to all AWS accounts.
  @JsonKey(name: 'Principal')
  final String principal;

  /// With the principal set to *, grant permission to all accounts in the specified
  /// organization.
  @JsonKey(name: 'OrganizationId')
  final String organizationId;

  /// Only update the policy if the revision ID matches the ID specified. Use
  /// this option to avoid modifying a policy that has changed since you last
  /// read it.
  @JsonKey(name: 'RevisionId')
  final String revisionId;

  AddLayerVersionPermissionRequest({
    @required this.layerName,
    @required this.versionNumber,
    @required this.statementId,
    @required this.action,
    @required this.principal,
    this.organizationId,
    this.revisionId,
  });

  factory AddLayerVersionPermissionRequest.fromJson(
          Map<String, dynamic> json) =>
      _$AddLayerVersionPermissionRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AddLayerVersionPermissionRequestToJson(this);
}

@JsonSerializable()
class AddLayerVersionPermissionResponse {
  /// The permission statement.
  @JsonKey(name: 'Statement')
  final String statement;

  /// A unique identifier for the current revision of the policy.
  @JsonKey(name: 'RevisionId')
  final String revisionId;

  AddLayerVersionPermissionResponse({
    this.statement,
    this.revisionId,
  });

  factory AddLayerVersionPermissionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AddLayerVersionPermissionResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AddLayerVersionPermissionResponseToJson(this);
}

@JsonSerializable()
class AddPermissionRequest {
  /// The name of the Lambda function, version, or alias.  Name formats     Function
  /// name - my-function (name-only), my-function:v1 (with alias).    Function
  /// ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial
  /// ARN - 123456789012:function:my-function.   You can append a version number
  /// or alias to any of the formats. The length constraint applies only to the
  /// full ARN. If you specify only the function name, it is limited to 64 characters
  /// in length.
  @JsonKey(name: 'FunctionName')
  final String functionName;

  /// A statement identifier that differentiates the statement from others in
  /// the same policy.
  @JsonKey(name: 'StatementId')
  final String statementId;

  /// The action that the principal can use on the function. For example, lambda:InvokeFunction
  /// or lambda:GetFunction.
  @JsonKey(name: 'Action')
  final String action;

  /// The AWS service or account that invokes the function. If you specify a
  /// service, use SourceArn or SourceAccount to limit who can invoke the function
  /// through that service.
  @JsonKey(name: 'Principal')
  final String principal;

  /// For AWS services, the ARN of the AWS resource that invokes the function.
  /// For example, an Amazon S3 bucket or Amazon SNS topic.
  @JsonKey(name: 'SourceArn')
  final String sourceArn;

  /// For AWS services, the ID of the account that owns the resource. Use this
  /// instead of SourceArn to grant permission to resources that are owned by
  /// another account (for example, all of an account's Amazon S3 buckets). Or
  /// use it together with SourceArn to ensure that the resource is owned by
  /// the specified account. For example, an Amazon S3 bucket could be deleted
  /// by its owner and recreated by another account.
  @JsonKey(name: 'SourceAccount')
  final String sourceAccount;

  /// For Alexa Smart Home functions, a token that must be supplied by the invoker.
  @JsonKey(name: 'EventSourceToken')
  final String eventSourceToken;

  /// Specify a version or alias to add permissions to a published version of
  /// the function.
  @JsonKey(name: 'Qualifier')
  final String qualifier;

  /// Only update the policy if the revision ID matches the ID that's specified.
  /// Use this option to avoid modifying a policy that has changed since you
  /// last read it.
  @JsonKey(name: 'RevisionId')
  final String revisionId;

  AddPermissionRequest({
    @required this.functionName,
    @required this.statementId,
    @required this.action,
    @required this.principal,
    this.sourceArn,
    this.sourceAccount,
    this.eventSourceToken,
    this.qualifier,
    this.revisionId,
  });

  factory AddPermissionRequest.fromJson(Map<String, dynamic> json) =>
      _$AddPermissionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddPermissionRequestToJson(this);
}

@JsonSerializable()
class AddPermissionResponse {
  /// The permission statement that's added to the function policy.
  @JsonKey(name: 'Statement')
  final String statement;

  AddPermissionResponse({
    this.statement,
  });

  factory AddPermissionResponse.fromJson(Map<String, dynamic> json) =>
      _$AddPermissionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddPermissionResponseToJson(this);
}

/// Provides configuration information about a Lambda function alias.
@JsonSerializable()
class AliasConfiguration {
  /// The Amazon Resource Name (ARN) of the alias.
  @JsonKey(name: 'AliasArn')
  final String aliasArn;

  /// The name of the alias.
  @JsonKey(name: 'Name')
  final String name;

  /// The function version that the alias invokes.
  @JsonKey(name: 'FunctionVersion')
  final String functionVersion;

  /// A description of the alias.
  @JsonKey(name: 'Description')
  final String description;

  /// The routing configuration of the alias.
  @JsonKey(name: 'RoutingConfig')
  final AliasRoutingConfiguration routingConfig;

  /// A unique identifier that changes when you update the alias.
  @JsonKey(name: 'RevisionId')
  final String revisionId;

  AliasConfiguration({
    this.aliasArn,
    this.name,
    this.functionVersion,
    this.description,
    this.routingConfig,
    this.revisionId,
  });

  factory AliasConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AliasConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$AliasConfigurationToJson(this);
}

/// The traffic-shifting configuration of a Lambda function alias.
@JsonSerializable()
class AliasRoutingConfiguration {
  /// The name of the second alias, and the percentage of traffic that's routed
  /// to it.
  @JsonKey(name: 'AdditionalVersionWeights')
  final Map<String, double> additionalVersionWeights;

  AliasRoutingConfiguration({
    this.additionalVersionWeights,
  });

  factory AliasRoutingConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AliasRoutingConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$AliasRoutingConfigurationToJson(this);
}

@JsonSerializable()
class Concurrency {
  /// The number of concurrent executions that are reserved for this function.
  /// For more information, see Managing Concurrency.
  @JsonKey(name: 'ReservedConcurrentExecutions')
  final int reservedConcurrentExecutions;

  Concurrency({
    this.reservedConcurrentExecutions,
  });

  factory Concurrency.fromJson(Map<String, dynamic> json) =>
      _$ConcurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$ConcurrencyToJson(this);
}

@JsonSerializable()
class CreateAliasRequest {
  /// The name of the Lambda function.  Name formats     Function name - MyFunction.
  ///    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:MyFunction.
  ///    Partial ARN - 123456789012:function:MyFunction.   The length constraint
  /// applies only to the full ARN. If you specify only the function name, it
  /// is limited to 64 characters in length.
  @JsonKey(name: 'FunctionName')
  final String functionName;

  /// The name of the alias.
  @JsonKey(name: 'Name')
  final String name;

  /// The function version that the alias invokes.
  @JsonKey(name: 'FunctionVersion')
  final String functionVersion;

  /// A description of the alias.
  @JsonKey(name: 'Description')
  final String description;

  /// The routing configuration of the alias.
  @JsonKey(name: 'RoutingConfig')
  final AliasRoutingConfiguration routingConfig;

  CreateAliasRequest({
    @required this.functionName,
    @required this.name,
    @required this.functionVersion,
    this.description,
    this.routingConfig,
  });

  factory CreateAliasRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateAliasRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateAliasRequestToJson(this);
}

@JsonSerializable()
class CreateEventSourceMappingRequest {
  /// The Amazon Resource Name (ARN) of the event source.    Amazon Kinesis -
  /// The ARN of the data stream or a stream consumer.    Amazon DynamoDB Streams
  /// - The ARN of the stream.    Amazon Simple Queue Service - The ARN of the
  /// queue.
  @JsonKey(name: 'EventSourceArn')
  final String eventSourceArn;

  /// The name of the Lambda function.  Name formats     Function name - MyFunction.
  ///    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:MyFunction.
  ///    Version or Alias ARN - arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD.
  ///    Partial ARN - 123456789012:function:MyFunction.   The length constraint
  /// applies only to the full ARN. If you specify only the function name, it's
  /// limited to 64 characters in length.
  @JsonKey(name: 'FunctionName')
  final String functionName;

  /// Disables the event source mapping to pause polling and invocation.
  @JsonKey(name: 'Enabled')
  final bool enabled;

  /// The maximum number of items to retrieve in a single batch.    Amazon Kinesis
  /// - Default 100. Max 10,000.    Amazon DynamoDB Streams - Default 100. Max
  /// 1,000.    Amazon Simple Queue Service - Default 10. Max 10.
  @JsonKey(name: 'BatchSize')
  final int batchSize;
  @JsonKey(name: 'MaximumBatchingWindowInSeconds')
  final int maximumBatchingWindowInSeconds;

  /// The position in a stream from which to start reading. Required for Amazon
  /// Kinesis and Amazon DynamoDB Streams sources. AT_TIMESTAMP is only supported
  /// for Amazon Kinesis streams.
  ///
  /// Possible values: [TRIM_HORIZON, LATEST, AT_TIMESTAMP]
  @JsonKey(name: 'StartingPosition')
  final String startingPosition;

  /// With StartingPosition set to AT_TIMESTAMP, the time from which to start
  /// reading.
  @JsonKey(name: 'StartingPositionTimestamp')
  final String startingPositionTimestamp;

  CreateEventSourceMappingRequest({
    @required this.eventSourceArn,
    @required this.functionName,
    this.enabled,
    this.batchSize,
    this.maximumBatchingWindowInSeconds,
    this.startingPosition,
    this.startingPositionTimestamp,
  });

  factory CreateEventSourceMappingRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateEventSourceMappingRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CreateEventSourceMappingRequestToJson(this);
}

@JsonSerializable()
class CreateFunctionRequest {
  /// The name of the Lambda function.  Name formats     Function name - my-function.
  ///    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.
  ///    Partial ARN - 123456789012:function:my-function.   The length constraint
  /// applies only to the full ARN. If you specify only the function name, it
  /// is limited to 64 characters in length.
  @JsonKey(name: 'FunctionName')
  final String functionName;

  /// The identifier of the function's runtime.
  ///
  /// Possible values: [nodejs, nodejs4.3, nodejs6.10, nodejs8.10, nodejs10.x, java8, python2.7, python3.6, python3.7, dotnetcore1.0, dotnetcore2.0, dotnetcore2.1, nodejs4.3-edge, go1.x, ruby2.5, provided]
  @JsonKey(name: 'Runtime')
  final String runtime;

  /// The Amazon Resource Name (ARN) of the function's execution role.
  @JsonKey(name: 'Role')
  final String role;

  /// The name of the method within your code that Lambda calls to execute your
  /// function. The format includes the file name. It can also include namespaces
  /// and other qualifiers, depending on the runtime. For more information, see
  /// Programming Model.
  @JsonKey(name: 'Handler')
  final String handler;

  /// The code for the function.
  @JsonKey(name: 'Code')
  final FunctionCode code;

  /// A description of the function.
  @JsonKey(name: 'Description')
  final String description;

  /// The amount of time that Lambda allows a function to run before stopping
  /// it. The default is 3 seconds. The maximum allowed value is 900 seconds.
  @JsonKey(name: 'Timeout')
  final int timeout;

  /// The amount of memory that your function has access to. Increasing the function's
  /// memory also increases its CPU allocation. The default value is 128 MB.
  /// The value must be a multiple of 64 MB.
  @JsonKey(name: 'MemorySize')
  final int memorySize;

  /// Set to true to publish the first version of the function during creation.
  @JsonKey(name: 'Publish')
  final bool publish;

  /// For network connectivity to AWS resources in a VPC, specify a list of security
  /// groups and subnets in the VPC. When you connect a function to a VPC, it
  /// can only access resources and the internet through that VPC. For more information,
  /// see VPC Settings.
  @JsonKey(name: 'VpcConfig')
  final VpcConfig vpcConfig;

  /// A dead letter queue configuration that specifies the queue or topic where
  /// Lambda sends asynchronous events when they fail processing. For more information,
  /// see Dead Letter Queues.
  @JsonKey(name: 'DeadLetterConfig')
  final DeadLetterConfig deadLetterConfig;

  /// Environment variables that are accessible from function code during execution.
  @JsonKey(name: 'Environment')
  final Environment environment;

  /// The ARN of the AWS Key Management Service (AWS KMS) key that's used to
  /// encrypt your function's environment variables. If it's not provided, AWS
  /// Lambda uses a default service key.
  @JsonKey(name: 'KMSKeyArn')
  final String kMSKeyArn;

  /// Set Mode to Active to sample and trace a subset of incoming requests with
  /// AWS X-Ray.
  @JsonKey(name: 'TracingConfig')
  final TracingConfig tracingConfig;

  /// A list of tags to apply to the function.
  @JsonKey(name: 'Tags')
  final Map<String, String> tags;

  /// A list of function layers to add to the function's execution environment.
  /// Specify each layer by its ARN, including the version.
  @JsonKey(name: 'Layers')
  final List<String> layers;

  CreateFunctionRequest({
    @required this.functionName,
    @required this.runtime,
    @required this.role,
    @required this.handler,
    @required this.code,
    this.description,
    this.timeout,
    this.memorySize,
    this.publish,
    this.vpcConfig,
    this.deadLetterConfig,
    this.environment,
    this.kMSKeyArn,
    this.tracingConfig,
    this.tags,
    this.layers,
  });

  factory CreateFunctionRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateFunctionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateFunctionRequestToJson(this);
}

/// The dead letter queue for failed asynchronous invocations.
@JsonSerializable()
class DeadLetterConfig {
  /// The Amazon Resource Name (ARN) of an Amazon SQS queue or Amazon SNS topic.
  @JsonKey(name: 'TargetArn')
  final String targetArn;

  DeadLetterConfig({
    this.targetArn,
  });

  factory DeadLetterConfig.fromJson(Map<String, dynamic> json) =>
      _$DeadLetterConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DeadLetterConfigToJson(this);
}

@JsonSerializable()
class DeleteAliasRequest {
  /// The name of the Lambda function.  Name formats     Function name - MyFunction.
  ///    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:MyFunction.
  ///    Partial ARN - 123456789012:function:MyFunction.   The length constraint
  /// applies only to the full ARN. If you specify only the function name, it
  /// is limited to 64 characters in length.
  @JsonKey(name: 'FunctionName')
  final String functionName;

  /// The name of the alias.
  @JsonKey(name: 'Name')
  final String name;

  DeleteAliasRequest({
    @required this.functionName,
    @required this.name,
  });

  factory DeleteAliasRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteAliasRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteAliasRequestToJson(this);
}

@JsonSerializable()
class DeleteEventSourceMappingRequest {
  /// The identifier of the event source mapping.
  @JsonKey(name: 'UUID')
  final String uUID;

  DeleteEventSourceMappingRequest({
    @required this.uUID,
  });

  factory DeleteEventSourceMappingRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteEventSourceMappingRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DeleteEventSourceMappingRequestToJson(this);
}

@JsonSerializable()
class DeleteFunctionConcurrencyRequest {
  /// The name of the Lambda function.  Name formats     Function name - my-function.
  ///    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.
  ///    Partial ARN - 123456789012:function:my-function.   The length constraint
  /// applies only to the full ARN. If you specify only the function name, it
  /// is limited to 64 characters in length.
  @JsonKey(name: 'FunctionName')
  final String functionName;

  DeleteFunctionConcurrencyRequest({
    @required this.functionName,
  });

  factory DeleteFunctionConcurrencyRequest.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteFunctionConcurrencyRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DeleteFunctionConcurrencyRequestToJson(this);
}

@JsonSerializable()
class DeleteFunctionRequest {
  /// The name of the Lambda function or version.  Name formats     Function
  /// name - my-function (name-only), my-function:1 (with version).    Function
  /// ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial
  /// ARN - 123456789012:function:my-function.   You can append a version number
  /// or alias to any of the formats. The length constraint applies only to the
  /// full ARN. If you specify only the function name, it is limited to 64 characters
  /// in length.
  @JsonKey(name: 'FunctionName')
  final String functionName;

  /// Specify a version to delete. You can't delete a version that's referenced
  /// by an alias.
  @JsonKey(name: 'Qualifier')
  final String qualifier;

  DeleteFunctionRequest({
    @required this.functionName,
    this.qualifier,
  });

  factory DeleteFunctionRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteFunctionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteFunctionRequestToJson(this);
}

@JsonSerializable()
class DeleteLayerVersionRequest {
  /// The name or Amazon Resource Name (ARN) of the layer.
  @JsonKey(name: 'LayerName')
  final String layerName;

  /// The version number.
  @JsonKey(name: 'VersionNumber')
  final int versionNumber;

  DeleteLayerVersionRequest({
    @required this.layerName,
    @required this.versionNumber,
  });

  factory DeleteLayerVersionRequest.fromJson(Map<String, dynamic> json) =>
      _$DeleteLayerVersionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$DeleteLayerVersionRequestToJson(this);
}

/// A function's environment variable settings.
@JsonSerializable()
class Environment {
  /// Environment variable key-value pairs.
  @JsonKey(name: 'Variables')
  final Map<String, String> variables;

  Environment({
    this.variables,
  });

  factory Environment.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentFromJson(json);

  Map<String, dynamic> toJson() => _$EnvironmentToJson(this);
}

/// Error messages for environment variables that couldn't be applied.
@JsonSerializable()
class EnvironmentError {
  /// The error code.
  @JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// The error message.
  @JsonKey(name: 'Message')
  final String message;

  EnvironmentError({
    this.errorCode,
    this.message,
  });

  factory EnvironmentError.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentErrorFromJson(json);

  Map<String, dynamic> toJson() => _$EnvironmentErrorToJson(this);
}

/// The results of a configuration update that applied environment variables.
@JsonSerializable()
class EnvironmentResponse {
  /// Environment variable key-value pairs.
  @JsonKey(name: 'Variables')
  final Map<String, String> variables;

  /// Error messages for environment variables that couldn't be applied.
  @JsonKey(name: 'Error')
  final EnvironmentError error;

  EnvironmentResponse({
    this.variables,
    this.error,
  });

  factory EnvironmentResponse.fromJson(Map<String, dynamic> json) =>
      _$EnvironmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EnvironmentResponseToJson(this);
}

/// A mapping between an AWS resource and an AWS Lambda function. See CreateEventSourceMapping
/// for details.
@JsonSerializable()
class EventSourceMappingConfiguration {
  /// The identifier of the event source mapping.
  @JsonKey(name: 'UUID')
  final String uUID;

  /// The maximum number of items to retrieve in a single batch.
  @JsonKey(name: 'BatchSize')
  final int batchSize;
  @JsonKey(name: 'MaximumBatchingWindowInSeconds')
  final int maximumBatchingWindowInSeconds;

  /// The Amazon Resource Name (ARN) of the event source.
  @JsonKey(name: 'EventSourceArn')
  final String eventSourceArn;

  /// The ARN of the Lambda function.
  @JsonKey(name: 'FunctionArn')
  final String functionArn;

  /// The date that the event source mapping was last updated.
  @JsonKey(name: 'LastModified')
  final String lastModified;

  /// The result of the last AWS Lambda invocation of your Lambda function.
  @JsonKey(name: 'LastProcessingResult')
  final String lastProcessingResult;

  /// The state of the event source mapping. It can be one of the following:
  /// Creating, Enabling, Enabled, Disabling, Disabled, Updating, or Deleting.
  @JsonKey(name: 'State')
  final String state;

  /// The cause of the last state change, either User initiated or Lambda initiated.
  @JsonKey(name: 'StateTransitionReason')
  final String stateTransitionReason;

  EventSourceMappingConfiguration({
    this.uUID,
    this.batchSize,
    this.maximumBatchingWindowInSeconds,
    this.eventSourceArn,
    this.functionArn,
    this.lastModified,
    this.lastProcessingResult,
    this.state,
    this.stateTransitionReason,
  });

  factory EventSourceMappingConfiguration.fromJson(Map<String, dynamic> json) =>
      _$EventSourceMappingConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$EventSourceMappingConfigurationToJson(this);
}

/// The code for the Lambda function. You can specify either an object in Amazon
/// S3, or upload a deployment package directly.
@JsonSerializable()
class FunctionCode {
  /// The base64-encoded contents of the deployment package. AWS SDK and AWS
  /// CLI clients handle the encoding for you.
  @JsonKey(name: 'ZipFile')
  @Base64Converter()
  final String zipFile;

  /// An Amazon S3 bucket in the same AWS Region as your function. The bucket
  /// can be in a different AWS account.
  @JsonKey(name: 'S3Bucket')
  final String s3Bucket;

  /// The Amazon S3 key of the deployment package.
  @JsonKey(name: 'S3Key')
  final String s3Key;

  /// For versioned objects, the version of the deployment package object to
  /// use.
  @JsonKey(name: 'S3ObjectVersion')
  final String s3ObjectVersion;

  FunctionCode({
    this.zipFile,
    this.s3Bucket,
    this.s3Key,
    this.s3ObjectVersion,
  });

  factory FunctionCode.fromJson(Map<String, dynamic> json) =>
      _$FunctionCodeFromJson(json);

  Map<String, dynamic> toJson() => _$FunctionCodeToJson(this);
}

/// Details about a function's deployment package.
@JsonSerializable()
class FunctionCodeLocation {
  /// The service that's hosting the file.
  @JsonKey(name: 'RepositoryType')
  final String repositoryType;

  /// A presigned URL that you can use to download the deployment package.
  @JsonKey(name: 'Location')
  final String location;

  FunctionCodeLocation({
    this.repositoryType,
    this.location,
  });

  factory FunctionCodeLocation.fromJson(Map<String, dynamic> json) =>
      _$FunctionCodeLocationFromJson(json);

  Map<String, dynamic> toJson() => _$FunctionCodeLocationToJson(this);
}

/// Details about a function's configuration.
@JsonSerializable()
class FunctionConfiguration {
  /// The name of the function.
  @JsonKey(name: 'FunctionName')
  final String functionName;

  /// The function's Amazon Resource Name (ARN).
  @JsonKey(name: 'FunctionArn')
  final String functionArn;

  /// The runtime environment for the Lambda function.
  ///
  /// Possible values: [nodejs, nodejs4.3, nodejs6.10, nodejs8.10, nodejs10.x, java8, python2.7, python3.6, python3.7, dotnetcore1.0, dotnetcore2.0, dotnetcore2.1, nodejs4.3-edge, go1.x, ruby2.5, provided]
  @JsonKey(name: 'Runtime')
  final String runtime;

  /// The function's execution role.
  @JsonKey(name: 'Role')
  final String role;

  /// The function that Lambda calls to begin executing your function.
  @JsonKey(name: 'Handler')
  final String handler;

  /// The size of the function's deployment package, in bytes.
  @JsonKey(name: 'CodeSize')
  final int codeSize;

  /// The function's description.
  @JsonKey(name: 'Description')
  final String description;

  /// The amount of time that Lambda allows a function to run before stopping
  /// it.
  @JsonKey(name: 'Timeout')
  final int timeout;

  /// The memory that's allocated to the function.
  @JsonKey(name: 'MemorySize')
  final int memorySize;

  /// The date and time that the function was last updated, in ISO-8601 format
  /// (YYYY-MM-DDThh:mm:ss.sTZD).
  @JsonKey(name: 'LastModified')
  final String lastModified;

  /// The SHA256 hash of the function's deployment package.
  @JsonKey(name: 'CodeSha256')
  final String codeSha256;

  /// The version of the Lambda function.
  @JsonKey(name: 'Version')
  final String version;

  /// The function's networking configuration.
  @JsonKey(name: 'VpcConfig')
  final VpcConfigResponse vpcConfig;

  /// The function's dead letter queue.
  @JsonKey(name: 'DeadLetterConfig')
  final DeadLetterConfig deadLetterConfig;

  /// The function's environment variables.
  @JsonKey(name: 'Environment')
  final EnvironmentResponse environment;

  /// The KMS key that's used to encrypt the function's environment variables.
  /// This key is only returned if you've configured a customer-managed CMK.
  @JsonKey(name: 'KMSKeyArn')
  final String kMSKeyArn;

  /// The function's AWS X-Ray tracing configuration.
  @JsonKey(name: 'TracingConfig')
  final TracingConfigResponse tracingConfig;

  /// For Lambda@Edge functions, the ARN of the master function.
  @JsonKey(name: 'MasterArn')
  final String masterArn;

  /// The latest updated revision of the function or alias.
  @JsonKey(name: 'RevisionId')
  final String revisionId;

  /// The function's  layers.
  @JsonKey(name: 'Layers')
  final List<Layer> layers;

  FunctionConfiguration({
    this.functionName,
    this.functionArn,
    this.runtime,
    this.role,
    this.handler,
    this.codeSize,
    this.description,
    this.timeout,
    this.memorySize,
    this.lastModified,
    this.codeSha256,
    this.version,
    this.vpcConfig,
    this.deadLetterConfig,
    this.environment,
    this.kMSKeyArn,
    this.tracingConfig,
    this.masterArn,
    this.revisionId,
    this.layers,
  });

  factory FunctionConfiguration.fromJson(Map<String, dynamic> json) =>
      _$FunctionConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$FunctionConfigurationToJson(this);
}

@JsonSerializable()
class GetAccountSettingsResponse {
  /// Limits that are related to concurrency and code storage.
  @JsonKey(name: 'AccountLimit')
  final AccountLimit accountLimit;

  /// The number of functions and amount of storage in use.
  @JsonKey(name: 'AccountUsage')
  final AccountUsage accountUsage;

  GetAccountSettingsResponse({
    this.accountLimit,
    this.accountUsage,
  });

  factory GetAccountSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAccountSettingsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetAccountSettingsResponseToJson(this);
}

@JsonSerializable()
class GetAliasRequest {
  /// The name of the Lambda function.  Name formats     Function name - MyFunction.
  ///    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:MyFunction.
  ///    Partial ARN - 123456789012:function:MyFunction.   The length constraint
  /// applies only to the full ARN. If you specify only the function name, it
  /// is limited to 64 characters in length.
  @JsonKey(name: 'FunctionName')
  final String functionName;

  /// The name of the alias.
  @JsonKey(name: 'Name')
  final String name;

  GetAliasRequest({
    @required this.functionName,
    @required this.name,
  });

  factory GetAliasRequest.fromJson(Map<String, dynamic> json) =>
      _$GetAliasRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetAliasRequestToJson(this);
}

@JsonSerializable()
class GetEventSourceMappingRequest {
  /// The identifier of the event source mapping.
  @JsonKey(name: 'UUID')
  final String uUID;

  GetEventSourceMappingRequest({
    @required this.uUID,
  });

  factory GetEventSourceMappingRequest.fromJson(Map<String, dynamic> json) =>
      _$GetEventSourceMappingRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetEventSourceMappingRequestToJson(this);
}

@JsonSerializable()
class GetFunctionConfigurationRequest {
  /// The name of the Lambda function, version, or alias.  Name formats     Function
  /// name - my-function (name-only), my-function:v1 (with alias).    Function
  /// ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial
  /// ARN - 123456789012:function:my-function.   You can append a version number
  /// or alias to any of the formats. The length constraint applies only to the
  /// full ARN. If you specify only the function name, it is limited to 64 characters
  /// in length.
  @JsonKey(name: 'FunctionName')
  final String functionName;

  /// Specify a version or alias to get details about a published version of
  /// the function.
  @JsonKey(name: 'Qualifier')
  final String qualifier;

  GetFunctionConfigurationRequest({
    @required this.functionName,
    this.qualifier,
  });

  factory GetFunctionConfigurationRequest.fromJson(Map<String, dynamic> json) =>
      _$GetFunctionConfigurationRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetFunctionConfigurationRequestToJson(this);
}

@JsonSerializable()
class GetFunctionRequest {
  /// The name of the Lambda function, version, or alias.  Name formats     Function
  /// name - my-function (name-only), my-function:v1 (with alias).    Function
  /// ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial
  /// ARN - 123456789012:function:my-function.   You can append a version number
  /// or alias to any of the formats. The length constraint applies only to the
  /// full ARN. If you specify only the function name, it is limited to 64 characters
  /// in length.
  @JsonKey(name: 'FunctionName')
  final String functionName;

  /// Specify a version or alias to get details about a published version of
  /// the function.
  @JsonKey(name: 'Qualifier')
  final String qualifier;

  GetFunctionRequest({
    @required this.functionName,
    this.qualifier,
  });

  factory GetFunctionRequest.fromJson(Map<String, dynamic> json) =>
      _$GetFunctionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetFunctionRequestToJson(this);
}

@JsonSerializable()
class GetFunctionResponse {
  /// The configuration of the function or version.
  @JsonKey(name: 'Configuration')
  final FunctionConfiguration configuration;

  /// The deployment package of the function or version.
  @JsonKey(name: 'Code')
  final FunctionCodeLocation code;

  /// The function's tags.
  @JsonKey(name: 'Tags')
  final Map<String, String> tags;

  /// The function's reserved concurrency.
  @JsonKey(name: 'Concurrency')
  final Concurrency concurrency;

  GetFunctionResponse({
    this.configuration,
    this.code,
    this.tags,
    this.concurrency,
  });

  factory GetFunctionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetFunctionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetFunctionResponseToJson(this);
}

@JsonSerializable()
class GetLayerVersionByArnRequest {
  /// The ARN of the layer version.
  @JsonKey(name: 'Arn')
  final String arn;

  GetLayerVersionByArnRequest({
    @required this.arn,
  });

  factory GetLayerVersionByArnRequest.fromJson(Map<String, dynamic> json) =>
      _$GetLayerVersionByArnRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetLayerVersionByArnRequestToJson(this);
}

@JsonSerializable()
class GetLayerVersionPolicyRequest {
  /// The name or Amazon Resource Name (ARN) of the layer.
  @JsonKey(name: 'LayerName')
  final String layerName;

  /// The version number.
  @JsonKey(name: 'VersionNumber')
  final int versionNumber;

  GetLayerVersionPolicyRequest({
    @required this.layerName,
    @required this.versionNumber,
  });

  factory GetLayerVersionPolicyRequest.fromJson(Map<String, dynamic> json) =>
      _$GetLayerVersionPolicyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetLayerVersionPolicyRequestToJson(this);
}

@JsonSerializable()
class GetLayerVersionPolicyResponse {
  /// The policy document.
  @JsonKey(name: 'Policy')
  final String policy;

  /// A unique identifier for the current revision of the policy.
  @JsonKey(name: 'RevisionId')
  final String revisionId;

  GetLayerVersionPolicyResponse({
    this.policy,
    this.revisionId,
  });

  factory GetLayerVersionPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLayerVersionPolicyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetLayerVersionPolicyResponseToJson(this);
}

@JsonSerializable()
class GetLayerVersionRequest {
  /// The name or Amazon Resource Name (ARN) of the layer.
  @JsonKey(name: 'LayerName')
  final String layerName;

  /// The version number.
  @JsonKey(name: 'VersionNumber')
  final int versionNumber;

  GetLayerVersionRequest({
    @required this.layerName,
    @required this.versionNumber,
  });

  factory GetLayerVersionRequest.fromJson(Map<String, dynamic> json) =>
      _$GetLayerVersionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetLayerVersionRequestToJson(this);
}

@JsonSerializable()
class GetLayerVersionResponse {
  /// Details about the layer version.
  @JsonKey(name: 'Content')
  final LayerVersionContentOutput content;

  /// The ARN of the layer.
  @JsonKey(name: 'LayerArn')
  final String layerArn;

  /// The ARN of the layer version.
  @JsonKey(name: 'LayerVersionArn')
  final String layerVersionArn;

  /// The description of the version.
  @JsonKey(name: 'Description')
  final String description;

  /// The date that the layer version was created, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
  @JsonKey(name: 'CreatedDate')
  final String createdDate;

  /// The version number.
  @JsonKey(name: 'Version')
  final int version;

  /// The layer's compatible runtimes.
  @JsonKey(name: 'CompatibleRuntimes')
  final List<String> compatibleRuntimes;

  /// The layer's software license.
  @JsonKey(name: 'LicenseInfo')
  final String licenseInfo;

  GetLayerVersionResponse({
    this.content,
    this.layerArn,
    this.layerVersionArn,
    this.description,
    this.createdDate,
    this.version,
    this.compatibleRuntimes,
    this.licenseInfo,
  });

  factory GetLayerVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLayerVersionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetLayerVersionResponseToJson(this);
}

@JsonSerializable()
class GetPolicyRequest {
  /// The name of the Lambda function, version, or alias.  Name formats     Function
  /// name - my-function (name-only), my-function:v1 (with alias).    Function
  /// ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial
  /// ARN - 123456789012:function:my-function.   You can append a version number
  /// or alias to any of the formats. The length constraint applies only to the
  /// full ARN. If you specify only the function name, it is limited to 64 characters
  /// in length.
  @JsonKey(name: 'FunctionName')
  final String functionName;

  /// Specify a version or alias to get the policy for that resource.
  @JsonKey(name: 'Qualifier')
  final String qualifier;

  GetPolicyRequest({
    @required this.functionName,
    this.qualifier,
  });

  factory GetPolicyRequest.fromJson(Map<String, dynamic> json) =>
      _$GetPolicyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetPolicyRequestToJson(this);
}

@JsonSerializable()
class GetPolicyResponse {
  /// The resource-based policy.
  @JsonKey(name: 'Policy')
  final String policy;

  /// A unique identifier for the current revision of the policy.
  @JsonKey(name: 'RevisionId')
  final String revisionId;

  GetPolicyResponse({
    this.policy,
    this.revisionId,
  });

  factory GetPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPolicyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPolicyResponseToJson(this);
}

@JsonSerializable()
class InvocationRequest {
  /// The name of the Lambda function, version, or alias.  Name formats     Function
  /// name - my-function (name-only), my-function:v1 (with alias).    Function
  /// ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial
  /// ARN - 123456789012:function:my-function.   You can append a version number
  /// or alias to any of the formats. The length constraint applies only to the
  /// full ARN. If you specify only the function name, it is limited to 64 characters
  /// in length.
  @JsonKey(name: 'FunctionName')
  final String functionName;

  /// Choose from the following options.    RequestResponse (default) - Invoke
  /// the function synchronously. Keep the connection open until the function
  /// returns a response or times out. The API response includes the function
  /// response and additional data.    Event - Invoke the function asynchronously.
  /// Send events that fail multiple times to the function's dead-letter queue
  /// (if it's configured). The API response only includes a status code.
  /// DryRun - Validate parameter values and verify that the user or role has
  /// permission to invoke the function.
  ///
  /// Possible values: [Event, RequestResponse, DryRun]
  @JsonKey(name: 'InvocationType')
  final String invocationType;

  /// Set to Tail to include the execution log in the response.
  ///
  /// Possible values: [None, Tail]
  @JsonKey(name: 'LogType')
  final String logType;

  /// Up to 3583 bytes of base64-encoded data about the invoking client to pass
  /// to the function in the context object.
  @JsonKey(name: 'ClientContext')
  final String clientContext;

  /// The JSON that you want to provide to your Lambda function as input.
  @JsonKey(name: 'Payload')
  @Base64Converter()
  final String payload;

  /// Specify a version or alias to invoke a published version of the function.
  @JsonKey(name: 'Qualifier')
  final String qualifier;

  InvocationRequest({
    @required this.functionName,
    this.invocationType,
    this.logType,
    this.clientContext,
    this.payload,
    this.qualifier,
  });

  factory InvocationRequest.fromJson(Map<String, dynamic> json) =>
      _$InvocationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InvocationRequestToJson(this);
}

@JsonSerializable()
class InvocationResponse {
  /// The HTTP status code is in the 200 range for a successful request. For
  /// the RequestResponse invocation type, this status code is 200. For the Event
  /// invocation type, this status code is 202. For the DryRun invocation type,
  /// the status code is 204.
  @JsonKey(name: 'StatusCode')
  final int statusCode;

  /// If present, indicates that an error occurred during function execution.
  /// Details about the error are included in the response payload.    Handled
  /// - The runtime caught an error thrown by the function and formatted it into
  /// a JSON document.    Unhandled - The runtime didn't handle the error. For
  /// example, the function ran out of memory or timed out.
  @JsonKey(name: 'FunctionError')
  final String functionError;

  /// The last 4 KB of the execution log, which is base64 encoded.
  @JsonKey(name: 'LogResult')
  final String logResult;

  /// The response from the function, or an error object.
  @JsonKey(name: 'Payload')
  @Base64Converter()
  final String payload;

  /// The version of the function that executed. When you invoke a function with
  /// an alias, this indicates which version the alias resolved to.
  @JsonKey(name: 'ExecutedVersion')
  final String executedVersion;

  InvocationResponse({
    this.statusCode,
    this.functionError,
    this.logResult,
    this.payload,
    this.executedVersion,
  });

  factory InvocationResponse.fromJson(Map<String, dynamic> json) =>
      _$InvocationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InvocationResponseToJson(this);
}

@Deprecated("Deprecated")
@JsonSerializable()
class InvokeAsyncRequest {
  /// The name of the Lambda function.  Name formats     Function name - my-function.
  ///    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.
  ///    Partial ARN - 123456789012:function:my-function.   The length constraint
  /// applies only to the full ARN. If you specify only the function name, it
  /// is limited to 64 characters in length.
  @JsonKey(name: 'FunctionName')
  final String functionName;

  /// The JSON that you want to provide to your Lambda function as input.
  @JsonKey(name: 'InvokeArgs')
  @Base64Converter()
  final String invokeArgs;

  InvokeAsyncRequest({
    @required this.functionName,
    @required this.invokeArgs,
  });

  factory InvokeAsyncRequest.fromJson(Map<String, dynamic> json) =>
      _$InvokeAsyncRequestFromJson(json);

  Map<String, dynamic> toJson() => _$InvokeAsyncRequestToJson(this);
}

/// A success response (202 Accepted) indicates that the request is queued
/// for invocation.
@Deprecated("Deprecated")
@JsonSerializable()
class InvokeAsyncResponse {
  /// The status code.
  @JsonKey(name: 'Status')
  final int status;

  InvokeAsyncResponse({
    this.status,
  });

  factory InvokeAsyncResponse.fromJson(Map<String, dynamic> json) =>
      _$InvokeAsyncResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InvokeAsyncResponseToJson(this);
}

/// An AWS Lambda layer.
@JsonSerializable()
class Layer {
  /// The Amazon Resource Name (ARN) of the function layer.
  @JsonKey(name: 'Arn')
  final String arn;

  /// The size of the layer archive in bytes.
  @JsonKey(name: 'CodeSize')
  final int codeSize;

  Layer({
    this.arn,
    this.codeSize,
  });

  factory Layer.fromJson(Map<String, dynamic> json) => _$LayerFromJson(json);

  Map<String, dynamic> toJson() => _$LayerToJson(this);
}

/// A ZIP archive that contains the contents of an AWS Lambda layer. You can
/// specify either an Amazon S3 location, or upload a layer archive directly.
@JsonSerializable()
class LayerVersionContentInput {
  /// The Amazon S3 bucket of the layer archive.
  @JsonKey(name: 'S3Bucket')
  final String s3Bucket;

  /// The Amazon S3 key of the layer archive.
  @JsonKey(name: 'S3Key')
  final String s3Key;

  /// For versioned objects, the version of the layer archive object to use.
  @JsonKey(name: 'S3ObjectVersion')
  final String s3ObjectVersion;

  /// The base64-encoded contents of the layer archive. AWS SDK and AWS CLI clients
  /// handle the encoding for you.
  @JsonKey(name: 'ZipFile')
  @Base64Converter()
  final String zipFile;

  LayerVersionContentInput({
    this.s3Bucket,
    this.s3Key,
    this.s3ObjectVersion,
    this.zipFile,
  });

  factory LayerVersionContentInput.fromJson(Map<String, dynamic> json) =>
      _$LayerVersionContentInputFromJson(json);

  Map<String, dynamic> toJson() => _$LayerVersionContentInputToJson(this);
}

/// Details about a version of an AWS Lambda layer.
@JsonSerializable()
class LayerVersionContentOutput {
  /// A link to the layer archive in Amazon S3 that is valid for 10 minutes.
  @JsonKey(name: 'Location')
  final String location;

  /// The SHA-256 hash of the layer archive.
  @JsonKey(name: 'CodeSha256')
  final String codeSha256;

  /// The size of the layer archive in bytes.
  @JsonKey(name: 'CodeSize')
  final int codeSize;

  LayerVersionContentOutput({
    this.location,
    this.codeSha256,
    this.codeSize,
  });

  factory LayerVersionContentOutput.fromJson(Map<String, dynamic> json) =>
      _$LayerVersionContentOutputFromJson(json);

  Map<String, dynamic> toJson() => _$LayerVersionContentOutputToJson(this);
}

/// Details about a version of an AWS Lambda layer.
@JsonSerializable()
class LayerVersionsListItem {
  /// The ARN of the layer version.
  @JsonKey(name: 'LayerVersionArn')
  final String layerVersionArn;

  /// The version number.
  @JsonKey(name: 'Version')
  final int version;

  /// The description of the version.
  @JsonKey(name: 'Description')
  final String description;

  /// The date that the version was created, in ISO 8601 format. For example,
  /// 2018-11-27T15:10:45.123+0000.
  @JsonKey(name: 'CreatedDate')
  final String createdDate;

  /// The layer's compatible runtimes.
  @JsonKey(name: 'CompatibleRuntimes')
  final List<String> compatibleRuntimes;

  /// The layer's open-source license.
  @JsonKey(name: 'LicenseInfo')
  final String licenseInfo;

  LayerVersionsListItem({
    this.layerVersionArn,
    this.version,
    this.description,
    this.createdDate,
    this.compatibleRuntimes,
    this.licenseInfo,
  });

  factory LayerVersionsListItem.fromJson(Map<String, dynamic> json) =>
      _$LayerVersionsListItemFromJson(json);

  Map<String, dynamic> toJson() => _$LayerVersionsListItemToJson(this);
}

/// Details about an AWS Lambda layer.
@JsonSerializable()
class LayersListItem {
  /// The name of the layer.
  @JsonKey(name: 'LayerName')
  final String layerName;

  /// The Amazon Resource Name (ARN) of the function layer.
  @JsonKey(name: 'LayerArn')
  final String layerArn;

  /// The newest version of the layer.
  @JsonKey(name: 'LatestMatchingVersion')
  final LayerVersionsListItem latestMatchingVersion;

  LayersListItem({
    this.layerName,
    this.layerArn,
    this.latestMatchingVersion,
  });

  factory LayersListItem.fromJson(Map<String, dynamic> json) =>
      _$LayersListItemFromJson(json);

  Map<String, dynamic> toJson() => _$LayersListItemToJson(this);
}

@JsonSerializable()
class ListAliasesRequest {
  /// The name of the Lambda function.  Name formats     Function name - MyFunction.
  ///    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:MyFunction.
  ///    Partial ARN - 123456789012:function:MyFunction.   The length constraint
  /// applies only to the full ARN. If you specify only the function name, it
  /// is limited to 64 characters in length.
  @JsonKey(name: 'FunctionName')
  final String functionName;

  /// Specify a function version to only list aliases that invoke that version.
  @JsonKey(name: 'FunctionVersion')
  final String functionVersion;

  /// Specify the pagination token that's returned by a previous request to retrieve
  /// the next page of results.
  @JsonKey(name: 'Marker')
  final String marker;

  /// Limit the number of aliases returned.
  @JsonKey(name: 'MaxItems')
  final int maxItems;

  ListAliasesRequest({
    @required this.functionName,
    this.functionVersion,
    this.marker,
    this.maxItems,
  });

  factory ListAliasesRequest.fromJson(Map<String, dynamic> json) =>
      _$ListAliasesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ListAliasesRequestToJson(this);
}

@JsonSerializable()
class ListAliasesResponse {
  /// The pagination token that's included if more results are available.
  @JsonKey(name: 'NextMarker')
  final String nextMarker;

  /// A list of aliases.
  @JsonKey(name: 'Aliases')
  final List<AliasConfiguration> aliases;

  ListAliasesResponse({
    this.nextMarker,
    this.aliases,
  });

  factory ListAliasesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAliasesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListAliasesResponseToJson(this);
}

@JsonSerializable()
class ListEventSourceMappingsRequest {
  /// The Amazon Resource Name (ARN) of the event source.    Amazon Kinesis -
  /// The ARN of the data stream or a stream consumer.    Amazon DynamoDB Streams
  /// - The ARN of the stream.    Amazon Simple Queue Service - The ARN of the
  /// queue.
  @JsonKey(name: 'EventSourceArn')
  final String eventSourceArn;

  /// The name of the Lambda function.  Name formats     Function name - MyFunction.
  ///    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:MyFunction.
  ///    Version or Alias ARN - arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD.
  ///    Partial ARN - 123456789012:function:MyFunction.   The length constraint
  /// applies only to the full ARN. If you specify only the function name, it's
  /// limited to 64 characters in length.
  @JsonKey(name: 'FunctionName')
  final String functionName;

  /// A pagination token returned by a previous call.
  @JsonKey(name: 'Marker')
  final String marker;

  /// The maximum number of event source mappings to return.
  @JsonKey(name: 'MaxItems')
  final int maxItems;

  ListEventSourceMappingsRequest({
    this.eventSourceArn,
    this.functionName,
    this.marker,
    this.maxItems,
  });

  factory ListEventSourceMappingsRequest.fromJson(Map<String, dynamic> json) =>
      _$ListEventSourceMappingsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ListEventSourceMappingsRequestToJson(this);
}

@JsonSerializable()
class ListEventSourceMappingsResponse {
  /// A pagination token that's returned when the response doesn't contain all
  /// event source mappings.
  @JsonKey(name: 'NextMarker')
  final String nextMarker;

  /// A list of event source mappings.
  @JsonKey(name: 'EventSourceMappings')
  final List<EventSourceMappingConfiguration> eventSourceMappings;

  ListEventSourceMappingsResponse({
    this.nextMarker,
    this.eventSourceMappings,
  });

  factory ListEventSourceMappingsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListEventSourceMappingsResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ListEventSourceMappingsResponseToJson(this);
}

@JsonSerializable()
class ListFunctionsRequest {
  /// For Lambda@Edge functions, the AWS Region of the master function. For example,
  /// us-east-2 or ALL. If specified, you must set FunctionVersion to ALL.
  @JsonKey(name: 'MasterRegion')
  final String masterRegion;

  /// Set to ALL to include entries for all published versions of each function.
  ///
  /// Possible values: [ALL]
  @JsonKey(name: 'FunctionVersion')
  final String functionVersion;

  /// Specify the pagination token that's returned by a previous request to retrieve
  /// the next page of results.
  @JsonKey(name: 'Marker')
  final String marker;

  /// Specify a value between 1 and 50 to limit the number of functions in the
  /// response.
  @JsonKey(name: 'MaxItems')
  final int maxItems;

  ListFunctionsRequest({
    this.masterRegion,
    this.functionVersion,
    this.marker,
    this.maxItems,
  });

  factory ListFunctionsRequest.fromJson(Map<String, dynamic> json) =>
      _$ListFunctionsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ListFunctionsRequestToJson(this);
}

/// A list of Lambda functions.
@JsonSerializable()
class ListFunctionsResponse {
  /// The pagination token that's included if more results are available.
  @JsonKey(name: 'NextMarker')
  final String nextMarker;

  /// A list of Lambda functions.
  @JsonKey(name: 'Functions')
  final List<FunctionConfiguration> functions;

  ListFunctionsResponse({
    this.nextMarker,
    this.functions,
  });

  factory ListFunctionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFunctionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListFunctionsResponseToJson(this);
}

@JsonSerializable()
class ListLayerVersionsRequest {
  /// The name or Amazon Resource Name (ARN) of the layer.
  @JsonKey(name: 'LayerName')
  final String layerName;

  /// A runtime identifier. For example, go1.x.
  ///
  /// Possible values: [nodejs, nodejs4.3, nodejs6.10, nodejs8.10, nodejs10.x, java8, python2.7, python3.6, python3.7, dotnetcore1.0, dotnetcore2.0, dotnetcore2.1, nodejs4.3-edge, go1.x, ruby2.5, provided]
  @JsonKey(name: 'CompatibleRuntime')
  final String compatibleRuntime;

  /// A pagination token returned by a previous call.
  @JsonKey(name: 'Marker')
  final String marker;

  /// The maximum number of versions to return.
  @JsonKey(name: 'MaxItems')
  final int maxItems;

  ListLayerVersionsRequest({
    @required this.layerName,
    this.compatibleRuntime,
    this.marker,
    this.maxItems,
  });

  factory ListLayerVersionsRequest.fromJson(Map<String, dynamic> json) =>
      _$ListLayerVersionsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ListLayerVersionsRequestToJson(this);
}

@JsonSerializable()
class ListLayerVersionsResponse {
  /// A pagination token returned when the response doesn't contain all versions.
  @JsonKey(name: 'NextMarker')
  final String nextMarker;

  /// A list of versions.
  @JsonKey(name: 'LayerVersions')
  final List<LayerVersionsListItem> layerVersions;

  ListLayerVersionsResponse({
    this.nextMarker,
    this.layerVersions,
  });

  factory ListLayerVersionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListLayerVersionsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListLayerVersionsResponseToJson(this);
}

@JsonSerializable()
class ListLayersRequest {
  /// A runtime identifier. For example, go1.x.
  ///
  /// Possible values: [nodejs, nodejs4.3, nodejs6.10, nodejs8.10, nodejs10.x, java8, python2.7, python3.6, python3.7, dotnetcore1.0, dotnetcore2.0, dotnetcore2.1, nodejs4.3-edge, go1.x, ruby2.5, provided]
  @JsonKey(name: 'CompatibleRuntime')
  final String compatibleRuntime;

  /// A pagination token returned by a previous call.
  @JsonKey(name: 'Marker')
  final String marker;

  /// The maximum number of layers to return.
  @JsonKey(name: 'MaxItems')
  final int maxItems;

  ListLayersRequest({
    this.compatibleRuntime,
    this.marker,
    this.maxItems,
  });

  factory ListLayersRequest.fromJson(Map<String, dynamic> json) =>
      _$ListLayersRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ListLayersRequestToJson(this);
}

@JsonSerializable()
class ListLayersResponse {
  /// A pagination token returned when the response doesn't contain all layers.
  @JsonKey(name: 'NextMarker')
  final String nextMarker;

  /// A list of function layers.
  @JsonKey(name: 'Layers')
  final List<LayersListItem> layers;

  ListLayersResponse({
    this.nextMarker,
    this.layers,
  });

  factory ListLayersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListLayersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListLayersResponseToJson(this);
}

@JsonSerializable()
class ListTagsRequest {
  /// The function's Amazon Resource Name (ARN).
  @JsonKey(name: 'Resource')
  final String resource;

  ListTagsRequest({
    @required this.resource,
  });

  factory ListTagsRequest.fromJson(Map<String, dynamic> json) =>
      _$ListTagsRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ListTagsRequestToJson(this);
}

@JsonSerializable()
class ListTagsResponse {
  /// The function's tags.
  @JsonKey(name: 'Tags')
  final Map<String, String> tags;

  ListTagsResponse({
    this.tags,
  });

  factory ListTagsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListTagsResponseToJson(this);
}

@JsonSerializable()
class ListVersionsByFunctionRequest {
  /// The name of the Lambda function.  Name formats     Function name - MyFunction.
  ///    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:MyFunction.
  ///    Partial ARN - 123456789012:function:MyFunction.   The length constraint
  /// applies only to the full ARN. If you specify only the function name, it
  /// is limited to 64 characters in length.
  @JsonKey(name: 'FunctionName')
  final String functionName;

  /// Specify the pagination token that's returned by a previous request to retrieve
  /// the next page of results.
  @JsonKey(name: 'Marker')
  final String marker;

  /// Limit the number of versions that are returned.
  @JsonKey(name: 'MaxItems')
  final int maxItems;

  ListVersionsByFunctionRequest({
    @required this.functionName,
    this.marker,
    this.maxItems,
  });

  factory ListVersionsByFunctionRequest.fromJson(Map<String, dynamic> json) =>
      _$ListVersionsByFunctionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ListVersionsByFunctionRequestToJson(this);
}

@JsonSerializable()
class ListVersionsByFunctionResponse {
  /// The pagination token that's included if more results are available.
  @JsonKey(name: 'NextMarker')
  final String nextMarker;

  /// A list of Lambda function versions.
  @JsonKey(name: 'Versions')
  final List<FunctionConfiguration> versions;

  ListVersionsByFunctionResponse({
    this.nextMarker,
    this.versions,
  });

  factory ListVersionsByFunctionResponse.fromJson(Map<String, dynamic> json) =>
      _$ListVersionsByFunctionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListVersionsByFunctionResponseToJson(this);
}

@JsonSerializable()
class PublishLayerVersionRequest {
  /// The name or Amazon Resource Name (ARN) of the layer.
  @JsonKey(name: 'LayerName')
  final String layerName;

  /// The function layer archive.
  @JsonKey(name: 'Content')
  final LayerVersionContentInput content;

  /// The description of the version.
  @JsonKey(name: 'Description')
  final String description;

  /// A list of compatible function runtimes. Used for filtering with ListLayers
  /// and ListLayerVersions.
  @JsonKey(name: 'CompatibleRuntimes')
  final List<String> compatibleRuntimes;

  /// The layer's software license. It can be any of the following:   An SPDX
  /// license identifier. For example, MIT.   The URL of a license hosted on
  /// the internet. For example, https://opensource.org/licenses/MIT.   The full
  /// text of the license.
  @JsonKey(name: 'LicenseInfo')
  final String licenseInfo;

  PublishLayerVersionRequest({
    @required this.layerName,
    @required this.content,
    this.description,
    this.compatibleRuntimes,
    this.licenseInfo,
  });

  factory PublishLayerVersionRequest.fromJson(Map<String, dynamic> json) =>
      _$PublishLayerVersionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PublishLayerVersionRequestToJson(this);
}

@JsonSerializable()
class PublishLayerVersionResponse {
  /// Details about the layer version.
  @JsonKey(name: 'Content')
  final LayerVersionContentOutput content;

  /// The ARN of the layer.
  @JsonKey(name: 'LayerArn')
  final String layerArn;

  /// The ARN of the layer version.
  @JsonKey(name: 'LayerVersionArn')
  final String layerVersionArn;

  /// The description of the version.
  @JsonKey(name: 'Description')
  final String description;

  /// The date that the layer version was created, in ISO-8601 format (YYYY-MM-DDThh:mm:ss.sTZD).
  @JsonKey(name: 'CreatedDate')
  final String createdDate;

  /// The version number.
  @JsonKey(name: 'Version')
  final int version;

  /// The layer's compatible runtimes.
  @JsonKey(name: 'CompatibleRuntimes')
  final List<String> compatibleRuntimes;

  /// The layer's software license.
  @JsonKey(name: 'LicenseInfo')
  final String licenseInfo;

  PublishLayerVersionResponse({
    this.content,
    this.layerArn,
    this.layerVersionArn,
    this.description,
    this.createdDate,
    this.version,
    this.compatibleRuntimes,
    this.licenseInfo,
  });

  factory PublishLayerVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$PublishLayerVersionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PublishLayerVersionResponseToJson(this);
}

@JsonSerializable()
class PublishVersionRequest {
  /// The name of the Lambda function.  Name formats     Function name - MyFunction.
  ///    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:MyFunction.
  ///    Partial ARN - 123456789012:function:MyFunction.   The length constraint
  /// applies only to the full ARN. If you specify only the function name, it
  /// is limited to 64 characters in length.
  @JsonKey(name: 'FunctionName')
  final String functionName;

  /// Only publish a version if the hash value matches the value that's specified.
  /// Use this option to avoid publishing a version if the function code has
  /// changed since you last updated it. You can get the hash for the version
  /// that you uploaded from the output of UpdateFunctionCode.
  @JsonKey(name: 'CodeSha256')
  final String codeSha256;

  /// A description for the version to override the description in the function
  /// configuration.
  @JsonKey(name: 'Description')
  final String description;

  /// Only update the function if the revision ID matches the ID that's specified.
  /// Use this option to avoid publishing a version if the function configuration
  /// has changed since you last updated it.
  @JsonKey(name: 'RevisionId')
  final String revisionId;

  PublishVersionRequest({
    @required this.functionName,
    this.codeSha256,
    this.description,
    this.revisionId,
  });

  factory PublishVersionRequest.fromJson(Map<String, dynamic> json) =>
      _$PublishVersionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PublishVersionRequestToJson(this);
}

@JsonSerializable()
class PutFunctionConcurrencyRequest {
  /// The name of the Lambda function.  Name formats     Function name - my-function.
  ///    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.
  ///    Partial ARN - 123456789012:function:my-function.   The length constraint
  /// applies only to the full ARN. If you specify only the function name, it
  /// is limited to 64 characters in length.
  @JsonKey(name: 'FunctionName')
  final String functionName;

  /// The number of simultaneous executions to reserve for the function.
  @JsonKey(name: 'ReservedConcurrentExecutions')
  final int reservedConcurrentExecutions;

  PutFunctionConcurrencyRequest({
    @required this.functionName,
    @required this.reservedConcurrentExecutions,
  });

  factory PutFunctionConcurrencyRequest.fromJson(Map<String, dynamic> json) =>
      _$PutFunctionConcurrencyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PutFunctionConcurrencyRequestToJson(this);
}

@JsonSerializable()
class RemoveLayerVersionPermissionRequest {
  /// The name or Amazon Resource Name (ARN) of the layer.
  @JsonKey(name: 'LayerName')
  final String layerName;

  /// The version number.
  @JsonKey(name: 'VersionNumber')
  final int versionNumber;

  /// The identifier that was specified when the statement was added.
  @JsonKey(name: 'StatementId')
  final String statementId;

  /// Only update the policy if the revision ID matches the ID specified. Use
  /// this option to avoid modifying a policy that has changed since you last
  /// read it.
  @JsonKey(name: 'RevisionId')
  final String revisionId;

  RemoveLayerVersionPermissionRequest({
    @required this.layerName,
    @required this.versionNumber,
    @required this.statementId,
    this.revisionId,
  });

  factory RemoveLayerVersionPermissionRequest.fromJson(
          Map<String, dynamic> json) =>
      _$RemoveLayerVersionPermissionRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RemoveLayerVersionPermissionRequestToJson(this);
}

@JsonSerializable()
class RemovePermissionRequest {
  /// The name of the Lambda function, version, or alias.  Name formats     Function
  /// name - my-function (name-only), my-function:v1 (with alias).    Function
  /// ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.    Partial
  /// ARN - 123456789012:function:my-function.   You can append a version number
  /// or alias to any of the formats. The length constraint applies only to the
  /// full ARN. If you specify only the function name, it is limited to 64 characters
  /// in length.
  @JsonKey(name: 'FunctionName')
  final String functionName;

  /// Statement ID of the permission to remove.
  @JsonKey(name: 'StatementId')
  final String statementId;

  /// Specify a version or alias to remove permissions from a published version
  /// of the function.
  @JsonKey(name: 'Qualifier')
  final String qualifier;

  /// Only update the policy if the revision ID matches the ID that's specified.
  /// Use this option to avoid modifying a policy that has changed since you
  /// last read it.
  @JsonKey(name: 'RevisionId')
  final String revisionId;

  RemovePermissionRequest({
    @required this.functionName,
    @required this.statementId,
    this.qualifier,
    this.revisionId,
  });

  factory RemovePermissionRequest.fromJson(Map<String, dynamic> json) =>
      _$RemovePermissionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RemovePermissionRequestToJson(this);
}

@JsonSerializable()
class TagResourceRequest {
  /// The function's Amazon Resource Name (ARN).
  @JsonKey(name: 'Resource')
  final String resource;

  /// A list of tags to apply to the function.
  @JsonKey(name: 'Tags')
  final Map<String, String> tags;

  TagResourceRequest({
    @required this.resource,
    @required this.tags,
  });

  factory TagResourceRequest.fromJson(Map<String, dynamic> json) =>
      _$TagResourceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TagResourceRequestToJson(this);
}

/// The function's AWS X-Ray tracing configuration.
@JsonSerializable()
class TracingConfig {
  /// The tracing mode.
  ///
  /// Possible values: [Active, PassThrough]
  @JsonKey(name: 'Mode')
  final String mode;

  TracingConfig({
    this.mode,
  });

  factory TracingConfig.fromJson(Map<String, dynamic> json) =>
      _$TracingConfigFromJson(json);

  Map<String, dynamic> toJson() => _$TracingConfigToJson(this);
}

/// The function's AWS X-Ray tracing configuration.
@JsonSerializable()
class TracingConfigResponse {
  /// The tracing mode.
  ///
  /// Possible values: [Active, PassThrough]
  @JsonKey(name: 'Mode')
  final String mode;

  TracingConfigResponse({
    this.mode,
  });

  factory TracingConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$TracingConfigResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TracingConfigResponseToJson(this);
}

@JsonSerializable()
class UntagResourceRequest {
  /// The function's Amazon Resource Name (ARN).
  @JsonKey(name: 'Resource')
  final String resource;

  /// A list of tag keys to remove from the function.
  @JsonKey(name: 'TagKeys')
  final List<String> tagKeys;

  UntagResourceRequest({
    @required this.resource,
    @required this.tagKeys,
  });

  factory UntagResourceRequest.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UntagResourceRequestToJson(this);
}

@JsonSerializable()
class UpdateAliasRequest {
  /// The name of the Lambda function.  Name formats     Function name - MyFunction.
  ///    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:MyFunction.
  ///    Partial ARN - 123456789012:function:MyFunction.   The length constraint
  /// applies only to the full ARN. If you specify only the function name, it
  /// is limited to 64 characters in length.
  @JsonKey(name: 'FunctionName')
  final String functionName;

  /// The name of the alias.
  @JsonKey(name: 'Name')
  final String name;

  /// The function version that the alias invokes.
  @JsonKey(name: 'FunctionVersion')
  final String functionVersion;

  /// A description of the alias.
  @JsonKey(name: 'Description')
  final String description;

  /// The routing configuration of the alias.
  @JsonKey(name: 'RoutingConfig')
  final AliasRoutingConfiguration routingConfig;

  /// Only update the alias if the revision ID matches the ID that's specified.
  /// Use this option to avoid modifying an alias that has changed since you
  /// last read it.
  @JsonKey(name: 'RevisionId')
  final String revisionId;

  UpdateAliasRequest({
    @required this.functionName,
    @required this.name,
    this.functionVersion,
    this.description,
    this.routingConfig,
    this.revisionId,
  });

  factory UpdateAliasRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateAliasRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateAliasRequestToJson(this);
}

@JsonSerializable()
class UpdateEventSourceMappingRequest {
  /// The identifier of the event source mapping.
  @JsonKey(name: 'UUID')
  final String uUID;

  /// The name of the Lambda function.  Name formats     Function name - MyFunction.
  ///    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:MyFunction.
  ///    Version or Alias ARN - arn:aws:lambda:us-west-2:123456789012:function:MyFunction:PROD.
  ///    Partial ARN - 123456789012:function:MyFunction.   The length constraint
  /// applies only to the full ARN. If you specify only the function name, it's
  /// limited to 64 characters in length.
  @JsonKey(name: 'FunctionName')
  final String functionName;

  /// Disables the event source mapping to pause polling and invocation.
  @JsonKey(name: 'Enabled')
  final bool enabled;

  /// The maximum number of items to retrieve in a single batch.    Amazon Kinesis
  /// - Default 100. Max 10,000.    Amazon DynamoDB Streams - Default 100. Max
  /// 1,000.    Amazon Simple Queue Service - Default 10. Max 10.
  @JsonKey(name: 'BatchSize')
  final int batchSize;
  @JsonKey(name: 'MaximumBatchingWindowInSeconds')
  final int maximumBatchingWindowInSeconds;

  UpdateEventSourceMappingRequest({
    @required this.uUID,
    this.functionName,
    this.enabled,
    this.batchSize,
    this.maximumBatchingWindowInSeconds,
  });

  factory UpdateEventSourceMappingRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateEventSourceMappingRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UpdateEventSourceMappingRequestToJson(this);
}

@JsonSerializable()
class UpdateFunctionCodeRequest {
  /// The name of the Lambda function.  Name formats     Function name - my-function.
  ///    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.
  ///    Partial ARN - 123456789012:function:my-function.   The length constraint
  /// applies only to the full ARN. If you specify only the function name, it
  /// is limited to 64 characters in length.
  @JsonKey(name: 'FunctionName')
  final String functionName;

  /// The base64-encoded contents of the deployment package. AWS SDK and AWS
  /// CLI clients handle the encoding for you.
  @JsonKey(name: 'ZipFile')
  @Base64Converter()
  final String zipFile;

  /// An Amazon S3 bucket in the same AWS Region as your function. The bucket
  /// can be in a different AWS account.
  @JsonKey(name: 'S3Bucket')
  final String s3Bucket;

  /// The Amazon S3 key of the deployment package.
  @JsonKey(name: 'S3Key')
  final String s3Key;

  /// For versioned objects, the version of the deployment package object to
  /// use.
  @JsonKey(name: 'S3ObjectVersion')
  final String s3ObjectVersion;

  /// Set to true to publish a new version of the function after updating the
  /// code. This has the same effect as calling PublishVersion separately.
  @JsonKey(name: 'Publish')
  final bool publish;

  /// Set to true to validate the request parameters and access permissions without
  /// modifying the function code.
  @JsonKey(name: 'DryRun')
  final bool dryRun;

  /// Only update the function if the revision ID matches the ID that's specified.
  /// Use this option to avoid modifying a function that has changed since you
  /// last read it.
  @JsonKey(name: 'RevisionId')
  final String revisionId;

  UpdateFunctionCodeRequest({
    @required this.functionName,
    this.zipFile,
    this.s3Bucket,
    this.s3Key,
    this.s3ObjectVersion,
    this.publish,
    this.dryRun,
    this.revisionId,
  });

  factory UpdateFunctionCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateFunctionCodeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateFunctionCodeRequestToJson(this);
}

@JsonSerializable()
class UpdateFunctionConfigurationRequest {
  /// The name of the Lambda function.  Name formats     Function name - my-function.
  ///    Function ARN - arn:aws:lambda:us-west-2:123456789012:function:my-function.
  ///    Partial ARN - 123456789012:function:my-function.   The length constraint
  /// applies only to the full ARN. If you specify only the function name, it
  /// is limited to 64 characters in length.
  @JsonKey(name: 'FunctionName')
  final String functionName;

  /// The Amazon Resource Name (ARN) of the function's execution role.
  @JsonKey(name: 'Role')
  final String role;

  /// The name of the method within your code that Lambda calls to execute your
  /// function. The format includes the file name. It can also include namespaces
  /// and other qualifiers, depending on the runtime. For more information, see
  /// Programming Model.
  @JsonKey(name: 'Handler')
  final String handler;

  /// A description of the function.
  @JsonKey(name: 'Description')
  final String description;

  /// The amount of time that Lambda allows a function to run before stopping
  /// it. The default is 3 seconds. The maximum allowed value is 900 seconds.
  @JsonKey(name: 'Timeout')
  final int timeout;

  /// The amount of memory that your function has access to. Increasing the function's
  /// memory also increases its CPU allocation. The default value is 128 MB.
  /// The value must be a multiple of 64 MB.
  @JsonKey(name: 'MemorySize')
  final int memorySize;

  /// For network connectivity to AWS resources in a VPC, specify a list of security
  /// groups and subnets in the VPC. When you connect a function to a VPC, it
  /// can only access resources and the internet through that VPC. For more information,
  /// see VPC Settings.
  @JsonKey(name: 'VpcConfig')
  final VpcConfig vpcConfig;

  /// Environment variables that are accessible from function code during execution.
  @JsonKey(name: 'Environment')
  final Environment environment;

  /// The identifier of the function's runtime.
  ///
  /// Possible values: [nodejs, nodejs4.3, nodejs6.10, nodejs8.10, nodejs10.x, java8, python2.7, python3.6, python3.7, dotnetcore1.0, dotnetcore2.0, dotnetcore2.1, nodejs4.3-edge, go1.x, ruby2.5, provided]
  @JsonKey(name: 'Runtime')
  final String runtime;

  /// A dead letter queue configuration that specifies the queue or topic where
  /// Lambda sends asynchronous events when they fail processing. For more information,
  /// see Dead Letter Queues.
  @JsonKey(name: 'DeadLetterConfig')
  final DeadLetterConfig deadLetterConfig;

  /// The ARN of the AWS Key Management Service (AWS KMS) key that's used to
  /// encrypt your function's environment variables. If it's not provided, AWS
  /// Lambda uses a default service key.
  @JsonKey(name: 'KMSKeyArn')
  final String kMSKeyArn;

  /// Set Mode to Active to sample and trace a subset of incoming requests with
  /// AWS X-Ray.
  @JsonKey(name: 'TracingConfig')
  final TracingConfig tracingConfig;

  /// Only update the function if the revision ID matches the ID that's specified.
  /// Use this option to avoid modifying a function that has changed since you
  /// last read it.
  @JsonKey(name: 'RevisionId')
  final String revisionId;

  /// A list of function layers to add to the function's execution environment.
  /// Specify each layer by its ARN, including the version.
  @JsonKey(name: 'Layers')
  final List<String> layers;

  UpdateFunctionConfigurationRequest({
    @required this.functionName,
    this.role,
    this.handler,
    this.description,
    this.timeout,
    this.memorySize,
    this.vpcConfig,
    this.environment,
    this.runtime,
    this.deadLetterConfig,
    this.kMSKeyArn,
    this.tracingConfig,
    this.revisionId,
    this.layers,
  });

  factory UpdateFunctionConfigurationRequest.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateFunctionConfigurationRequestFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UpdateFunctionConfigurationRequestToJson(this);
}

/// The VPC security groups and subnets that are attached to a Lambda function.
@JsonSerializable()
class VpcConfig {
  /// A list of VPC subnet IDs.
  @JsonKey(name: 'SubnetIds')
  final List<String> subnetIds;

  /// A list of VPC security groups IDs.
  @JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

  VpcConfig({
    this.subnetIds,
    this.securityGroupIds,
  });

  factory VpcConfig.fromJson(Map<String, dynamic> json) =>
      _$VpcConfigFromJson(json);

  Map<String, dynamic> toJson() => _$VpcConfigToJson(this);
}

/// The VPC security groups and subnets that are attached to a Lambda function.
@JsonSerializable()
class VpcConfigResponse {
  /// A list of VPC subnet IDs.
  @JsonKey(name: 'SubnetIds')
  final List<String> subnetIds;

  /// A list of VPC security groups IDs.
  @JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

  /// The ID of the VPC.
  @JsonKey(name: 'VpcId')
  final String vpcId;

  VpcConfigResponse({
    this.subnetIds,
    this.securityGroupIds,
    this.vpcId,
  });

  factory VpcConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$VpcConfigResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VpcConfigResponseToJson(this);
}

class Base64Converter implements JsonConverter<String, String> {
  const Base64Converter();

  @override
  String fromJson(String json) => utf8.decode(base64Decode(json));

  @override
  String toJson(String object) => base64Encode(utf8.encode(object));
}

class Base64ListConverter implements JsonConverter<List<String>, List<String>> {
  const Base64ListConverter();

  @override
  List<String> fromJson(List<String> json) =>
      json.map((x) => utf8.decode(base64Decode(x))).toList(growable: false);

  @override
  List<String> toJson(List<String> object) =>
      object.map((x) => base64Encode(utf8.encode(x))).toList(growable: false);
}
