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

/// Resilience Hub helps you proactively prepare and protect your Amazon Web
/// Services applications from disruptions. It offers continual resiliency
/// assessment and validation that integrates into your software development
/// lifecycle. This enables you to uncover resiliency weaknesses, ensure
/// recovery time objective (RTO) and recovery point objective (RPO) targets for
/// your applications are met, and resolve issues before they are released into
/// production.
class ResilienceHub {
  final _s.RestJsonProtocol _protocol;
  ResilienceHub({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
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

  /// Adds the source of resource-maps to the draft version of an application.
  /// During assessment, Resilience Hub will use these resource-maps to resolve
  /// the latest physical ID for each resource in the application template. For
  /// more information about different types of resources suported by Resilience
  /// Hub and how to add them in your application, see <a
  /// href="https://docs.aws.amazon.com/resilience-hub/latest/userguide/how-app-manage.html">Step
  /// 2: How is your application managed?</a> in the Resilience Hub User Guide.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
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

  /// Enables you to include or exclude one or more operational recommendations.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [requestEntries] :
  /// Defines the list of operational recommendations that need to be included
  /// or excluded.
  Future<BatchUpdateRecommendationStatusResponse>
      batchUpdateRecommendationStatus({
    required String appArn,
    required List<UpdateRecommendationStatusRequestEntry> requestEntries,
  }) async {
    final $payload = <String, dynamic>{
      'appArn': appArn,
      'requestEntries': requestEntries,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/batch-update-recommendation-status',
      exceptionFnMap: _exceptionFns,
    );
    return BatchUpdateRecommendationStatusResponse.fromJson(response);
  }

  /// Creates an Resilience Hub application. An Resilience Hub application is a
  /// collection of Amazon Web Services resources structured to prevent and
  /// recover Amazon Web Services application disruptions. To describe a
  /// Resilience Hub application, you provide an application name, resources
  /// from one or more CloudFormation stacks, Resource Groups, Terraform state
  /// files, AppRegistry applications, and an appropriate resiliency policy. In
  /// addition, you can also add resources that are located on Amazon Elastic
  /// Kubernetes Service (Amazon EKS) clusters as optional resources. For more
  /// information about the number of resources supported per application, see
  /// <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/resiliencehub.html#limits_resiliencehub">Service
  /// quotas</a>.
  ///
  /// After you create an Resilience Hub application, you publish it so that you
  /// can run a resiliency assessment on it. You can then use recommendations
  /// from the assessment to improve resiliency by running another assessment,
  /// comparing results, and then iterating the process until you achieve your
  /// goals for recovery time objective (RTO) and recovery point objective
  /// (RPO).
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
  /// Name of the application.
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
  /// Parameter [eventSubscriptions] :
  /// The list of events you would like to subscribe and get notification for.
  /// Currently, Resilience Hub supports only <b>Drift detected</b> and
  /// <b>Scheduled assessment failure</b> events notification.
  ///
  /// Parameter [permissionModel] :
  /// Defines the roles and credentials that Resilience Hub would use while
  /// creating the application, importing its resources, and running an
  /// assessment.
  ///
  /// Parameter [policyArn] :
  /// Amazon Resource Name (ARN) of the resiliency policy. The format for this
  /// ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:resiliency-policy/<code>policy-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [tags] :
  /// Tags assigned to the resource. A tag is a label that you assign to an
  /// Amazon Web Services resource. Each tag consists of a key/value pair.
  Future<CreateAppResponse> createApp({
    required String name,
    AppAssessmentScheduleType? assessmentSchedule,
    String? clientToken,
    String? description,
    List<EventSubscription>? eventSubscriptions,
    PermissionModel? permissionModel,
    String? policyArn,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (assessmentSchedule != null)
        'assessmentSchedule': assessmentSchedule.toValue(),
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (eventSubscriptions != null) 'eventSubscriptions': eventSubscriptions,
      if (permissionModel != null) 'permissionModel': permissionModel,
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

  /// Creates a new Application Component in the Resilience Hub application.
  /// <note>
  /// This API updates the Resilience Hub application draft version. To use this
  /// Application Component for running assessments, you must publish the
  /// Resilience Hub application using the <code>PublishAppVersion</code> API.
  /// </note>
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
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [name] :
  /// Name of the Application Component.
  ///
  /// Parameter [type] :
  /// Type of Application Component. For more information about the types of
  /// Application Component, see <a
  /// href="https://docs.aws.amazon.com/resilience-hub/latest/userguide/AppComponent.grouping.html">Grouping
  /// resources in an AppComponent</a>.
  ///
  /// Parameter [additionalInfo] :
  /// Currently, there is no supported additional information for Application
  /// Components.
  ///
  /// Parameter [clientToken] :
  /// Used for an idempotency token. A client token is a unique, case-sensitive
  /// string of up to 64 ASCII characters. You should not reuse the same client
  /// token for other API requests.
  ///
  /// Parameter [id] :
  /// Identifier of the Application Component.
  Future<CreateAppVersionAppComponentResponse> createAppVersionAppComponent({
    required String appArn,
    required String name,
    required String type,
    Map<String, List<String>>? additionalInfo,
    String? clientToken,
    String? id,
  }) async {
    final $payload = <String, dynamic>{
      'appArn': appArn,
      'name': name,
      'type': type,
      if (additionalInfo != null) 'additionalInfo': additionalInfo,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (id != null) 'id': id,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/create-app-version-app-component',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAppVersionAppComponentResponse.fromJson(response);
  }

  /// Adds a resource to the Resilience Hub application and assigns it to the
  /// specified Application Components. If you specify a new Application
  /// Component, Resilience Hub will automatically create the Application
  /// Component.
  /// <note>
  /// <ul>
  /// <li>
  /// This action has no effect outside Resilience Hub.
  /// </li>
  /// <li>
  /// This API updates the Resilience Hub application draft version. To use this
  /// resource for running resiliency assessments, you must publish the
  /// Resilience Hub application using the <code>PublishAppVersion</code> API.
  /// </li>
  /// <li>
  /// To update application version with new <code>physicalResourceID</code>,
  /// you must call <code>ResolveAppVersionResources</code> API.
  /// </li>
  /// </ul> </note>
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
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [appComponents] :
  /// List of Application Components that this resource belongs to. If an
  /// Application Component is not part of the Resilience Hub application, it
  /// will be added.
  ///
  /// Parameter [logicalResourceId] :
  /// Logical identifier of the resource.
  ///
  /// Parameter [physicalResourceId] :
  /// Physical identifier of the resource.
  ///
  /// Parameter [resourceType] :
  /// Type of resource.
  ///
  /// Parameter [additionalInfo] :
  /// Currently, there is no supported additional information for resources.
  ///
  /// Parameter [awsAccountId] :
  /// Amazon Web Services account that owns the physical resource.
  ///
  /// Parameter [awsRegion] :
  /// Amazon Web Services region that owns the physical resource.
  ///
  /// Parameter [clientToken] :
  /// Used for an idempotency token. A client token is a unique, case-sensitive
  /// string of up to 64 ASCII characters. You should not reuse the same client
  /// token for other API requests.
  ///
  /// Parameter [resourceName] :
  /// Name of the resource.
  Future<CreateAppVersionResourceResponse> createAppVersionResource({
    required String appArn,
    required List<String> appComponents,
    required LogicalResourceId logicalResourceId,
    required String physicalResourceId,
    required String resourceType,
    Map<String, List<String>>? additionalInfo,
    String? awsAccountId,
    String? awsRegion,
    String? clientToken,
    String? resourceName,
  }) async {
    final $payload = <String, dynamic>{
      'appArn': appArn,
      'appComponents': appComponents,
      'logicalResourceId': logicalResourceId,
      'physicalResourceId': physicalResourceId,
      'resourceType': resourceType,
      if (additionalInfo != null) 'additionalInfo': additionalInfo,
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (awsRegion != null) 'awsRegion': awsRegion,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (resourceName != null) 'resourceName': resourceName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/create-app-version-resource',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAppVersionResourceResponse.fromJson(response);
  }

  /// Creates a new recommendation template for the Resilience Hub application.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [assessmentArn] :
  /// Amazon Resource Name (ARN) of the assessment. The format for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
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
  /// Tags assigned to the resource. A tag is a label that you assign to an
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
  /// <note>
  /// Resilience Hub allows you to provide a value of zero for
  /// <code>rtoInSecs</code> and <code>rpoInSecs</code> of your resiliency
  /// policy. But, while assessing your application, the lowest possible
  /// assessment result is near zero. Hence, if you provide value zero for
  /// <code>rtoInSecs</code> and <code>rpoInSecs</code>, the estimated workload
  /// RTO and estimated workload RPO result will be near zero and the
  /// <b>Compliance status</b> for your application will be set to <b>Policy
  /// breached</b>.
  /// </note>
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
  /// Tags assigned to the resource. A tag is a label that you assign to an
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

  /// Deletes an Resilience Hub application. This is a destructive action that
  /// can't be undone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [appArn] :
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [clientToken] :
  /// Used for an idempotency token. A client token is a unique, case-sensitive
  /// string of up to 64 ASCII characters. You should not reuse the same client
  /// token for other API requests.
  ///
  /// Parameter [forceDelete] :
  /// A boolean option to force the deletion of an Resilience Hub application.
  Future<DeleteAppResponse> deleteApp({
    required String appArn,
    String? clientToken,
    bool? forceDelete,
  }) async {
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

  /// Deletes an Resilience Hub application assessment. This is a destructive
  /// action that can't be undone.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [assessmentArn] :
  /// Amazon Resource Name (ARN) of the assessment. The format for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [clientToken] :
  /// Used for an idempotency token. A client token is a unique, case-sensitive
  /// string of up to 64 ASCII characters. You should not reuse the same client
  /// token for other API requests.
  Future<DeleteAppAssessmentResponse> deleteAppAssessment({
    required String assessmentArn,
    String? clientToken,
  }) async {
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

  /// Deletes the input source and all of its imported resources from the
  /// Resilience Hub application.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [clientToken] :
  /// Used for an idempotency token. A client token is a unique, case-sensitive
  /// string of up to 64 ASCII characters. You should not reuse the same client
  /// token for other API requests.
  ///
  /// Parameter [eksSourceClusterNamespace] :
  /// The namespace on your Amazon Elastic Kubernetes Service cluster that you
  /// want to delete from the Resilience Hub application.
  ///
  /// Parameter [sourceArn] :
  /// The Amazon Resource Name (ARN) of the imported resource you want to remove
  /// from the Resilience Hub application. For more information about ARNs, see
  /// <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [terraformSource] :
  /// The imported Terraform s3 state ﬁle you want to remove from the Resilience
  /// Hub application.
  Future<DeleteAppInputSourceResponse> deleteAppInputSource({
    required String appArn,
    String? clientToken,
    EksSourceClusterNamespace? eksSourceClusterNamespace,
    String? sourceArn,
    TerraformSource? terraformSource,
  }) async {
    final $payload = <String, dynamic>{
      'appArn': appArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (eksSourceClusterNamespace != null)
        'eksSourceClusterNamespace': eksSourceClusterNamespace,
      if (sourceArn != null) 'sourceArn': sourceArn,
      if (terraformSource != null) 'terraformSource': terraformSource,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delete-app-input-source',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAppInputSourceResponse.fromJson(response);
  }

  /// Deletes an Application Component from the Resilience Hub application.
  /// <note>
  /// <ul>
  /// <li>
  /// This API updates the Resilience Hub application draft version. To use this
  /// Application Component for running assessments, you must publish the
  /// Resilience Hub application using the <code>PublishAppVersion</code> API.
  /// </li>
  /// <li>
  /// You will not be able to delete an Application Component if it has
  /// resources associated with it.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [id] :
  /// Identifier of the Application Component.
  ///
  /// Parameter [clientToken] :
  /// Used for an idempotency token. A client token is a unique, case-sensitive
  /// string of up to 64 ASCII characters. You should not reuse the same client
  /// token for other API requests.
  Future<DeleteAppVersionAppComponentResponse> deleteAppVersionAppComponent({
    required String appArn,
    required String id,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'appArn': appArn,
      'id': id,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delete-app-version-app-component',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAppVersionAppComponentResponse.fromJson(response);
  }

  /// Deletes a resource from the Resilience Hub application.
  /// <note>
  /// <ul>
  /// <li>
  /// You can only delete a manually added resource. To exclude non-manually
  /// added resources, use the <code>UpdateAppVersionResource</code> API.
  /// </li>
  /// <li>
  /// This action has no effect outside Resilience Hub.
  /// </li>
  /// <li>
  /// This API updates the Resilience Hub application draft version. To use this
  /// resource for running resiliency assessments, you must publish the
  /// Resilience Hub application using the <code>PublishAppVersion</code> API.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [awsAccountId] :
  /// Amazon Web Services account that owns the physical resource.
  ///
  /// Parameter [awsRegion] :
  /// Amazon Web Services region that owns the physical resource.
  ///
  /// Parameter [clientToken] :
  /// Used for an idempotency token. A client token is a unique, case-sensitive
  /// string of up to 64 ASCII characters. You should not reuse the same client
  /// token for other API requests.
  ///
  /// Parameter [logicalResourceId] :
  /// Logical identifier of the resource.
  ///
  /// Parameter [physicalResourceId] :
  /// Physical identifier of the resource.
  ///
  /// Parameter [resourceName] :
  /// Name of the resource.
  Future<DeleteAppVersionResourceResponse> deleteAppVersionResource({
    required String appArn,
    String? awsAccountId,
    String? awsRegion,
    String? clientToken,
    LogicalResourceId? logicalResourceId,
    String? physicalResourceId,
    String? resourceName,
  }) async {
    final $payload = <String, dynamic>{
      'appArn': appArn,
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (awsRegion != null) 'awsRegion': awsRegion,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (logicalResourceId != null) 'logicalResourceId': logicalResourceId,
      if (physicalResourceId != null) 'physicalResourceId': physicalResourceId,
      if (resourceName != null) 'resourceName': resourceName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delete-app-version-resource',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAppVersionResourceResponse.fromJson(response);
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
  /// Amazon Resource Name (ARN) of the resiliency policy. The format for this
  /// ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:resiliency-policy/<code>policy-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [clientToken] :
  /// Used for an idempotency token. A client token is a unique, case-sensitive
  /// string of up to 64 ASCII characters. You should not reuse the same client
  /// token for other API requests.
  Future<DeleteResiliencyPolicyResponse> deleteResiliencyPolicy({
    required String policyArn,
    String? clientToken,
  }) async {
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

  /// Describes an Resilience Hub application.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  Future<DescribeAppResponse> describeApp({
    required String appArn,
  }) async {
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

  /// Describes an assessment for an Resilience Hub application.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [assessmentArn] :
  /// Amazon Resource Name (ARN) of the assessment. The format for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  Future<DescribeAppAssessmentResponse> describeAppAssessment({
    required String assessmentArn,
  }) async {
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

  /// Describes the Resilience Hub application version.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [appVersion] :
  /// Resilience Hub application version.
  Future<DescribeAppVersionResponse> describeAppVersion({
    required String appArn,
    required String appVersion,
  }) async {
    final $payload = <String, dynamic>{
      'appArn': appArn,
      'appVersion': appVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describe-app-version',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAppVersionResponse.fromJson(response);
  }

  /// Describes an Application Component in the Resilience Hub application.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [appVersion] :
  /// Resilience Hub application version.
  ///
  /// Parameter [id] :
  /// Identifier of the Application Component.
  Future<DescribeAppVersionAppComponentResponse>
      describeAppVersionAppComponent({
    required String appArn,
    required String appVersion,
    required String id,
  }) async {
    final $payload = <String, dynamic>{
      'appArn': appArn,
      'appVersion': appVersion,
      'id': id,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describe-app-version-app-component',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAppVersionAppComponentResponse.fromJson(response);
  }

  /// Describes a resource of the Resilience Hub application.
  /// <note>
  /// This API accepts only one of the following parameters to descibe the
  /// resource:
  ///
  /// <ul>
  /// <li>
  /// <code>resourceName</code>
  /// </li>
  /// <li>
  /// <code>logicalResourceId</code>
  /// </li>
  /// <li>
  /// <code>physicalResourceId</code> (Along with
  /// <code>physicalResourceId</code>, you can also provide
  /// <code>awsAccountId</code>, and <code>awsRegion</code>)
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [appVersion] :
  /// Resilience Hub application version.
  ///
  /// Parameter [awsAccountId] :
  /// Amazon Web Services account that owns the physical resource.
  ///
  /// Parameter [awsRegion] :
  /// Amazon Web Services region that owns the physical resource.
  ///
  /// Parameter [logicalResourceId] :
  /// Logical identifier of the resource.
  ///
  /// Parameter [physicalResourceId] :
  /// Physical identifier of the resource.
  ///
  /// Parameter [resourceName] :
  /// Name of the resource.
  Future<DescribeAppVersionResourceResponse> describeAppVersionResource({
    required String appArn,
    required String appVersion,
    String? awsAccountId,
    String? awsRegion,
    LogicalResourceId? logicalResourceId,
    String? physicalResourceId,
    String? resourceName,
  }) async {
    final $payload = <String, dynamic>{
      'appArn': appArn,
      'appVersion': appVersion,
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (awsRegion != null) 'awsRegion': awsRegion,
      if (logicalResourceId != null) 'logicalResourceId': logicalResourceId,
      if (physicalResourceId != null) 'physicalResourceId': physicalResourceId,
      if (resourceName != null) 'resourceName': resourceName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describe-app-version-resource',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAppVersionResourceResponse.fromJson(response);
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
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
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

  /// Describes details about an Resilience Hub application.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [appVersion] :
  /// The version of the application.
  Future<DescribeAppVersionTemplateResponse> describeAppVersionTemplate({
    required String appArn,
    required String appVersion,
  }) async {
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
  /// <note>
  /// If you get a 404 error with
  /// <code>ResourceImportStatusNotFoundAppMetadataException</code>, you must
  /// call <code>importResourcesToDraftAppVersion</code> after creating the
  /// application and before calling
  /// <code>describeDraftAppVersionResourcesImportStatus</code> to obtain the
  /// status.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  Future<DescribeDraftAppVersionResourcesImportStatusResponse>
      describeDraftAppVersionResourcesImportStatus({
    required String appArn,
  }) async {
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

  /// Describes a specified resiliency policy for an Resilience Hub application.
  /// The returned policy object includes creation time, data location
  /// constraints, the Amazon Resource Name (ARN) for the policy, tags, tier,
  /// and more.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [policyArn] :
  /// Amazon Resource Name (ARN) of the resiliency policy. The format for this
  /// ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:resiliency-policy/<code>policy-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  Future<DescribeResiliencyPolicyResponse> describeResiliencyPolicy({
    required String policyArn,
  }) async {
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

  /// Imports resources to Resilience Hub application draft version from
  /// different input sources. For more information about the input sources
  /// supported by Resilience Hub, see <a
  /// href="https://docs.aws.amazon.com/resilience-hub/latest/userguide/discover-structure.html">Discover
  /// the structure and describe your Resilience Hub application</a>.
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
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [eksSources] :
  /// The input sources of the Amazon Elastic Kubernetes Service resources you
  /// need to import.
  ///
  /// Parameter [importStrategy] :
  /// The import strategy you would like to set to import resources into
  /// Resilience Hub application.
  ///
  /// Parameter [sourceArns] :
  /// The Amazon Resource Names (ARNs) for the resources.
  ///
  /// Parameter [terraformSources] :
  /// A list of terraform file s3 URLs you need to import.
  Future<ImportResourcesToDraftAppVersionResponse>
      importResourcesToDraftAppVersion({
    required String appArn,
    List<EksSource>? eksSources,
    ResourceImportStrategyType? importStrategy,
    List<String>? sourceArns,
    List<TerraformSource>? terraformSources,
  }) async {
    final $payload = <String, dynamic>{
      'appArn': appArn,
      if (eksSources != null) 'eksSources': eksSources,
      if (importStrategy != null) 'importStrategy': importStrategy.toValue(),
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

  /// Lists the alarm recommendations for an Resilience Hub application.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [assessmentArn] :
  /// Amazon Resource Name (ARN) of the assessment. The format for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to include in the response. If more results
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

  /// List of compliance drifts that were detected while running an assessment.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [assessmentArn] :
  /// Amazon Resource Name (ARN) of the assessment. The format for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [maxResults] :
  /// Indicates the maximum number of applications requested.
  ///
  /// Parameter [nextToken] :
  /// Indicates the unique token number of the next application to be checked
  /// for compliance and regulatory requirements from the list of applications.
  Future<ListAppAssessmentComplianceDriftsResponse>
      listAppAssessmentComplianceDrifts({
    required String assessmentArn,
    int? maxResults,
    String? nextToken,
  }) async {
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
      requestUri: '/list-app-assessment-compliance-drifts',
      exceptionFnMap: _exceptionFns,
    );
    return ListAppAssessmentComplianceDriftsResponse.fromJson(response);
  }

  /// Indicates the list of resource drifts that were detected while running an
  /// assessment.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [assessmentArn] :
  /// Amazon Resource Name (ARN) of the assessment. The format for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [maxResults] :
  /// Indicates the maximum number of drift results to include in the response.
  /// If more results exist than the specified <code>MaxResults</code> value, a
  /// token is included in the response so that the remaining results can be
  /// retrieved.
  ///
  /// Parameter [nextToken] :
  /// Null, or the token from a previous call to get the next set of results.
  Future<ListAppAssessmentResourceDriftsResponse>
      listAppAssessmentResourceDrifts({
    required String assessmentArn,
    int? maxResults,
    String? nextToken,
  }) async {
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
      requestUri: '/list-app-assessment-resource-drifts',
      exceptionFnMap: _exceptionFns,
    );
    return ListAppAssessmentResourceDriftsResponse.fromJson(response);
  }

  /// Lists the assessments for an Resilience Hub application. You can use
  /// request parameters to refine the results for the response object.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
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
  /// Maximum number of results to include in the response. If more results
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

  /// Lists the compliances for an Resilience Hub Application Component.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [assessmentArn] :
  /// Amazon Resource Name (ARN) of the assessment. The format for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to include in the response. If more results
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

  /// Lists the recommendations for an Resilience Hub Application Component.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [assessmentArn] :
  /// Amazon Resource Name (ARN) of the assessment. The format for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to include in the response. If more results
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

  /// Lists all the input sources of the Resilience Hub application. For more
  /// information about the input sources supported by Resilience Hub, see <a
  /// href="https://docs.aws.amazon.com/resilience-hub/latest/userguide/discover-structure.html">Discover
  /// the structure and describe your Resilience Hub application</a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [appVersion] :
  /// Resilience Hub application version.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of input sources to be displayed per Resilience Hub
  /// application.
  ///
  /// Parameter [nextToken] :
  /// Null, or the token from a previous call to get the next set of results.
  Future<ListAppInputSourcesResponse> listAppInputSources({
    required String appArn,
    required String appVersion,
    int? maxResults,
    String? nextToken,
  }) async {
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
      requestUri: '/list-app-input-sources',
      exceptionFnMap: _exceptionFns,
    );
    return ListAppInputSourcesResponse.fromJson(response);
  }

  /// Lists all the Application Components in the Resilience Hub application.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [appVersion] :
  /// Version of the Application Component.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of Application Components to be displayed per Resilience
  /// Hub application version.
  ///
  /// Parameter [nextToken] :
  /// Null, or the token from a previous call to get the next set of results.
  Future<ListAppVersionAppComponentsResponse> listAppVersionAppComponents({
    required String appArn,
    required String appVersion,
    int? maxResults,
    String? nextToken,
  }) async {
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
      requestUri: '/list-app-version-app-components',
      exceptionFnMap: _exceptionFns,
    );
    return ListAppVersionAppComponentsResponse.fromJson(response);
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
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [appVersion] :
  /// The version of the application.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to include in the response. If more results
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

  /// Lists all the resources in an Resilience Hub application.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [appVersion] :
  /// The version of the application.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to include in the response. If more results
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
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [endTime] :
  /// Upper limit of the time range to filter the application versions.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [nextToken] :
  /// Null, or the token from a previous call to get the next set of results.
  ///
  /// Parameter [startTime] :
  /// Lower limit of the time range to filter the application versions.
  Future<ListAppVersionsResponse> listAppVersions({
    required String appArn,
    DateTime? endTime,
    int? maxResults,
    String? nextToken,
    DateTime? startTime,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'appArn': appArn,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
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
  /// <note>
  /// You can filter applications using only one filter at a time or without
  /// using any filter. If you try to filter applications using multiple
  /// filters, you will get the following error:
  ///
  /// <code>An error occurred (ValidationException) when calling the ListApps
  /// operation: Only one filter is supported for this operation.</code>
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [fromLastAssessmentTime] :
  /// Indicates the lower limit of the range that is used to filter applications
  /// based on their last assessment times.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to include in the response. If more results
  /// exist than the specified <code>MaxResults</code> value, a token is
  /// included in the response so that the remaining results can be retrieved.
  ///
  /// Parameter [name] :
  /// The name for the one of the listed applications.
  ///
  /// Parameter [nextToken] :
  /// Null, or the token from a previous call to get the next set of results.
  ///
  /// Parameter [reverseOrder] :
  /// The application list is sorted based on the values of
  /// <code>lastAppComplianceEvaluationTime</code> field. By default,
  /// application list is sorted in ascending order. To sort the appliation list
  /// in descending order, set this field to <code>True</code>.
  ///
  /// Parameter [toLastAssessmentTime] :
  /// Indicates the upper limit of the range that is used to filter the
  /// applications based on their last assessment times.
  Future<ListAppsResponse> listApps({
    String? appArn,
    DateTime? fromLastAssessmentTime,
    int? maxResults,
    String? name,
    String? nextToken,
    bool? reverseOrder,
    DateTime? toLastAssessmentTime,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (appArn != null) 'appArn': [appArn],
      if (fromLastAssessmentTime != null)
        'fromLastAssessmentTime': [
          _s.iso8601ToJson(fromLastAssessmentTime).toString()
        ],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (name != null) 'name': [name],
      if (nextToken != null) 'nextToken': [nextToken],
      if (reverseOrder != null) 'reverseOrder': [reverseOrder.toString()],
      if (toLastAssessmentTime != null)
        'toLastAssessmentTime': [
          _s.iso8601ToJson(toLastAssessmentTime).toString()
        ],
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
  /// Amazon Resource Name (ARN) of the assessment. The format for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to include in the response. If more results
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
  /// Status of the action.
  Future<ListRecommendationTemplatesResponse> listRecommendationTemplates({
    String? assessmentArn,
    int? maxResults,
    String? name,
    String? nextToken,
    String? recommendationTemplateArn,
    bool? reverseOrder,
    List<RecommendationTemplateStatus>? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (assessmentArn != null) 'assessmentArn': [assessmentArn],
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
  /// Maximum number of results to include in the response. If more results
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
  /// Amazon Resource Name (ARN) of the assessment. The format for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to include in the response. If more results
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
  /// Maximum number of results to include in the response. If more results
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
  /// Amazon Resource Name (ARN) of the assessment. The format for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to include in the response. If more results
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

  /// Lists the resources that are not currently supported in Resilience Hub. An
  /// unsupported resource is a resource that exists in the object that was used
  /// to create an app, but is not supported by Resilience Hub.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [appVersion] :
  /// The version of the application.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to include in the response. If more results
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
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [versionName] :
  /// Name of the application version.
  Future<PublishAppVersionResponse> publishAppVersion({
    required String appArn,
    String? versionName,
  }) async {
    final $payload = <String, dynamic>{
      'appArn': appArn,
      if (versionName != null) 'versionName': versionName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/publish-app-version',
      exceptionFnMap: _exceptionFns,
    );
    return PublishAppVersionResponse.fromJson(response);
  }

  /// Adds or updates the app template for an Resilience Hub application draft
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
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [appTemplateBody] :
  /// A JSON string that provides information about your application structure.
  /// To learn more about the <code>appTemplateBody</code> template, see the
  /// sample template provided in the <i>Examples</i> section.
  ///
  /// The <code>appTemplateBody</code> JSON string has the following structure:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>resources</code> </b>
  ///
  /// The list of logical resources that must be included in the Resilience Hub
  /// application.
  ///
  /// Type: Array
  /// <note>
  /// Don't add the resources that you want to exclude.
  /// </note>
  /// Each <code>resources</code> array item includes the following fields:
  ///
  /// <ul>
  /// <li>
  /// <i> <code>logicalResourceId</code> </i>
  ///
  /// Logical identifier of the resource.
  ///
  /// Type: Object
  ///
  /// Each <code>logicalResourceId</code> object includes the following fields:
  ///
  /// <ul>
  /// <li>
  /// <code>identifier</code>
  ///
  /// Identifier of the resource.
  ///
  /// Type: String
  /// </li>
  /// <li>
  /// <code>logicalStackName</code>
  ///
  /// The name of the CloudFormation stack this resource belongs to.
  ///
  /// Type: String
  /// </li>
  /// <li>
  /// <code>resourceGroupName</code>
  ///
  /// The name of the resource group this resource belongs to.
  ///
  /// Type: String
  /// </li>
  /// <li>
  /// <code>terraformSourceName</code>
  ///
  /// The name of the Terraform S3 state file this resource belongs to.
  ///
  /// Type: String
  /// </li>
  /// <li>
  /// <code>eksSourceName</code>
  ///
  /// Name of the Amazon Elastic Kubernetes Service cluster and namespace this
  /// resource belongs to.
  /// <note>
  /// This parameter accepts values in "eks-cluster/namespace" format.
  /// </note>
  /// Type: String
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <i> <code>type</code> </i>
  ///
  /// The type of resource.
  ///
  /// Type: string
  /// </li>
  /// <li>
  /// <i> <code>name</code> </i>
  ///
  /// The name of the resource.
  ///
  /// Type: String
  /// </li>
  /// <li>
  /// <code>additionalInfo</code>
  ///
  /// Additional configuration parameters for an Resilience Hub application. If
  /// you want to implement <code>additionalInfo</code> through the Resilience
  /// Hub console rather than using an API call, see <a
  /// href="https://docs.aws.amazon.com/resilience-hub/latest/userguide/app-config-param.html">Configure
  /// the application configuration parameters</a>.
  /// <note>
  /// Currently, this parameter accepts a key-value mapping (in a string format)
  /// of only one failover region and one associated account.
  ///
  /// Key: <code>"failover-regions"</code>
  ///
  /// Value: <code>"[{"region":"&lt;REGION&gt;",
  /// "accounts":[{"id":"&lt;ACCOUNT_ID&gt;"}]}]"</code>
  /// </note> </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>appComponents</code> </b>
  ///
  /// List of Application Components that this resource belongs to. If an
  /// Application Component is not part of the Resilience Hub application, it
  /// will be added.
  ///
  /// Type: Array
  ///
  /// Each <code>appComponents</code> array item includes the following fields:
  ///
  /// <ul>
  /// <li>
  /// <code>name</code>
  ///
  /// Name of the Application Component.
  ///
  /// Type: String
  /// </li>
  /// <li>
  /// <code>type</code>
  ///
  /// Type of Application Component. For more information about the types of
  /// Application Component, see <a
  /// href="https://docs.aws.amazon.com/resilience-hub/latest/userguide/AppComponent.grouping.html">Grouping
  /// resources in an AppComponent</a>.
  ///
  /// Type: String
  /// </li>
  /// <li>
  /// <code>resourceNames</code>
  ///
  /// The list of included resources that are assigned to the Application
  /// Component.
  ///
  /// Type: Array of strings
  /// </li>
  /// <li>
  /// <code>additionalInfo</code>
  ///
  /// Additional configuration parameters for an Resilience Hub application. If
  /// you want to implement <code>additionalInfo</code> through the Resilience
  /// Hub console rather than using an API call, see <a
  /// href="https://docs.aws.amazon.com/resilience-hub/latest/userguide/app-config-param.html">Configure
  /// the application configuration parameters</a>.
  /// <note>
  /// Currently, this parameter accepts a key-value mapping (in a string format)
  /// of only one failover region and one associated account.
  ///
  /// Key: <code>"failover-regions"</code>
  ///
  /// Value: <code>"[{"region":"&lt;REGION&gt;",
  /// "accounts":[{"id":"&lt;ACCOUNT_ID&gt;"}]}]"</code>
  /// </note> </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>excludedResources</code> </b>
  ///
  /// The list of logical resource identifiers to be excluded from the
  /// application.
  ///
  /// Type: Array
  /// <note>
  /// Don't add the resources that you want to include.
  /// </note>
  /// Each <code>excludedResources</code> array item includes the following
  /// fields:
  ///
  /// <ul>
  /// <li>
  /// <i> <code>logicalResourceIds</code> </i>
  ///
  /// Logical identifier of the resource.
  ///
  /// Type: Object
  /// <note>
  /// You can configure only one of the following fields:
  ///
  /// <ul>
  /// <li>
  /// <code>logicalStackName</code>
  /// </li>
  /// <li>
  /// <code>resourceGroupName</code>
  /// </li>
  /// <li>
  /// <code>terraformSourceName</code>
  /// </li>
  /// <li>
  /// <code>eksSourceName</code>
  /// </li>
  /// </ul> </note>
  /// Each <code>logicalResourceIds</code> object includes the following fields:
  ///
  /// <ul>
  /// <li>
  /// <code>identifier</code>
  ///
  /// Identifier of the resource.
  ///
  /// Type: String
  /// </li>
  /// <li>
  /// <code>logicalStackName</code>
  ///
  /// The name of the CloudFormation stack this resource belongs to.
  ///
  /// Type: String
  /// </li>
  /// <li>
  /// <code>resourceGroupName</code>
  ///
  /// The name of the resource group this resource belongs to.
  ///
  /// Type: String
  /// </li>
  /// <li>
  /// <code>terraformSourceName</code>
  ///
  /// The name of the Terraform S3 state file this resource belongs to.
  ///
  /// Type: String
  /// </li>
  /// <li>
  /// <code>eksSourceName</code>
  ///
  /// Name of the Amazon Elastic Kubernetes Service cluster and namespace this
  /// resource belongs to.
  /// <note>
  /// This parameter accepts values in "eks-cluster/namespace" format.
  /// </note>
  /// Type: String
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>version</code> </b>
  ///
  /// Resilience Hub application version.
  /// </li>
  /// <li>
  /// <code>additionalInfo</code>
  ///
  /// Additional configuration parameters for an Resilience Hub application. If
  /// you want to implement <code>additionalInfo</code> through the Resilience
  /// Hub console rather than using an API call, see <a
  /// href="https://docs.aws.amazon.com/resilience-hub/latest/userguide/app-config-param.html">Configure
  /// the application configuration parameters</a>.
  /// <note>
  /// Currently, this parameter accepts a key-value mapping (in a string format)
  /// of only one failover region and one associated account.
  ///
  /// Key: <code>"failover-regions"</code>
  ///
  /// Value: <code>"[{"region":"&lt;REGION&gt;",
  /// "accounts":[{"id":"&lt;ACCOUNT_ID&gt;"}]}]"</code>
  /// </note> </li>
  /// </ul>
  Future<PutDraftAppVersionTemplateResponse> putDraftAppVersionTemplate({
    required String appArn,
    required String appTemplateBody,
  }) async {
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
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [appRegistryAppNames] :
  /// The names of the registered applications you want to remove from the
  /// resource mappings.
  ///
  /// Parameter [eksSourceNames] :
  /// The names of the Amazon Elastic Kubernetes Service clusters and namespaces
  /// you want to remove from the resource mappings.
  /// <note>
  /// This parameter accepts values in "eks-cluster/namespace" format.
  /// </note>
  ///
  /// Parameter [logicalStackNames] :
  /// The names of the CloudFormation stacks you want to remove from the
  /// resource mappings.
  ///
  /// Parameter [resourceGroupNames] :
  /// The names of the resource groups you want to remove from the resource
  /// mappings.
  ///
  /// Parameter [resourceNames] :
  /// The names of the resources you want to remove from the resource mappings.
  ///
  /// Parameter [terraformSourceNames] :
  /// The names of the Terraform sources you want to remove from the resource
  /// mappings.
  Future<RemoveDraftAppVersionResourceMappingsResponse>
      removeDraftAppVersionResourceMappings({
    required String appArn,
    List<String>? appRegistryAppNames,
    List<String>? eksSourceNames,
    List<String>? logicalStackNames,
    List<String>? resourceGroupNames,
    List<String>? resourceNames,
    List<String>? terraformSourceNames,
  }) async {
    final $payload = <String, dynamic>{
      'appArn': appArn,
      if (appRegistryAppNames != null)
        'appRegistryAppNames': appRegistryAppNames,
      if (eksSourceNames != null) 'eksSourceNames': eksSourceNames,
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
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [appVersion] :
  /// The version of the application.
  Future<ResolveAppVersionResourcesResponse> resolveAppVersionResources({
    required String appArn,
    required String appVersion,
  }) async {
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
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
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
  /// Tags assigned to the resource. A tag is a label that you assign to an
  /// Amazon Web Services resource. Each tag consists of a key/value pair.
  Future<StartAppAssessmentResponse> startAppAssessment({
    required String appArn,
    required String appVersion,
    required String assessmentName,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
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
  /// Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the resource. Each tag consists of a key/value pair.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
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
  /// Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags you want to remove.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
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
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
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
  /// Parameter [eventSubscriptions] :
  /// The list of events you would like to subscribe and get notification for.
  /// Currently, Resilience Hub supports notifications only for <b>Drift
  /// detected</b> and <b>Scheduled assessment failure</b> events.
  ///
  /// Parameter [permissionModel] :
  /// Defines the roles and credentials that Resilience Hub would use while
  /// creating an application, importing its resources, and running an
  /// assessment.
  ///
  /// Parameter [policyArn] :
  /// Amazon Resource Name (ARN) of the resiliency policy. The format for this
  /// ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:resiliency-policy/<code>policy-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  Future<UpdateAppResponse> updateApp({
    required String appArn,
    AppAssessmentScheduleType? assessmentSchedule,
    bool? clearResiliencyPolicyArn,
    String? description,
    List<EventSubscription>? eventSubscriptions,
    PermissionModel? permissionModel,
    String? policyArn,
  }) async {
    final $payload = <String, dynamic>{
      'appArn': appArn,
      if (assessmentSchedule != null)
        'assessmentSchedule': assessmentSchedule.toValue(),
      if (clearResiliencyPolicyArn != null)
        'clearResiliencyPolicyArn': clearResiliencyPolicyArn,
      if (description != null) 'description': description,
      if (eventSubscriptions != null) 'eventSubscriptions': eventSubscriptions,
      if (permissionModel != null) 'permissionModel': permissionModel,
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

  /// Updates the Resilience Hub application version.
  /// <note>
  /// This API updates the Resilience Hub application draft version. To use this
  /// information for running resiliency assessments, you must publish the
  /// Resilience Hub application using the <code>PublishAppVersion</code> API.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [additionalInfo] :
  /// Additional configuration parameters for an Resilience Hub application. If
  /// you want to implement <code>additionalInfo</code> through the Resilience
  /// Hub console rather than using an API call, see <a
  /// href="https://docs.aws.amazon.com/resilience-hub/latest/userguide/app-config-param.html">Configure
  /// the application configuration parameters</a>.
  /// <note>
  /// Currently, this parameter accepts a key-value mapping (in a string format)
  /// of only one failover region and one associated account.
  ///
  /// Key: <code>"failover-regions"</code>
  ///
  /// Value: <code>"[{"region":"&lt;REGION&gt;",
  /// "accounts":[{"id":"&lt;ACCOUNT_ID&gt;"}]}]"</code>
  /// </note>
  Future<UpdateAppVersionResponse> updateAppVersion({
    required String appArn,
    Map<String, List<String>>? additionalInfo,
  }) async {
    final $payload = <String, dynamic>{
      'appArn': appArn,
      if (additionalInfo != null) 'additionalInfo': additionalInfo,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/update-app-version',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAppVersionResponse.fromJson(response);
  }

  /// Updates an existing Application Component in the Resilience Hub
  /// application.
  /// <note>
  /// This API updates the Resilience Hub application draft version. To use this
  /// Application Component for running assessments, you must publish the
  /// Resilience Hub application using the <code>PublishAppVersion</code> API.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appArn] :
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [id] :
  /// Identifier of the Application Component.
  ///
  /// Parameter [additionalInfo] :
  /// Currently, there is no supported additional information for Application
  /// Components.
  ///
  /// Parameter [name] :
  /// Name of the Application Component.
  ///
  /// Parameter [type] :
  /// Type of Application Component. For more information about the types of
  /// Application Component, see <a
  /// href="https://docs.aws.amazon.com/resilience-hub/latest/userguide/AppComponent.grouping.html">Grouping
  /// resources in an AppComponent</a>.
  Future<UpdateAppVersionAppComponentResponse> updateAppVersionAppComponent({
    required String appArn,
    required String id,
    Map<String, List<String>>? additionalInfo,
    String? name,
    String? type,
  }) async {
    final $payload = <String, dynamic>{
      'appArn': appArn,
      'id': id,
      if (additionalInfo != null) 'additionalInfo': additionalInfo,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/update-app-version-app-component',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAppVersionAppComponentResponse.fromJson(response);
  }

  /// Updates the resource details in the Resilience Hub application.
  /// <note>
  /// <ul>
  /// <li>
  /// This action has no effect outside Resilience Hub.
  /// </li>
  /// <li>
  /// This API updates the Resilience Hub application draft version. To use this
  /// resource for running resiliency assessments, you must publish the
  /// Resilience Hub application using the <code>PublishAppVersion</code> API.
  /// </li>
  /// <li>
  /// To update application version with new <code>physicalResourceID</code>,
  /// you must call <code>ResolveAppVersionResources</code> API.
  /// </li>
  /// </ul> </note>
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
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format
  /// for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  ///
  /// Parameter [additionalInfo] :
  /// Currently, there is no supported additional information for resources.
  ///
  /// Parameter [appComponents] :
  /// List of Application Components that this resource belongs to. If an
  /// Application Component is not part of the Resilience Hub application, it
  /// will be added.
  ///
  /// Parameter [awsAccountId] :
  /// Amazon Web Services account that owns the physical resource.
  ///
  /// Parameter [awsRegion] :
  /// Amazon Web Services region that owns the physical resource.
  ///
  /// Parameter [excluded] :
  /// Indicates if a resource is excluded from an Resilience Hub application.
  /// <note>
  /// You can exclude only imported resources from an Resilience Hub
  /// application.
  /// </note>
  ///
  /// Parameter [logicalResourceId] :
  /// Logical identifier of the resource.
  ///
  /// Parameter [physicalResourceId] :
  /// Physical identifier of the resource.
  ///
  /// Parameter [resourceName] :
  /// Name of the resource.
  ///
  /// Parameter [resourceType] :
  /// Type of resource.
  Future<UpdateAppVersionResourceResponse> updateAppVersionResource({
    required String appArn,
    Map<String, List<String>>? additionalInfo,
    List<String>? appComponents,
    String? awsAccountId,
    String? awsRegion,
    bool? excluded,
    LogicalResourceId? logicalResourceId,
    String? physicalResourceId,
    String? resourceName,
    String? resourceType,
  }) async {
    final $payload = <String, dynamic>{
      'appArn': appArn,
      if (additionalInfo != null) 'additionalInfo': additionalInfo,
      if (appComponents != null) 'appComponents': appComponents,
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (awsRegion != null) 'awsRegion': awsRegion,
      if (excluded != null) 'excluded': excluded,
      if (logicalResourceId != null) 'logicalResourceId': logicalResourceId,
      if (physicalResourceId != null) 'physicalResourceId': physicalResourceId,
      if (resourceName != null) 'resourceName': resourceName,
      if (resourceType != null) 'resourceType': resourceType,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/update-app-version-resource',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAppVersionResourceResponse.fromJson(response);
  }

  /// Updates a resiliency policy.
  /// <note>
  /// Resilience Hub allows you to provide a value of zero for
  /// <code>rtoInSecs</code> and <code>rpoInSecs</code> of your resiliency
  /// policy. But, while assessing your application, the lowest possible
  /// assessment result is near zero. Hence, if you provide value zero for
  /// <code>rtoInSecs</code> and <code>rpoInSecs</code>, the estimated workload
  /// RTO and estimated workload RPO result will be near zero and the
  /// <b>Compliance status</b> for your application will be set to <b>Policy
  /// breached</b>.
  /// </note>
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [policyArn] :
  /// Amazon Resource Name (ARN) of the resiliency policy. The format for this
  /// ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:resiliency-policy/<code>policy-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
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
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String appArn;

  /// The version of the application.
  final String appVersion;

  /// List of sources that are used to map a logical resource from the template to
  /// a physical resource. You can use sources such as CloudFormation, Terraform
  /// state files, AppRegistry applications, or Amazon EKS.
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
  /// Name of the alarm recommendation.
  final String name;

  /// Identifier of the alarm recommendation.
  final String recommendationId;

  /// Reference identifier of the alarm recommendation.
  final String referenceId;

  /// Type of alarm recommendation.
  final AlarmType type;

  /// Application Component name for the CloudWatch alarm recommendation. This
  /// name is saved as the first item in the <code>appComponentNames</code> list.
  final String? appComponentName;

  /// List of Application Component names for the CloudWatch alarm recommendation.
  final List<String>? appComponentNames;

  /// Description of the alarm recommendation.
  final String? description;

  /// List of CloudWatch alarm recommendations.
  final List<RecommendationItem>? items;

  /// The prerequisite for the alarm recommendation.
  final String? prerequisite;

  /// Status of the recommended Amazon CloudWatch alarm.
  final RecommendationStatus? recommendationStatus;

  AlarmRecommendation({
    required this.name,
    required this.recommendationId,
    required this.referenceId,
    required this.type,
    this.appComponentName,
    this.appComponentNames,
    this.description,
    this.items,
    this.prerequisite,
    this.recommendationStatus,
  });

  factory AlarmRecommendation.fromJson(Map<String, dynamic> json) {
    return AlarmRecommendation(
      name: json['name'] as String,
      recommendationId: json['recommendationId'] as String,
      referenceId: json['referenceId'] as String,
      type: (json['type'] as String).toAlarmType(),
      appComponentName: json['appComponentName'] as String?,
      appComponentNames: (json['appComponentNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => RecommendationItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      prerequisite: json['prerequisite'] as String?,
      recommendationStatus:
          (json['recommendationStatus'] as String?)?.toRecommendationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final recommendationId = this.recommendationId;
    final referenceId = this.referenceId;
    final type = this.type;
    final appComponentName = this.appComponentName;
    final appComponentNames = this.appComponentNames;
    final description = this.description;
    final items = this.items;
    final prerequisite = this.prerequisite;
    final recommendationStatus = this.recommendationStatus;
    return {
      'name': name,
      'recommendationId': recommendationId,
      'referenceId': referenceId,
      'type': type.toValue(),
      if (appComponentName != null) 'appComponentName': appComponentName,
      if (appComponentNames != null) 'appComponentNames': appComponentNames,
      if (description != null) 'description': description,
      if (items != null) 'items': items,
      if (prerequisite != null) 'prerequisite': prerequisite,
      if (recommendationStatus != null)
        'recommendationStatus': recommendationStatus.toValue(),
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

extension AlarmTypeValueExtension on AlarmType {
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

extension AlarmTypeFromString on String {
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

/// Defines an Resilience Hub application.
class App {
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String appArn;

  /// Date and time when the app was created.
  final DateTime creationTime;

  /// Name for the application.
  final String name;

  /// Assessment execution schedule with 'Daily' or 'Disabled' values.
  final AppAssessmentScheduleType? assessmentSchedule;

  /// Current status of compliance for the resiliency policy.
  final AppComplianceStatusType? complianceStatus;

  /// Optional description for an application.
  final String? description;

  /// Indicates if compliance drifts (deviations) were detected while running an
  /// assessment for your application.
  final AppDriftStatusType? driftStatus;

  /// The list of events you would like to subscribe and get notification for.
  /// Currently, Resilience Hub supports notifications only for <b>Drift
  /// detected</b> and <b>Scheduled assessment failure</b> events.
  final List<EventSubscription>? eventSubscriptions;

  /// Date and time the most recent compliance evaluation.
  final DateTime? lastAppComplianceEvaluationTime;

  /// Indicates the last time that a drift was evaluated.
  final DateTime? lastDriftEvaluationTime;

  /// Date and time the most recent resiliency score evaluation.
  final DateTime? lastResiliencyScoreEvaluationTime;

  /// Defines the roles and credentials that Resilience Hub would use while
  /// creating the application, importing its resources, and running an
  /// assessment.
  final PermissionModel? permissionModel;

  /// Amazon Resource Name (ARN) of the resiliency policy. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:resiliency-policy/<code>policy-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String? policyArn;

  /// Current resiliency score for the application.
  final double? resiliencyScore;

  /// Recovery Point Objective (RPO) in seconds.
  final int? rpoInSecs;

  /// Recovery Time Objective (RTO) in seconds.
  final int? rtoInSecs;

  /// Status of the application.
  final AppStatusType? status;

  /// Tags assigned to the resource. A tag is a label that you assign to an Amazon
  /// Web Services resource. Each tag consists of a key/value pair.
  final Map<String, String>? tags;

  App({
    required this.appArn,
    required this.creationTime,
    required this.name,
    this.assessmentSchedule,
    this.complianceStatus,
    this.description,
    this.driftStatus,
    this.eventSubscriptions,
    this.lastAppComplianceEvaluationTime,
    this.lastDriftEvaluationTime,
    this.lastResiliencyScoreEvaluationTime,
    this.permissionModel,
    this.policyArn,
    this.resiliencyScore,
    this.rpoInSecs,
    this.rtoInSecs,
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
      driftStatus: (json['driftStatus'] as String?)?.toAppDriftStatusType(),
      eventSubscriptions: (json['eventSubscriptions'] as List?)
          ?.whereNotNull()
          .map((e) => EventSubscription.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastAppComplianceEvaluationTime:
          timeStampFromJson(json['lastAppComplianceEvaluationTime']),
      lastDriftEvaluationTime:
          timeStampFromJson(json['lastDriftEvaluationTime']),
      lastResiliencyScoreEvaluationTime:
          timeStampFromJson(json['lastResiliencyScoreEvaluationTime']),
      permissionModel: json['permissionModel'] != null
          ? PermissionModel.fromJson(
              json['permissionModel'] as Map<String, dynamic>)
          : null,
      policyArn: json['policyArn'] as String?,
      resiliencyScore: json['resiliencyScore'] as double?,
      rpoInSecs: json['rpoInSecs'] as int?,
      rtoInSecs: json['rtoInSecs'] as int?,
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
    final driftStatus = this.driftStatus;
    final eventSubscriptions = this.eventSubscriptions;
    final lastAppComplianceEvaluationTime =
        this.lastAppComplianceEvaluationTime;
    final lastDriftEvaluationTime = this.lastDriftEvaluationTime;
    final lastResiliencyScoreEvaluationTime =
        this.lastResiliencyScoreEvaluationTime;
    final permissionModel = this.permissionModel;
    final policyArn = this.policyArn;
    final resiliencyScore = this.resiliencyScore;
    final rpoInSecs = this.rpoInSecs;
    final rtoInSecs = this.rtoInSecs;
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
      if (driftStatus != null) 'driftStatus': driftStatus.toValue(),
      if (eventSubscriptions != null) 'eventSubscriptions': eventSubscriptions,
      if (lastAppComplianceEvaluationTime != null)
        'lastAppComplianceEvaluationTime':
            unixTimestampToJson(lastAppComplianceEvaluationTime),
      if (lastDriftEvaluationTime != null)
        'lastDriftEvaluationTime': unixTimestampToJson(lastDriftEvaluationTime),
      if (lastResiliencyScoreEvaluationTime != null)
        'lastResiliencyScoreEvaluationTime':
            unixTimestampToJson(lastResiliencyScoreEvaluationTime),
      if (permissionModel != null) 'permissionModel': permissionModel,
      if (policyArn != null) 'policyArn': policyArn,
      if (resiliencyScore != null) 'resiliencyScore': resiliencyScore,
      if (rpoInSecs != null) 'rpoInSecs': rpoInSecs,
      if (rtoInSecs != null) 'rtoInSecs': rtoInSecs,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

/// Defines an application assessment.
class AppAssessment {
  /// Amazon Resource Name (ARN) of the assessment. The format for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String assessmentArn;

  /// Current status of the assessment for the resiliency policy.
  final AssessmentStatus assessmentStatus;

  /// The entity that invoked the assessment.
  final AssessmentInvoker invoker;

  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String? appArn;

  /// Version of an application.
  final String? appVersion;

  /// Name of the assessment.
  final String? assessmentName;

  /// Application compliance against the resiliency policy.
  final Map<DisruptionType, DisruptionCompliance>? compliance;

  /// Current status of the compliance for the resiliency policy.
  final ComplianceStatus? complianceStatus;

  /// Cost for the application.
  final Cost? cost;

  /// Indicates if compliance drifts (deviations) were detected while running an
  /// assessment for your application.
  final DriftStatus? driftStatus;

  /// End time for the action.
  final DateTime? endTime;

  /// Error or warning message from the assessment execution
  final String? message;

  /// Resiliency policy of an application.
  final ResiliencyPolicy? policy;

  /// Current resiliency score for an application.
  final ResiliencyScore? resiliencyScore;

  /// A resource error object containing a list of errors retrieving an
  /// application's resources.
  final ResourceErrorsDetails? resourceErrorsDetails;

  /// Starting time for the action.
  final DateTime? startTime;

  /// Tags assigned to the resource. A tag is a label that you assign to an Amazon
  /// Web Services resource. Each tag consists of a key/value pair.
  final Map<String, String>? tags;

  /// Version name of the published application.
  final String? versionName;

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
    this.driftStatus,
    this.endTime,
    this.message,
    this.policy,
    this.resiliencyScore,
    this.resourceErrorsDetails,
    this.startTime,
    this.tags,
    this.versionName,
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
      driftStatus: (json['driftStatus'] as String?)?.toDriftStatus(),
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
      versionName: json['versionName'] as String?,
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
    final driftStatus = this.driftStatus;
    final endTime = this.endTime;
    final message = this.message;
    final policy = this.policy;
    final resiliencyScore = this.resiliencyScore;
    final resourceErrorsDetails = this.resourceErrorsDetails;
    final startTime = this.startTime;
    final tags = this.tags;
    final versionName = this.versionName;
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
      if (driftStatus != null) 'driftStatus': driftStatus.toValue(),
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (message != null) 'message': message,
      if (policy != null) 'policy': policy,
      if (resiliencyScore != null) 'resiliencyScore': resiliencyScore,
      if (resourceErrorsDetails != null)
        'resourceErrorsDetails': resourceErrorsDetails,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (tags != null) 'tags': tags,
      if (versionName != null) 'versionName': versionName,
    };
  }
}

enum AppAssessmentScheduleType {
  disabled,
  daily,
}

extension AppAssessmentScheduleTypeValueExtension on AppAssessmentScheduleType {
  String toValue() {
    switch (this) {
      case AppAssessmentScheduleType.disabled:
        return 'Disabled';
      case AppAssessmentScheduleType.daily:
        return 'Daily';
    }
  }
}

extension AppAssessmentScheduleTypeFromString on String {
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
  /// Amazon Resource Name (ARN) of the assessment. The format for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String assessmentArn;

  /// Current status of the assessment for the resiliency policy.
  final AssessmentStatus assessmentStatus;

  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String? appArn;

  /// Version of an application.
  final String? appVersion;

  /// Name of the assessment.
  final String? assessmentName;

  /// TCurrent status of compliance for the resiliency policy.
  final ComplianceStatus? complianceStatus;

  /// Cost for an application.
  final Cost? cost;

  /// Indicates if compliance drifts (deviations) were detected while running an
  /// assessment for your application.
  final DriftStatus? driftStatus;

  /// End time for the action.
  final DateTime? endTime;

  /// Entity that invoked the assessment.
  final AssessmentInvoker? invoker;

  /// Message from the assessment run.
  final String? message;

  /// Current resiliency score for the application.
  final double? resiliencyScore;

  /// Starting time for the action.
  final DateTime? startTime;

  /// Name of an application version.
  final String? versionName;

  AppAssessmentSummary({
    required this.assessmentArn,
    required this.assessmentStatus,
    this.appArn,
    this.appVersion,
    this.assessmentName,
    this.complianceStatus,
    this.cost,
    this.driftStatus,
    this.endTime,
    this.invoker,
    this.message,
    this.resiliencyScore,
    this.startTime,
    this.versionName,
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
      driftStatus: (json['driftStatus'] as String?)?.toDriftStatus(),
      endTime: timeStampFromJson(json['endTime']),
      invoker: (json['invoker'] as String?)?.toAssessmentInvoker(),
      message: json['message'] as String?,
      resiliencyScore: json['resiliencyScore'] as double?,
      startTime: timeStampFromJson(json['startTime']),
      versionName: json['versionName'] as String?,
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
    final driftStatus = this.driftStatus;
    final endTime = this.endTime;
    final invoker = this.invoker;
    final message = this.message;
    final resiliencyScore = this.resiliencyScore;
    final startTime = this.startTime;
    final versionName = this.versionName;
    return {
      'assessmentArn': assessmentArn,
      'assessmentStatus': assessmentStatus.toValue(),
      if (appArn != null) 'appArn': appArn,
      if (appVersion != null) 'appVersion': appVersion,
      if (assessmentName != null) 'assessmentName': assessmentName,
      if (complianceStatus != null)
        'complianceStatus': complianceStatus.toValue(),
      if (cost != null) 'cost': cost,
      if (driftStatus != null) 'driftStatus': driftStatus.toValue(),
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (invoker != null) 'invoker': invoker.toValue(),
      if (message != null) 'message': message,
      if (resiliencyScore != null) 'resiliencyScore': resiliencyScore,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (versionName != null) 'versionName': versionName,
    };
  }
}

enum AppComplianceStatusType {
  policyBreached,
  policyMet,
  notAssessed,
  changesDetected,
}

extension AppComplianceStatusTypeValueExtension on AppComplianceStatusType {
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

extension AppComplianceStatusTypeFromString on String {
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

/// Defines an Application Component.
class AppComponent {
  /// Name of the Application Component.
  final String name;

  /// The type of Application Component.
  final String type;

  /// Additional configuration parameters for an Resilience Hub application. If
  /// you want to implement <code>additionalInfo</code> through the Resilience Hub
  /// console rather than using an API call, see <a
  /// href="https://docs.aws.amazon.com/resilience-hub/latest/userguide/app-config-param.html">Configure
  /// the application configuration parameters</a>.
  /// <note>
  /// Currently, this parameter accepts a key-value mapping (in a string format)
  /// of only one failover region and one associated account.
  ///
  /// Key: <code>"failover-regions"</code>
  ///
  /// Value: <code>"[{"region":"&lt;REGION&gt;",
  /// "accounts":[{"id":"&lt;ACCOUNT_ID&gt;"}]}]"</code>
  /// </note>
  final Map<String, List<String>>? additionalInfo;

  /// Identifier of the Application Component.
  final String? id;

  AppComponent({
    required this.name,
    required this.type,
    this.additionalInfo,
    this.id,
  });

  factory AppComponent.fromJson(Map<String, dynamic> json) {
    return AppComponent(
      name: json['name'] as String,
      type: json['type'] as String,
      additionalInfo: (json['additionalInfo'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k, (e as List).whereNotNull().map((e) => e as String).toList())),
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final additionalInfo = this.additionalInfo;
    final id = this.id;
    return {
      'name': name,
      'type': type,
      if (additionalInfo != null) 'additionalInfo': additionalInfo,
      if (id != null) 'id': id,
    };
  }
}

/// Defines the compliance of an Application Component against the resiliency
/// policy.
class AppComponentCompliance {
  /// Name of the Application Component.
  final String? appComponentName;

  /// The compliance of the Application Component against the resiliency policy.
  final Map<DisruptionType, DisruptionCompliance>? compliance;

  /// The cost for the application.
  final Cost? cost;

  /// The compliance message.
  final String? message;

  /// The current resiliency score for the application.
  final ResiliencyScore? resiliencyScore;

  /// Status of the action.
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

enum AppDriftStatusType {
  notChecked,
  notDetected,
  detected,
}

extension AppDriftStatusTypeValueExtension on AppDriftStatusType {
  String toValue() {
    switch (this) {
      case AppDriftStatusType.notChecked:
        return 'NotChecked';
      case AppDriftStatusType.notDetected:
        return 'NotDetected';
      case AppDriftStatusType.detected:
        return 'Detected';
    }
  }
}

extension AppDriftStatusTypeFromString on String {
  AppDriftStatusType toAppDriftStatusType() {
    switch (this) {
      case 'NotChecked':
        return AppDriftStatusType.notChecked;
      case 'NotDetected':
        return AppDriftStatusType.notDetected;
      case 'Detected':
        return AppDriftStatusType.detected;
    }
    throw Exception('$this is not known in enum AppDriftStatusType');
  }
}

/// The list of Resilience Hub application input sources.
class AppInputSource {
  /// The resource type of the input source.
  final ResourceMappingType importType;

  /// The namespace on your Amazon Elastic Kubernetes Service cluster.
  final EksSourceClusterNamespace? eksSourceClusterNamespace;

  /// The number of resources.
  final int? resourceCount;

  /// The Amazon Resource Name (ARN) of the input source. For more information
  /// about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String? sourceArn;

  /// The name of the input source.
  final String? sourceName;

  /// The name of the Terraform s3 state ﬁle.
  final TerraformSource? terraformSource;

  AppInputSource({
    required this.importType,
    this.eksSourceClusterNamespace,
    this.resourceCount,
    this.sourceArn,
    this.sourceName,
    this.terraformSource,
  });

  factory AppInputSource.fromJson(Map<String, dynamic> json) {
    return AppInputSource(
      importType: (json['importType'] as String).toResourceMappingType(),
      eksSourceClusterNamespace: json['eksSourceClusterNamespace'] != null
          ? EksSourceClusterNamespace.fromJson(
              json['eksSourceClusterNamespace'] as Map<String, dynamic>)
          : null,
      resourceCount: json['resourceCount'] as int?,
      sourceArn: json['sourceArn'] as String?,
      sourceName: json['sourceName'] as String?,
      terraformSource: json['terraformSource'] != null
          ? TerraformSource.fromJson(
              json['terraformSource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final importType = this.importType;
    final eksSourceClusterNamespace = this.eksSourceClusterNamespace;
    final resourceCount = this.resourceCount;
    final sourceArn = this.sourceArn;
    final sourceName = this.sourceName;
    final terraformSource = this.terraformSource;
    return {
      'importType': importType.toValue(),
      if (eksSourceClusterNamespace != null)
        'eksSourceClusterNamespace': eksSourceClusterNamespace,
      if (resourceCount != null) 'resourceCount': resourceCount,
      if (sourceArn != null) 'sourceArn': sourceArn,
      if (sourceName != null) 'sourceName': sourceName,
      if (terraformSource != null) 'terraformSource': terraformSource,
    };
  }
}

enum AppStatusType {
  active,
  deleting,
}

extension AppStatusTypeValueExtension on AppStatusType {
  String toValue() {
    switch (this) {
      case AppStatusType.active:
        return 'Active';
      case AppStatusType.deleting:
        return 'Deleting';
    }
  }
}

extension AppStatusTypeFromString on String {
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
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String appArn;

  /// Date and time when the app was created.
  final DateTime creationTime;

  /// The name of the application.
  final String name;

  /// Assessment execution schedule with 'Daily' or 'Disabled' values.
  final AppAssessmentScheduleType? assessmentSchedule;

  /// The current status of compliance for the resiliency policy.
  final AppComplianceStatusType? complianceStatus;

  /// The optional description for an app.
  final String? description;

  /// Indicates if compliance drifts (deviations) were detected while running an
  /// assessment for your application.
  final AppDriftStatusType? driftStatus;

  /// Date and time of the most recent compliance evaluation.
  final DateTime? lastAppComplianceEvaluationTime;

  /// The current resiliency score for the application.
  final double? resiliencyScore;

  /// Recovery Point Objective (RPO) in seconds.
  final int? rpoInSecs;

  /// Recovery Time Objective (RTO) in seconds.
  final int? rtoInSecs;

  /// Status of the application.
  final AppStatusType? status;

  AppSummary({
    required this.appArn,
    required this.creationTime,
    required this.name,
    this.assessmentSchedule,
    this.complianceStatus,
    this.description,
    this.driftStatus,
    this.lastAppComplianceEvaluationTime,
    this.resiliencyScore,
    this.rpoInSecs,
    this.rtoInSecs,
    this.status,
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
      driftStatus: (json['driftStatus'] as String?)?.toAppDriftStatusType(),
      lastAppComplianceEvaluationTime:
          timeStampFromJson(json['lastAppComplianceEvaluationTime']),
      resiliencyScore: json['resiliencyScore'] as double?,
      rpoInSecs: json['rpoInSecs'] as int?,
      rtoInSecs: json['rtoInSecs'] as int?,
      status: (json['status'] as String?)?.toAppStatusType(),
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final creationTime = this.creationTime;
    final name = this.name;
    final assessmentSchedule = this.assessmentSchedule;
    final complianceStatus = this.complianceStatus;
    final description = this.description;
    final driftStatus = this.driftStatus;
    final lastAppComplianceEvaluationTime =
        this.lastAppComplianceEvaluationTime;
    final resiliencyScore = this.resiliencyScore;
    final rpoInSecs = this.rpoInSecs;
    final rtoInSecs = this.rtoInSecs;
    final status = this.status;
    return {
      'appArn': appArn,
      'creationTime': unixTimestampToJson(creationTime),
      'name': name,
      if (assessmentSchedule != null)
        'assessmentSchedule': assessmentSchedule.toValue(),
      if (complianceStatus != null)
        'complianceStatus': complianceStatus.toValue(),
      if (description != null) 'description': description,
      if (driftStatus != null) 'driftStatus': driftStatus.toValue(),
      if (lastAppComplianceEvaluationTime != null)
        'lastAppComplianceEvaluationTime':
            unixTimestampToJson(lastAppComplianceEvaluationTime),
      if (resiliencyScore != null) 'resiliencyScore': resiliencyScore,
      if (rpoInSecs != null) 'rpoInSecs': rpoInSecs,
      if (rtoInSecs != null) 'rtoInSecs': rtoInSecs,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Version of an application.
class AppVersionSummary {
  /// Version of an application.
  final String appVersion;

  /// Creation time of the application version.
  final DateTime? creationTime;

  /// Identifier of the application version.
  final int? identifier;

  /// Name of the application version.
  final String? versionName;

  AppVersionSummary({
    required this.appVersion,
    this.creationTime,
    this.identifier,
    this.versionName,
  });

  factory AppVersionSummary.fromJson(Map<String, dynamic> json) {
    return AppVersionSummary(
      appVersion: json['appVersion'] as String,
      creationTime: timeStampFromJson(json['creationTime']),
      identifier: json['identifier'] as int?,
      versionName: json['versionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appVersion = this.appVersion;
    final creationTime = this.creationTime;
    final identifier = this.identifier;
    final versionName = this.versionName;
    return {
      'appVersion': appVersion,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (identifier != null) 'identifier': identifier,
      if (versionName != null) 'versionName': versionName,
    };
  }
}

enum AssessmentInvoker {
  user,
  system,
}

extension AssessmentInvokerValueExtension on AssessmentInvoker {
  String toValue() {
    switch (this) {
      case AssessmentInvoker.user:
        return 'User';
      case AssessmentInvoker.system:
        return 'System';
    }
  }
}

extension AssessmentInvokerFromString on String {
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

extension AssessmentStatusValueExtension on AssessmentStatus {
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

extension AssessmentStatusFromString on String {
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

/// List of operational recommendations that did not get included or excluded.
class BatchUpdateRecommendationStatusFailedEntry {
  /// An identifier of an entry in this batch that is used to communicate the
  /// result.
  /// <note>
  /// The <code>entryId</code>s of a batch request need to be unique within a
  /// request.
  /// </note>
  final String entryId;

  /// Indicates the error that occurred while excluding an operational
  /// recommendation.
  final String errorMessage;

  BatchUpdateRecommendationStatusFailedEntry({
    required this.entryId,
    required this.errorMessage,
  });

  factory BatchUpdateRecommendationStatusFailedEntry.fromJson(
      Map<String, dynamic> json) {
    return BatchUpdateRecommendationStatusFailedEntry(
      entryId: json['entryId'] as String,
      errorMessage: json['errorMessage'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final entryId = this.entryId;
    final errorMessage = this.errorMessage;
    return {
      'entryId': entryId,
      'errorMessage': errorMessage,
    };
  }
}

class BatchUpdateRecommendationStatusResponse {
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String appArn;

  /// A list of items with error details about each item, which could not be
  /// included or excluded.
  final List<BatchUpdateRecommendationStatusFailedEntry> failedEntries;

  /// A list of items that were included or excluded.
  final List<BatchUpdateRecommendationStatusSuccessfulEntry> successfulEntries;

  BatchUpdateRecommendationStatusResponse({
    required this.appArn,
    required this.failedEntries,
    required this.successfulEntries,
  });

  factory BatchUpdateRecommendationStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchUpdateRecommendationStatusResponse(
      appArn: json['appArn'] as String,
      failedEntries: (json['failedEntries'] as List)
          .whereNotNull()
          .map((e) => BatchUpdateRecommendationStatusFailedEntry.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      successfulEntries: (json['successfulEntries'] as List)
          .whereNotNull()
          .map((e) => BatchUpdateRecommendationStatusSuccessfulEntry.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final failedEntries = this.failedEntries;
    final successfulEntries = this.successfulEntries;
    return {
      'appArn': appArn,
      'failedEntries': failedEntries,
      'successfulEntries': successfulEntries,
    };
  }
}

/// List of operational recommendations that were successfully included or
/// excluded.
class BatchUpdateRecommendationStatusSuccessfulEntry {
  /// An identifier for an entry in this batch that is used to communicate the
  /// result.
  /// <note>
  /// The <code>entryId</code>s of a batch request need to be unique within a
  /// request.
  /// </note>
  final String entryId;

  /// Indicates if the operational recommendation was successfully excluded.
  final bool excluded;

  /// The operational recommendation item.
  final UpdateRecommendationStatusItem item;

  /// Reference identifier of the operational recommendation.
  final String referenceId;

  /// Indicates the reason for excluding an operational recommendation.
  final ExcludeRecommendationReason? excludeReason;

  BatchUpdateRecommendationStatusSuccessfulEntry({
    required this.entryId,
    required this.excluded,
    required this.item,
    required this.referenceId,
    this.excludeReason,
  });

  factory BatchUpdateRecommendationStatusSuccessfulEntry.fromJson(
      Map<String, dynamic> json) {
    return BatchUpdateRecommendationStatusSuccessfulEntry(
      entryId: json['entryId'] as String,
      excluded: json['excluded'] as bool,
      item: UpdateRecommendationStatusItem.fromJson(
          json['item'] as Map<String, dynamic>),
      referenceId: json['referenceId'] as String,
      excludeReason:
          (json['excludeReason'] as String?)?.toExcludeRecommendationReason(),
    );
  }

  Map<String, dynamic> toJson() {
    final entryId = this.entryId;
    final excluded = this.excluded;
    final item = this.item;
    final referenceId = this.referenceId;
    final excludeReason = this.excludeReason;
    return {
      'entryId': entryId,
      'excluded': excluded,
      'item': item,
      'referenceId': referenceId,
      if (excludeReason != null) 'excludeReason': excludeReason.toValue(),
    };
  }
}

/// Indicates the compliance drifts (recovery time objective (RTO) and recovery
/// point objective (RPO)) that were detected for an assessed entity.
class ComplianceDrift {
  /// Assessment identifier that is associated with this drift item.
  final String? actualReferenceId;

  /// Actual compliance value of the entity.
  final Map<DisruptionType, DisruptionCompliance>? actualValue;

  /// Identifier of your application.
  final String? appId;

  /// Published version of your application on which drift was detected.
  final String? appVersion;

  /// Difference type between actual and expected recovery point objective (RPO)
  /// and recovery time objective (RTO) values. Currently, Resilience Hub supports
  /// only <b>NotEqual</b> difference type.
  final DifferenceType? diffType;

  /// The type of drift detected. Currently, Resilience Hub supports only
  /// <b>ApplicationCompliance</b> drift type.
  final DriftType? driftType;

  /// Identifier of an entity in which drift was detected. For compliance drift,
  /// the entity ID can be either application ID or the AppComponent ID.
  final String? entityId;

  /// The type of entity in which drift was detected. For compliance drifts,
  /// Resilience Hub supports <code>AWS::ResilienceHub::AppComponent</code> and
  /// <code>AWS::ResilienceHub::Application</code>.
  final String? entityType;

  /// Assessment identifier of a previous assessment of the same application
  /// version. Resilience Hub uses the previous assessment (associated with the
  /// reference identifier) to compare the compliance with the current assessment
  /// to identify drifts.
  final String? expectedReferenceId;

  /// The expected compliance value of an entity.
  final Map<DisruptionType, DisruptionCompliance>? expectedValue;

  ComplianceDrift({
    this.actualReferenceId,
    this.actualValue,
    this.appId,
    this.appVersion,
    this.diffType,
    this.driftType,
    this.entityId,
    this.entityType,
    this.expectedReferenceId,
    this.expectedValue,
  });

  factory ComplianceDrift.fromJson(Map<String, dynamic> json) {
    return ComplianceDrift(
      actualReferenceId: json['actualReferenceId'] as String?,
      actualValue: (json['actualValue'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k.toDisruptionType(),
              DisruptionCompliance.fromJson(e as Map<String, dynamic>))),
      appId: json['appId'] as String?,
      appVersion: json['appVersion'] as String?,
      diffType: (json['diffType'] as String?)?.toDifferenceType(),
      driftType: (json['driftType'] as String?)?.toDriftType(),
      entityId: json['entityId'] as String?,
      entityType: json['entityType'] as String?,
      expectedReferenceId: json['expectedReferenceId'] as String?,
      expectedValue: (json['expectedValue'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(k.toDisruptionType(),
              DisruptionCompliance.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final actualReferenceId = this.actualReferenceId;
    final actualValue = this.actualValue;
    final appId = this.appId;
    final appVersion = this.appVersion;
    final diffType = this.diffType;
    final driftType = this.driftType;
    final entityId = this.entityId;
    final entityType = this.entityType;
    final expectedReferenceId = this.expectedReferenceId;
    final expectedValue = this.expectedValue;
    return {
      if (actualReferenceId != null) 'actualReferenceId': actualReferenceId,
      if (actualValue != null)
        'actualValue': actualValue.map((k, e) => MapEntry(k.toValue(), e)),
      if (appId != null) 'appId': appId,
      if (appVersion != null) 'appVersion': appVersion,
      if (diffType != null) 'diffType': diffType.toValue(),
      if (driftType != null) 'driftType': driftType.toValue(),
      if (entityId != null) 'entityId': entityId,
      if (entityType != null) 'entityType': entityType,
      if (expectedReferenceId != null)
        'expectedReferenceId': expectedReferenceId,
      if (expectedValue != null)
        'expectedValue': expectedValue.map((k, e) => MapEntry(k.toValue(), e)),
    };
  }
}

enum ComplianceStatus {
  policyBreached,
  policyMet,
}

extension ComplianceStatusValueExtension on ComplianceStatus {
  String toValue() {
    switch (this) {
      case ComplianceStatus.policyBreached:
        return 'PolicyBreached';
      case ComplianceStatus.policyMet:
        return 'PolicyMet';
    }
  }
}

extension ComplianceStatusFromString on String {
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

/// Defines recommendations for an Resilience Hub Application Component,
/// returned as an object. This object contains component names, configuration
/// recommendations, and recommendation statuses.
class ComponentRecommendation {
  /// Name of the Application Component.
  final String appComponentName;

  /// List of recommendations.
  final List<ConfigRecommendation> configRecommendations;

  /// Status of the recommendation.
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

/// Defines a recommendation configuration.
class ConfigRecommendation {
  /// The name of the recommendation configuration.
  final String name;

  /// The type of optimization.
  final ConfigRecommendationOptimizationType optimizationType;

  /// Reference identifier for the recommendation configuration.
  final String referenceId;

  /// Name of the Application Component.
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
  bestRegionRecovery,
}

extension ConfigRecommendationOptimizationTypeValueExtension
    on ConfigRecommendationOptimizationType {
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
      case ConfigRecommendationOptimizationType.bestRegionRecovery:
        return 'BestRegionRecovery';
    }
  }
}

extension ConfigRecommendationOptimizationTypeFromString on String {
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
      case 'BestRegionRecovery':
        return ConfigRecommendationOptimizationType.bestRegionRecovery;
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

extension CostFrequencyValueExtension on CostFrequency {
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

extension CostFrequencyFromString on String {
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

class CreateAppVersionAppComponentResponse {
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String appArn;

  /// Resilience Hub application version.
  final String appVersion;

  /// List of Application Components that belong to this resource.
  final AppComponent? appComponent;

  CreateAppVersionAppComponentResponse({
    required this.appArn,
    required this.appVersion,
    this.appComponent,
  });

  factory CreateAppVersionAppComponentResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateAppVersionAppComponentResponse(
      appArn: json['appArn'] as String,
      appVersion: json['appVersion'] as String,
      appComponent: json['appComponent'] != null
          ? AppComponent.fromJson(json['appComponent'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final appVersion = this.appVersion;
    final appComponent = this.appComponent;
    return {
      'appArn': appArn,
      'appVersion': appVersion,
      if (appComponent != null) 'appComponent': appComponent,
    };
  }
}

class CreateAppVersionResourceResponse {
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String appArn;

  /// Resilience Hub application version.
  final String appVersion;

  /// Defines a physical resource. A physical resource is a resource that exists
  /// in your account. It can be identified using an Amazon Resource Name (ARN) or
  /// a Resilience Hub-native identifier.
  final PhysicalResource? physicalResource;

  CreateAppVersionResourceResponse({
    required this.appArn,
    required this.appVersion,
    this.physicalResource,
  });

  factory CreateAppVersionResourceResponse.fromJson(Map<String, dynamic> json) {
    return CreateAppVersionResourceResponse(
      appArn: json['appArn'] as String,
      appVersion: json['appVersion'] as String,
      physicalResource: json['physicalResource'] != null
          ? PhysicalResource.fromJson(
              json['physicalResource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final appVersion = this.appVersion;
    final physicalResource = this.physicalResource;
    return {
      'appArn': appArn,
      'appVersion': appVersion,
      if (physicalResource != null) 'physicalResource': physicalResource,
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

extension DataLocationConstraintValueExtension on DataLocationConstraint {
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

extension DataLocationConstraintFromString on String {
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
  /// Amazon Resource Name (ARN) of the assessment. The format for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
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

class DeleteAppInputSourceResponse {
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String? appArn;

  /// Name of the input source from where the application resource is imported
  /// from.
  final AppInputSource? appInputSource;

  DeleteAppInputSourceResponse({
    this.appArn,
    this.appInputSource,
  });

  factory DeleteAppInputSourceResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAppInputSourceResponse(
      appArn: json['appArn'] as String?,
      appInputSource: json['appInputSource'] != null
          ? AppInputSource.fromJson(
              json['appInputSource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final appInputSource = this.appInputSource;
    return {
      if (appArn != null) 'appArn': appArn,
      if (appInputSource != null) 'appInputSource': appInputSource,
    };
  }
}

class DeleteAppResponse {
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
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

class DeleteAppVersionAppComponentResponse {
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String appArn;

  /// Resilience Hub application version.
  final String appVersion;

  /// List of Application Components that belong to this resource.
  final AppComponent? appComponent;

  DeleteAppVersionAppComponentResponse({
    required this.appArn,
    required this.appVersion,
    this.appComponent,
  });

  factory DeleteAppVersionAppComponentResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteAppVersionAppComponentResponse(
      appArn: json['appArn'] as String,
      appVersion: json['appVersion'] as String,
      appComponent: json['appComponent'] != null
          ? AppComponent.fromJson(json['appComponent'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final appVersion = this.appVersion;
    final appComponent = this.appComponent;
    return {
      'appArn': appArn,
      'appVersion': appVersion,
      if (appComponent != null) 'appComponent': appComponent,
    };
  }
}

class DeleteAppVersionResourceResponse {
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String appArn;

  /// Resilience Hub application version.
  final String appVersion;

  /// Defines a physical resource. A physical resource is a resource that exists
  /// in your account. It can be identified using an Amazon Resource Name (ARN) or
  /// a Resilience Hub-native identifier.
  final PhysicalResource? physicalResource;

  DeleteAppVersionResourceResponse({
    required this.appArn,
    required this.appVersion,
    this.physicalResource,
  });

  factory DeleteAppVersionResourceResponse.fromJson(Map<String, dynamic> json) {
    return DeleteAppVersionResourceResponse(
      appArn: json['appArn'] as String,
      appVersion: json['appVersion'] as String,
      physicalResource: json['physicalResource'] != null
          ? PhysicalResource.fromJson(
              json['physicalResource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final appVersion = this.appVersion;
    final physicalResource = this.physicalResource;
    return {
      'appArn': appArn,
      'appVersion': appVersion,
      if (physicalResource != null) 'physicalResource': physicalResource,
    };
  }
}

class DeleteRecommendationTemplateResponse {
  /// The Amazon Resource Name (ARN) for a recommendation template.
  final String recommendationTemplateArn;

  /// Status of the action.
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
  /// Amazon Resource Name (ARN) of the resiliency policy. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:resiliency-policy/<code>policy-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
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
  /// The assessment for an Resilience Hub application, returned as an object.
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

class DescribeAppVersionAppComponentResponse {
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String appArn;

  /// Resilience Hub application version.
  final String appVersion;

  /// List of Application Components that belong to this resource.
  final AppComponent? appComponent;

  DescribeAppVersionAppComponentResponse({
    required this.appArn,
    required this.appVersion,
    this.appComponent,
  });

  factory DescribeAppVersionAppComponentResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeAppVersionAppComponentResponse(
      appArn: json['appArn'] as String,
      appVersion: json['appVersion'] as String,
      appComponent: json['appComponent'] != null
          ? AppComponent.fromJson(json['appComponent'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final appVersion = this.appVersion;
    final appComponent = this.appComponent;
    return {
      'appArn': appArn,
      'appVersion': appVersion,
      if (appComponent != null) 'appComponent': appComponent,
    };
  }
}

class DescribeAppVersionResourceResponse {
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String appArn;

  /// Resilience Hub application version.
  final String appVersion;

  /// Defines a physical resource. A physical resource is a resource that exists
  /// in your account. It can be identified using an Amazon Resource Name (ARN) or
  /// a Resilience Hub-native identifier.
  final PhysicalResource? physicalResource;

  DescribeAppVersionResourceResponse({
    required this.appArn,
    required this.appVersion,
    this.physicalResource,
  });

  factory DescribeAppVersionResourceResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeAppVersionResourceResponse(
      appArn: json['appArn'] as String,
      appVersion: json['appVersion'] as String,
      physicalResource: json['physicalResource'] != null
          ? PhysicalResource.fromJson(
              json['physicalResource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final appVersion = this.appVersion;
    final physicalResource = this.physicalResource;
    return {
      'appArn': appArn,
      'appVersion': appVersion,
      if (physicalResource != null) 'physicalResource': physicalResource,
    };
  }
}

class DescribeAppVersionResourcesResolutionStatusResponse {
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String appArn;

  /// The version of the application.
  final String appVersion;

  /// The identifier for a specific resolution.
  final String resolutionId;

  /// Status of the action.
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

class DescribeAppVersionResponse {
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String appArn;

  /// Resilience Hub application version.
  final String appVersion;

  /// Additional configuration parameters for an Resilience Hub application. If
  /// you want to implement <code>additionalInfo</code> through the Resilience Hub
  /// console rather than using an API call, see <a
  /// href="https://docs.aws.amazon.com/resilience-hub/latest/userguide/app-config-param.html">Configure
  /// the application configuration parameters</a>.
  /// <note>
  /// Currently, this parameter supports only failover region and account.
  /// </note>
  final Map<String, List<String>>? additionalInfo;

  DescribeAppVersionResponse({
    required this.appArn,
    required this.appVersion,
    this.additionalInfo,
  });

  factory DescribeAppVersionResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAppVersionResponse(
      appArn: json['appArn'] as String,
      appVersion: json['appVersion'] as String,
      additionalInfo: (json['additionalInfo'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k, (e as List).whereNotNull().map((e) => e as String).toList())),
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final appVersion = this.appVersion;
    final additionalInfo = this.additionalInfo;
    return {
      'appArn': appArn,
      'appVersion': appVersion,
      if (additionalInfo != null) 'additionalInfo': additionalInfo,
    };
  }
}

class DescribeAppVersionTemplateResponse {
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String appArn;

  /// A JSON string that provides information about your application structure. To
  /// learn more about the <code>appTemplateBody</code> template, see the sample
  /// template provided in the <i>Examples</i> section.
  ///
  /// The <code>appTemplateBody</code> JSON string has the following structure:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>resources</code> </b>
  ///
  /// The list of logical resources that must be included in the Resilience Hub
  /// application.
  ///
  /// Type: Array
  /// <note>
  /// Don't add the resources that you want to exclude.
  /// </note>
  /// Each <code>resources</code> array item includes the following fields:
  ///
  /// <ul>
  /// <li>
  /// <i> <code>logicalResourceId</code> </i>
  ///
  /// Logical identifier of the resource.
  ///
  /// Type: Object
  ///
  /// Each <code>logicalResourceId</code> object includes the following fields:
  ///
  /// <ul>
  /// <li>
  /// <code>identifier</code>
  ///
  /// Identifier of the resource.
  ///
  /// Type: String
  /// </li>
  /// <li>
  /// <code>logicalStackName</code>
  ///
  /// The name of the CloudFormation stack this resource belongs to.
  ///
  /// Type: String
  /// </li>
  /// <li>
  /// <code>resourceGroupName</code>
  ///
  /// The name of the resource group this resource belongs to.
  ///
  /// Type: String
  /// </li>
  /// <li>
  /// <code>terraformSourceName</code>
  ///
  /// The name of the Terraform S3 state file this resource belongs to.
  ///
  /// Type: String
  /// </li>
  /// <li>
  /// <code>eksSourceName</code>
  ///
  /// Name of the Amazon Elastic Kubernetes Service cluster and namespace this
  /// resource belongs to.
  /// <note>
  /// This parameter accepts values in "eks-cluster/namespace" format.
  /// </note>
  /// Type: String
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <i> <code>type</code> </i>
  ///
  /// The type of resource.
  ///
  /// Type: string
  /// </li>
  /// <li>
  /// <i> <code>name</code> </i>
  ///
  /// The name of the resource.
  ///
  /// Type: String
  /// </li>
  /// <li>
  /// <code>additionalInfo</code>
  ///
  /// Additional configuration parameters for an Resilience Hub application. If
  /// you want to implement <code>additionalInfo</code> through the Resilience Hub
  /// console rather than using an API call, see <a
  /// href="https://docs.aws.amazon.com/resilience-hub/latest/userguide/app-config-param.html">Configure
  /// the application configuration parameters</a>.
  /// <note>
  /// Currently, this parameter accepts a key-value mapping (in a string format)
  /// of only one failover region and one associated account.
  ///
  /// Key: <code>"failover-regions"</code>
  ///
  /// Value: <code>"[{"region":"&lt;REGION&gt;",
  /// "accounts":[{"id":"&lt;ACCOUNT_ID&gt;"}]}]"</code>
  /// </note> </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>appComponents</code> </b>
  ///
  /// List of Application Components that this resource belongs to. If an
  /// Application Component is not part of the Resilience Hub application, it will
  /// be added.
  ///
  /// Type: Array
  ///
  /// Each <code>appComponents</code> array item includes the following fields:
  ///
  /// <ul>
  /// <li>
  /// <code>name</code>
  ///
  /// Name of the Application Component.
  ///
  /// Type: String
  /// </li>
  /// <li>
  /// <code>type</code>
  ///
  /// Type of Application Component. For more information about the types of
  /// Application Component, see <a
  /// href="https://docs.aws.amazon.com/resilience-hub/latest/userguide/AppComponent.grouping.html">Grouping
  /// resources in an AppComponent</a>.
  ///
  /// Type: String
  /// </li>
  /// <li>
  /// <code>resourceNames</code>
  ///
  /// The list of included resources that are assigned to the Application
  /// Component.
  ///
  /// Type: Array of strings
  /// </li>
  /// <li>
  /// <code>additionalInfo</code>
  ///
  /// Additional configuration parameters for an Resilience Hub application. If
  /// you want to implement <code>additionalInfo</code> through the Resilience Hub
  /// console rather than using an API call, see <a
  /// href="https://docs.aws.amazon.com/resilience-hub/latest/userguide/app-config-param.html">Configure
  /// the application configuration parameters</a>.
  /// <note>
  /// Currently, this parameter accepts a key-value mapping (in a string format)
  /// of only one failover region and one associated account.
  ///
  /// Key: <code>"failover-regions"</code>
  ///
  /// Value: <code>"[{"region":"&lt;REGION&gt;",
  /// "accounts":[{"id":"&lt;ACCOUNT_ID&gt;"}]}]"</code>
  /// </note> </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>excludedResources</code> </b>
  ///
  /// The list of logical resource identifiers to be excluded from the
  /// application.
  ///
  /// Type: Array
  /// <note>
  /// Don't add the resources that you want to include.
  /// </note>
  /// Each <code>excludedResources</code> array item includes the following
  /// fields:
  ///
  /// <ul>
  /// <li>
  /// <i> <code>logicalResourceIds</code> </i>
  ///
  /// Logical identifier of the resource.
  ///
  /// Type: Object
  /// <note>
  /// You can configure only one of the following fields:
  ///
  /// <ul>
  /// <li>
  /// <code>logicalStackName</code>
  /// </li>
  /// <li>
  /// <code>resourceGroupName</code>
  /// </li>
  /// <li>
  /// <code>terraformSourceName</code>
  /// </li>
  /// <li>
  /// <code>eksSourceName</code>
  /// </li>
  /// </ul> </note>
  /// Each <code>logicalResourceIds</code> object includes the following fields:
  ///
  /// <ul>
  /// <li>
  /// <code>identifier</code>
  ///
  /// Identifier of the resource.
  ///
  /// Type: String
  /// </li>
  /// <li>
  /// <code>logicalStackName</code>
  ///
  /// The name of the CloudFormation stack this resource belongs to.
  ///
  /// Type: String
  /// </li>
  /// <li>
  /// <code>resourceGroupName</code>
  ///
  /// The name of the resource group this resource belongs to.
  ///
  /// Type: String
  /// </li>
  /// <li>
  /// <code>terraformSourceName</code>
  ///
  /// The name of the Terraform S3 state file this resource belongs to.
  ///
  /// Type: String
  /// </li>
  /// <li>
  /// <code>eksSourceName</code>
  ///
  /// Name of the Amazon Elastic Kubernetes Service cluster and namespace this
  /// resource belongs to.
  /// <note>
  /// This parameter accepts values in "eks-cluster/namespace" format.
  /// </note>
  /// Type: String
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// <li>
  /// <b> <code>version</code> </b>
  ///
  /// Resilience Hub application version.
  /// </li>
  /// <li>
  /// <code>additionalInfo</code>
  ///
  /// Additional configuration parameters for an Resilience Hub application. If
  /// you want to implement <code>additionalInfo</code> through the Resilience Hub
  /// console rather than using an API call, see <a
  /// href="https://docs.aws.amazon.com/resilience-hub/latest/userguide/app-config-param.html">Configure
  /// the application configuration parameters</a>.
  /// <note>
  /// Currently, this parameter accepts a key-value mapping (in a string format)
  /// of only one failover region and one associated account.
  ///
  /// Key: <code>"failover-regions"</code>
  ///
  /// Value: <code>"[{"region":"&lt;REGION&gt;",
  /// "accounts":[{"id":"&lt;ACCOUNT_ID&gt;"}]}]"</code>
  /// </note> </li>
  /// </ul>
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
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String appArn;

  /// The version of the application.
  final String appVersion;

  /// Status of the action.
  final ResourceImportStatusType status;

  /// The time when the status last changed.
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

enum DifferenceType {
  notEqual,
  added,
  removed,
}

extension DifferenceTypeValueExtension on DifferenceType {
  String toValue() {
    switch (this) {
      case DifferenceType.notEqual:
        return 'NotEqual';
      case DifferenceType.added:
        return 'Added';
      case DifferenceType.removed:
        return 'Removed';
    }
  }
}

extension DifferenceTypeFromString on String {
  DifferenceType toDifferenceType() {
    switch (this) {
      case 'NotEqual':
        return DifferenceType.notEqual;
      case 'Added':
        return DifferenceType.added;
      case 'Removed':
        return DifferenceType.removed;
    }
    throw Exception('$this is not known in enum DifferenceType');
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

  /// Reference identifier of the RPO .
  final String? rpoReferenceId;

  /// The RTO description.
  final String? rtoDescription;

  /// Reference identifier of the RTO.
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

extension DisruptionTypeValueExtension on DisruptionType {
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

extension DisruptionTypeFromString on String {
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

enum DriftStatus {
  notChecked,
  notDetected,
  detected,
}

extension DriftStatusValueExtension on DriftStatus {
  String toValue() {
    switch (this) {
      case DriftStatus.notChecked:
        return 'NotChecked';
      case DriftStatus.notDetected:
        return 'NotDetected';
      case DriftStatus.detected:
        return 'Detected';
    }
  }
}

extension DriftStatusFromString on String {
  DriftStatus toDriftStatus() {
    switch (this) {
      case 'NotChecked':
        return DriftStatus.notChecked;
      case 'NotDetected':
        return DriftStatus.notDetected;
      case 'Detected':
        return DriftStatus.detected;
    }
    throw Exception('$this is not known in enum DriftStatus');
  }
}

enum DriftType {
  applicationCompliance,
  appComponentResiliencyComplianceStatus,
}

extension DriftTypeValueExtension on DriftType {
  String toValue() {
    switch (this) {
      case DriftType.applicationCompliance:
        return 'ApplicationCompliance';
      case DriftType.appComponentResiliencyComplianceStatus:
        return 'AppComponentResiliencyComplianceStatus';
    }
  }
}

extension DriftTypeFromString on String {
  DriftType toDriftType() {
    switch (this) {
      case 'ApplicationCompliance':
        return DriftType.applicationCompliance;
      case 'AppComponentResiliencyComplianceStatus':
        return DriftType.appComponentResiliencyComplianceStatus;
    }
    throw Exception('$this is not known in enum DriftType');
  }
}

/// The input source of the Amazon Elastic Kubernetes Service cluster.
class EksSource {
  /// Amazon Resource Name (ARN) of the Amazon Elastic Kubernetes Service cluster.
  /// The format for this ARN is:
  /// arn:<code>aws</code>:eks:<code>region</code>:<code>account-id</code>:cluster/<code>cluster-name</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String eksClusterArn;

  /// The list of namespaces located on your Amazon Elastic Kubernetes Service
  /// cluster.
  final List<String> namespaces;

  EksSource({
    required this.eksClusterArn,
    required this.namespaces,
  });

  factory EksSource.fromJson(Map<String, dynamic> json) {
    return EksSource(
      eksClusterArn: json['eksClusterArn'] as String,
      namespaces: (json['namespaces'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final eksClusterArn = this.eksClusterArn;
    final namespaces = this.namespaces;
    return {
      'eksClusterArn': eksClusterArn,
      'namespaces': namespaces,
    };
  }
}

/// The input source of the namespace that is located on your Amazon Elastic
/// Kubernetes Service cluster.
class EksSourceClusterNamespace {
  /// Amazon Resource Name (ARN) of the Amazon Elastic Kubernetes Service cluster.
  /// The format for this ARN is:
  /// arn:<code>aws</code>:eks:<code>region</code>:<code>account-id</code>:cluster/<code>cluster-name</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String eksClusterArn;

  /// Name of the namespace that is located on your Amazon Elastic Kubernetes
  /// Service cluster.
  final String namespace;

  EksSourceClusterNamespace({
    required this.eksClusterArn,
    required this.namespace,
  });

  factory EksSourceClusterNamespace.fromJson(Map<String, dynamic> json) {
    return EksSourceClusterNamespace(
      eksClusterArn: json['eksClusterArn'] as String,
      namespace: json['namespace'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final eksClusterArn = this.eksClusterArn;
    final namespace = this.namespace;
    return {
      'eksClusterArn': eksClusterArn,
      'namespace': namespace,
    };
  }
}

enum EstimatedCostTier {
  l1,
  l2,
  l3,
  l4,
}

extension EstimatedCostTierValueExtension on EstimatedCostTier {
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

extension EstimatedCostTierFromString on String {
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

/// Indicates an event you would like to subscribe and get notification for.
/// Currently, Resilience Hub supports notifications only for <b>Drift
/// detected</b> and <b>Scheduled assessment failure</b> events.
class EventSubscription {
  /// The type of event you would like to subscribe and get notification for.
  /// Currently, Resilience Hub supports notifications only for <b>Drift
  /// detected</b> (<code>DriftDetected</code>) and <b>Scheduled assessment
  /// failure</b> (<code>ScheduledAssessmentFailure</code>) events.
  final EventType eventType;

  /// Unique name to identify an event subscription.
  final String name;

  /// Amazon Resource Name (ARN) of the Amazon Simple Notification Service topic.
  /// The format for this ARN is:
  /// <code>arn:partition:sns:region:account:topic-name</code>. For more
  /// information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String? snsTopicArn;

  EventSubscription({
    required this.eventType,
    required this.name,
    this.snsTopicArn,
  });

  factory EventSubscription.fromJson(Map<String, dynamic> json) {
    return EventSubscription(
      eventType: (json['eventType'] as String).toEventType(),
      name: json['name'] as String,
      snsTopicArn: json['snsTopicArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventType = this.eventType;
    final name = this.name;
    final snsTopicArn = this.snsTopicArn;
    return {
      'eventType': eventType.toValue(),
      'name': name,
      if (snsTopicArn != null) 'snsTopicArn': snsTopicArn,
    };
  }
}

enum EventType {
  scheduledAssessmentFailure,
  driftDetected,
}

extension EventTypeValueExtension on EventType {
  String toValue() {
    switch (this) {
      case EventType.scheduledAssessmentFailure:
        return 'ScheduledAssessmentFailure';
      case EventType.driftDetected:
        return 'DriftDetected';
    }
  }
}

extension EventTypeFromString on String {
  EventType toEventType() {
    switch (this) {
      case 'ScheduledAssessmentFailure':
        return EventType.scheduledAssessmentFailure;
      case 'DriftDetected':
        return EventType.driftDetected;
    }
    throw Exception('$this is not known in enum EventType');
  }
}

enum ExcludeRecommendationReason {
  alreadyImplemented,
  notRelevant,
  complexityOfImplementation,
}

extension ExcludeRecommendationReasonValueExtension
    on ExcludeRecommendationReason {
  String toValue() {
    switch (this) {
      case ExcludeRecommendationReason.alreadyImplemented:
        return 'AlreadyImplemented';
      case ExcludeRecommendationReason.notRelevant:
        return 'NotRelevant';
      case ExcludeRecommendationReason.complexityOfImplementation:
        return 'ComplexityOfImplementation';
    }
  }
}

extension ExcludeRecommendationReasonFromString on String {
  ExcludeRecommendationReason toExcludeRecommendationReason() {
    switch (this) {
      case 'AlreadyImplemented':
        return ExcludeRecommendationReason.alreadyImplemented;
      case 'NotRelevant':
        return ExcludeRecommendationReason.notRelevant;
      case 'ComplexityOfImplementation':
        return ExcludeRecommendationReason.complexityOfImplementation;
    }
    throw Exception('$this is not known in enum ExcludeRecommendationReason');
  }
}

/// Defines a failure policy.
class FailurePolicy {
  /// Recovery Point Objective (RPO) in seconds.
  final int rpoInSecs;

  /// Recovery Time Objective (RTO) in seconds.
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

extension HaArchitectureValueExtension on HaArchitecture {
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

extension HaArchitectureFromString on String {
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
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String appArn;

  /// The version of the application.
  final String appVersion;

  /// Status of the action.
  final ResourceImportStatusType status;

  /// The input sources of the Amazon Elastic Kubernetes Service resources you
  /// have imported.
  final List<EksSource>? eksSources;

  /// The Amazon Resource Names (ARNs) for the resources you have imported.
  final List<String>? sourceArns;

  /// A list of terraform file s3 URLs you have imported.
  final List<TerraformSource>? terraformSources;

  ImportResourcesToDraftAppVersionResponse({
    required this.appArn,
    required this.appVersion,
    required this.status,
    this.eksSources,
    this.sourceArns,
    this.terraformSources,
  });

  factory ImportResourcesToDraftAppVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return ImportResourcesToDraftAppVersionResponse(
      appArn: json['appArn'] as String,
      appVersion: json['appVersion'] as String,
      status: (json['status'] as String).toResourceImportStatusType(),
      eksSources: (json['eksSources'] as List?)
          ?.whereNotNull()
          .map((e) => EksSource.fromJson(e as Map<String, dynamic>))
          .toList(),
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
    final eksSources = this.eksSources;
    final sourceArns = this.sourceArns;
    final terraformSources = this.terraformSources;
    return {
      'appArn': appArn,
      'appVersion': appVersion,
      'status': status.toValue(),
      if (eksSources != null) 'eksSources': eksSources,
      if (sourceArns != null) 'sourceArns': sourceArns,
      if (terraformSources != null) 'terraformSources': terraformSources,
    };
  }
}

class ListAlarmRecommendationsResponse {
  /// The alarm recommendations for an Resilience Hub application, returned as an
  /// object. This object includes Application Component names, descriptions,
  /// information about whether a recommendation has already been implemented or
  /// not, prerequisites, and more.
  final List<AlarmRecommendation> alarmRecommendations;

  /// Token for the next set of results, or null if there are no more results.
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

class ListAppAssessmentComplianceDriftsResponse {
  /// Indicates compliance drifts (recovery time objective (RTO) and recovery
  /// point objective (RPO)) detected for an assessed entity.
  final List<ComplianceDrift> complianceDrifts;

  /// Token number of the next application to be checked for compliance and
  /// regulatory requirements from the list of applications.
  final String? nextToken;

  ListAppAssessmentComplianceDriftsResponse({
    required this.complianceDrifts,
    this.nextToken,
  });

  factory ListAppAssessmentComplianceDriftsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAppAssessmentComplianceDriftsResponse(
      complianceDrifts: (json['complianceDrifts'] as List)
          .whereNotNull()
          .map((e) => ComplianceDrift.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final complianceDrifts = this.complianceDrifts;
    final nextToken = this.nextToken;
    return {
      'complianceDrifts': complianceDrifts,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAppAssessmentResourceDriftsResponse {
  /// Indicates all the resource drifts detected for an assessed entity.
  final List<ResourceDrift> resourceDrifts;

  /// Null, or the token from a previous call to get the next set of results.
  final String? nextToken;

  ListAppAssessmentResourceDriftsResponse({
    required this.resourceDrifts,
    this.nextToken,
  });

  factory ListAppAssessmentResourceDriftsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAppAssessmentResourceDriftsResponse(
      resourceDrifts: (json['resourceDrifts'] as List)
          .whereNotNull()
          .map((e) => ResourceDrift.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceDrifts = this.resourceDrifts;
    final nextToken = this.nextToken;
    return {
      'resourceDrifts': resourceDrifts,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAppAssessmentsResponse {
  /// The summaries for the specified assessments, returned as an object. This
  /// object includes application versions, associated Amazon Resource Numbers
  /// (ARNs), cost, messages, resiliency scores, and more.
  final List<AppAssessmentSummary> assessmentSummaries;

  /// Token for the next set of results, or null if there are no more results.
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
  /// The compliances for an Resilience Hub Application Component, returned as an
  /// object. This object contains the names of the Application Components,
  /// compliances, costs, resiliency scores, outage scores, and more.
  final List<AppComponentCompliance> componentCompliances;

  /// Token for the next set of results, or null if there are no more results.
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
  /// The recommendations for an Resilience Hub Application Component, returned as
  /// an object. This object contains the names of the Application Components,
  /// configuration recommendations, and recommendation statuses.
  final List<ComponentRecommendation> componentRecommendations;

  /// Token for the next set of results, or null if there are no more results.
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

class ListAppInputSourcesResponse {
  /// The list of Resilience Hub application input sources.
  final List<AppInputSource> appInputSources;

  /// Token for the next set of results, or null if there are no more results.
  final String? nextToken;

  ListAppInputSourcesResponse({
    required this.appInputSources,
    this.nextToken,
  });

  factory ListAppInputSourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListAppInputSourcesResponse(
      appInputSources: (json['appInputSources'] as List)
          .whereNotNull()
          .map((e) => AppInputSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appInputSources = this.appInputSources;
    final nextToken = this.nextToken;
    return {
      'appInputSources': appInputSources,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListAppVersionAppComponentsResponse {
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String appArn;

  /// Resilience Hub application version.
  final String appVersion;

  /// Defines an Application Component.
  final List<AppComponent>? appComponents;

  /// Token for the next set of results, or null if there are no more results.
  final String? nextToken;

  ListAppVersionAppComponentsResponse({
    required this.appArn,
    required this.appVersion,
    this.appComponents,
    this.nextToken,
  });

  factory ListAppVersionAppComponentsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAppVersionAppComponentsResponse(
      appArn: json['appArn'] as String,
      appVersion: json['appVersion'] as String,
      appComponents: (json['appComponents'] as List?)
          ?.whereNotNull()
          .map((e) => AppComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final appVersion = this.appVersion;
    final appComponents = this.appComponents;
    final nextToken = this.nextToken;
    return {
      'appArn': appArn,
      'appVersion': appVersion,
      if (appComponents != null) 'appComponents': appComponents,
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

  /// Token for the next set of results, or null if there are no more results.
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

  /// The ID for a specific resolution.
  final String resolutionId;

  /// Token for the next set of results, or null if there are no more results.
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

  /// Token for the next set of results, or null if there are no more results.
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

  /// Token for the next set of results, or null if there are no more results.
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
  /// Token for the next set of results, or null if there are no more results.
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

  /// Token for the next set of results, or null if there are no more results.
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

  /// Token for the next set of results, or null if there are no more results.
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

  /// Token for the next set of results, or null if there are no more results.
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
  /// Tags assigned to the resource. A tag is a label that you assign to an Amazon
  /// Web Services resource. Each tag consists of a key/value pair.
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

  /// Token for the next set of results, or null if there are no more results.
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

  /// Token for the next set of results, or null if there are no more results.
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
  /// Identifier of the resource.
  final String identifier;

  /// Name of the Amazon Elastic Kubernetes Service cluster and namespace this
  /// resource belongs to.
  /// <note>
  /// This parameter accepts values in "eks-cluster/namespace" format.
  /// </note>
  final String? eksSourceName;

  /// The name of the CloudFormation stack this resource belongs to.
  final String? logicalStackName;

  /// The name of the resource group that this resource belongs to.
  final String? resourceGroupName;

  /// The name of the Terraform S3 state file this resource belongs to.
  final String? terraformSourceName;

  LogicalResourceId({
    required this.identifier,
    this.eksSourceName,
    this.logicalStackName,
    this.resourceGroupName,
    this.terraformSourceName,
  });

  factory LogicalResourceId.fromJson(Map<String, dynamic> json) {
    return LogicalResourceId(
      identifier: json['identifier'] as String,
      eksSourceName: json['eksSourceName'] as String?,
      logicalStackName: json['logicalStackName'] as String?,
      resourceGroupName: json['resourceGroupName'] as String?,
      terraformSourceName: json['terraformSourceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identifier = this.identifier;
    final eksSourceName = this.eksSourceName;
    final logicalStackName = this.logicalStackName;
    final resourceGroupName = this.resourceGroupName;
    final terraformSourceName = this.terraformSourceName;
    return {
      'identifier': identifier,
      if (eksSourceName != null) 'eksSourceName': eksSourceName,
      if (logicalStackName != null) 'logicalStackName': logicalStackName,
      if (resourceGroupName != null) 'resourceGroupName': resourceGroupName,
      if (terraformSourceName != null)
        'terraformSourceName': terraformSourceName,
    };
  }
}

/// Defines the roles and credentials that Resilience Hub would use while
/// creating the application, importing its resources, and running an
/// assessment.
class PermissionModel {
  /// Defines how Resilience Hub scans your resources. It can scan for the
  /// resources by using a pre-existing role in your Amazon Web Services account,
  /// or by using the credentials of the current IAM user.
  final PermissionModelType type;

  /// Defines a list of role Amazon Resource Names (ARNs) to be used in other
  /// accounts. These ARNs are used for querying purposes while importing
  /// resources and assessing your application.
  /// <note>
  /// <ul>
  /// <li>
  /// These ARNs are required only when your resources are in other accounts and
  /// you have different role name in these accounts. Else, the invoker role name
  /// will be used in the other accounts.
  /// </li>
  /// <li>
  /// These roles must have a trust policy with <code>iam:AssumeRole</code>
  /// permission to the invoker role in the primary account.
  /// </li>
  /// </ul> </note>
  final List<String>? crossAccountRoleArns;

  /// Existing Amazon Web Services IAM role name in the primary Amazon Web
  /// Services account that will be assumed by Resilience Hub Service Principle to
  /// obtain a read-only access to your application resources while running an
  /// assessment.
  /// <note>
  /// <ul>
  /// <li>
  /// You must have <code>iam:passRole</code> permission for this role while
  /// creating or updating the application.
  /// </li>
  /// <li>
  /// Currently, <code>invokerRoleName</code> accepts only
  /// <code>[A-Za-z0-9_+=,.@-]</code> characters.
  /// </li>
  /// </ul> </note>
  final String? invokerRoleName;

  PermissionModel({
    required this.type,
    this.crossAccountRoleArns,
    this.invokerRoleName,
  });

  factory PermissionModel.fromJson(Map<String, dynamic> json) {
    return PermissionModel(
      type: (json['type'] as String).toPermissionModelType(),
      crossAccountRoleArns: (json['crossAccountRoleArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      invokerRoleName: json['invokerRoleName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final crossAccountRoleArns = this.crossAccountRoleArns;
    final invokerRoleName = this.invokerRoleName;
    return {
      'type': type.toValue(),
      if (crossAccountRoleArns != null)
        'crossAccountRoleArns': crossAccountRoleArns,
      if (invokerRoleName != null) 'invokerRoleName': invokerRoleName,
    };
  }
}

enum PermissionModelType {
  legacyIAMUser,
  roleBased,
}

extension PermissionModelTypeValueExtension on PermissionModelType {
  String toValue() {
    switch (this) {
      case PermissionModelType.legacyIAMUser:
        return 'LegacyIAMUser';
      case PermissionModelType.roleBased:
        return 'RoleBased';
    }
  }
}

extension PermissionModelTypeFromString on String {
  PermissionModelType toPermissionModelType() {
    switch (this) {
      case 'LegacyIAMUser':
        return PermissionModelType.legacyIAMUser;
      case 'RoleBased':
        return PermissionModelType.roleBased;
    }
    throw Exception('$this is not known in enum PermissionModelType');
  }
}

enum PhysicalIdentifierType {
  arn,
  native,
}

extension PhysicalIdentifierTypeValueExtension on PhysicalIdentifierType {
  String toValue() {
    switch (this) {
      case PhysicalIdentifierType.arn:
        return 'Arn';
      case PhysicalIdentifierType.native:
        return 'Native';
    }
  }
}

extension PhysicalIdentifierTypeFromString on String {
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
/// an Resilience Hub-native identifier.
class PhysicalResource {
  /// Logical identifier of the resource.
  final LogicalResourceId logicalResourceId;

  /// Identifier of the physical resource.
  final PhysicalResourceId physicalResourceId;

  /// Type of resource.
  final String resourceType;

  /// Additional configuration parameters for an Resilience Hub application. If
  /// you want to implement <code>additionalInfo</code> through the Resilience Hub
  /// console rather than using an API call, see <a
  /// href="https://docs.aws.amazon.com/resilience-hub/latest/userguide/app-config-param.html">Configure
  /// the application configuration parameters</a>.
  /// <note>
  /// Currently, this parameter accepts a key-value mapping (in a string format)
  /// of only one failover region and one associated account.
  ///
  /// Key: <code>"failover-regions"</code>
  ///
  /// Value: <code>"[{"region":"&lt;REGION&gt;",
  /// "accounts":[{"id":"&lt;ACCOUNT_ID&gt;"}]}]"</code>
  /// </note>
  final Map<String, List<String>>? additionalInfo;

  /// The application components that belong to this resource.
  final List<AppComponent>? appComponents;

  /// Indicates if a resource is included or excluded from the assessment.
  final bool? excluded;

  /// Name of the parent resource.
  final String? parentResourceName;

  /// The name of the resource.
  final String? resourceName;

  /// Type of input source.
  final ResourceSourceType? sourceType;

  PhysicalResource({
    required this.logicalResourceId,
    required this.physicalResourceId,
    required this.resourceType,
    this.additionalInfo,
    this.appComponents,
    this.excluded,
    this.parentResourceName,
    this.resourceName,
    this.sourceType,
  });

  factory PhysicalResource.fromJson(Map<String, dynamic> json) {
    return PhysicalResource(
      logicalResourceId: LogicalResourceId.fromJson(
          json['logicalResourceId'] as Map<String, dynamic>),
      physicalResourceId: PhysicalResourceId.fromJson(
          json['physicalResourceId'] as Map<String, dynamic>),
      resourceType: json['resourceType'] as String,
      additionalInfo: (json['additionalInfo'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k, (e as List).whereNotNull().map((e) => e as String).toList())),
      appComponents: (json['appComponents'] as List?)
          ?.whereNotNull()
          .map((e) => AppComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      excluded: json['excluded'] as bool?,
      parentResourceName: json['parentResourceName'] as String?,
      resourceName: json['resourceName'] as String?,
      sourceType: (json['sourceType'] as String?)?.toResourceSourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final logicalResourceId = this.logicalResourceId;
    final physicalResourceId = this.physicalResourceId;
    final resourceType = this.resourceType;
    final additionalInfo = this.additionalInfo;
    final appComponents = this.appComponents;
    final excluded = this.excluded;
    final parentResourceName = this.parentResourceName;
    final resourceName = this.resourceName;
    final sourceType = this.sourceType;
    return {
      'logicalResourceId': logicalResourceId,
      'physicalResourceId': physicalResourceId,
      'resourceType': resourceType,
      if (additionalInfo != null) 'additionalInfo': additionalInfo,
      if (appComponents != null) 'appComponents': appComponents,
      if (excluded != null) 'excluded': excluded,
      if (parentResourceName != null) 'parentResourceName': parentResourceName,
      if (resourceName != null) 'resourceName': resourceName,
      if (sourceType != null) 'sourceType': sourceType.toValue(),
    };
  }
}

/// Defines a physical resource identifier.
class PhysicalResourceId {
  /// Identifier of the physical resource.
  final String identifier;

  /// Specifies the type of physical resource identifier.
  /// <dl> <dt>Arn</dt> <dd>
  /// The resource identifier is an Amazon Resource Name (ARN) and it can identify
  /// the following list of resources:
  ///
  /// <ul>
  /// <li>
  /// <code>AWS::ECS::Service</code>
  /// </li>
  /// <li>
  /// <code>AWS::EFS::FileSystem</code>
  /// </li>
  /// <li>
  /// <code>AWS::ElasticLoadBalancingV2::LoadBalancer</code>
  /// </li>
  /// <li>
  /// <code>AWS::Lambda::Function</code>
  /// </li>
  /// <li>
  /// <code>AWS::SNS::Topic</code>
  /// </li>
  /// </ul> </dd> <dt>Native</dt> <dd>
  /// The resource identifier is an Resilience Hub-native identifier and it can
  /// identify the following list of resources:
  ///
  /// <ul>
  /// <li>
  /// <code>AWS::ApiGateway::RestApi</code>
  /// </li>
  /// <li>
  /// <code>AWS::ApiGatewayV2::Api</code>
  /// </li>
  /// <li>
  /// <code>AWS::AutoScaling::AutoScalingGroup</code>
  /// </li>
  /// <li>
  /// <code>AWS::DocDB::DBCluster</code>
  /// </li>
  /// <li>
  /// <code>AWS::DocDB::DBGlobalCluster</code>
  /// </li>
  /// <li>
  /// <code>AWS::DocDB::DBInstance</code>
  /// </li>
  /// <li>
  /// <code>AWS::DynamoDB::GlobalTable</code>
  /// </li>
  /// <li>
  /// <code>AWS::DynamoDB::Table</code>
  /// </li>
  /// <li>
  /// <code>AWS::EC2::EC2Fleet</code>
  /// </li>
  /// <li>
  /// <code>AWS::EC2::Instance</code>
  /// </li>
  /// <li>
  /// <code>AWS::EC2::NatGateway</code>
  /// </li>
  /// <li>
  /// <code>AWS::EC2::Volume</code>
  /// </li>
  /// <li>
  /// <code>AWS::ElasticLoadBalancing::LoadBalancer</code>
  /// </li>
  /// <li>
  /// <code>AWS::RDS::DBCluster</code>
  /// </li>
  /// <li>
  /// <code>AWS::RDS::DBInstance</code>
  /// </li>
  /// <li>
  /// <code>AWS::RDS::GlobalCluster</code>
  /// </li>
  /// <li>
  /// <code>AWS::Route53::RecordSet</code>
  /// </li>
  /// <li>
  /// <code>AWS::S3::Bucket</code>
  /// </li>
  /// <li>
  /// <code>AWS::SQS::Queue</code>
  /// </li>
  /// </ul> </dd> </dl>
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
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String appArn;

  /// The version of the application.
  final String? appVersion;

  /// Identifier of the application version.
  final int? identifier;

  /// Name of the application version.
  final String? versionName;

  PublishAppVersionResponse({
    required this.appArn,
    this.appVersion,
    this.identifier,
    this.versionName,
  });

  factory PublishAppVersionResponse.fromJson(Map<String, dynamic> json) {
    return PublishAppVersionResponse(
      appArn: json['appArn'] as String,
      appVersion: json['appVersion'] as String?,
      identifier: json['identifier'] as int?,
      versionName: json['versionName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final appVersion = this.appVersion;
    final identifier = this.identifier;
    final versionName = this.versionName;
    return {
      'appArn': appArn,
      if (appVersion != null) 'appVersion': appVersion,
      if (identifier != null) 'identifier': identifier,
      if (versionName != null) 'versionName': versionName,
    };
  }
}

class PutDraftAppVersionTemplateResponse {
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
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

extension RecommendationComplianceStatusValueExtension
    on RecommendationComplianceStatus {
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

extension RecommendationComplianceStatusFromString on String {
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

  /// Indicates the reason for excluding an operational recommendation.
  final ExcludeRecommendationReason? excludeReason;

  /// Indicates if an operational recommendation item is excluded.
  final bool? excluded;

  /// Identifier of the resource.
  final String? resourceId;

  /// Identifier of the target account.
  final String? targetAccountId;

  /// The target region.
  final String? targetRegion;

  RecommendationItem({
    this.alreadyImplemented,
    this.excludeReason,
    this.excluded,
    this.resourceId,
    this.targetAccountId,
    this.targetRegion,
  });

  factory RecommendationItem.fromJson(Map<String, dynamic> json) {
    return RecommendationItem(
      alreadyImplemented: json['alreadyImplemented'] as bool?,
      excludeReason:
          (json['excludeReason'] as String?)?.toExcludeRecommendationReason(),
      excluded: json['excluded'] as bool?,
      resourceId: json['resourceId'] as String?,
      targetAccountId: json['targetAccountId'] as String?,
      targetRegion: json['targetRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final alreadyImplemented = this.alreadyImplemented;
    final excludeReason = this.excludeReason;
    final excluded = this.excluded;
    final resourceId = this.resourceId;
    final targetAccountId = this.targetAccountId;
    final targetRegion = this.targetRegion;
    return {
      if (alreadyImplemented != null) 'alreadyImplemented': alreadyImplemented,
      if (excludeReason != null) 'excludeReason': excludeReason.toValue(),
      if (excluded != null) 'excluded': excluded,
      if (resourceId != null) 'resourceId': resourceId,
      if (targetAccountId != null) 'targetAccountId': targetAccountId,
      if (targetRegion != null) 'targetRegion': targetRegion,
    };
  }
}

enum RecommendationStatus {
  implemented,
  inactive,
  notImplemented,
  excluded,
}

extension RecommendationStatusValueExtension on RecommendationStatus {
  String toValue() {
    switch (this) {
      case RecommendationStatus.implemented:
        return 'Implemented';
      case RecommendationStatus.inactive:
        return 'Inactive';
      case RecommendationStatus.notImplemented:
        return 'NotImplemented';
      case RecommendationStatus.excluded:
        return 'Excluded';
    }
  }
}

extension RecommendationStatusFromString on String {
  RecommendationStatus toRecommendationStatus() {
    switch (this) {
      case 'Implemented':
        return RecommendationStatus.implemented;
      case 'Inactive':
        return RecommendationStatus.inactive;
      case 'NotImplemented':
        return RecommendationStatus.notImplemented;
      case 'Excluded':
        return RecommendationStatus.excluded;
    }
    throw Exception('$this is not known in enum RecommendationStatus');
  }
}

/// Defines a recommendation template created with the
/// <a>CreateRecommendationTemplate</a> action.
class RecommendationTemplate {
  /// Amazon Resource Name (ARN) of the assessment. The format for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String assessmentArn;

  /// Format of the recommendation template.
  /// <dl> <dt>CfnJson</dt> <dd>
  /// The template is CloudFormation JSON.
  /// </dd> <dt>CfnYaml</dt> <dd>
  /// The template is CloudFormation YAML.
  /// </dd> </dl>
  final TemplateFormat format;

  /// Name for the recommendation template.
  final String name;

  /// Amazon Resource Name (ARN) for the recommendation template.
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

  /// Status of the action.
  final RecommendationTemplateStatus status;

  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String? appArn;

  /// The end time for the action.
  final DateTime? endTime;

  /// Message for the recommendation template.
  final String? message;

  /// Indicates if replacements are needed.
  final bool? needsReplacements;

  /// Identifiers for the recommendations used in the recommendation template.
  final List<String>? recommendationIds;

  /// The start time for the action.
  final DateTime? startTime;

  /// Tags assigned to the resource. A tag is a label that you assign to an Amazon
  /// Web Services resource. Each tag consists of a key/value pair.
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

extension RecommendationTemplateStatusValueExtension
    on RecommendationTemplateStatus {
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

extension RecommendationTemplateStatusFromString on String {
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
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
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

extension RenderRecommendationTypeValueExtension on RenderRecommendationType {
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

extension RenderRecommendationTypeFromString on String {
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
/// <note>
/// Resilience Hub allows you to provide a value of zero for
/// <code>rtoInSecs</code> and <code>rpoInSecs</code> of your resiliency policy.
/// But, while assessing your application, the lowest possible assessment result
/// is near zero. Hence, if you provide value zero for <code>rtoInSecs</code>
/// and <code>rpoInSecs</code>, the estimated workload RTO and estimated
/// workload RPO result will be near zero and the <b>Compliance status</b> for
/// your application will be set to <b>Policy breached</b>.
/// </note>
class ResiliencyPolicy {
  /// Date and time when the resiliency policy was created.
  final DateTime? creationTime;

  /// Specifies a high-level geographical location constraint for where your
  /// resilience policy data can be stored.
  final DataLocationConstraint? dataLocationConstraint;

  /// Specifies the estimated cost tier of the resiliency policy.
  final EstimatedCostTier? estimatedCostTier;

  /// The resiliency policy.
  final Map<DisruptionType, FailurePolicy>? policy;

  /// Amazon Resource Name (ARN) of the resiliency policy. The format for this ARN
  /// is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:resiliency-policy/<code>policy-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String? policyArn;

  /// The description for the policy.
  final String? policyDescription;

  /// The name of the policy
  final String? policyName;

  /// Tags assigned to the resource. A tag is a label that you assign to an Amazon
  /// Web Services resource. Each tag consists of a key/value pair.
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
  notApplicable,
}

extension ResiliencyPolicyTierValueExtension on ResiliencyPolicyTier {
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
      case ResiliencyPolicyTier.notApplicable:
        return 'NotApplicable';
    }
  }
}

extension ResiliencyPolicyTierFromString on String {
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
      case 'NotApplicable':
        return ResiliencyPolicyTier.notApplicable;
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

  /// The score generated by Resilience Hub for the scoring component after
  /// running an assessment.
  ///
  /// For example, if the <code>score</code> is 25 points, it indicates the
  /// overall score of your application generated by Resilience Hub after running
  /// an assessment.
  final Map<ResiliencyScoreType, ScoringComponentResiliencyScore>?
      componentScore;

  ResiliencyScore({
    required this.disruptionScore,
    required this.score,
    this.componentScore,
  });

  factory ResiliencyScore.fromJson(Map<String, dynamic> json) {
    return ResiliencyScore(
      disruptionScore: (json['disruptionScore'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k.toDisruptionType(), e as double)),
      score: json['score'] as double,
      componentScore: (json['componentScore'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k.toResiliencyScoreType(),
              ScoringComponentResiliencyScore.fromJson(
                  e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final disruptionScore = this.disruptionScore;
    final score = this.score;
    final componentScore = this.componentScore;
    return {
      'disruptionScore':
          disruptionScore.map((k, e) => MapEntry(k.toValue(), e)),
      'score': score,
      if (componentScore != null)
        'componentScore':
            componentScore.map((k, e) => MapEntry(k.toValue(), e)),
    };
  }
}

enum ResiliencyScoreType {
  compliance,
  test,
  alarm,
  sop,
}

extension ResiliencyScoreTypeValueExtension on ResiliencyScoreType {
  String toValue() {
    switch (this) {
      case ResiliencyScoreType.compliance:
        return 'Compliance';
      case ResiliencyScoreType.test:
        return 'Test';
      case ResiliencyScoreType.alarm:
        return 'Alarm';
      case ResiliencyScoreType.sop:
        return 'Sop';
    }
  }
}

extension ResiliencyScoreTypeFromString on String {
  ResiliencyScoreType toResiliencyScoreType() {
    switch (this) {
      case 'Compliance':
        return ResiliencyScoreType.compliance;
      case 'Test':
        return ResiliencyScoreType.test;
      case 'Alarm':
        return ResiliencyScoreType.alarm;
      case 'Sop':
        return ResiliencyScoreType.sop;
    }
    throw Exception('$this is not known in enum ResiliencyScoreType');
  }
}

class ResolveAppVersionResourcesResponse {
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String appArn;

  /// The version of the application.
  final String appVersion;

  /// The identifier for a specific resolution.
  final String resolutionId;

  /// Status of the action.
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

/// Indicates the resources that have drifted in the current application
/// version.
class ResourceDrift {
  /// Amazon Resource Name (ARN) of the application whose resources have drifted.
  /// The format for this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app-assessment/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String? appArn;

  /// Version of the application whose resources have drifted.
  final String? appVersion;

  /// Indicates if the resource was added or removed.
  final DifferenceType? diffType;

  /// Reference identifier of the resource drift.
  final String? referenceId;

  /// Identifier of the drifted resource.
  final ResourceIdentifier? resourceIdentifier;

  ResourceDrift({
    this.appArn,
    this.appVersion,
    this.diffType,
    this.referenceId,
    this.resourceIdentifier,
  });

  factory ResourceDrift.fromJson(Map<String, dynamic> json) {
    return ResourceDrift(
      appArn: json['appArn'] as String?,
      appVersion: json['appVersion'] as String?,
      diffType: (json['diffType'] as String?)?.toDifferenceType(),
      referenceId: json['referenceId'] as String?,
      resourceIdentifier: json['resourceIdentifier'] != null
          ? ResourceIdentifier.fromJson(
              json['resourceIdentifier'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final appVersion = this.appVersion;
    final diffType = this.diffType;
    final referenceId = this.referenceId;
    final resourceIdentifier = this.resourceIdentifier;
    return {
      if (appArn != null) 'appArn': appArn,
      if (appVersion != null) 'appVersion': appVersion,
      if (diffType != null) 'diffType': diffType.toValue(),
      if (referenceId != null) 'referenceId': referenceId,
      if (resourceIdentifier != null) 'resourceIdentifier': resourceIdentifier,
    };
  }
}

/// Defines application resource errors.
class ResourceError {
  /// Identifier of the logical resource.
  final String? logicalResourceId;

  /// Identifier of the physical resource.
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

/// Defines a resource identifier for the drifted resource.
class ResourceIdentifier {
  /// Logical identifier of the drifted resource.
  final LogicalResourceId? logicalResourceId;

  /// Type of the drifted resource.
  final String? resourceType;

  ResourceIdentifier({
    this.logicalResourceId,
    this.resourceType,
  });

  factory ResourceIdentifier.fromJson(Map<String, dynamic> json) {
    return ResourceIdentifier(
      logicalResourceId: json['logicalResourceId'] != null
          ? LogicalResourceId.fromJson(
              json['logicalResourceId'] as Map<String, dynamic>)
          : null,
      resourceType: json['resourceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logicalResourceId = this.logicalResourceId;
    final resourceType = this.resourceType;
    return {
      if (logicalResourceId != null) 'logicalResourceId': logicalResourceId,
      if (resourceType != null) 'resourceType': resourceType,
    };
  }
}

enum ResourceImportStatusType {
  pending,
  inProgress,
  failed,
  success,
}

extension ResourceImportStatusTypeValueExtension on ResourceImportStatusType {
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

extension ResourceImportStatusTypeFromString on String {
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

enum ResourceImportStrategyType {
  addOnly,
  replaceAll,
}

extension ResourceImportStrategyTypeValueExtension
    on ResourceImportStrategyType {
  String toValue() {
    switch (this) {
      case ResourceImportStrategyType.addOnly:
        return 'AddOnly';
      case ResourceImportStrategyType.replaceAll:
        return 'ReplaceAll';
    }
  }
}

extension ResourceImportStrategyTypeFromString on String {
  ResourceImportStrategyType toResourceImportStrategyType() {
    switch (this) {
      case 'AddOnly':
        return ResourceImportStrategyType.addOnly;
      case 'ReplaceAll':
        return ResourceImportStrategyType.replaceAll;
    }
    throw Exception('$this is not known in enum ResourceImportStrategyType');
  }
}

/// Defines a resource mapping.
class ResourceMapping {
  /// Specifies the type of resource mapping.
  final ResourceMappingType mappingType;

  /// Identifier of the physical resource.
  final PhysicalResourceId physicalResourceId;

  /// Name of the application this resource is mapped to when the
  /// <code>mappingType</code> is <code>AppRegistryApp</code>.
  final String? appRegistryAppName;

  /// Name of the Amazon Elastic Kubernetes Service cluster and namespace that
  /// this resource is mapped to when the <code>mappingType</code> is
  /// <code>EKS</code>.
  /// <note>
  /// This parameter accepts values in "eks-cluster/namespace" format.
  /// </note>
  final String? eksSourceName;

  /// Name of the CloudFormation stack this resource is mapped to when the
  /// <code>mappingType</code> is <code>CfnStack</code>.
  final String? logicalStackName;

  /// Name of the Resource Groups that this resource is mapped to when the
  /// <code>mappingType</code> is <code>ResourceGroup</code>.
  final String? resourceGroupName;

  /// Name of the resource that this resource is mapped to when the
  /// <code>mappingType</code> is <code>Resource</code>.
  final String? resourceName;

  /// Name of the Terraform source that this resource is mapped to when the
  /// <code>mappingType</code> is <code>Terraform</code>.
  final String? terraformSourceName;

  ResourceMapping({
    required this.mappingType,
    required this.physicalResourceId,
    this.appRegistryAppName,
    this.eksSourceName,
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
      eksSourceName: json['eksSourceName'] as String?,
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
    final eksSourceName = this.eksSourceName;
    final logicalStackName = this.logicalStackName;
    final resourceGroupName = this.resourceGroupName;
    final resourceName = this.resourceName;
    final terraformSourceName = this.terraformSourceName;
    return {
      'mappingType': mappingType.toValue(),
      'physicalResourceId': physicalResourceId,
      if (appRegistryAppName != null) 'appRegistryAppName': appRegistryAppName,
      if (eksSourceName != null) 'eksSourceName': eksSourceName,
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
  eks,
}

extension ResourceMappingTypeValueExtension on ResourceMappingType {
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
      case ResourceMappingType.eks:
        return 'EKS';
    }
  }
}

extension ResourceMappingTypeFromString on String {
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
      case 'EKS':
        return ResourceMappingType.eks;
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

extension ResourceResolutionStatusTypeValueExtension
    on ResourceResolutionStatusType {
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

extension ResourceResolutionStatusTypeFromString on String {
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

enum ResourceSourceType {
  appTemplate,
  discovered,
}

extension ResourceSourceTypeValueExtension on ResourceSourceType {
  String toValue() {
    switch (this) {
      case ResourceSourceType.appTemplate:
        return 'AppTemplate';
      case ResourceSourceType.discovered:
        return 'Discovered';
    }
  }
}

extension ResourceSourceTypeFromString on String {
  ResourceSourceType toResourceSourceType() {
    switch (this) {
      case 'AppTemplate':
        return ResourceSourceType.appTemplate;
      case 'Discovered':
        return ResourceSourceType.discovered;
    }
    throw Exception('$this is not known in enum ResourceSourceType');
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

/// Resiliency score of each scoring component. For more information about
/// scoring component, see <a
/// href="https://docs.aws.amazon.com/resilience-hub/latest/userguide/calculate-score.html">Calculating
/// resiliency score</a>.
class ScoringComponentResiliencyScore {
  /// Number of recommendations that were excluded from the assessment.
  ///
  /// For example, if the <code>excludedCount</code> for Alarms coverage scoring
  /// component is 7, it indicates that 7 Amazon CloudWatch alarms are excluded
  /// from the assessment.
  final int? excludedCount;

  /// Number of recommendations that must be implemented to obtain the maximum
  /// possible score for the scoring component. For SOPs, alarms, and tests, these
  /// are the number of recommendations that must be implemented. For compliance,
  /// these are the number of Application Components that have breached the
  /// resiliency policy.
  ///
  /// For example, if the <code>outstandingCount</code> for Alarms coverage
  /// scoring component is 5, it indicates that 5 Amazon CloudWatch alarms need to
  /// be implemented to achieve the maximum possible score.
  final int? outstandingCount;

  /// Maximum possible score that can be obtained for the scoring component.
  ///
  /// For example, if the <code>possibleScore</code> is 20 points, it indicates
  /// the maximum possible score you can achieve for the scoring component when
  /// you run a new assessment after implementing all the Resilience Hub
  /// recommendations.
  final double? possibleScore;

  /// Resiliency score points given for the scoring component. The score is always
  /// less than or equal to the <code>possibleScore</code>.
  final double? score;

  ScoringComponentResiliencyScore({
    this.excludedCount,
    this.outstandingCount,
    this.possibleScore,
    this.score,
  });

  factory ScoringComponentResiliencyScore.fromJson(Map<String, dynamic> json) {
    return ScoringComponentResiliencyScore(
      excludedCount: json['excludedCount'] as int?,
      outstandingCount: json['outstandingCount'] as int?,
      possibleScore: json['possibleScore'] as double?,
      score: json['score'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final excludedCount = this.excludedCount;
    final outstandingCount = this.outstandingCount;
    final possibleScore = this.possibleScore;
    final score = this.score;
    return {
      if (excludedCount != null) 'excludedCount': excludedCount,
      if (outstandingCount != null) 'outstandingCount': outstandingCount,
      if (possibleScore != null) 'possibleScore': possibleScore,
      if (score != null) 'score': score,
    };
  }
}

/// Defines a standard operating procedure (SOP) recommendation.
class SopRecommendation {
  /// Identifier for the SOP recommendation.
  final String recommendationId;

  /// Reference identifier for the SOP recommendation.
  final String referenceId;

  /// The service type.
  final SopServiceType serviceType;

  /// Name of the Application Component.
  final String? appComponentName;

  /// Description of the SOP recommendation.
  final String? description;

  /// The recommendation items.
  final List<RecommendationItem>? items;

  /// Name of the SOP recommendation.
  final String? name;

  /// Prerequisite for the SOP recommendation.
  final String? prerequisite;

  /// Status of the recommended standard operating procedure.
  final RecommendationStatus? recommendationStatus;

  SopRecommendation({
    required this.recommendationId,
    required this.referenceId,
    required this.serviceType,
    this.appComponentName,
    this.description,
    this.items,
    this.name,
    this.prerequisite,
    this.recommendationStatus,
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
      recommendationStatus:
          (json['recommendationStatus'] as String?)?.toRecommendationStatus(),
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
    final recommendationStatus = this.recommendationStatus;
    return {
      'recommendationId': recommendationId,
      'referenceId': referenceId,
      'serviceType': serviceType.toValue(),
      if (appComponentName != null) 'appComponentName': appComponentName,
      if (description != null) 'description': description,
      if (items != null) 'items': items,
      if (name != null) 'name': name,
      if (prerequisite != null) 'prerequisite': prerequisite,
      if (recommendationStatus != null)
        'recommendationStatus': recommendationStatus.toValue(),
    };
  }
}

enum SopServiceType {
  ssm,
}

extension SopServiceTypeValueExtension on SopServiceType {
  String toValue() {
    switch (this) {
      case SopServiceType.ssm:
        return 'SSM';
    }
  }
}

extension SopServiceTypeFromString on String {
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

extension TemplateFormatValueExtension on TemplateFormat {
  String toValue() {
    switch (this) {
      case TemplateFormat.cfnYaml:
        return 'CfnYaml';
      case TemplateFormat.cfnJson:
        return 'CfnJson';
    }
  }
}

extension TemplateFormatFromString on String {
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
  /// The URL of the Terraform s3 state file you need to import.
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
  /// Reference identifier for the test recommendation.
  final String referenceId;

  /// Name of the Application Component.
  final String? appComponentName;

  /// A list of recommended alarms that are used in the test and must be exported
  /// before or with the test.
  final List<String>? dependsOnAlarms;

  /// Description for the test recommendation.
  final String? description;

  /// Intent of the test recommendation.
  final String? intent;

  /// The test recommendation items.
  final List<RecommendationItem>? items;

  /// Name of the test recommendation.
  final String? name;

  /// Prerequisite of the test recommendation.
  final String? prerequisite;

  /// Identifier for the test recommendation.
  final String? recommendationId;

  /// Status of the recommended test.
  final RecommendationStatus? recommendationStatus;

  /// Level of risk for this test recommendation.
  final TestRisk? risk;

  /// Type of test recommendation.
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
    this.recommendationStatus,
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
      recommendationStatus:
          (json['recommendationStatus'] as String?)?.toRecommendationStatus(),
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
    final recommendationStatus = this.recommendationStatus;
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
      if (recommendationStatus != null)
        'recommendationStatus': recommendationStatus.toValue(),
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

extension TestRiskValueExtension on TestRisk {
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

extension TestRiskFromString on String {
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

extension TestTypeValueExtension on TestType {
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

extension TestTypeFromString on String {
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
  /// Logical resource identifier for the unsupported resource.
  final LogicalResourceId logicalResourceId;

  /// Physical resource identifier for the unsupported resource.
  final PhysicalResourceId physicalResourceId;

  /// The type of resource.
  final String resourceType;

  /// The status of the unsupported resource.
  final String? unsupportedResourceStatus;

  UnsupportedResource({
    required this.logicalResourceId,
    required this.physicalResourceId,
    required this.resourceType,
    this.unsupportedResourceStatus,
  });

  factory UnsupportedResource.fromJson(Map<String, dynamic> json) {
    return UnsupportedResource(
      logicalResourceId: LogicalResourceId.fromJson(
          json['logicalResourceId'] as Map<String, dynamic>),
      physicalResourceId: PhysicalResourceId.fromJson(
          json['physicalResourceId'] as Map<String, dynamic>),
      resourceType: json['resourceType'] as String,
      unsupportedResourceStatus: json['unsupportedResourceStatus'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logicalResourceId = this.logicalResourceId;
    final physicalResourceId = this.physicalResourceId;
    final resourceType = this.resourceType;
    final unsupportedResourceStatus = this.unsupportedResourceStatus;
    return {
      'logicalResourceId': logicalResourceId,
      'physicalResourceId': physicalResourceId,
      'resourceType': resourceType,
      if (unsupportedResourceStatus != null)
        'unsupportedResourceStatus': unsupportedResourceStatus,
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

class UpdateAppVersionAppComponentResponse {
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String appArn;

  /// Resilience Hub application version.
  final String appVersion;

  /// List of Application Components that belong to this resource.
  final AppComponent? appComponent;

  UpdateAppVersionAppComponentResponse({
    required this.appArn,
    required this.appVersion,
    this.appComponent,
  });

  factory UpdateAppVersionAppComponentResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateAppVersionAppComponentResponse(
      appArn: json['appArn'] as String,
      appVersion: json['appVersion'] as String,
      appComponent: json['appComponent'] != null
          ? AppComponent.fromJson(json['appComponent'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final appVersion = this.appVersion;
    final appComponent = this.appComponent;
    return {
      'appArn': appArn,
      'appVersion': appVersion,
      if (appComponent != null) 'appComponent': appComponent,
    };
  }
}

class UpdateAppVersionResourceResponse {
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String appArn;

  /// Resilience Hub application version.
  final String appVersion;

  /// Defines a physical resource. A physical resource is a resource that exists
  /// in your account. It can be identified using an Amazon Resource Name (ARN) or
  /// a Resilience Hub-native identifier.
  final PhysicalResource? physicalResource;

  UpdateAppVersionResourceResponse({
    required this.appArn,
    required this.appVersion,
    this.physicalResource,
  });

  factory UpdateAppVersionResourceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAppVersionResourceResponse(
      appArn: json['appArn'] as String,
      appVersion: json['appVersion'] as String,
      physicalResource: json['physicalResource'] != null
          ? PhysicalResource.fromJson(
              json['physicalResource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final appVersion = this.appVersion;
    final physicalResource = this.physicalResource;
    return {
      'appArn': appArn,
      'appVersion': appVersion,
      if (physicalResource != null) 'physicalResource': physicalResource,
    };
  }
}

class UpdateAppVersionResponse {
  /// Amazon Resource Name (ARN) of the Resilience Hub application. The format for
  /// this ARN is:
  /// arn:<code>partition</code>:resiliencehub:<code>region</code>:<code>account</code>:app/<code>app-id</code>.
  /// For more information about ARNs, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">
  /// Amazon Resource Names (ARNs)</a> in the <i>Amazon Web Services General
  /// Reference</i> guide.
  final String appArn;

  /// Resilience Hub application version.
  final String appVersion;

  /// Additional configuration parameters for an Resilience Hub application. If
  /// you want to implement <code>additionalInfo</code> through the Resilience Hub
  /// console rather than using an API call, see <a
  /// href="https://docs.aws.amazon.com/resilience-hub/latest/userguide/app-config-param.html">Configure
  /// the application configuration parameters</a>.
  /// <note>
  /// Currently, this parameter supports only failover region and account.
  /// </note>
  final Map<String, List<String>>? additionalInfo;

  UpdateAppVersionResponse({
    required this.appArn,
    required this.appVersion,
    this.additionalInfo,
  });

  factory UpdateAppVersionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAppVersionResponse(
      appArn: json['appArn'] as String,
      appVersion: json['appVersion'] as String,
      additionalInfo: (json['additionalInfo'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k, (e as List).whereNotNull().map((e) => e as String).toList())),
    );
  }

  Map<String, dynamic> toJson() {
    final appArn = this.appArn;
    final appVersion = this.appVersion;
    final additionalInfo = this.additionalInfo;
    return {
      'appArn': appArn,
      'appVersion': appVersion,
      if (additionalInfo != null) 'additionalInfo': additionalInfo,
    };
  }
}

/// Defines the operational recommendation item that needs a status update.
class UpdateRecommendationStatusItem {
  /// Resource identifier of the operational recommendation item.
  final String? resourceId;

  /// Identifier of the target Amazon Web Services account.
  final String? targetAccountId;

  /// Identifier of the target Amazon Web Services Region.
  final String? targetRegion;

  UpdateRecommendationStatusItem({
    this.resourceId,
    this.targetAccountId,
    this.targetRegion,
  });

  factory UpdateRecommendationStatusItem.fromJson(Map<String, dynamic> json) {
    return UpdateRecommendationStatusItem(
      resourceId: json['resourceId'] as String?,
      targetAccountId: json['targetAccountId'] as String?,
      targetRegion: json['targetRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceId = this.resourceId;
    final targetAccountId = this.targetAccountId;
    final targetRegion = this.targetRegion;
    return {
      if (resourceId != null) 'resourceId': resourceId,
      if (targetAccountId != null) 'targetAccountId': targetAccountId,
      if (targetRegion != null) 'targetRegion': targetRegion,
    };
  }
}

/// Defines the operational recommendation item that is to be included or
/// excluded.
class UpdateRecommendationStatusRequestEntry {
  /// An identifier for an entry in this batch that is used to communicate the
  /// result.
  /// <note>
  /// The <code>entryId</code>s of a batch request need to be unique within a
  /// request.
  /// </note>
  final String entryId;

  /// Indicates if the operational recommendation needs to be excluded. If set to
  /// True, the operational recommendation will be excluded.
  final bool excluded;

  /// The operational recommendation item.
  final UpdateRecommendationStatusItem item;

  /// Reference identifier of the operational recommendation item.
  final String referenceId;

  /// Indicates the reason for excluding an operational recommendation.
  final ExcludeRecommendationReason? excludeReason;

  UpdateRecommendationStatusRequestEntry({
    required this.entryId,
    required this.excluded,
    required this.item,
    required this.referenceId,
    this.excludeReason,
  });

  Map<String, dynamic> toJson() {
    final entryId = this.entryId;
    final excluded = this.excluded;
    final item = this.item;
    final referenceId = this.referenceId;
    final excludeReason = this.excludeReason;
    return {
      'entryId': entryId,
      'excluded': excluded,
      'item': item,
      'referenceId': referenceId,
      if (excludeReason != null) 'excludeReason': excludeReason.toValue(),
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
