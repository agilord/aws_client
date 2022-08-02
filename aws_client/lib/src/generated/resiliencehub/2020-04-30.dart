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

/// AWS Resilience Hub helps you proactively prepare and protect your Amazon Web
/// Services applications from disruptions. Resilience Hub offers continuous
/// resiliency assessment and validation that integrates into your software
/// development lifecycle. This enables you to uncover resiliency weaknesses,
/// ensure recovery time objective (RTO) and recovery point objective (RPO)
/// targets for your applications are met, and resolve issues before they are
/// released into production.
class ResilienceHub {
  final _s.RestJsonProtocol _protocol;
  ResilienceHub({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'resiliencehub',
            signingName: 'resiliencehub',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Adds the resource mapping for the draft application version.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [resourceMappings] :
  /// Mappings used to map logical resources from the template to physical
  /// resources. You can use the mapping type <code>CFN_STACK</code> if the
  /// application template uses a logical stack name. Or you can map individual
  /// resources by using the mapping type <code>RESOURCE</code>. We recommend
  /// using the mapping type <code>CFN_STACK</code> if the application is backed
  /// by a CloudFormation stack.
  Future<AddDraftAppVersionResourceMappingsResponse>
      addDraftAppVersionResourceMappings({
    required String appArn,
    required List<ResourceMapping> resourceMappings,
  }) async {
    ArgumentError.checkNotNull(appArn, 'appArn');
    ArgumentError.checkNotNull(resourceMappings, 'resourceMappings');
    final $payload = <String, dynamic>{
      'appArn': appArn,
      'resourceMappings': resourceMappings,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/add-draft-app-version-resource-mappings',
      exceptionFnMap: _exceptionFns,
    );
    return AddDraftAppVersionResourceMappingsResponse.fromJson(response);
  }

  /// Creates a Resilience Hub application. A Resilience Hub application is a
  /// collection of Amazon Web Services resources structured to prevent and
  /// recover Amazon Web Services application disruptions. To describe a
  /// Resilience Hub application, you provide an application name, resources
  /// from one or more–up to five–CloudFormation stacks, and an appropriate
  /// resiliency policy.
  /// <pre><code> &lt;p&gt;After you create a Resilience Hub application, you
  /// publish it so that you can run a resiliency assessment on it. You can then
  /// use recommendations from the assessment to improve resiliency by running
  /// another assessment, comparing results, and then iterating the process
  /// until you achieve your goals for recovery time objective (RTO) and
  /// recovery point objective (RPO).&lt;/p&gt; </code></pre>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name for the application.
  ///
  /// Parameter [assessmentSchedule] :
  /// Assessment execution schedule with 'Daily' or 'Disabled' values.
  ///
  /// Parameter [clientToken] :
  /// Used for an idempotency token. A client token is a unique, case-sensitive
  /// string of up to 64 ASCII characters. You should not reuse the same client
  /// token for other API requests.
  ///
  /// Parameter [description] :
  /// The optional description for an app.
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the resiliency policy. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:resiliency-policy/<code>policy-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [tags] :
  /// The tags assigned to the resource. A tag is a label that you assign to an
  /// Amazon Web Services resource. Each tag consists of a key/value pair.
  Future<CreateAppResponse> createApp({
    required String name,
    AppAssessmentScheduleType? assessmentSchedule,
    String? clientToken,
    String? description,
    String? policyArn,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final $payload = <String, dynamic>{
      'name': name,
      if (assessmentSchedule != null)
        'assessmentSchedule': assessmentSchedule.toValue(),
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (policyArn != null) 'policyArn': policyArn,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/create-app',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAppResponse.fromJson(response);
  }

  /// Creates a new recommendation template.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [assessmentArn] :
  /// The Amazon Resource Name (ARN) of the assessment. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [name] :
  /// The name for the recommendation template.
  ///
  /// Parameter [bucketName] :
  /// The name of the Amazon S3 bucket that will contain the recommendation
  /// template.
  ///
  /// Parameter [clientToken] :
  /// Used for an idempotency token. A client token is a unique, case-sensitive
  /// string of up to 64 ASCII characters. You should not reuse the same client
  /// token for other API requests.
  ///
  /// Parameter [format] :
  /// The format for the recommendation template.
  /// <dl> <dt>CfnJson</dt> <dd>
  /// The template is CloudFormation JSON.
  /// </dd> <dt>CfnYaml</dt> <dd>
  /// The template is CloudFormation YAML.
  /// </dd> </dl>
  ///
  /// Parameter [recommendationIds] :
  /// Identifiers for the recommendations used to create a recommendation
  /// template.
  ///
  /// Parameter [recommendationTypes] :
  /// An array of strings that specify the recommendation template type or
  /// types.
  /// <dl> <dt>Alarm</dt> <dd>
  /// The template is an <a>AlarmRecommendation</a> template.
  /// </dd> <dt>Sop</dt> <dd>
  /// The template is a <a>SopRecommendation</a> template.
  /// </dd> <dt>Test</dt> <dd>
  /// The template is a <a>TestRecommendation</a> template.
  /// </dd> </dl>
  ///
  /// Parameter [tags] :
  /// The tags assigned to the resource. A tag is a label that you assign to an
  /// Amazon Web Services resource. Each tag consists of a key/value pair.
  Future<CreateRecommendationTemplateResponse> createRecommendationTemplate({
    required String assessmentArn,
    required String name,
    String? bucketName,
    String? clientToken,
    TemplateFormat? format,
    List<String>? recommendationIds,
    List<RenderRecommendationType>? recommendationTypes,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(assessmentArn, 'assessmentArn');
    ArgumentError.checkNotNull(name, 'name');
    final $payload = <String, dynamic>{
      'assessmentArn': assessmentArn,
      'name': name,
      if (bucketName != null) 'bucketName': bucketName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (format != null) 'format': format.toValue(),
      if (recommendationIds != null) 'recommendationIds': recommendationIds,
      if (recommendationTypes != null)
        'recommendationTypes':
            recommendationTypes.map((e) => e.toValue()).toList(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/create-recommendation-template',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRecommendationTemplateResponse.fromJson(response);
  }

  /// Creates a resiliency policy for an application.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [policy] :
  /// The type of resiliency policy to be created, including the recovery time
  /// objective (RTO) and recovery point objective (RPO) in seconds.
  ///
  /// Parameter [policyName] :
  /// The name of the policy
  ///
  /// Parameter [tier] :
  /// The tier for this resiliency policy, ranging from the highest severity
  /// (<code>MissionCritical</code>) to lowest (<code>NonCritical</code>).
  ///
  /// Parameter [clientToken] :
  /// Used for an idempotency token. A client token is a unique, case-sensitive
  /// string of up to 64 ASCII characters. You should not reuse the same client
  /// token for other API requests.
  ///
  /// Parameter [dataLocationConstraint] :
  /// Specifies a high-level geographical location constraint for where your
  /// resilience policy data can be stored.
  ///
  /// Parameter [policyDescription] :
  /// The description for the policy.
  ///
  /// Parameter [tags] :
  /// The tags assigned to the resource. A tag is a label that you assign to an
  /// Amazon Web Services resource. Each tag consists of a key/value pair.
  Future<CreateResiliencyPolicyResponse> createResiliencyPolicy({
    required Map<DisruptionType, FailurePolicy> policy,
    required String policyName,
    required ResiliencyPolicyTier tier,
    String? clientToken,
    DataLocationConstraint? dataLocationConstraint,
    String? policyDescription,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(policy, 'policy');
    ArgumentError.checkNotNull(policyName, 'policyName');
    ArgumentError.checkNotNull(tier, 'tier');
    final $payload = <String, dynamic>{
      'policy': policy.map((k, e) => MapEntry(k.toValue(), e)),
      'policyName': policyName,
      'tier': tier.toValue(),
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (dataLocationConstraint != null)
        'dataLocationConstraint': dataLocationConstraint.toValue(),
      if (policyDescription != null) 'policyDescription': policyDescription,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/create-resiliency-policy',
      exceptionFnMap: _exceptionFns,
    );
    return CreateResiliencyPolicyResponse.fromJson(response);
  }

  /// Deletes an AWS Resilience Hub application. This is a destructive action
  /// that can't be undone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [appArn] :
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [clientToken] :
  /// Used for an idempotency token. A client token is a unique, case-sensitive
  /// string of up to 64 ASCII characters. You should not reuse the same client
  /// token for other API requests.
  ///
  /// Parameter [forceDelete] :
  /// A boolean option to force the deletion of a Resilience Hub application.
  Future<DeleteAppResponse> deleteApp({
    required String appArn,
    String? clientToken,
    bool? forceDelete,
  }) async {
    ArgumentError.checkNotNull(appArn, 'appArn');
    final $payload = <String, dynamic>{
      'appArn': appArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (forceDelete != null) 'forceDelete': forceDelete,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delete-app',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAppResponse.fromJson(response);
  }

  /// Deletes an AWS Resilience Hub application assessment. This is a
  /// destructive action that can't be undone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [assessmentArn] :
  /// The Amazon Resource Name (ARN) of the assessment. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [clientToken] :
  /// Used for an idempotency token. A client token is a unique, case-sensitive
  /// string of up to 64 ASCII characters. You should not reuse the same client
  /// token for other API requests.
  Future<DeleteAppAssessmentResponse> deleteAppAssessment({
    required String assessmentArn,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(assessmentArn, 'assessmentArn');
    final $payload = <String, dynamic>{
      'assessmentArn': assessmentArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delete-app-assessment',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAppAssessmentResponse.fromJson(response);
  }

  /// Deletes a recommendation template. This is a destructive action that can't
  /// be undone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [recommendationTemplateArn] :
  /// The Amazon Resource Name (ARN) for a recommendation template.
  ///
  /// Parameter [clientToken] :
  /// Used for an idempotency token. A client token is a unique, case-sensitive
  /// string of up to 64 ASCII characters. You should not reuse the same client
  /// token for other API requests.
  Future<DeleteRecommendationTemplateResponse> deleteRecommendationTemplate({
    required String recommendationTemplateArn,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(
        recommendationTemplateArn, 'recommendationTemplateArn');
    final $payload = <String, dynamic>{
      'recommendationTemplateArn': recommendationTemplateArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delete-recommendation-template',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteRecommendationTemplateResponse.fromJson(response);
  }

  /// Deletes a resiliency policy. This is a destructive action that can't be
  /// undone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the resiliency policy. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:resiliency-policy/<code>policy-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [clientToken] :
  /// Used for an idempotency token. A client token is a unique, case-sensitive
  /// string of up to 64 ASCII characters. You should not reuse the same client
  /// token for other API requests.
  Future<DeleteResiliencyPolicyResponse> deleteResiliencyPolicy({
    required String policyArn,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(policyArn, 'policyArn');
    final $payload = <String, dynamic>{
      'policyArn': policyArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delete-resiliency-policy',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteResiliencyPolicyResponse.fromJson(response);
  }

  /// Describes an AWS Resilience Hub application.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  Future<DescribeAppResponse> describeApp({
    required String appArn,
  }) async {
    ArgumentError.checkNotNull(appArn, 'appArn');
    final $payload = <String, dynamic>{
      'appArn': appArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describe-app',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAppResponse.fromJson(response);
  }

  /// Describes an assessment for an AWS Resilience Hub application.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [assessmentArn] :
  /// The Amazon Resource Name (ARN) of the assessment. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  Future<DescribeAppAssessmentResponse> describeAppAssessment({
    required String assessmentArn,
  }) async {
    ArgumentError.checkNotNull(assessmentArn, 'assessmentArn');
    final $payload = <String, dynamic>{
      'assessmentArn': assessmentArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describe-app-assessment',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAppAssessmentResponse.fromJson(response);
  }

  /// Returns the resolution status for the specified resolution identifier for
  /// an application version. If <code>resolutionId</code> is not specified, the
  /// current resolution status is returned.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [appVersion] :
  /// The version of the application.
  ///
  /// Parameter [resolutionId] :
  /// The identifier for a specific resolution.
  Future<DescribeAppVersionResourcesResolutionStatusResponse>
      describeAppVersionResourcesResolutionStatus({
    required String appArn,
    required String appVersion,
    String? resolutionId,
  }) async {
    ArgumentError.checkNotNull(appArn, 'appArn');
    ArgumentError.checkNotNull(appVersion, 'appVersion');
    final $payload = <String, dynamic>{
      'appArn': appArn,
      'appVersion': appVersion,
      if (resolutionId != null) 'resolutionId': resolutionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describe-app-version-resources-resolution-status',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAppVersionResourcesResolutionStatusResponse.fromJson(
        response);
  }

  /// Describes details about an AWS Resilience Hub
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [appVersion] :
  /// The version of the application.
  Future<DescribeAppVersionTemplateResponse> describeAppVersionTemplate({
    required String appArn,
    required String appVersion,
  }) async {
    ArgumentError.checkNotNull(appArn, 'appArn');
    ArgumentError.checkNotNull(appVersion, 'appVersion');
    final $payload = <String, dynamic>{
      'appArn': appArn,
      'appVersion': appVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describe-app-version-template',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAppVersionTemplateResponse.fromJson(response);
  }

  /// Describes the status of importing resources to an application version.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  Future<DescribeDraftAppVersionResourcesImportStatusResponse>
      describeDraftAppVersionResourcesImportStatus({
    required String appArn,
  }) async {
    ArgumentError.checkNotNull(appArn, 'appArn');
    final $payload = <String, dynamic>{
      'appArn': appArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describe-draft-app-version-resources-import-status',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDraftAppVersionResourcesImportStatusResponse.fromJson(
        response);
  }

  /// Describes a specified resiliency policy for an AWS Resilience Hub
  /// application. The returned policy object includes creation time, data
  /// location constraints, the Amazon Resource Name (ARN) for the policy, tags,
  /// tier, and more.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the resiliency policy. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:resiliency-policy/<code>policy-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  Future<DescribeResiliencyPolicyResponse> describeResiliencyPolicy({
    required String policyArn,
  }) async {
    ArgumentError.checkNotNull(policyArn, 'policyArn');
    final $payload = <String, dynamic>{
      'policyArn': policyArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describe-resiliency-policy',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeResiliencyPolicyResponse.fromJson(response);
  }

  /// Imports resources from sources such as a CloudFormation stack,
  /// resource-groups, or application registry app to a draft application
  /// version.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [sourceArns] :
  /// The Amazon Resource Names (ARNs) for the resources that you want to
  /// import.
  ///
  /// Parameter [terraformSources] :
  /// A list of terraform file s3 URLs you need to import.
  Future<ImportResourcesToDraftAppVersionResponse>
      importResourcesToDraftAppVersion({
    required String appArn,
    List<String>? sourceArns,
    List<TerraformSource>? terraformSources,
  }) async {
    ArgumentError.checkNotNull(appArn, 'appArn');
    final $payload = <String, dynamic>{
      'appArn': appArn,
      if (sourceArns != null) 'sourceArns': sourceArns,
      if (terraformSources != null) 'terraformSources': terraformSources,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/import-resources-to-draft-app-version',
      exceptionFnMap: _exceptionFns,
    );
    return ImportResourcesToDraftAppVersionResponse.fromJson(response);
  }

  /// Lists the alarm recommendations for a AWS Resilience Hub application.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [assessmentArn] :
  /// The Amazon Resource Name (ARN) of the assessment. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// Null, or the token from a previous call to get the next set of results.
  Future<ListAlarmRecommendationsResponse> listAlarmRecommendations({
    required String assessmentArn,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(assessmentArn, 'assessmentArn');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'assessmentArn': assessmentArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-alarm-recommendations',
      exceptionFnMap: _exceptionFns,
    );
    return ListAlarmRecommendationsResponse.fromJson(response);
  }

  /// Lists the assessments for an AWS Resilience Hub application. You can use
  /// request parameters to refine the results for the response object.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [assessmentName] :
  /// The name for the assessment.
  ///
  /// Parameter [assessmentStatus] :
  /// The current status of the assessment for the resiliency policy.
  ///
  /// Parameter [complianceStatus] :
  /// The current status of compliance for the resiliency policy.
  ///
  /// Parameter [invoker] :
  /// Specifies the entity that invoked a specific assessment, either a
  /// <code>User</code> or the <code>System</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// Null, or the token from a previous call to get the next set of results.
  ///
  /// Parameter [reverseOrder] :
  /// The default is to sort by ascending <b>startTime</b>. To sort by
  /// descending <b>startTime</b>, set reverseOrder to <code>true</code>.
  Future<ListAppAssessmentsResponse> listAppAssessments({
    String? appArn,
    String? assessmentName,
    List<AssessmentStatus>? assessmentStatus,
    ComplianceStatus? complianceStatus,
    AssessmentInvoker? invoker,
    int? maxResults,
    String? nextToken,
    bool? reverseOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (appArn != null) 'appArn': [appArn],
      if (assessmentName != null) 'assessmentName': [assessmentName],
      if (assessmentStatus != null)
        'assessmentStatus': assessmentStatus.map((e) => e.toValue()).toList(),
      if (complianceStatus != null)
        'complianceStatus': [complianceStatus.toValue()],
      if (invoker != null) 'invoker': [invoker.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (reverseOrder != null) 'reverseOrder': [reverseOrder.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/list-app-assessments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAppAssessmentsResponse.fromJson(response);
  }

  /// Lists the compliances for an AWS Resilience Hub component.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [assessmentArn] :
  /// The Amazon Resource Name (ARN) of the assessment. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// Null, or the token from a previous call to get the next set of results.
  Future<ListAppComponentCompliancesResponse> listAppComponentCompliances({
    required String assessmentArn,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(assessmentArn, 'assessmentArn');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'assessmentArn': assessmentArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-app-component-compliances',
      exceptionFnMap: _exceptionFns,
    );
    return ListAppComponentCompliancesResponse.fromJson(response);
  }

  /// Lists the recommendations for an AWS Resilience Hub component.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [assessmentArn] :
  /// The Amazon Resource Name (ARN) of the assessment. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// Null, or the token from a previous call to get the next set of results.
  Future<ListAppComponentRecommendationsResponse>
      listAppComponentRecommendations({
    required String assessmentArn,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(assessmentArn, 'assessmentArn');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'assessmentArn': assessmentArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-app-component-recommendations',
      exceptionFnMap: _exceptionFns,
    );
    return ListAppComponentRecommendationsResponse.fromJson(response);
  }

  /// Lists how the resources in an application version are mapped/sourced from.
  /// Mappings can be physical resource identifiers, CloudFormation stacks,
  /// resource-groups, or an application registry app.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [appVersion] :
  /// The version of the application.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// Null, or the token from a previous call to get the next set of results.
  Future<ListAppVersionResourceMappingsResponse>
      listAppVersionResourceMappings({
    required String appArn,
    required String appVersion,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(appArn, 'appArn');
    ArgumentError.checkNotNull(appVersion, 'appVersion');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'appArn': appArn,
      'appVersion': appVersion,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-app-version-resource-mappings',
      exceptionFnMap: _exceptionFns,
    );
    return ListAppVersionResourceMappingsResponse.fromJson(response);
  }

  /// Lists all the resources in an application version.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [appVersion] :
  /// The version of the application.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// Null, or the token from a previous call to get the next set of results.
  ///
  /// Parameter [resolutionId] :
  /// The identifier for a specific resolution.
  Future<ListAppVersionResourcesResponse> listAppVersionResources({
    required String appArn,
    required String appVersion,
    int? maxResults,
    String? nextToken,
    String? resolutionId,
  }) async {
    ArgumentError.checkNotNull(appArn, 'appArn');
    ArgumentError.checkNotNull(appVersion, 'appVersion');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'appArn': appArn,
      'appVersion': appVersion,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (resolutionId != null) 'resolutionId': resolutionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-app-version-resources',
      exceptionFnMap: _exceptionFns,
    );
    return ListAppVersionResourcesResponse.fromJson(response);
  }

  /// Lists the different versions for the Resilience Hub applications.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// Null, or the token from a previous call to get the next set of results.
  Future<ListAppVersionsResponse> listAppVersions({
    required String appArn,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(appArn, 'appArn');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'appArn': appArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-app-versions',
      exceptionFnMap: _exceptionFns,
    );
    return ListAppVersionsResponse.fromJson(response);
  }

  /// Lists your Resilience Hub applications.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [name] :
  /// The name for the one of the listed applications.
  ///
  /// Parameter [nextToken] :
  /// Null, or the token from a previous call to get the next set of results.
  Future<ListAppsResponse> listApps({
    String? appArn,
    int? maxResults,
    String? name,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (appArn != null) 'appArn': [appArn],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (name != null) 'name': [name],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/list-apps',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAppsResponse.fromJson(response);
  }

  /// Lists the recommendation templates for the Resilience Hub applications.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [assessmentArn] :
  /// The Amazon Resource Name (ARN) of the assessment. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [name] :
  /// The name for one of the listed recommendation templates.
  ///
  /// Parameter [nextToken] :
  /// Null, or the token from a previous call to get the next set of results.
  ///
  /// Parameter [recommendationTemplateArn] :
  /// The Amazon Resource Name (ARN) for a recommendation template.
  ///
  /// Parameter [reverseOrder] :
  /// The default is to sort by ascending <b>startTime</b>. To sort by
  /// descending <b>startTime</b>, set reverseOrder to <code>true</code>.
  ///
  /// Parameter [status] :
  /// The status of the action.
  Future<ListRecommendationTemplatesResponse> listRecommendationTemplates({
    required String assessmentArn,
    int? maxResults,
    String? name,
    String? nextToken,
    String? recommendationTemplateArn,
    bool? reverseOrder,
    List<RecommendationTemplateStatus>? status,
  }) async {
    ArgumentError.checkNotNull(assessmentArn, 'assessmentArn');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      'assessmentArn': [assessmentArn],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (name != null) 'name': [name],
      if (nextToken != null) 'nextToken': [nextToken],
      if (recommendationTemplateArn != null)
        'recommendationTemplateArn': [recommendationTemplateArn],
      if (reverseOrder != null) 'reverseOrder': [reverseOrder.toString()],
      if (status != null) 'status': status.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/list-recommendation-templates',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRecommendationTemplatesResponse.fromJson(response);
  }

  /// Lists the resiliency policies for the Resilience Hub applications.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// Null, or the token from a previous call to get the next set of results.
  ///
  /// Parameter [policyName] :
  /// The name of the policy
  Future<ListResiliencyPoliciesResponse> listResiliencyPolicies({
    int? maxResults,
    String? nextToken,
    String? policyName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (policyName != null) 'policyName': [policyName],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/list-resiliency-policies',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListResiliencyPoliciesResponse.fromJson(response);
  }

  /// Lists the standard operating procedure (SOP) recommendations for the
  /// Resilience Hub applications.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [assessmentArn] :
  /// The Amazon Resource Name (ARN) of the assessment. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// Null, or the token from a previous call to get the next set of results.
  Future<ListSopRecommendationsResponse> listSopRecommendations({
    required String assessmentArn,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(assessmentArn, 'assessmentArn');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'assessmentArn': assessmentArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-sop-recommendations',
      exceptionFnMap: _exceptionFns,
    );
    return ListSopRecommendationsResponse.fromJson(response);
  }

  /// Lists the suggested resiliency policies for the Resilience Hub
  /// applications.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// Null, or the token from a previous call to get the next set of results.
  Future<ListSuggestedResiliencyPoliciesResponse>
      listSuggestedResiliencyPolicies({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/list-suggested-resiliency-policies',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSuggestedResiliencyPoliciesResponse.fromJson(response);
  }

  /// Lists the tags for your resources in your Resilience Hub applications.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for a specific resource in your Resilience
  /// Hub application.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Lists the test recommendations for the Resilience Hub application.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [assessmentArn] :
  /// The Amazon Resource Name (ARN) of the assessment. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// Null, or the token from a previous call to get the next set of results.
  Future<ListTestRecommendationsResponse> listTestRecommendations({
    required String assessmentArn,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(assessmentArn, 'assessmentArn');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'assessmentArn': assessmentArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-test-recommendations',
      exceptionFnMap: _exceptionFns,
    );
    return ListTestRecommendationsResponse.fromJson(response);
  }

  /// Lists the resources that are not currently supported in AWS Resilience
  /// Hub. An unsupported resource is a resource that exists in the object that
  /// was used to create an app, but is not supported by Resilience Hub.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [appVersion] :
  /// The version of the application.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// Null, or the token from a previous call to get the next set of results.
  ///
  /// Parameter [resolutionId] :
  /// The identifier for a specific resolution.
  Future<ListUnsupportedAppVersionResourcesResponse>
      listUnsupportedAppVersionResources({
    required String appArn,
    required String appVersion,
    int? maxResults,
    String? nextToken,
    String? resolutionId,
  }) async {
    ArgumentError.checkNotNull(appArn, 'appArn');
    ArgumentError.checkNotNull(appVersion, 'appVersion');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'appArn': appArn,
      'appVersion': appVersion,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (resolutionId != null) 'resolutionId': resolutionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-unsupported-app-version-resources',
      exceptionFnMap: _exceptionFns,
    );
    return ListUnsupportedAppVersionResourcesResponse.fromJson(response);
  }

  /// Publishes a new version of a specific Resilience Hub application.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  Future<PublishAppVersionResponse> publishAppVersion({
    required String appArn,
  }) async {
    ArgumentError.checkNotNull(appArn, 'appArn');
    final $payload = <String, dynamic>{
      'appArn': appArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/publish-app-version',
      exceptionFnMap: _exceptionFns,
    );
    return PublishAppVersionResponse.fromJson(response);
  }

  /// Adds or updates the app template for a draft version of a Resilience Hub
  /// app.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [appTemplateBody] :
  /// A JSON string that contains the body of the app template.
  Future<PutDraftAppVersionTemplateResponse> putDraftAppVersionTemplate({
    required String appArn,
    required String appTemplateBody,
  }) async {
    ArgumentError.checkNotNull(appArn, 'appArn');
    ArgumentError.checkNotNull(appTemplateBody, 'appTemplateBody');
    final $payload = <String, dynamic>{
      'appArn': appArn,
      'appTemplateBody': appTemplateBody,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/put-draft-app-version-template',
      exceptionFnMap: _exceptionFns,
    );
    return PutDraftAppVersionTemplateResponse.fromJson(response);
  }

  /// Removes resource mappings from a draft application version.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [appRegistryAppNames] :
  /// The names of the registered applications to remove from the resource
  /// mappings.
  ///
  /// Parameter [logicalStackNames] :
  /// The names of the CloudFormation stacks to remove from the resource
  /// mappings.
  ///
  /// Parameter [resourceGroupNames] :
  /// The names of the resource groups to remove from the resource mappings.
  ///
  /// Parameter [resourceNames] :
  /// The names of the resources to remove from the resource mappings.
  ///
  /// Parameter [terraformSourceNames] :
  /// <pre><code>&lt;/p&gt; </code></pre>
  Future<RemoveDraftAppVersionResourceMappingsResponse>
      removeDraftAppVersionResourceMappings({
    required String appArn,
    List<String>? appRegistryAppNames,
    List<String>? logicalStackNames,
    List<String>? resourceGroupNames,
    List<String>? resourceNames,
    List<String>? terraformSourceNames,
  }) async {
    ArgumentError.checkNotNull(appArn, 'appArn');
    final $payload = <String, dynamic>{
      'appArn': appArn,
      if (appRegistryAppNames != null)
        'appRegistryAppNames': appRegistryAppNames,
      if (logicalStackNames != null) 'logicalStackNames': logicalStackNames,
      if (resourceGroupNames != null) 'resourceGroupNames': resourceGroupNames,
      if (resourceNames != null) 'resourceNames': resourceNames,
      if (terraformSourceNames != null)
        'terraformSourceNames': terraformSourceNames,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/remove-draft-app-version-resource-mappings',
      exceptionFnMap: _exceptionFns,
    );
    return RemoveDraftAppVersionResourceMappingsResponse.fromJson(response);
  }

  /// Resolves the resources for an application version.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [appVersion] :
  /// The version of the application.
  Future<ResolveAppVersionResourcesResponse> resolveAppVersionResources({
    required String appArn,
    required String appVersion,
  }) async {
    ArgumentError.checkNotNull(appArn, 'appArn');
    ArgumentError.checkNotNull(appVersion, 'appVersion');
    final $payload = <String, dynamic>{
      'appArn': appArn,
      'appVersion': appVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/resolve-app-version-resources',
      exceptionFnMap: _exceptionFns,
    );
    return ResolveAppVersionResourcesResponse.fromJson(response);
  }

  /// Creates a new application assessment for an application.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [appVersion] :
  /// The version of the application.
  ///
  /// Parameter [assessmentName] :
  /// The name for the assessment.
  ///
  /// Parameter [clientToken] :
  /// Used for an idempotency token. A client token is a unique, case-sensitive
  /// string of up to 64 ASCII characters. You should not reuse the same client
  /// token for other API requests.
  ///
  /// Parameter [tags] :
  /// The tags assigned to the resource. A tag is a label that you assign to an
  /// Amazon Web Services resource. Each tag consists of a key/value pair.
  Future<StartAppAssessmentResponse> startAppAssessment({
    required String appArn,
    required String appVersion,
    required String assessmentName,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(appArn, 'appArn');
    ArgumentError.checkNotNull(appVersion, 'appVersion');
    ArgumentError.checkNotNull(assessmentName, 'assessmentName');
    final $payload = <String, dynamic>{
      'appArn': appArn,
      'appVersion': appVersion,
      'assessmentName': assessmentName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/start-app-assessment',
      exceptionFnMap: _exceptionFns,
    );
    return StartAppAssessmentResponse.fromJson(response);
  }

  /// Applies one or more tags to a resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the resource. Each tag consists of a key/value pair.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes one or more tags from a resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to remove.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an application.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [assessmentSchedule] :
  /// Assessment execution schedule with 'Daily' or 'Disabled' values.
  ///
  /// Parameter [clearResiliencyPolicyArn] :
  /// Specifies if the resiliency policy ARN should be cleared.
  ///
  /// Parameter [description] :
  /// The optional description for an app.
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the resiliency policy. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:resiliency-policy/<code>policy-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  Future<UpdateAppResponse> updateApp({
    required String appArn,
    AppAssessmentScheduleType? assessmentSchedule,
    bool? clearResiliencyPolicyArn,
    String? description,
    String? policyArn,
  }) async {
    ArgumentError.checkNotNull(appArn, 'appArn');
    final $payload = <String, dynamic>{
      'appArn': appArn,
      if (assessmentSchedule != null)
        'assessmentSchedule': assessmentSchedule.toValue(),
      if (clearResiliencyPolicyArn != null)
        'clearResiliencyPolicyArn': clearResiliencyPolicyArn,
      if (description != null) 'description': description,
      if (policyArn != null) 'policyArn': policyArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/update-app',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAppResponse.fromJson(response);
  }

  /// Updates a resiliency policy.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the resiliency policy. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:resiliency-policy/<code>policy-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  ///
  /// Parameter [dataLocationConstraint] :
  /// Specifies a high-level geographical location constraint for where your
  /// resilience policy data can be stored.
  ///
  /// Parameter [policy] :
  /// The type of resiliency policy to be created, including the recovery time
  /// objective (RTO) and recovery point objective (RPO) in seconds.
  ///
  /// Parameter [policyDescription] :
  /// The description for the policy.
  ///
  /// Parameter [policyName] :
  /// The name of the policy
  ///
  /// Parameter [tier] :
  /// The tier for this resiliency policy, ranging from the highest severity
  /// (<code>MissionCritical</code>) to lowest (<code>NonCritical</code>).
  Future<UpdateResiliencyPolicyResponse> updateResiliencyPolicy({
    required String policyArn,
    DataLocationConstraint? dataLocationConstraint,
    Map<DisruptionType, FailurePolicy>? policy,
    String? policyDescription,
    String? policyName,
    ResiliencyPolicyTier? tier,
  }) async {
    ArgumentError.checkNotNull(policyArn, 'policyArn');
    final $payload = <String, dynamic>{
      'policyArn': policyArn,
      if (dataLocationConstraint != null)
        'dataLocationConstraint': dataLocationConstraint.toValue(),
      if (policy != null)
        'policy': policy.map((k, e) => MapEntry(k.toValue(), e)),
      if (policyDescription != null) 'policyDescription': policyDescription,
      if (policyName != null) 'policyName': policyName,
      if (tier != null) 'tier': tier.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/update-resiliency-policy',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateResiliencyPolicyResponse.fromJson(response);
  }
}

class AddDraftAppVersionResourceMappingsResponse {
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String appArn;

  /// The version of the application.
  final String appVersion;

  /// Mappings used to map logical resources from the template to physical
  /// resources. You can use the mapping type <code>CFN_STACK</code> if the
  /// application template uses a logical stack name. Or you can map individual
  /// resources by using the mapping type <code>RESOURCE</code>. We recommend
  /// using the mapping type <code>CFN_STACK</code> if the application is backed
  /// by a CloudFormation stack.
  final List<ResourceMapping> resourceMappings;

  AddDraftAppVersionResourceMappingsResponse({
    required this.appArn,
    required this.appVersion,
    required this.resourceMappings,
  });

  factory AddDraftAppVersionResourceMappingsResponse.fromJson(
      Map<String, dynamic> json) {
    return AddDraftAppVersionResourceMappingsResponse(
      appArn: json['appArn'] as String,
      appVersion: json['appVersion'] as String,
      resourceMappings: (json['resourceMappings'] as List)
          .whereNotNull()
          .map((e) => ResourceMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final appVersion = this.appVersion;
    final resourceMappings = this.resourceMappings;
    return {
      'appArn': appArn,
      'appVersion': appVersion,
      'resourceMappings': resourceMappings,
    };
  }
}

/// Defines a recommendation for a CloudWatch alarm.
class AlarmRecommendation {
  /// The name of the alarm recommendation.
  final String name;

  /// The identifier of the alarm recommendation.
  final String recommendationId;

  /// The reference identifier of the alarm recommendation.
  final String referenceId;

  /// The type of alarm recommendation.
  final AlarmType type;

  /// The application component for the CloudWatch alarm recommendation.
  final String? appComponentName;

  /// The description of the recommendation.
  final String? description;

  /// The list of CloudWatch alarm recommendations.
  final List<RecommendationItem>? items;

  /// The prerequisite for the alarm recommendation.
  final String? prerequisite;

  AlarmRecommendation({
    required this.name,
    required this.recommendationId,
    required this.referenceId,
    required this.type,
    this.appComponentName,
    this.description,
    this.items,
    this.prerequisite,
  });

  factory AlarmRecommendation.fromJson(Map<String, dynamic> json) {
    return AlarmRecommendation(
      name: json['name'] as String,
      recommendationId: json['recommendationId'] as String,
      referenceId: json['referenceId'] as String,
      type: (json['type'] as String).toAlarmType(),
      appComponentName: json['appComponentName'] as String?,
      description: json['description'] as String?,
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => RecommendationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      prerequisite: json['prerequisite'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final recommendationId = this.recommendationId;
    final referenceId = this.referenceId;
    final type = this.type;
    final appComponentName = this.appComponentName;
    final description = this.description;
    final items = this.items;
    final prerequisite = this.prerequisite;
    return {
      'name': name,
      'recommendationId': recommendationId,
      'referenceId': referenceId,
      'type': type.toValue(),
      if (appComponentName != null) 'appComponentName': appComponentName,
      if (description != null) 'description': description,
      if (items != null) 'items': items,
      if (prerequisite != null) 'prerequisite': prerequisite,
    };
  }
}

enum AlarmType {
  metric,
  composite,
  canary,
  logs,
  event,
}

extension on AlarmType {
  String toValue() {
    switch (this) {
      case AlarmType.metric:
        return 'Metric';
      case AlarmType.composite:
        return 'Composite';
      case AlarmType.canary:
        return 'Canary';
      case AlarmType.logs:
        return 'Logs';
      case AlarmType.event:
        return 'Event';
    }
  }
}

extension on String {
  AlarmType toAlarmType() {
    switch (this) {
      case 'Metric':
        return AlarmType.metric;
      case 'Composite':
        return AlarmType.composite;
      case 'Canary':
        return AlarmType.canary;
      case 'Logs':
        return AlarmType.logs;
      case 'Event':
        return AlarmType.event;
    }
    throw Exception('$this is not known in enum AlarmType');
  }
}

/// Defines a Resilience Hub application.
class App {
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String appArn;

  /// The timestamp for when the app was created.
  final DateTime creationTime;

  /// The name for the application.
  final String name;

  /// Assessment execution schedule with 'Daily' or 'Disabled' values.
  final AppAssessmentScheduleType? assessmentSchedule;

  /// The current status of compliance for the resiliency policy.
  final AppComplianceStatusType? complianceStatus;

  /// The optional description for an app.
  final String? description;

  /// The timestamp for the most recent compliance evaluation.
  final DateTime? lastAppComplianceEvaluationTime;

  /// The timestamp for the most recent resiliency score evaluation.
  final DateTime? lastResiliencyScoreEvaluationTime;

  /// The Amazon Resource Name (ARN) of the resiliency policy. The format for this
  /// ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:resiliency-policy/<code>policy-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String? policyArn;

  /// The current resiliency score for the application.
  final double? resiliencyScore;

  /// The status of the action.
  final AppStatusType? status;

  /// The tags assigned to the resource. A tag is a label that you assign to an
  /// Amazon Web Services resource. Each tag consists of a key/value pair.
  final Map<String, String>? tags;

  App({
    required this.appArn,
    required this.creationTime,
    required this.name,
    this.assessmentSchedule,
    this.complianceStatus,
    this.description,
    this.lastAppComplianceEvaluationTime,
    this.lastResiliencyScoreEvaluationTime,
    this.policyArn,
    this.resiliencyScore,
    this.status,
    this.tags,
  });

  factory App.fromJson(Map<String, dynamic> json) {
    return App(
      appArn: json['appArn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      name: json['name'] as String,
      assessmentSchedule: (json['assessmentSchedule'] as String?)
          ?.toAppAssessmentScheduleType(),
      complianceStatus:
          (json['complianceStatus'] as String?)?.toAppComplianceStatusType(),
      description: json['description'] as String?,
      lastAppComplianceEvaluationTime:
          timeStampFromJson(json['lastAppComplianceEvaluationTime']),
      lastResiliencyScoreEvaluationTime:
          timeStampFromJson(json['lastResiliencyScoreEvaluationTime']),
      policyArn: json['policyArn'] as String?,
      resiliencyScore: json['resiliencyScore'] as double?,
      status: (json['status'] as String?)?.toAppStatusType(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final creationTime = this.creationTime;
    final name = this.name;
    final assessmentSchedule = this.assessmentSchedule;
    final complianceStatus = this.complianceStatus;
    final description = this.description;
    final lastAppComplianceEvaluationTime =
        this.lastAppComplianceEvaluationTime;
    final lastResiliencyScoreEvaluationTime =
        this.lastResiliencyScoreEvaluationTime;
    final policyArn = this.policyArn;
    final resiliencyScore = this.resiliencyScore;
    final status = this.status;
    final tags = this.tags;
    return {
      'appArn': appArn,
      'creationTime': unixTimestampToJson(creationTime),
      'name': name,
      if (assessmentSchedule != null)
        'assessmentSchedule': assessmentSchedule.toValue(),
      if (complianceStatus != null)
        'complianceStatus': complianceStatus.toValue(),
      if (description != null) 'description': description,
      if (lastAppComplianceEvaluationTime != null)
        'lastAppComplianceEvaluationTime':
            unixTimestampToJson(lastAppComplianceEvaluationTime),
      if (lastResiliencyScoreEvaluationTime != null)
        'lastResiliencyScoreEvaluationTime':
            unixTimestampToJson(lastResiliencyScoreEvaluationTime),
      if (policyArn != null) 'policyArn': policyArn,
      if (resiliencyScore != null) 'resiliencyScore': resiliencyScore,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

/// Defines an application assessment.
class AppAssessment {
  /// The Amazon Resource Name (ARN) of the assessment. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String assessmentArn;

  /// The current status of the assessment for the resiliency policy.
  final AssessmentStatus assessmentStatus;

  /// The entity that invoked the assessment.
  final AssessmentInvoker invoker;

  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String? appArn;

  /// The version of the application.
  final String? appVersion;

  /// The name of the assessment.
  final String? assessmentName;

  /// The application compliance against the resiliency policy.
  final Map<DisruptionType, DisruptionCompliance>? compliance;

  /// The current status of the compliance for the resiliency policy.
  final ComplianceStatus? complianceStatus;

  /// The cost for the application.
  final Cost? cost;

  /// The end time for the action.
  final DateTime? endTime;

  /// Error or warning message from the assessment execution
  final String? message;

  /// The resiliency policy.
  final ResiliencyPolicy? policy;

  /// The current resiliency score for the application.
  final ResiliencyScore? resiliencyScore;

  /// A resource error object containing a list of errors retrieving an
  /// application's resources.
  final ResourceErrorsDetails? resourceErrorsDetails;

  /// The starting time for the action.
  final DateTime? startTime;

  /// The tags assigned to the resource. A tag is a label that you assign to an
  /// Amazon Web Services resource. Each tag consists of a key/value pair.
  final Map<String, String>? tags;

  AppAssessment({
    required this.assessmentArn,
    required this.assessmentStatus,
    required this.invoker,
    this.appArn,
    this.appVersion,
    this.assessmentName,
    this.compliance,
    this.complianceStatus,
    this.cost,
    this.endTime,
    this.message,
    this.policy,
    this.resiliencyScore,
    this.resourceErrorsDetails,
    this.startTime,
    this.tags,
  });

  factory AppAssessment.fromJson(Map<String, dynamic> json) {
    return AppAssessment(
      assessmentArn: json['assessmentArn'] as String,
      assessmentStatus:
          (json['assessmentStatus'] as String).toAssessmentStatus(),
      invoker: (json['invoker'] as String).toAssessmentInvoker(),
      appArn: json['appArn'] as String?,
      appVersion: json['appVersion'] as String?,
      assessmentName: json['assessmentName'] as String?,
      compliance: (json['compliance'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k.toDisruptionType(),
              DisruptionCompliance.fromJson(e as Map<String, dynamic>))),
      complianceStatus:
          (json['complianceStatus'] as String?)?.toComplianceStatus(),
      cost: json['cost'] != null
          ? Cost.fromJson(json['cost'] as Map<String, dynamic>)
          : null,
      endTime: timeStampFromJson(json['endTime']),
      message: json['message'] as String?,
      policy: json['policy'] != null
          ? ResiliencyPolicy.fromJson(json['policy'] as Map<String, dynamic>)
          : null,
      resiliencyScore: json['resiliencyScore'] != null
          ? ResiliencyScore.fromJson(
              json['resiliencyScore'] as Map<String, dynamic>)
          : null,
      resourceErrorsDetails: json['resourceErrorsDetails'] != null
          ? ResourceErrorsDetails.fromJson(
              json['resourceErrorsDetails'] as Map<String, dynamic>)
          : null,
      startTime: timeStampFromJson(json['startTime']),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentArn = this.assessmentArn;
    final assessmentStatus = this.assessmentStatus;
    final invoker = this.invoker;
    final appArn = this.appArn;
    final appVersion = this.appVersion;
    final assessmentName = this.assessmentName;
    final compliance = this.compliance;
    final complianceStatus = this.complianceStatus;
    final cost = this.cost;
    final endTime = this.endTime;
    final message = this.message;
    final policy = this.policy;
    final resiliencyScore = this.resiliencyScore;
    final resourceErrorsDetails = this.resourceErrorsDetails;
    final startTime = this.startTime;
    final tags = this.tags;
    return {
      'assessmentArn': assessmentArn,
      'assessmentStatus': assessmentStatus.toValue(),
      'invoker': invoker.toValue(),
      if (appArn != null) 'appArn': appArn,
      if (appVersion != null) 'appVersion': appVersion,
      if (assessmentName != null) 'assessmentName': assessmentName,
      if (compliance != null)
        'compliance': compliance.map((k, e) => MapEntry(k.toValue(), e)),
      if (complianceStatus != null)
        'complianceStatus': complianceStatus.toValue(),
      if (cost != null) 'cost': cost,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (message != null) 'message': message,
      if (policy != null) 'policy': policy,
      if (resiliencyScore != null) 'resiliencyScore': resiliencyScore,
      if (resourceErrorsDetails != null)
        'resourceErrorsDetails': resourceErrorsDetails,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (tags != null) 'tags': tags,
    };
  }
}

enum AppAssessmentScheduleType {
  disabled,
  daily,
}

extension on AppAssessmentScheduleType {
  String toValue() {
    switch (this) {
      case AppAssessmentScheduleType.disabled:
        return 'Disabled';
      case AppAssessmentScheduleType.daily:
        return 'Daily';
    }
  }
}

extension on String {
  AppAssessmentScheduleType toAppAssessmentScheduleType() {
    switch (this) {
      case 'Disabled':
        return AppAssessmentScheduleType.disabled;
      case 'Daily':
        return AppAssessmentScheduleType.daily;
    }
    throw Exception('$this is not known in enum AppAssessmentScheduleType');
  }
}

/// Defines an application assessment summary.
class AppAssessmentSummary {
  /// The Amazon Resource Name (ARN) of the assessment. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String assessmentArn;

  /// The current status of the assessment for the resiliency policy.
  final AssessmentStatus assessmentStatus;

  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String? appArn;

  /// The version of the application.
  final String? appVersion;

  /// The name of the assessment.
  final String? assessmentName;

  /// The current status of compliance for the resiliency policy.
  final ComplianceStatus? complianceStatus;

  /// The cost for the application.
  final Cost? cost;

  /// The end time for the action.
  final DateTime? endTime;

  /// The entity that invoked the assessment.
  final AssessmentInvoker? invoker;

  /// The message from the assessment run.
  final String? message;

  /// The current resiliency score for the application.
  final double? resiliencyScore;

  /// The starting time for the action.
  final DateTime? startTime;

  AppAssessmentSummary({
    required this.assessmentArn,
    required this.assessmentStatus,
    this.appArn,
    this.appVersion,
    this.assessmentName,
    this.complianceStatus,
    this.cost,
    this.endTime,
    this.invoker,
    this.message,
    this.resiliencyScore,
    this.startTime,
  });

  factory AppAssessmentSummary.fromJson(Map<String, dynamic> json) {
    return AppAssessmentSummary(
      assessmentArn: json['assessmentArn'] as String,
      assessmentStatus:
          (json['assessmentStatus'] as String).toAssessmentStatus(),
      appArn: json['appArn'] as String?,
      appVersion: json['appVersion'] as String?,
      assessmentName: json['assessmentName'] as String?,
      complianceStatus:
          (json['complianceStatus'] as String?)?.toComplianceStatus(),
      cost: json['cost'] != null
          ? Cost.fromJson(json['cost'] as Map<String, dynamic>)
          : null,
      endTime: timeStampFromJson(json['endTime']),
      invoker: (json['invoker'] as String?)?.toAssessmentInvoker(),
      message: json['message'] as String?,
      resiliencyScore: json['resiliencyScore'] as double?,
      startTime: timeStampFromJson(json['startTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentArn = this.assessmentArn;
    final assessmentStatus = this.assessmentStatus;
    final appArn = this.appArn;
    final appVersion = this.appVersion;
    final assessmentName = this.assessmentName;
    final complianceStatus = this.complianceStatus;
    final cost = this.cost;
    final endTime = this.endTime;
    final invoker = this.invoker;
    final message = this.message;
    final resiliencyScore = this.resiliencyScore;
    final startTime = this.startTime;
    return {
      'assessmentArn': assessmentArn,
      'assessmentStatus': assessmentStatus.toValue(),
      if (appArn != null) 'appArn': appArn,
      if (appVersion != null) 'appVersion': appVersion,
      if (assessmentName != null) 'assessmentName': assessmentName,
      if (complianceStatus != null)
        'complianceStatus': complianceStatus.toValue(),
      if (cost != null) 'cost': cost,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (invoker != null) 'invoker': invoker.toValue(),
      if (message != null) 'message': message,
      if (resiliencyScore != null) 'resiliencyScore': resiliencyScore,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
    };
  }
}

enum AppComplianceStatusType {
  policyBreached,
  policyMet,
  notAssessed,
  changesDetected,
}

extension on AppComplianceStatusType {
  String toValue() {
    switch (this) {
      case AppComplianceStatusType.policyBreached:
        return 'PolicyBreached';
      case AppComplianceStatusType.policyMet:
        return 'PolicyMet';
      case AppComplianceStatusType.notAssessed:
        return 'NotAssessed';
      case AppComplianceStatusType.changesDetected:
        return 'ChangesDetected';
    }
  }
}

extension on String {
  AppComplianceStatusType toAppComplianceStatusType() {
    switch (this) {
      case 'PolicyBreached':
        return AppComplianceStatusType.policyBreached;
      case 'PolicyMet':
        return AppComplianceStatusType.policyMet;
      case 'NotAssessed':
        return AppComplianceStatusType.notAssessed;
      case 'ChangesDetected':
        return AppComplianceStatusType.changesDetected;
    }
    throw Exception('$this is not known in enum AppComplianceStatusType');
  }
}

/// Defines an application component.
class AppComponent {
  /// The name of the application component.
  final String name;

  /// The type of application component.
  final String type;

  AppComponent({
    required this.name,
    required this.type,
  });

  factory AppComponent.fromJson(Map<String, dynamic> json) {
    return AppComponent(
      name: json['name'] as String,
      type: json['type'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    return {
      'name': name,
      'type': type,
    };
  }
}

/// Defines the compliance of an application component against the resiliency
/// policy.
class AppComponentCompliance {
  /// The name of the application component.
  final String? appComponentName;

  /// The compliance of the application component against the resiliency policy.
  final Map<DisruptionType, DisruptionCompliance>? compliance;

  /// The cost for the application.
  final Cost? cost;

  /// The compliance message.
  final String? message;

  /// The current resiliency score for the application.
  final ResiliencyScore? resiliencyScore;

  /// The status of the action.
  final ComplianceStatus? status;

  AppComponentCompliance({
    this.appComponentName,
    this.compliance,
    this.cost,
    this.message,
    this.resiliencyScore,
    this.status,
  });

  factory AppComponentCompliance.fromJson(Map<String, dynamic> json) {
    return AppComponentCompliance(
      appComponentName: json['appComponentName'] as String?,
      compliance: (json['compliance'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k.toDisruptionType(),
              DisruptionCompliance.fromJson(e as Map<String, dynamic>))),
      cost: json['cost'] != null
          ? Cost.fromJson(json['cost'] as Map<String, dynamic>)
          : null,
      message: json['message'] as String?,
      resiliencyScore: json['resiliencyScore'] != null
          ? ResiliencyScore.fromJson(
              json['resiliencyScore'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toComplianceStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final appComponentName = this.appComponentName;
    final compliance = this.compliance;
    final cost = this.cost;
    final message = this.message;
    final resiliencyScore = this.resiliencyScore;
    final status = this.status;
    return {
      if (appComponentName != null) 'appComponentName': appComponentName,
      if (compliance != null)
        'compliance': compliance.map((k, e) => MapEntry(k.toValue(), e)),
      if (cost != null) 'cost': cost,
      if (message != null) 'message': message,
      if (resiliencyScore != null) 'resiliencyScore': resiliencyScore,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum AppStatusType {
  active,
  deleting,
}

extension on AppStatusType {
  String toValue() {
    switch (this) {
      case AppStatusType.active:
        return 'Active';
      case AppStatusType.deleting:
        return 'Deleting';
    }
  }
}

extension on String {
  AppStatusType toAppStatusType() {
    switch (this) {
      case 'Active':
        return AppStatusType.active;
      case 'Deleting':
        return AppStatusType.deleting;
    }
    throw Exception('$this is not known in enum AppStatusType');
  }
}

/// Defines an application summary.
class AppSummary {
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String appArn;

  /// The timestamp for when the app was created.
  final DateTime creationTime;

  /// The name of the application.
  final String name;

  /// Assessment execution schedule with 'Daily' or 'Disabled' values.
  final AppAssessmentScheduleType? assessmentSchedule;

  /// The current status of compliance for the resiliency policy.
  final AppComplianceStatusType? complianceStatus;

  /// The optional description for an app.
  final String? description;

  /// The current resiliency score for the application.
  final double? resiliencyScore;

  AppSummary({
    required this.appArn,
    required this.creationTime,
    required this.name,
    this.assessmentSchedule,
    this.complianceStatus,
    this.description,
    this.resiliencyScore,
  });

  factory AppSummary.fromJson(Map<String, dynamic> json) {
    return AppSummary(
      appArn: json['appArn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      name: json['name'] as String,
      assessmentSchedule: (json['assessmentSchedule'] as String?)
          ?.toAppAssessmentScheduleType(),
      complianceStatus:
          (json['complianceStatus'] as String?)?.toAppComplianceStatusType(),
      description: json['description'] as String?,
      resiliencyScore: json['resiliencyScore'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final creationTime = this.creationTime;
    final name = this.name;
    final assessmentSchedule = this.assessmentSchedule;
    final complianceStatus = this.complianceStatus;
    final description = this.description;
    final resiliencyScore = this.resiliencyScore;
    return {
      'appArn': appArn,
      'creationTime': unixTimestampToJson(creationTime),
      'name': name,
      if (assessmentSchedule != null)
        'assessmentSchedule': assessmentSchedule.toValue(),
      if (complianceStatus != null)
        'complianceStatus': complianceStatus.toValue(),
      if (description != null) 'description': description,
      if (resiliencyScore != null) 'resiliencyScore': resiliencyScore,
    };
  }
}

/// The version of the application.
class AppVersionSummary {
  /// The version of the application.
  final String appVersion;

  AppVersionSummary({
    required this.appVersion,
  });

  factory AppVersionSummary.fromJson(Map<String, dynamic> json) {
    return AppVersionSummary(
      appVersion: json['appVersion'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final appVersion = this.appVersion;
    return {
      'appVersion': appVersion,
    };
  }
}

enum AssessmentInvoker {
  user,
  system,
}

extension on AssessmentInvoker {
  String toValue() {
    switch (this) {
      case AssessmentInvoker.user:
        return 'User';
      case AssessmentInvoker.system:
        return 'System';
    }
  }
}

extension on String {
  AssessmentInvoker toAssessmentInvoker() {
    switch (this) {
      case 'User':
        return AssessmentInvoker.user;
      case 'System':
        return AssessmentInvoker.system;
    }
    throw Exception('$this is not known in enum AssessmentInvoker');
  }
}

enum AssessmentStatus {
  pending,
  inProgress,
  failed,
  success,
}

extension on AssessmentStatus {
  String toValue() {
    switch (this) {
      case AssessmentStatus.pending:
        return 'Pending';
      case AssessmentStatus.inProgress:
        return 'InProgress';
      case AssessmentStatus.failed:
        return 'Failed';
      case AssessmentStatus.success:
        return 'Success';
    }
  }
}

extension on String {
  AssessmentStatus toAssessmentStatus() {
    switch (this) {
      case 'Pending':
        return AssessmentStatus.pending;
      case 'InProgress':
        return AssessmentStatus.inProgress;
      case 'Failed':
        return AssessmentStatus.failed;
      case 'Success':
        return AssessmentStatus.success;
    }
    throw Exception('$this is not known in enum AssessmentStatus');
  }
}

enum ComplianceStatus {
  policyBreached,
  policyMet,
}

extension on ComplianceStatus {
  String toValue() {
    switch (this) {
      case ComplianceStatus.policyBreached:
        return 'PolicyBreached';
      case ComplianceStatus.policyMet:
        return 'PolicyMet';
    }
  }
}

extension on String {
  ComplianceStatus toComplianceStatus() {
    switch (this) {
      case 'PolicyBreached':
        return ComplianceStatus.policyBreached;
      case 'PolicyMet':
        return ComplianceStatus.policyMet;
    }
    throw Exception('$this is not known in enum ComplianceStatus');
  }
}

/// Defines recommendations for a Resilience Hub application component, returned
/// as an object. This object contains component names, configuration
/// recommendations, and recommendation statuses.
class ComponentRecommendation {
  /// The name of the application component.
  final String appComponentName;

  /// The list of recommendations.
  final List<ConfigRecommendation> configRecommendations;

  /// The recommendation status.
  final RecommendationComplianceStatus recommendationStatus;

  ComponentRecommendation({
    required this.appComponentName,
    required this.configRecommendations,
    required this.recommendationStatus,
  });

  factory ComponentRecommendation.fromJson(Map<String, dynamic> json) {
    return ComponentRecommendation(
      appComponentName: json['appComponentName'] as String,
      configRecommendations: (json['configRecommendations'] as List)
          .whereNotNull()
          .map((e) => ConfigRecommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
      recommendationStatus: (json['recommendationStatus'] as String)
          .toRecommendationComplianceStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final appComponentName = this.appComponentName;
    final configRecommendations = this.configRecommendations;
    final recommendationStatus = this.recommendationStatus;
    return {
      'appComponentName': appComponentName,
      'configRecommendations': configRecommendations,
      'recommendationStatus': recommendationStatus.toValue(),
    };
  }
}

/// Defines a configuration recommendation.
class ConfigRecommendation {
  /// The name of the recommendation configuration.
  final String name;

  /// The type of optimization.
  final ConfigRecommendationOptimizationType optimizationType;

  /// The reference identifier for the recommendation configuration.
  final String referenceId;

  /// The application component name.
  final String? appComponentName;

  /// The current compliance against the resiliency policy before applying the
  /// configuration change.
  final Map<DisruptionType, DisruptionCompliance>? compliance;

  /// The cost for the application.
  final Cost? cost;

  /// The optional description for an app.
  final String? description;

  /// The architecture type.
  final HaArchitecture? haArchitecture;

  /// The expected compliance against the resiliency policy after applying the
  /// configuration change.
  final Map<DisruptionType, RecommendationDisruptionCompliance>?
      recommendationCompliance;

  /// List of the suggested configuration changes.
  final List<String>? suggestedChanges;

  ConfigRecommendation({
    required this.name,
    required this.optimizationType,
    required this.referenceId,
    this.appComponentName,
    this.compliance,
    this.cost,
    this.description,
    this.haArchitecture,
    this.recommendationCompliance,
    this.suggestedChanges,
  });

  factory ConfigRecommendation.fromJson(Map<String, dynamic> json) {
    return ConfigRecommendation(
      name: json['name'] as String,
      optimizationType: (json['optimizationType'] as String)
          .toConfigRecommendationOptimizationType(),
      referenceId: json['referenceId'] as String,
      appComponentName: json['appComponentName'] as String?,
      compliance: (json['compliance'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k.toDisruptionType(),
              DisruptionCompliance.fromJson(e as Map<String, dynamic>))),
      cost: json['cost'] != null
          ? Cost.fromJson(json['cost'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      haArchitecture: (json['haArchitecture'] as String?)?.toHaArchitecture(),
      recommendationCompliance:
          (json['recommendationCompliance'] as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(
                  k.toDisruptionType(),
                  RecommendationDisruptionCompliance.fromJson(
                      e as Map<String, dynamic>))),
      suggestedChanges: (json['suggestedChanges'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final optimizationType = this.optimizationType;
    final referenceId = this.referenceId;
    final appComponentName = this.appComponentName;
    final compliance = this.compliance;
    final cost = this.cost;
    final description = this.description;
    final haArchitecture = this.haArchitecture;
    final recommendationCompliance = this.recommendationCompliance;
    final suggestedChanges = this.suggestedChanges;
    return {
      'name': name,
      'optimizationType': optimizationType.toValue(),
      'referenceId': referenceId,
      if (appComponentName != null) 'appComponentName': appComponentName,
      if (compliance != null)
        'compliance': compliance.map((k, e) => MapEntry(k.toValue(), e)),
      if (cost != null) 'cost': cost,
      if (description != null) 'description': description,
      if (haArchitecture != null) 'haArchitecture': haArchitecture.toValue(),
      if (recommendationCompliance != null)
        'recommendationCompliance':
            recommendationCompliance.map((k, e) => MapEntry(k.toValue(), e)),
      if (suggestedChanges != null) 'suggestedChanges': suggestedChanges,
    };
  }
}

enum ConfigRecommendationOptimizationType {
  leastCost,
  leastChange,
  bestAZRecovery,
  leastErrors,
  bestAttainable,
}

extension on ConfigRecommendationOptimizationType {
  String toValue() {
    switch (this) {
      case ConfigRecommendationOptimizationType.leastCost:
        return 'LeastCost';
      case ConfigRecommendationOptimizationType.leastChange:
        return 'LeastChange';
      case ConfigRecommendationOptimizationType.bestAZRecovery:
        return 'BestAZRecovery';
      case ConfigRecommendationOptimizationType.leastErrors:
        return 'LeastErrors';
      case ConfigRecommendationOptimizationType.bestAttainable:
        return 'BestAttainable';
    }
  }
}

extension on String {
  ConfigRecommendationOptimizationType
      toConfigRecommendationOptimizationType() {
    switch (this) {
      case 'LeastCost':
        return ConfigRecommendationOptimizationType.leastCost;
      case 'LeastChange':
        return ConfigRecommendationOptimizationType.leastChange;
      case 'BestAZRecovery':
        return ConfigRecommendationOptimizationType.bestAZRecovery;
      case 'LeastErrors':
        return ConfigRecommendationOptimizationType.leastErrors;
      case 'BestAttainable':
        return ConfigRecommendationOptimizationType.bestAttainable;
    }
    throw Exception(
        '$this is not known in enum ConfigRecommendationOptimizationType');
  }
}

/// Defines a cost object.
class Cost {
  /// The cost amount.
  final double amount;

  /// The cost currency, for example <code>USD</code>.
  final String currency;

  /// The cost frequency.
  final CostFrequency frequency;

  Cost({
    required this.amount,
    required this.currency,
    required this.frequency,
  });

  factory Cost.fromJson(Map<String, dynamic> json) {
    return Cost(
      amount: json['amount'] as double,
      currency: json['currency'] as String,
      frequency: (json['frequency'] as String).toCostFrequency(),
    );
  }

  Map<String, dynamic> toJson() {
    final amount = this.amount;
    final currency = this.currency;
    final frequency = this.frequency;
    return {
      'amount': amount,
      'currency': currency,
      'frequency': frequency.toValue(),
    };
  }
}

enum CostFrequency {
  hourly,
  daily,
  monthly,
  yearly,
}

extension on CostFrequency {
  String toValue() {
    switch (this) {
      case CostFrequency.hourly:
        return 'Hourly';
      case CostFrequency.daily:
        return 'Daily';
      case CostFrequency.monthly:
        return 'Monthly';
      case CostFrequency.yearly:
        return 'Yearly';
    }
  }
}

extension on String {
  CostFrequency toCostFrequency() {
    switch (this) {
      case 'Hourly':
        return CostFrequency.hourly;
      case 'Daily':
        return CostFrequency.daily;
      case 'Monthly':
        return CostFrequency.monthly;
      case 'Yearly':
        return CostFrequency.yearly;
    }
    throw Exception('$this is not known in enum CostFrequency');
  }
}

class CreateAppResponse {
  /// The created application returned as an object with details including
  /// compliance status, creation time, description, resiliency score, and more.
  final App app;

  CreateAppResponse({
    required this.app,
  });

  factory CreateAppResponse.fromJson(Map<String, dynamic> json) {
    return CreateAppResponse(
      app: App.fromJson(json['app'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final app = this.app;
    return {
      'app': app,
    };
  }
}

class CreateRecommendationTemplateResponse {
  /// The newly created recommendation template, returned as an object. This
  /// object includes the template's name, format, status, tags, Amazon S3 bucket
  /// location, and more.
  final RecommendationTemplate? recommendationTemplate;

  CreateRecommendationTemplateResponse({
    this.recommendationTemplate,
  });

  factory CreateRecommendationTemplateResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateRecommendationTemplateResponse(
      recommendationTemplate: json['recommendationTemplate'] != null
          ? RecommendationTemplate.fromJson(
              json['recommendationTemplate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final recommendationTemplate = this.recommendationTemplate;
    return {
      if (recommendationTemplate != null)
        'recommendationTemplate': recommendationTemplate,
    };
  }
}

class CreateResiliencyPolicyResponse {
  /// The type of resiliency policy that was created, including the recovery time
  /// objective (RTO) and recovery point objective (RPO) in seconds.
  final ResiliencyPolicy policy;

  CreateResiliencyPolicyResponse({
    required this.policy,
  });

  factory CreateResiliencyPolicyResponse.fromJson(Map<String, dynamic> json) {
    return CreateResiliencyPolicyResponse(
      policy: ResiliencyPolicy.fromJson(json['policy'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      'policy': policy,
    };
  }
}

enum DataLocationConstraint {
  anyLocation,
  sameContinent,
  sameCountry,
}

extension on DataLocationConstraint {
  String toValue() {
    switch (this) {
      case DataLocationConstraint.anyLocation:
        return 'AnyLocation';
      case DataLocationConstraint.sameContinent:
        return 'SameContinent';
      case DataLocationConstraint.sameCountry:
        return 'SameCountry';
    }
  }
}

extension on String {
  DataLocationConstraint toDataLocationConstraint() {
    switch (this) {
      case 'AnyLocation':
        return DataLocationConstraint.anyLocation;
      case 'SameContinent':
        return DataLocationConstraint.sameContinent;
      case 'SameCountry':
        return DataLocationConstraint.sameCountry;
    }
    throw Exception('$this is not known in enum DataLocationConstraint');
  }
}

class DeleteAppAssessmentResponse {
  /// The Amazon Resource Name (ARN) of the assessment. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String assessmentArn;

  /// The current status of the assessment for the resiliency policy.
  final AssessmentStatus assessmentStatus;

  DeleteAppAssessmentResponse({
    required this.assessmentArn,
    required this.assessmentStatus,
  });

  factory DeleteAppAssessmentResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAppAssessmentResponse(
      assessmentArn: json['assessmentArn'] as String,
      assessmentStatus:
          (json['assessmentStatus'] as String).toAssessmentStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentArn = this.assessmentArn;
    final assessmentStatus = this.assessmentStatus;
    return {
      'assessmentArn': assessmentArn,
      'assessmentStatus': assessmentStatus.toValue(),
    };
  }
}

class DeleteAppResponse {
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String appArn;

  DeleteAppResponse({
    required this.appArn,
  });

  factory DeleteAppResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAppResponse(
      appArn: json['appArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    return {
      'appArn': appArn,
    };
  }
}

class DeleteRecommendationTemplateResponse {
  /// The Amazon Resource Name (ARN) for a recommendation template.
  final String recommendationTemplateArn;

  /// The status of the action.
  final RecommendationTemplateStatus status;

  DeleteRecommendationTemplateResponse({
    required this.recommendationTemplateArn,
    required this.status,
  });

  factory DeleteRecommendationTemplateResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteRecommendationTemplateResponse(
      recommendationTemplateArn: json['recommendationTemplateArn'] as String,
      status: (json['status'] as String).toRecommendationTemplateStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final recommendationTemplateArn = this.recommendationTemplateArn;
    final status = this.status;
    return {
      'recommendationTemplateArn': recommendationTemplateArn,
      'status': status.toValue(),
    };
  }
}

class DeleteResiliencyPolicyResponse {
  /// The Amazon Resource Name (ARN) of the resiliency policy. The format for this
  /// ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:resiliency-policy/<code>policy-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String policyArn;

  DeleteResiliencyPolicyResponse({
    required this.policyArn,
  });

  factory DeleteResiliencyPolicyResponse.fromJson(Map<String, dynamic> json) {
    return DeleteResiliencyPolicyResponse(
      policyArn: json['policyArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final policyArn = this.policyArn;
    return {
      'policyArn': policyArn,
    };
  }
}

class DescribeAppAssessmentResponse {
  /// The assessment for an AWS Resilience Hub application, returned as an object.
  /// This object includes Amazon Resource Names (ARNs), compliance information,
  /// compliance status, cost, messages, resiliency scores, and more.
  final AppAssessment assessment;

  DescribeAppAssessmentResponse({
    required this.assessment,
  });

  factory DescribeAppAssessmentResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAppAssessmentResponse(
      assessment:
          AppAssessment.fromJson(json['assessment'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final assessment = this.assessment;
    return {
      'assessment': assessment,
    };
  }
}

class DescribeAppResponse {
  /// The specified application, returned as an object with details including
  /// compliance status, creation time, description, resiliency score, and more.
  final App app;

  DescribeAppResponse({
    required this.app,
  });

  factory DescribeAppResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAppResponse(
      app: App.fromJson(json['app'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final app = this.app;
    return {
      'app': app,
    };
  }
}

class DescribeAppVersionResourcesResolutionStatusResponse {
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String appArn;

  /// The version of the application.
  final String appVersion;

  /// The identifier for a specific resolution.
  final String resolutionId;

  /// The status of the action.
  final ResourceResolutionStatusType status;

  /// The returned error message for the request.
  final String? errorMessage;

  DescribeAppVersionResourcesResolutionStatusResponse({
    required this.appArn,
    required this.appVersion,
    required this.resolutionId,
    required this.status,
    this.errorMessage,
  });

  factory DescribeAppVersionResourcesResolutionStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeAppVersionResourcesResolutionStatusResponse(
      appArn: json['appArn'] as String,
      appVersion: json['appVersion'] as String,
      resolutionId: json['resolutionId'] as String,
      status: (json['status'] as String).toResourceResolutionStatusType(),
      errorMessage: json['errorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final appVersion = this.appVersion;
    final resolutionId = this.resolutionId;
    final status = this.status;
    final errorMessage = this.errorMessage;
    return {
      'appArn': appArn,
      'appVersion': appVersion,
      'resolutionId': resolutionId,
      'status': status.toValue(),
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }
}

class DescribeAppVersionTemplateResponse {
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String appArn;

  /// The body of the template.
  final String appTemplateBody;

  /// The version of the application.
  final String appVersion;

  DescribeAppVersionTemplateResponse({
    required this.appArn,
    required this.appTemplateBody,
    required this.appVersion,
  });

  factory DescribeAppVersionTemplateResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeAppVersionTemplateResponse(
      appArn: json['appArn'] as String,
      appTemplateBody: json['appTemplateBody'] as String,
      appVersion: json['appVersion'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final appTemplateBody = this.appTemplateBody;
    final appVersion = this.appVersion;
    return {
      'appArn': appArn,
      'appTemplateBody': appTemplateBody,
      'appVersion': appVersion,
    };
  }
}

class DescribeDraftAppVersionResourcesImportStatusResponse {
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String appArn;

  /// The version of the application.
  final String appVersion;

  /// The status of the action.
  final ResourceImportStatusType status;

  /// The timestamp for when the status last changed.
  final DateTime statusChangeTime;

  /// The returned error message for the request.
  final String? errorMessage;

  DescribeDraftAppVersionResourcesImportStatusResponse({
    required this.appArn,
    required this.appVersion,
    required this.status,
    required this.statusChangeTime,
    this.errorMessage,
  });

  factory DescribeDraftAppVersionResourcesImportStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeDraftAppVersionResourcesImportStatusResponse(
      appArn: json['appArn'] as String,
      appVersion: json['appVersion'] as String,
      status: (json['status'] as String).toResourceImportStatusType(),
      statusChangeTime:
          nonNullableTimeStampFromJson(json['statusChangeTime'] as Object),
      errorMessage: json['errorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final appVersion = this.appVersion;
    final status = this.status;
    final statusChangeTime = this.statusChangeTime;
    final errorMessage = this.errorMessage;
    return {
      'appArn': appArn,
      'appVersion': appVersion,
      'status': status.toValue(),
      'statusChangeTime': unixTimestampToJson(statusChangeTime),
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }
}

class DescribeResiliencyPolicyResponse {
  /// Information about the specific resiliency policy, returned as an object.
  /// This object includes creation time, data location constraints, its name,
  /// description, tags, the recovery time objective (RTO) and recovery point
  /// objective (RPO) in seconds, and more.
  final ResiliencyPolicy policy;

  DescribeResiliencyPolicyResponse({
    required this.policy,
  });

  factory DescribeResiliencyPolicyResponse.fromJson(Map<String, dynamic> json) {
    return DescribeResiliencyPolicyResponse(
      policy: ResiliencyPolicy.fromJson(json['policy'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      'policy': policy,
    };
  }
}

/// Defines the compliance against the resiliency policy for a disruption.
class DisruptionCompliance {
  /// The current status of compliance for the resiliency policy.
  final ComplianceStatus complianceStatus;

  /// The Recovery Point Objective (RPO) that is achievable, in seconds.
  final int? achievableRpoInSecs;

  /// The Recovery Time Objective (RTO) that is achievable, in seconds
  final int? achievableRtoInSecs;

  /// The current RPO, in seconds.
  final int? currentRpoInSecs;

  /// The current RTO, in seconds.
  final int? currentRtoInSecs;

  /// The disruption compliance message.
  final String? message;

  /// The RPO description.
  final String? rpoDescription;

  /// The RPO reference identifier.
  final String? rpoReferenceId;

  /// The RTO description.
  final String? rtoDescription;

  /// The RTO reference identifier.
  final String? rtoReferenceId;

  DisruptionCompliance({
    required this.complianceStatus,
    this.achievableRpoInSecs,
    this.achievableRtoInSecs,
    this.currentRpoInSecs,
    this.currentRtoInSecs,
    this.message,
    this.rpoDescription,
    this.rpoReferenceId,
    this.rtoDescription,
    this.rtoReferenceId,
  });

  factory DisruptionCompliance.fromJson(Map<String, dynamic> json) {
    return DisruptionCompliance(
      complianceStatus:
          (json['complianceStatus'] as String).toComplianceStatus(),
      achievableRpoInSecs: json['achievableRpoInSecs'] as int?,
      achievableRtoInSecs: json['achievableRtoInSecs'] as int?,
      currentRpoInSecs: json['currentRpoInSecs'] as int?,
      currentRtoInSecs: json['currentRtoInSecs'] as int?,
      message: json['message'] as String?,
      rpoDescription: json['rpoDescription'] as String?,
      rpoReferenceId: json['rpoReferenceId'] as String?,
      rtoDescription: json['rtoDescription'] as String?,
      rtoReferenceId: json['rtoReferenceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final complianceStatus = this.complianceStatus;
    final achievableRpoInSecs = this.achievableRpoInSecs;
    final achievableRtoInSecs = this.achievableRtoInSecs;
    final currentRpoInSecs = this.currentRpoInSecs;
    final currentRtoInSecs = this.currentRtoInSecs;
    final message = this.message;
    final rpoDescription = this.rpoDescription;
    final rpoReferenceId = this.rpoReferenceId;
    final rtoDescription = this.rtoDescription;
    final rtoReferenceId = this.rtoReferenceId;
    return {
      'complianceStatus': complianceStatus.toValue(),
      if (achievableRpoInSecs != null)
        'achievableRpoInSecs': achievableRpoInSecs,
      if (achievableRtoInSecs != null)
        'achievableRtoInSecs': achievableRtoInSecs,
      if (currentRpoInSecs != null) 'currentRpoInSecs': currentRpoInSecs,
      if (currentRtoInSecs != null) 'currentRtoInSecs': currentRtoInSecs,
      if (message != null) 'message': message,
      if (rpoDescription != null) 'rpoDescription': rpoDescription,
      if (rpoReferenceId != null) 'rpoReferenceId': rpoReferenceId,
      if (rtoDescription != null) 'rtoDescription': rtoDescription,
      if (rtoReferenceId != null) 'rtoReferenceId': rtoReferenceId,
    };
  }
}

enum DisruptionType {
  software,
  hardware,
  az,
  region,
}

extension on DisruptionType {
  String toValue() {
    switch (this) {
      case DisruptionType.software:
        return 'Software';
      case DisruptionType.hardware:
        return 'Hardware';
      case DisruptionType.az:
        return 'AZ';
      case DisruptionType.region:
        return 'Region';
    }
  }
}

extension on String {
  DisruptionType toDisruptionType() {
    switch (this) {
      case 'Software':
        return DisruptionType.software;
      case 'Hardware':
        return DisruptionType.hardware;
      case 'AZ':
        return DisruptionType.az;
      case 'Region':
        return DisruptionType.region;
    }
    throw Exception('$this is not known in enum DisruptionType');
  }
}

enum EstimatedCostTier {
  l1,
  l2,
  l3,
  l4,
}

extension on EstimatedCostTier {
  String toValue() {
    switch (this) {
      case EstimatedCostTier.l1:
        return 'L1';
      case EstimatedCostTier.l2:
        return 'L2';
      case EstimatedCostTier.l3:
        return 'L3';
      case EstimatedCostTier.l4:
        return 'L4';
    }
  }
}

extension on String {
  EstimatedCostTier toEstimatedCostTier() {
    switch (this) {
      case 'L1':
        return EstimatedCostTier.l1;
      case 'L2':
        return EstimatedCostTier.l2;
      case 'L3':
        return EstimatedCostTier.l3;
      case 'L4':
        return EstimatedCostTier.l4;
    }
    throw Exception('$this is not known in enum EstimatedCostTier');
  }
}

/// Defines a failure policy.
class FailurePolicy {
  /// The Recovery Point Objective (RPO), in seconds.
  final int rpoInSecs;

  /// The Recovery Time Objective (RTO), in seconds.
  final int rtoInSecs;

  FailurePolicy({
    required this.rpoInSecs,
    required this.rtoInSecs,
  });

  factory FailurePolicy.fromJson(Map<String, dynamic> json) {
    return FailurePolicy(
      rpoInSecs: json['rpoInSecs'] as int,
      rtoInSecs: json['rtoInSecs'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final rpoInSecs = this.rpoInSecs;
    final rtoInSecs = this.rtoInSecs;
    return {
      'rpoInSecs': rpoInSecs,
      'rtoInSecs': rtoInSecs,
    };
  }
}

enum HaArchitecture {
  multiSite,
  warmStandby,
  pilotLight,
  backupAndRestore,
  noRecoveryPlan,
}

extension on HaArchitecture {
  String toValue() {
    switch (this) {
      case HaArchitecture.multiSite:
        return 'MultiSite';
      case HaArchitecture.warmStandby:
        return 'WarmStandby';
      case HaArchitecture.pilotLight:
        return 'PilotLight';
      case HaArchitecture.backupAndRestore:
        return 'BackupAndRestore';
      case HaArchitecture.noRecoveryPlan:
        return 'NoRecoveryPlan';
    }
  }
}

extension on String {
  HaArchitecture toHaArchitecture() {
    switch (this) {
      case 'MultiSite':
        return HaArchitecture.multiSite;
      case 'WarmStandby':
        return HaArchitecture.warmStandby;
      case 'PilotLight':
        return HaArchitecture.pilotLight;
      case 'BackupAndRestore':
        return HaArchitecture.backupAndRestore;
      case 'NoRecoveryPlan':
        return HaArchitecture.noRecoveryPlan;
    }
    throw Exception('$this is not known in enum HaArchitecture');
  }
}

class ImportResourcesToDraftAppVersionResponse {
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String appArn;

  /// The version of the application.
  final String appVersion;

  /// The status of the action.
  final ResourceImportStatusType status;

  /// The Amazon Resource Names (ARNs) for the resources that you imported.
  final List<String>? sourceArns;

  /// A list of terraform file s3 URLs you need to import.
  final List<TerraformSource>? terraformSources;

  ImportResourcesToDraftAppVersionResponse({
    required this.appArn,
    required this.appVersion,
    required this.status,
    this.sourceArns,
    this.terraformSources,
  });

  factory ImportResourcesToDraftAppVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return ImportResourcesToDraftAppVersionResponse(
      appArn: json['appArn'] as String,
      appVersion: json['appVersion'] as String,
      status: (json['status'] as String).toResourceImportStatusType(),
      sourceArns: (json['sourceArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      terraformSources: (json['terraformSources'] as List?)
          ?.whereNotNull()
          .map((e) => TerraformSource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final appVersion = this.appVersion;
    final status = this.status;
    final sourceArns = this.sourceArns;
    final terraformSources = this.terraformSources;
    return {
      'appArn': appArn,
      'appVersion': appVersion,
      'status': status.toValue(),
      if (sourceArns != null) 'sourceArns': sourceArns,
      if (terraformSources != null) 'terraformSources': terraformSources,
    };
  }
}

class ListAlarmRecommendationsResponse {
  /// The alarm recommendations for an AWS Resilience Hub application, returned as
  /// an object. This object includes application component names, descriptions,
  /// information about whether a recommendation has already been implemented or
  /// not, prerequisites, and more.
  final List<AlarmRecommendation> alarmRecommendations;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  ListAlarmRecommendationsResponse({
    required this.alarmRecommendations,
    this.nextToken,
  });

  factory ListAlarmRecommendationsResponse.fromJson(Map<String, dynamic> json) {
    return ListAlarmRecommendationsResponse(
      alarmRecommendations: (json['alarmRecommendations'] as List)
          .whereNotNull()
          .map((e) => AlarmRecommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final alarmRecommendations = this.alarmRecommendations;
    final nextToken = this.nextToken;
    return {
      'alarmRecommendations': alarmRecommendations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAppAssessmentsResponse {
  /// The summaries for the specified assessments, returned as an object. This
  /// object includes application versions, associated Amazon Resource Numbers
  /// (ARNs), cost, messages, resiliency scores, and more.
  final List<AppAssessmentSummary> assessmentSummaries;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  ListAppAssessmentsResponse({
    required this.assessmentSummaries,
    this.nextToken,
  });

  factory ListAppAssessmentsResponse.fromJson(Map<String, dynamic> json) {
    return ListAppAssessmentsResponse(
      assessmentSummaries: (json['assessmentSummaries'] as List)
          .whereNotNull()
          .map((e) => AppAssessmentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentSummaries = this.assessmentSummaries;
    final nextToken = this.nextToken;
    return {
      'assessmentSummaries': assessmentSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAppComponentCompliancesResponse {
  /// The compliances for an AWS Resilience Hub application component, returned as
  /// an object. This object contains component names, compliances, costs,
  /// resiliency scores, outage scores, and more.
  final List<AppComponentCompliance> componentCompliances;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  ListAppComponentCompliancesResponse({
    required this.componentCompliances,
    this.nextToken,
  });

  factory ListAppComponentCompliancesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAppComponentCompliancesResponse(
      componentCompliances: (json['componentCompliances'] as List)
          .whereNotNull()
          .map(
              (e) => AppComponentCompliance.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final componentCompliances = this.componentCompliances;
    final nextToken = this.nextToken;
    return {
      'componentCompliances': componentCompliances,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAppComponentRecommendationsResponse {
  /// The recommendations for an Resilience Hub application component, returned as
  /// an object. This object contains component names, configuration
  /// recommendations, and recommendation statuses.
  final List<ComponentRecommendation> componentRecommendations;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  ListAppComponentRecommendationsResponse({
    required this.componentRecommendations,
    this.nextToken,
  });

  factory ListAppComponentRecommendationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAppComponentRecommendationsResponse(
      componentRecommendations: (json['componentRecommendations'] as List)
          .whereNotNull()
          .map((e) =>
              ComponentRecommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final componentRecommendations = this.componentRecommendations;
    final nextToken = this.nextToken;
    return {
      'componentRecommendations': componentRecommendations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAppVersionResourceMappingsResponse {
  /// Mappings used to map logical resources from the template to physical
  /// resources. You can use the mapping type <code>CFN_STACK</code> if the
  /// application template uses a logical stack name. Or you can map individual
  /// resources by using the mapping type <code>RESOURCE</code>. We recommend
  /// using the mapping type <code>CFN_STACK</code> if the application is backed
  /// by a CloudFormation stack.
  final List<ResourceMapping> resourceMappings;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  ListAppVersionResourceMappingsResponse({
    required this.resourceMappings,
    this.nextToken,
  });

  factory ListAppVersionResourceMappingsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAppVersionResourceMappingsResponse(
      resourceMappings: (json['resourceMappings'] as List)
          .whereNotNull()
          .map((e) => ResourceMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceMappings = this.resourceMappings;
    final nextToken = this.nextToken;
    return {
      'resourceMappings': resourceMappings,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAppVersionResourcesResponse {
  /// The physical resources in the application version.
  final List<PhysicalResource> physicalResources;

  /// The identifier for a specific resolution.
  final String resolutionId;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  ListAppVersionResourcesResponse({
    required this.physicalResources,
    required this.resolutionId,
    this.nextToken,
  });

  factory ListAppVersionResourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListAppVersionResourcesResponse(
      physicalResources: (json['physicalResources'] as List)
          .whereNotNull()
          .map((e) => PhysicalResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      resolutionId: json['resolutionId'] as String,
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final physicalResources = this.physicalResources;
    final resolutionId = this.resolutionId;
    final nextToken = this.nextToken;
    return {
      'physicalResources': physicalResources,
      'resolutionId': resolutionId,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAppVersionsResponse {
  /// The version of the application.
  final List<AppVersionSummary> appVersions;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  ListAppVersionsResponse({
    required this.appVersions,
    this.nextToken,
  });

  factory ListAppVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListAppVersionsResponse(
      appVersions: (json['appVersions'] as List)
          .whereNotNull()
          .map((e) => AppVersionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appVersions = this.appVersions;
    final nextToken = this.nextToken;
    return {
      'appVersions': appVersions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAppsResponse {
  /// Summaries for the Resilience Hub application.
  final List<AppSummary> appSummaries;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  ListAppsResponse({
    required this.appSummaries,
    this.nextToken,
  });

  factory ListAppsResponse.fromJson(Map<String, dynamic> json) {
    return ListAppsResponse(
      appSummaries: (json['appSummaries'] as List)
          .whereNotNull()
          .map((e) => AppSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appSummaries = this.appSummaries;
    final nextToken = this.nextToken;
    return {
      'appSummaries': appSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListRecommendationTemplatesResponse {
  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  /// The recommendation templates for the Resilience Hub applications.
  final List<RecommendationTemplate>? recommendationTemplates;

  ListRecommendationTemplatesResponse({
    this.nextToken,
    this.recommendationTemplates,
  });

  factory ListRecommendationTemplatesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListRecommendationTemplatesResponse(
      nextToken: json['nextToken'] as String?,
      recommendationTemplates: (json['recommendationTemplates'] as List?)
          ?.whereNotNull()
          .map(
              (e) => RecommendationTemplate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final recommendationTemplates = this.recommendationTemplates;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (recommendationTemplates != null)
        'recommendationTemplates': recommendationTemplates,
    };
  }
}

class ListResiliencyPoliciesResponse {
  /// The resiliency policies for the Resilience Hub applications.
  final List<ResiliencyPolicy> resiliencyPolicies;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  ListResiliencyPoliciesResponse({
    required this.resiliencyPolicies,
    this.nextToken,
  });

  factory ListResiliencyPoliciesResponse.fromJson(Map<String, dynamic> json) {
    return ListResiliencyPoliciesResponse(
      resiliencyPolicies: (json['resiliencyPolicies'] as List)
          .whereNotNull()
          .map((e) => ResiliencyPolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resiliencyPolicies = this.resiliencyPolicies;
    final nextToken = this.nextToken;
    return {
      'resiliencyPolicies': resiliencyPolicies,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListSopRecommendationsResponse {
  /// The standard operating procedure (SOP) recommendations for the Resilience
  /// Hub applications.
  final List<SopRecommendation> sopRecommendations;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  ListSopRecommendationsResponse({
    required this.sopRecommendations,
    this.nextToken,
  });

  factory ListSopRecommendationsResponse.fromJson(Map<String, dynamic> json) {
    return ListSopRecommendationsResponse(
      sopRecommendations: (json['sopRecommendations'] as List)
          .whereNotNull()
          .map((e) => SopRecommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sopRecommendations = this.sopRecommendations;
    final nextToken = this.nextToken;
    return {
      'sopRecommendations': sopRecommendations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListSuggestedResiliencyPoliciesResponse {
  /// The suggested resiliency policies for the Resilience Hub applications.
  final List<ResiliencyPolicy> resiliencyPolicies;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  ListSuggestedResiliencyPoliciesResponse({
    required this.resiliencyPolicies,
    this.nextToken,
  });

  factory ListSuggestedResiliencyPoliciesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListSuggestedResiliencyPoliciesResponse(
      resiliencyPolicies: (json['resiliencyPolicies'] as List)
          .whereNotNull()
          .map((e) => ResiliencyPolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resiliencyPolicies = this.resiliencyPolicies;
    final nextToken = this.nextToken;
    return {
      'resiliencyPolicies': resiliencyPolicies,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags assigned to the resource. A tag is a label that you assign to an
  /// Amazon Web Services resource. Each tag consists of a key/value pair.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

class ListTestRecommendationsResponse {
  /// The test recommendations for the Resilience Hub application.
  final List<TestRecommendation> testRecommendations;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  ListTestRecommendationsResponse({
    required this.testRecommendations,
    this.nextToken,
  });

  factory ListTestRecommendationsResponse.fromJson(Map<String, dynamic> json) {
    return ListTestRecommendationsResponse(
      testRecommendations: (json['testRecommendations'] as List)
          .whereNotNull()
          .map((e) => TestRecommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final testRecommendations = this.testRecommendations;
    final nextToken = this.nextToken;
    return {
      'testRecommendations': testRecommendations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListUnsupportedAppVersionResourcesResponse {
  /// The identifier for a specific resolution.
  final String resolutionId;

  /// The unsupported resources for the application.
  final List<UnsupportedResource> unsupportedResources;

  /// The token for the next set of results, or null if there are no more results.
  final String? nextToken;

  ListUnsupportedAppVersionResourcesResponse({
    required this.resolutionId,
    required this.unsupportedResources,
    this.nextToken,
  });

  factory ListUnsupportedAppVersionResourcesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListUnsupportedAppVersionResourcesResponse(
      resolutionId: json['resolutionId'] as String,
      unsupportedResources: (json['unsupportedResources'] as List)
          .whereNotNull()
          .map((e) => UnsupportedResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resolutionId = this.resolutionId;
    final unsupportedResources = this.unsupportedResources;
    final nextToken = this.nextToken;
    return {
      'resolutionId': resolutionId,
      'unsupportedResources': unsupportedResources,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Defines a logical resource identifier.
class LogicalResourceId {
  /// The identifier of the resource.
  final String identifier;

  /// The name of the CloudFormation stack this resource belongs to.
  final String? logicalStackName;

  /// The name of the resource group that this resource belongs to.
  final String? resourceGroupName;

  /// The name of the Terraform S3 state file this resource belongs to.
  final String? terraformSourceName;

  LogicalResourceId({
    required this.identifier,
    this.logicalStackName,
    this.resourceGroupName,
    this.terraformSourceName,
  });

  factory LogicalResourceId.fromJson(Map<String, dynamic> json) {
    return LogicalResourceId(
      identifier: json['identifier'] as String,
      logicalStackName: json['logicalStackName'] as String?,
      resourceGroupName: json['resourceGroupName'] as String?,
      terraformSourceName: json['terraformSourceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    final logicalStackName = this.logicalStackName;
    final resourceGroupName = this.resourceGroupName;
    final terraformSourceName = this.terraformSourceName;
    return {
      'identifier': identifier,
      if (logicalStackName != null) 'logicalStackName': logicalStackName,
      if (resourceGroupName != null) 'resourceGroupName': resourceGroupName,
      if (terraformSourceName != null)
        'terraformSourceName': terraformSourceName,
    };
  }
}

enum PhysicalIdentifierType {
  arn,
  native,
}

extension on PhysicalIdentifierType {
  String toValue() {
    switch (this) {
      case PhysicalIdentifierType.arn:
        return 'Arn';
      case PhysicalIdentifierType.native:
        return 'Native';
    }
  }
}

extension on String {
  PhysicalIdentifierType toPhysicalIdentifierType() {
    switch (this) {
      case 'Arn':
        return PhysicalIdentifierType.arn;
      case 'Native':
        return PhysicalIdentifierType.native;
    }
    throw Exception('$this is not known in enum PhysicalIdentifierType');
  }
}

/// Defines a physical resource. A physical resource is a resource that exists
/// in your account. It can be identified using an Amazon Resource Name (ARN) or
/// a Resilience Hub-native identifier.
class PhysicalResource {
  /// The logical identifier of the resource.
  final LogicalResourceId logicalResourceId;

  /// The physical identifier of the resource.
  final PhysicalResourceId physicalResourceId;

  /// The type of resource.
  final String resourceType;

  /// The application components that belong to this resource.
  final List<AppComponent>? appComponents;

  /// The name of the resource.
  final String? resourceName;

  PhysicalResource({
    required this.logicalResourceId,
    required this.physicalResourceId,
    required this.resourceType,
    this.appComponents,
    this.resourceName,
  });

  factory PhysicalResource.fromJson(Map<String, dynamic> json) {
    return PhysicalResource(
      logicalResourceId: LogicalResourceId.fromJson(
          json['logicalResourceId'] as Map<String, dynamic>),
      physicalResourceId: PhysicalResourceId.fromJson(
          json['physicalResourceId'] as Map<String, dynamic>),
      resourceType: json['resourceType'] as String,
      appComponents: (json['appComponents'] as List?)
          ?.whereNotNull()
          .map((e) => AppComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceName: json['resourceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logicalResourceId = this.logicalResourceId;
    final physicalResourceId = this.physicalResourceId;
    final resourceType = this.resourceType;
    final appComponents = this.appComponents;
    final resourceName = this.resourceName;
    return {
      'logicalResourceId': logicalResourceId,
      'physicalResourceId': physicalResourceId,
      'resourceType': resourceType,
      if (appComponents != null) 'appComponents': appComponents,
      if (resourceName != null) 'resourceName': resourceName,
    };
  }
}

/// Defines a physical resource identifier.
class PhysicalResourceId {
  /// The identifier of the physical resource.
  final String identifier;

  /// Specifies the type of physical resource identifier.
  /// <dl> <dt>Arn</dt> <dd>
  /// The resource identifier is an Amazon Resource Name (ARN) .
  /// </dd> <dt>Native</dt> <dd>
  /// The resource identifier is a Resilience Hub-native identifier.
  /// </dd> </dl>
  final PhysicalIdentifierType type;

  /// The Amazon Web Services account that owns the physical resource.
  final String? awsAccountId;

  /// The Amazon Web Services Region that the physical resource is located in.
  final String? awsRegion;

  PhysicalResourceId({
    required this.identifier,
    required this.type,
    this.awsAccountId,
    this.awsRegion,
  });

  factory PhysicalResourceId.fromJson(Map<String, dynamic> json) {
    return PhysicalResourceId(
      identifier: json['identifier'] as String,
      type: (json['type'] as String).toPhysicalIdentifierType(),
      awsAccountId: json['awsAccountId'] as String?,
      awsRegion: json['awsRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    final type = this.type;
    final awsAccountId = this.awsAccountId;
    final awsRegion = this.awsRegion;
    return {
      'identifier': identifier,
      'type': type.toValue(),
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (awsRegion != null) 'awsRegion': awsRegion,
    };
  }
}

class PublishAppVersionResponse {
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String appArn;

  /// The version of the application.
  final String? appVersion;

  PublishAppVersionResponse({
    required this.appArn,
    this.appVersion,
  });

  factory PublishAppVersionResponse.fromJson(Map<String, dynamic> json) {
    return PublishAppVersionResponse(
      appArn: json['appArn'] as String,
      appVersion: json['appVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final appVersion = this.appVersion;
    return {
      'appArn': appArn,
      if (appVersion != null) 'appVersion': appVersion,
    };
  }
}

class PutDraftAppVersionTemplateResponse {
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String? appArn;

  /// The version of the application.
  final String? appVersion;

  PutDraftAppVersionTemplateResponse({
    this.appArn,
    this.appVersion,
  });

  factory PutDraftAppVersionTemplateResponse.fromJson(
      Map<String, dynamic> json) {
    return PutDraftAppVersionTemplateResponse(
      appArn: json['appArn'] as String?,
      appVersion: json['appVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final appVersion = this.appVersion;
    return {
      if (appArn != null) 'appArn': appArn,
      if (appVersion != null) 'appVersion': appVersion,
    };
  }
}

enum RecommendationComplianceStatus {
  breachedUnattainable,
  breachedCanMeet,
  metCanImprove,
}

extension on RecommendationComplianceStatus {
  String toValue() {
    switch (this) {
      case RecommendationComplianceStatus.breachedUnattainable:
        return 'BreachedUnattainable';
      case RecommendationComplianceStatus.breachedCanMeet:
        return 'BreachedCanMeet';
      case RecommendationComplianceStatus.metCanImprove:
        return 'MetCanImprove';
    }
  }
}

extension on String {
  RecommendationComplianceStatus toRecommendationComplianceStatus() {
    switch (this) {
      case 'BreachedUnattainable':
        return RecommendationComplianceStatus.breachedUnattainable;
      case 'BreachedCanMeet':
        return RecommendationComplianceStatus.breachedCanMeet;
      case 'MetCanImprove':
        return RecommendationComplianceStatus.metCanImprove;
    }
    throw Exception(
        '$this is not known in enum RecommendationComplianceStatus');
  }
}

/// Defines a disruption compliance recommendation.
class RecommendationDisruptionCompliance {
  /// The expected compliance status after applying the recommended configuration
  /// change.
  final ComplianceStatus expectedComplianceStatus;

  /// The expected Recovery Point Objective (RPO) description after applying the
  /// recommended configuration change.
  final String? expectedRpoDescription;

  /// The expected RPO after applying the recommended configuration change.
  final int? expectedRpoInSecs;

  /// The expected Recovery Time Objective (RTO) description after applying the
  /// recommended configuration change.
  final String? expectedRtoDescription;

  /// The expected RTO after applying the recommended configuration change.
  final int? expectedRtoInSecs;

  RecommendationDisruptionCompliance({
    required this.expectedComplianceStatus,
    this.expectedRpoDescription,
    this.expectedRpoInSecs,
    this.expectedRtoDescription,
    this.expectedRtoInSecs,
  });

  factory RecommendationDisruptionCompliance.fromJson(
      Map<String, dynamic> json) {
    return RecommendationDisruptionCompliance(
      expectedComplianceStatus:
          (json['expectedComplianceStatus'] as String).toComplianceStatus(),
      expectedRpoDescription: json['expectedRpoDescription'] as String?,
      expectedRpoInSecs: json['expectedRpoInSecs'] as int?,
      expectedRtoDescription: json['expectedRtoDescription'] as String?,
      expectedRtoInSecs: json['expectedRtoInSecs'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final expectedComplianceStatus = this.expectedComplianceStatus;
    final expectedRpoDescription = this.expectedRpoDescription;
    final expectedRpoInSecs = this.expectedRpoInSecs;
    final expectedRtoDescription = this.expectedRtoDescription;
    final expectedRtoInSecs = this.expectedRtoInSecs;
    return {
      'expectedComplianceStatus': expectedComplianceStatus.toValue(),
      if (expectedRpoDescription != null)
        'expectedRpoDescription': expectedRpoDescription,
      if (expectedRpoInSecs != null) 'expectedRpoInSecs': expectedRpoInSecs,
      if (expectedRtoDescription != null)
        'expectedRtoDescription': expectedRtoDescription,
      if (expectedRtoInSecs != null) 'expectedRtoInSecs': expectedRtoInSecs,
    };
  }
}

/// Defines a recommendation.
class RecommendationItem {
  /// Specifies if the recommendation has already been implemented.
  final bool? alreadyImplemented;

  /// The resource identifier.
  final String? resourceId;

  /// The target account identifier.
  final String? targetAccountId;

  /// The target region.
  final String? targetRegion;

  RecommendationItem({
    this.alreadyImplemented,
    this.resourceId,
    this.targetAccountId,
    this.targetRegion,
  });

  factory RecommendationItem.fromJson(Map<String, dynamic> json) {
    return RecommendationItem(
      alreadyImplemented: json['alreadyImplemented'] as bool?,
      resourceId: json['resourceId'] as String?,
      targetAccountId: json['targetAccountId'] as String?,
      targetRegion: json['targetRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final alreadyImplemented = this.alreadyImplemented;
    final resourceId = this.resourceId;
    final targetAccountId = this.targetAccountId;
    final targetRegion = this.targetRegion;
    return {
      if (alreadyImplemented != null) 'alreadyImplemented': alreadyImplemented,
      if (resourceId != null) 'resourceId': resourceId,
      if (targetAccountId != null) 'targetAccountId': targetAccountId,
      if (targetRegion != null) 'targetRegion': targetRegion,
    };
  }
}

/// Defines a recommendation template created with the
/// <a>CreateRecommendationTemplate</a> action.
class RecommendationTemplate {
  /// The Amazon Resource Name (ARN) of the assessment. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String assessmentArn;

  /// The format of the recommendation template.
  /// <dl> <dt>CfnJson</dt> <dd>
  /// The template is CloudFormation JSON.
  /// </dd> <dt>CfnYaml</dt> <dd>
  /// The template is CloudFormation YAML.
  /// </dd> </dl>
  final TemplateFormat format;

  /// The name for the recommendation template.
  final String name;

  /// The Amazon Resource Name (ARN) for the recommendation template.
  final String recommendationTemplateArn;

  /// An array of strings that specify the recommendation template type or types.
  /// <dl> <dt>Alarm</dt> <dd>
  /// The template is an <a>AlarmRecommendation</a> template.
  /// </dd> <dt>Sop</dt> <dd>
  /// The template is a <a>SopRecommendation</a> template.
  /// </dd> <dt>Test</dt> <dd>
  /// The template is a <a>TestRecommendation</a> template.
  /// </dd> </dl>
  final List<RenderRecommendationType> recommendationTypes;

  /// The status of the action.
  final RecommendationTemplateStatus status;

  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String? appArn;

  /// The end time for the action.
  final DateTime? endTime;

  /// The message for the recommendation template.
  final String? message;

  /// Indicates if replacements are needed.
  final bool? needsReplacements;

  /// Identifiers for the recommendations used in the recommendation template.
  final List<String>? recommendationIds;

  /// The start time for the action.
  final DateTime? startTime;

  /// The tags assigned to the resource. A tag is a label that you assign to an
  /// Amazon Web Services resource. Each tag consists of a key/value pair.
  final Map<String, String>? tags;

  /// The file location of the template.
  final S3Location? templatesLocation;

  RecommendationTemplate({
    required this.assessmentArn,
    required this.format,
    required this.name,
    required this.recommendationTemplateArn,
    required this.recommendationTypes,
    required this.status,
    this.appArn,
    this.endTime,
    this.message,
    this.needsReplacements,
    this.recommendationIds,
    this.startTime,
    this.tags,
    this.templatesLocation,
  });

  factory RecommendationTemplate.fromJson(Map<String, dynamic> json) {
    return RecommendationTemplate(
      assessmentArn: json['assessmentArn'] as String,
      format: (json['format'] as String).toTemplateFormat(),
      name: json['name'] as String,
      recommendationTemplateArn: json['recommendationTemplateArn'] as String,
      recommendationTypes: (json['recommendationTypes'] as List)
          .whereNotNull()
          .map((e) => (e as String).toRenderRecommendationType())
          .toList(),
      status: (json['status'] as String).toRecommendationTemplateStatus(),
      appArn: json['appArn'] as String?,
      endTime: timeStampFromJson(json['endTime']),
      message: json['message'] as String?,
      needsReplacements: json['needsReplacements'] as bool?,
      recommendationIds: (json['recommendationIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      startTime: timeStampFromJson(json['startTime']),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      templatesLocation: json['templatesLocation'] != null
          ? S3Location.fromJson(
              json['templatesLocation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assessmentArn = this.assessmentArn;
    final format = this.format;
    final name = this.name;
    final recommendationTemplateArn = this.recommendationTemplateArn;
    final recommendationTypes = this.recommendationTypes;
    final status = this.status;
    final appArn = this.appArn;
    final endTime = this.endTime;
    final message = this.message;
    final needsReplacements = this.needsReplacements;
    final recommendationIds = this.recommendationIds;
    final startTime = this.startTime;
    final tags = this.tags;
    final templatesLocation = this.templatesLocation;
    return {
      'assessmentArn': assessmentArn,
      'format': format.toValue(),
      'name': name,
      'recommendationTemplateArn': recommendationTemplateArn,
      'recommendationTypes':
          recommendationTypes.map((e) => e.toValue()).toList(),
      'status': status.toValue(),
      if (appArn != null) 'appArn': appArn,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (message != null) 'message': message,
      if (needsReplacements != null) 'needsReplacements': needsReplacements,
      if (recommendationIds != null) 'recommendationIds': recommendationIds,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (tags != null) 'tags': tags,
      if (templatesLocation != null) 'templatesLocation': templatesLocation,
    };
  }
}

enum RecommendationTemplateStatus {
  pending,
  inProgress,
  failed,
  success,
}

extension on RecommendationTemplateStatus {
  String toValue() {
    switch (this) {
      case RecommendationTemplateStatus.pending:
        return 'Pending';
      case RecommendationTemplateStatus.inProgress:
        return 'InProgress';
      case RecommendationTemplateStatus.failed:
        return 'Failed';
      case RecommendationTemplateStatus.success:
        return 'Success';
    }
  }
}

extension on String {
  RecommendationTemplateStatus toRecommendationTemplateStatus() {
    switch (this) {
      case 'Pending':
        return RecommendationTemplateStatus.pending;
      case 'InProgress':
        return RecommendationTemplateStatus.inProgress;
      case 'Failed':
        return RecommendationTemplateStatus.failed;
      case 'Success':
        return RecommendationTemplateStatus.success;
    }
    throw Exception('$this is not known in enum RecommendationTemplateStatus');
  }
}

class RemoveDraftAppVersionResourceMappingsResponse {
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String? appArn;

  /// The version of the application.
  final String? appVersion;

  RemoveDraftAppVersionResourceMappingsResponse({
    this.appArn,
    this.appVersion,
  });

  factory RemoveDraftAppVersionResourceMappingsResponse.fromJson(
      Map<String, dynamic> json) {
    return RemoveDraftAppVersionResourceMappingsResponse(
      appArn: json['appArn'] as String?,
      appVersion: json['appVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final appVersion = this.appVersion;
    return {
      if (appArn != null) 'appArn': appArn,
      if (appVersion != null) 'appVersion': appVersion,
    };
  }
}

enum RenderRecommendationType {
  alarm,
  sop,
  test,
}

extension on RenderRecommendationType {
  String toValue() {
    switch (this) {
      case RenderRecommendationType.alarm:
        return 'Alarm';
      case RenderRecommendationType.sop:
        return 'Sop';
      case RenderRecommendationType.test:
        return 'Test';
    }
  }
}

extension on String {
  RenderRecommendationType toRenderRecommendationType() {
    switch (this) {
      case 'Alarm':
        return RenderRecommendationType.alarm;
      case 'Sop':
        return RenderRecommendationType.sop;
      case 'Test':
        return RenderRecommendationType.test;
    }
    throw Exception('$this is not known in enum RenderRecommendationType');
  }
}

/// Defines a resiliency policy.
class ResiliencyPolicy {
  /// The timestamp for when the resiliency policy was created.
  final DateTime? creationTime;

  /// Specifies a high-level geographical location constraint for where your
  /// resilience policy data can be stored.
  final DataLocationConstraint? dataLocationConstraint;

  /// Specifies the estimated cost tier of the resiliency policy.
  final EstimatedCostTier? estimatedCostTier;

  /// The resiliency policy.
  final Map<DisruptionType, FailurePolicy>? policy;

  /// The Amazon Resource Name (ARN) of the resiliency policy. The format for this
  /// ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:resiliency-policy/<code>policy-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String? policyArn;

  /// The description for the policy.
  final String? policyDescription;

  /// The name of the policy
  final String? policyName;

  /// The tags assigned to the resource. A tag is a label that you assign to an
  /// Amazon Web Services resource. Each tag consists of a key/value pair.
  final Map<String, String>? tags;

  /// The tier for this resiliency policy, ranging from the highest severity
  /// (<code>MissionCritical</code>) to lowest (<code>NonCritical</code>).
  final ResiliencyPolicyTier? tier;

  ResiliencyPolicy({
    this.creationTime,
    this.dataLocationConstraint,
    this.estimatedCostTier,
    this.policy,
    this.policyArn,
    this.policyDescription,
    this.policyName,
    this.tags,
    this.tier,
  });

  factory ResiliencyPolicy.fromJson(Map<String, dynamic> json) {
    return ResiliencyPolicy(
      creationTime: timeStampFromJson(json['creationTime']),
      dataLocationConstraint: (json['dataLocationConstraint'] as String?)
          ?.toDataLocationConstraint(),
      estimatedCostTier:
          (json['estimatedCostTier'] as String?)?.toEstimatedCostTier(),
      policy: (json['policy'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(
          k.toDisruptionType(),
          FailurePolicy.fromJson(e as Map<String, dynamic>))),
      policyArn: json['policyArn'] as String?,
      policyDescription: json['policyDescription'] as String?,
      policyName: json['policyName'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      tier: (json['tier'] as String?)?.toResiliencyPolicyTier(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final dataLocationConstraint = this.dataLocationConstraint;
    final estimatedCostTier = this.estimatedCostTier;
    final policy = this.policy;
    final policyArn = this.policyArn;
    final policyDescription = this.policyDescription;
    final policyName = this.policyName;
    final tags = this.tags;
    final tier = this.tier;
    return {
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (dataLocationConstraint != null)
        'dataLocationConstraint': dataLocationConstraint.toValue(),
      if (estimatedCostTier != null)
        'estimatedCostTier': estimatedCostTier.toValue(),
      if (policy != null)
        'policy': policy.map((k, e) => MapEntry(k.toValue(), e)),
      if (policyArn != null) 'policyArn': policyArn,
      if (policyDescription != null) 'policyDescription': policyDescription,
      if (policyName != null) 'policyName': policyName,
      if (tags != null) 'tags': tags,
      if (tier != null) 'tier': tier.toValue(),
    };
  }
}

enum ResiliencyPolicyTier {
  missionCritical,
  critical,
  important,
  coreServices,
  nonCritical,
}

extension on ResiliencyPolicyTier {
  String toValue() {
    switch (this) {
      case ResiliencyPolicyTier.missionCritical:
        return 'MissionCritical';
      case ResiliencyPolicyTier.critical:
        return 'Critical';
      case ResiliencyPolicyTier.important:
        return 'Important';
      case ResiliencyPolicyTier.coreServices:
        return 'CoreServices';
      case ResiliencyPolicyTier.nonCritical:
        return 'NonCritical';
    }
  }
}

extension on String {
  ResiliencyPolicyTier toResiliencyPolicyTier() {
    switch (this) {
      case 'MissionCritical':
        return ResiliencyPolicyTier.missionCritical;
      case 'Critical':
        return ResiliencyPolicyTier.critical;
      case 'Important':
        return ResiliencyPolicyTier.important;
      case 'CoreServices':
        return ResiliencyPolicyTier.coreServices;
      case 'NonCritical':
        return ResiliencyPolicyTier.nonCritical;
    }
    throw Exception('$this is not known in enum ResiliencyPolicyTier');
  }
}

/// The overall resiliency score, returned as an object that includes the
/// disruption score and outage score.
class ResiliencyScore {
  /// The disruption score for a valid key.
  final Map<DisruptionType, double> disruptionScore;

  /// The outage score for a valid key.
  final double score;

  ResiliencyScore({
    required this.disruptionScore,
    required this.score,
  });

  factory ResiliencyScore.fromJson(Map<String, dynamic> json) {
    return ResiliencyScore(
      disruptionScore: (json['disruptionScore'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k.toDisruptionType(), e as double)),
      score: json['score'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final disruptionScore = this.disruptionScore;
    final score = this.score;
    return {
      'disruptionScore':
          disruptionScore.map((k, e) => MapEntry(k.toValue(), e)),
      'score': score,
    };
  }
}

class ResolveAppVersionResourcesResponse {
  /// The Amazon Resource Name (ARN) of the application. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>AWS General Reference</i>.
  final String appArn;

  /// The version of the application.
  final String appVersion;

  /// The identifier for a specific resolution.
  final String resolutionId;

  /// The status of the action.
  final ResourceResolutionStatusType status;

  ResolveAppVersionResourcesResponse({
    required this.appArn,
    required this.appVersion,
    required this.resolutionId,
    required this.status,
  });

  factory ResolveAppVersionResourcesResponse.fromJson(
      Map<String, dynamic> json) {
    return ResolveAppVersionResourcesResponse(
      appArn: json['appArn'] as String,
      appVersion: json['appVersion'] as String,
      resolutionId: json['resolutionId'] as String,
      status: (json['status'] as String).toResourceResolutionStatusType(),
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final appVersion = this.appVersion;
    final resolutionId = this.resolutionId;
    final status = this.status;
    return {
      'appArn': appArn,
      'appVersion': appVersion,
      'resolutionId': resolutionId,
      'status': status.toValue(),
    };
  }
}

/// Defines application resource errors.
class ResourceError {
  /// This is the identifier of the resource.
  final String? logicalResourceId;

  /// This is the identifier of the physical resource.
  final String? physicalResourceId;

  /// This is the error message.
  final String? reason;

  ResourceError({
    this.logicalResourceId,
    this.physicalResourceId,
    this.reason,
  });

  factory ResourceError.fromJson(Map<String, dynamic> json) {
    return ResourceError(
      logicalResourceId: json['logicalResourceId'] as String?,
      physicalResourceId: json['physicalResourceId'] as String?,
      reason: json['reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logicalResourceId = this.logicalResourceId;
    final physicalResourceId = this.physicalResourceId;
    final reason = this.reason;
    return {
      if (logicalResourceId != null) 'logicalResourceId': logicalResourceId,
      if (physicalResourceId != null) 'physicalResourceId': physicalResourceId,
      if (reason != null) 'reason': reason,
    };
  }
}

/// A list of errors retrieving an application's resources.
class ResourceErrorsDetails {
  /// This indicates if there are more errors not listed in the resourceErrors
  /// list.
  final bool? hasMoreErrors;

  /// A list of errors retrieving an application's resources.
  final List<ResourceError>? resourceErrors;

  ResourceErrorsDetails({
    this.hasMoreErrors,
    this.resourceErrors,
  });

  factory ResourceErrorsDetails.fromJson(Map<String, dynamic> json) {
    return ResourceErrorsDetails(
      hasMoreErrors: json['hasMoreErrors'] as bool?,
      resourceErrors: (json['resourceErrors'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final hasMoreErrors = this.hasMoreErrors;
    final resourceErrors = this.resourceErrors;
    return {
      if (hasMoreErrors != null) 'hasMoreErrors': hasMoreErrors,
      if (resourceErrors != null) 'resourceErrors': resourceErrors,
    };
  }
}

enum ResourceImportStatusType {
  pending,
  inProgress,
  failed,
  success,
}

extension on ResourceImportStatusType {
  String toValue() {
    switch (this) {
      case ResourceImportStatusType.pending:
        return 'Pending';
      case ResourceImportStatusType.inProgress:
        return 'InProgress';
      case ResourceImportStatusType.failed:
        return 'Failed';
      case ResourceImportStatusType.success:
        return 'Success';
    }
  }
}

extension on String {
  ResourceImportStatusType toResourceImportStatusType() {
    switch (this) {
      case 'Pending':
        return ResourceImportStatusType.pending;
      case 'InProgress':
        return ResourceImportStatusType.inProgress;
      case 'Failed':
        return ResourceImportStatusType.failed;
      case 'Success':
        return ResourceImportStatusType.success;
    }
    throw Exception('$this is not known in enum ResourceImportStatusType');
  }
}

/// Defines a resource mapping.
class ResourceMapping {
  /// Specifies the type of resource mapping.
  /// <dl> <dt>AppRegistryApp</dt> <dd>
  /// The resource is mapped to another application. The name of the application
  /// is contained in the <code>appRegistryAppName</code> property.
  /// </dd> <dt>CfnStack</dt> <dd>
  /// The resource is mapped to a CloudFormation stack. The name of the
  /// CloudFormation stack is contained in the <code>logicalStackName</code>
  /// property.
  /// </dd> <dt>Resource</dt> <dd>
  /// The resource is mapped to another resource. The name of the resource is
  /// contained in the <code>resourceName</code> property.
  /// </dd> <dt>ResourceGroup</dt> <dd>
  /// The resource is mapped to a resource group. The name of the resource group
  /// is contained in the <code>resourceGroupName</code> property.
  /// </dd> </dl>
  final ResourceMappingType mappingType;

  /// The identifier of this resource.
  final PhysicalResourceId physicalResourceId;

  /// The name of the application this resource is mapped to.
  final String? appRegistryAppName;

  /// The name of the CloudFormation stack this resource is mapped to.
  final String? logicalStackName;

  /// The name of the resource group this resource is mapped to.
  final String? resourceGroupName;

  /// The name of the resource this resource is mapped to.
  final String? resourceName;

  /// The short name of the Terraform source.
  final String? terraformSourceName;

  ResourceMapping({
    required this.mappingType,
    required this.physicalResourceId,
    this.appRegistryAppName,
    this.logicalStackName,
    this.resourceGroupName,
    this.resourceName,
    this.terraformSourceName,
  });

  factory ResourceMapping.fromJson(Map<String, dynamic> json) {
    return ResourceMapping(
      mappingType: (json['mappingType'] as String).toResourceMappingType(),
      physicalResourceId: PhysicalResourceId.fromJson(
          json['physicalResourceId'] as Map<String, dynamic>),
      appRegistryAppName: json['appRegistryAppName'] as String?,
      logicalStackName: json['logicalStackName'] as String?,
      resourceGroupName: json['resourceGroupName'] as String?,
      resourceName: json['resourceName'] as String?,
      terraformSourceName: json['terraformSourceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mappingType = this.mappingType;
    final physicalResourceId = this.physicalResourceId;
    final appRegistryAppName = this.appRegistryAppName;
    final logicalStackName = this.logicalStackName;
    final resourceGroupName = this.resourceGroupName;
    final resourceName = this.resourceName;
    final terraformSourceName = this.terraformSourceName;
    return {
      'mappingType': mappingType.toValue(),
      'physicalResourceId': physicalResourceId,
      if (appRegistryAppName != null) 'appRegistryAppName': appRegistryAppName,
      if (logicalStackName != null) 'logicalStackName': logicalStackName,
      if (resourceGroupName != null) 'resourceGroupName': resourceGroupName,
      if (resourceName != null) 'resourceName': resourceName,
      if (terraformSourceName != null)
        'terraformSourceName': terraformSourceName,
    };
  }
}

enum ResourceMappingType {
  cfnStack,
  resource,
  appRegistryApp,
  resourceGroup,
  terraform,
}

extension on ResourceMappingType {
  String toValue() {
    switch (this) {
      case ResourceMappingType.cfnStack:
        return 'CfnStack';
      case ResourceMappingType.resource:
        return 'Resource';
      case ResourceMappingType.appRegistryApp:
        return 'AppRegistryApp';
      case ResourceMappingType.resourceGroup:
        return 'ResourceGroup';
      case ResourceMappingType.terraform:
        return 'Terraform';
    }
  }
}

extension on String {
  ResourceMappingType toResourceMappingType() {
    switch (this) {
      case 'CfnStack':
        return ResourceMappingType.cfnStack;
      case 'Resource':
        return ResourceMappingType.resource;
      case 'AppRegistryApp':
        return ResourceMappingType.appRegistryApp;
      case 'ResourceGroup':
        return ResourceMappingType.resourceGroup;
      case 'Terraform':
        return ResourceMappingType.terraform;
    }
    throw Exception('$this is not known in enum ResourceMappingType');
  }
}

enum ResourceResolutionStatusType {
  pending,
  inProgress,
  failed,
  success,
}

extension on ResourceResolutionStatusType {
  String toValue() {
    switch (this) {
      case ResourceResolutionStatusType.pending:
        return 'Pending';
      case ResourceResolutionStatusType.inProgress:
        return 'InProgress';
      case ResourceResolutionStatusType.failed:
        return 'Failed';
      case ResourceResolutionStatusType.success:
        return 'Success';
    }
  }
}

extension on String {
  ResourceResolutionStatusType toResourceResolutionStatusType() {
    switch (this) {
      case 'Pending':
        return ResourceResolutionStatusType.pending;
      case 'InProgress':
        return ResourceResolutionStatusType.inProgress;
      case 'Failed':
        return ResourceResolutionStatusType.failed;
      case 'Success':
        return ResourceResolutionStatusType.success;
    }
    throw Exception('$this is not known in enum ResourceResolutionStatusType');
  }
}

/// The location of the Amazon S3 bucket.
class S3Location {
  /// The name of the Amazon S3 bucket.
  final String? bucket;

  /// The prefix for the Amazon S3 bucket.
  final String? prefix;

  S3Location({
    this.bucket,
    this.prefix,
  });

  factory S3Location.fromJson(Map<String, dynamic> json) {
    return S3Location(
      bucket: json['bucket'] as String?,
      prefix: json['prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final prefix = this.prefix;
    return {
      if (bucket != null) 'bucket': bucket,
      if (prefix != null) 'prefix': prefix,
    };
  }
}

/// Defines a standard operating procedure (SOP) recommendation.
class SopRecommendation {
  /// Identifier for the SOP recommendation.
  final String recommendationId;

  /// The reference identifier for the SOP recommendation.
  final String referenceId;

  /// The service type.
  final SopServiceType serviceType;

  /// The application component name.
  final String? appComponentName;

  /// The description of the SOP recommendation.
  final String? description;

  /// The recommendation items.
  final List<RecommendationItem>? items;

  /// The name of the SOP recommendation.
  final String? name;

  /// The prerequisite for the SOP recommendation.
  final String? prerequisite;

  SopRecommendation({
    required this.recommendationId,
    required this.referenceId,
    required this.serviceType,
    this.appComponentName,
    this.description,
    this.items,
    this.name,
    this.prerequisite,
  });

  factory SopRecommendation.fromJson(Map<String, dynamic> json) {
    return SopRecommendation(
      recommendationId: json['recommendationId'] as String,
      referenceId: json['referenceId'] as String,
      serviceType: (json['serviceType'] as String).toSopServiceType(),
      appComponentName: json['appComponentName'] as String?,
      description: json['description'] as String?,
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => RecommendationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      prerequisite: json['prerequisite'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final recommendationId = this.recommendationId;
    final referenceId = this.referenceId;
    final serviceType = this.serviceType;
    final appComponentName = this.appComponentName;
    final description = this.description;
    final items = this.items;
    final name = this.name;
    final prerequisite = this.prerequisite;
    return {
      'recommendationId': recommendationId,
      'referenceId': referenceId,
      'serviceType': serviceType.toValue(),
      if (appComponentName != null) 'appComponentName': appComponentName,
      if (description != null) 'description': description,
      if (items != null) 'items': items,
      if (name != null) 'name': name,
      if (prerequisite != null) 'prerequisite': prerequisite,
    };
  }
}

enum SopServiceType {
  ssm,
}

extension on SopServiceType {
  String toValue() {
    switch (this) {
      case SopServiceType.ssm:
        return 'SSM';
    }
  }
}

extension on String {
  SopServiceType toSopServiceType() {
    switch (this) {
      case 'SSM':
        return SopServiceType.ssm;
    }
    throw Exception('$this is not known in enum SopServiceType');
  }
}

class StartAppAssessmentResponse {
  /// The assessment created.
  final AppAssessment assessment;

  StartAppAssessmentResponse({
    required this.assessment,
  });

  factory StartAppAssessmentResponse.fromJson(Map<String, dynamic> json) {
    return StartAppAssessmentResponse(
      assessment:
          AppAssessment.fromJson(json['assessment'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final assessment = this.assessment;
    return {
      'assessment': assessment,
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

enum TemplateFormat {
  cfnYaml,
  cfnJson,
}

extension on TemplateFormat {
  String toValue() {
    switch (this) {
      case TemplateFormat.cfnYaml:
        return 'CfnYaml';
      case TemplateFormat.cfnJson:
        return 'CfnJson';
    }
  }
}

extension on String {
  TemplateFormat toTemplateFormat() {
    switch (this) {
      case 'CfnYaml':
        return TemplateFormat.cfnYaml;
      case 'CfnJson':
        return TemplateFormat.cfnJson;
    }
    throw Exception('$this is not known in enum TemplateFormat');
  }
}

/// The Terraform s3 state file you need to import.
class TerraformSource {
  /// The Terraform s3 state file you need to import.
  final String s3StateFileUrl;

  TerraformSource({
    required this.s3StateFileUrl,
  });

  factory TerraformSource.fromJson(Map<String, dynamic> json) {
    return TerraformSource(
      s3StateFileUrl: json['s3StateFileUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final s3StateFileUrl = this.s3StateFileUrl;
    return {
      's3StateFileUrl': s3StateFileUrl,
    };
  }
}

/// Defines a test recommendation.
class TestRecommendation {
  /// The reference identifier for the test recommendation.
  final String referenceId;

  /// The name of the application component.
  final String? appComponentName;

  /// A list of recommended alarms that are used in the test and must be exported
  /// before or with the test.
  final List<String>? dependsOnAlarms;

  /// The description for the test recommendation.
  final String? description;

  /// The intent of the test recommendation.
  final String? intent;

  /// The test recommendation items.
  final List<RecommendationItem>? items;

  /// The name of the test recommendation.
  final String? name;

  /// The prerequisite of the test recommendation.
  final String? prerequisite;

  /// Identifier for the test recommendation.
  final String? recommendationId;

  /// The level of risk for this test recommendation.
  final TestRisk? risk;

  /// The type of test recommendation.
  final TestType? type;

  TestRecommendation({
    required this.referenceId,
    this.appComponentName,
    this.dependsOnAlarms,
    this.description,
    this.intent,
    this.items,
    this.name,
    this.prerequisite,
    this.recommendationId,
    this.risk,
    this.type,
  });

  factory TestRecommendation.fromJson(Map<String, dynamic> json) {
    return TestRecommendation(
      referenceId: json['referenceId'] as String,
      appComponentName: json['appComponentName'] as String?,
      dependsOnAlarms: (json['dependsOnAlarms'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      intent: json['intent'] as String?,
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => RecommendationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      prerequisite: json['prerequisite'] as String?,
      recommendationId: json['recommendationId'] as String?,
      risk: (json['risk'] as String?)?.toTestRisk(),
      type: (json['type'] as String?)?.toTestType(),
    );
  }

  Map<String, dynamic> toJson() {
    final referenceId = this.referenceId;
    final appComponentName = this.appComponentName;
    final dependsOnAlarms = this.dependsOnAlarms;
    final description = this.description;
    final intent = this.intent;
    final items = this.items;
    final name = this.name;
    final prerequisite = this.prerequisite;
    final recommendationId = this.recommendationId;
    final risk = this.risk;
    final type = this.type;
    return {
      'referenceId': referenceId,
      if (appComponentName != null) 'appComponentName': appComponentName,
      if (dependsOnAlarms != null) 'dependsOnAlarms': dependsOnAlarms,
      if (description != null) 'description': description,
      if (intent != null) 'intent': intent,
      if (items != null) 'items': items,
      if (name != null) 'name': name,
      if (prerequisite != null) 'prerequisite': prerequisite,
      if (recommendationId != null) 'recommendationId': recommendationId,
      if (risk != null) 'risk': risk.toValue(),
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum TestRisk {
  small,
  medium,
  high,
}

extension on TestRisk {
  String toValue() {
    switch (this) {
      case TestRisk.small:
        return 'Small';
      case TestRisk.medium:
        return 'Medium';
      case TestRisk.high:
        return 'High';
    }
  }
}

extension on String {
  TestRisk toTestRisk() {
    switch (this) {
      case 'Small':
        return TestRisk.small;
      case 'Medium':
        return TestRisk.medium;
      case 'High':
        return TestRisk.high;
    }
    throw Exception('$this is not known in enum TestRisk');
  }
}

enum TestType {
  software,
  hardware,
  az,
  region,
}

extension on TestType {
  String toValue() {
    switch (this) {
      case TestType.software:
        return 'Software';
      case TestType.hardware:
        return 'Hardware';
      case TestType.az:
        return 'AZ';
      case TestType.region:
        return 'Region';
    }
  }
}

extension on String {
  TestType toTestType() {
    switch (this) {
      case 'Software':
        return TestType.software;
      case 'Hardware':
        return TestType.hardware;
      case 'AZ':
        return TestType.az;
      case 'Region':
        return TestType.region;
    }
    throw Exception('$this is not known in enum TestType');
  }
}

/// Defines a resource that is not supported by Resilience Hub.
class UnsupportedResource {
  /// The logical resource identifier for the unsupported resource.
  final LogicalResourceId logicalResourceId;

  /// The physical resource identifier for the unsupported resource.
  final PhysicalResourceId physicalResourceId;

  /// The type of resource.
  final String resourceType;

  UnsupportedResource({
    required this.logicalResourceId,
    required this.physicalResourceId,
    required this.resourceType,
  });

  factory UnsupportedResource.fromJson(Map<String, dynamic> json) {
    return UnsupportedResource(
      logicalResourceId: LogicalResourceId.fromJson(
          json['logicalResourceId'] as Map<String, dynamic>),
      physicalResourceId: PhysicalResourceId.fromJson(
          json['physicalResourceId'] as Map<String, dynamic>),
      resourceType: json['resourceType'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final logicalResourceId = this.logicalResourceId;
    final physicalResourceId = this.physicalResourceId;
    final resourceType = this.resourceType;
    return {
      'logicalResourceId': logicalResourceId,
      'physicalResourceId': physicalResourceId,
      'resourceType': resourceType,
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

class UpdateAppResponse {
  /// The specified application, returned as an object with details including
  /// compliance status, creation time, description, resiliency score, and more.
  final App app;

  UpdateAppResponse({
    required this.app,
  });

  factory UpdateAppResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAppResponse(
      app: App.fromJson(json['app'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final app = this.app;
    return {
      'app': app,
    };
  }
}

class UpdateResiliencyPolicyResponse {
  /// The type of resiliency policy that was updated, including the recovery time
  /// objective (RTO) and recovery point objective (RPO) in seconds.
  final ResiliencyPolicy policy;

  UpdateResiliencyPolicyResponse({
    required this.policy,
  });

  factory UpdateResiliencyPolicyResponse.fromJson(Map<String, dynamic> json) {
    return UpdateResiliencyPolicyResponse(
      policy: ResiliencyPolicy.fromJson(json['policy'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      'policy': policy,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
