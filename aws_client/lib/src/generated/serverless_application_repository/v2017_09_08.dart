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

/// The AWS Serverless Application Repository makes it easy for developers and
/// enterprises to quickly find
/// and deploy serverless applications in the AWS Cloud. For more information
/// about serverless applications,
/// see Serverless Computing and Applications on the AWS website.
///
/// The AWS Serverless Application Repository is deeply integrated with the AWS
/// Lambda console, so that developers of
/// all levels can get started with serverless computing without needing to
/// learn anything new. You can use category
/// keywords to browse for applications such as web and mobile backends, data
/// processing applications, or chatbots.
/// You can also search for applications by name, publisher, or event source. To
/// use an application, you simply choose it,
/// configure any required fields, and deploy it with a few clicks.
///
/// You can also easily publish applications, sharing them publicly with the
/// community at large, or privately
/// within your team or across your organization. To publish a serverless
/// application (or app), you can use the
/// AWS Management Console, AWS Command Line Interface (AWS CLI), or AWS SDKs to
/// upload the code. Along with the
/// code, you upload a simple manifest file, also known as the AWS Serverless
/// Application Model (AWS SAM) template.
/// For more information about AWS SAM, see AWS Serverless Application Model
/// (AWS SAM) on the AWS Labs
/// GitHub repository.
///
/// The AWS Serverless Application Repository Developer Guide contains more
/// information about the two developer
/// experiences available:
///
/// <ul>
///
/// <li>
///
/// Consuming Applications – Browse for applications and view information about
/// them, including
/// source code and readme files. Also install, configure, and deploy
/// applications of your choosing.
///
///
/// Publishing Applications – Configure and upload applications to make them
/// available to other
/// developers, and publish new versions of applications.
///
/// </li>
///
/// </ul>
class ServerlessApplicationRepository {
  final _s.RestJsonProtocol _protocol;
  ServerlessApplicationRepository({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'serverlessrepo',
            signingName: 'serverlessrepo',
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

  /// Creates an application, optionally including an AWS SAM file to create the
  /// first application version in the same call.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [author] :
  /// The name of the author publishing the app.
  ///
  /// Minimum length=1. Maximum length=127.
  ///
  /// Pattern "^[a-z0-9](([a-z0-9]|-(?!-))*[a-z0-9])?$";
  ///
  /// Parameter [description] :
  /// The description of the application.
  ///
  /// Minimum length=1. Maximum length=256
  ///
  /// Parameter [name] :
  /// The name of the application that you want to publish.
  ///
  /// Minimum length=1. Maximum length=140
  ///
  /// Pattern: "[a-zA-Z0-9\\-]+";
  ///
  /// Parameter [homePageUrl] :
  /// A URL with more information about the application, for example the
  /// location of your GitHub repository for the application.
  ///
  /// Parameter [labels] :
  /// Labels to improve discovery of apps in search results.
  ///
  /// Minimum length=1. Maximum length=127. Maximum number of labels: 10
  ///
  /// Pattern: "^[a-zA-Z0-9+\\-_:\\/@]+$";
  ///
  /// Parameter [licenseBody] :
  /// A local text file that contains the license of the app that matches the
  /// spdxLicenseID value of your application.
  /// The file has the format file://&lt;path>/&lt;filename>.
  ///
  /// Maximum size 5 MB
  ///
  /// You can specify only one of licenseBody and licenseUrl; otherwise, an
  /// error results.
  ///
  /// Parameter [licenseUrl] :
  /// A link to the S3 object that contains the license of the app that matches
  /// the spdxLicenseID value of your application.
  ///
  /// Maximum size 5 MB
  ///
  /// You can specify only one of licenseBody and licenseUrl; otherwise, an
  /// error results.
  ///
  /// Parameter [readmeBody] :
  /// A local text readme file in Markdown language that contains a more
  /// detailed description of the application and how it works.
  /// The file has the format file://&lt;path>/&lt;filename>.
  ///
  /// Maximum size 5 MB
  ///
  /// You can specify only one of readmeBody and readmeUrl; otherwise, an error
  /// results.
  ///
  /// Parameter [readmeUrl] :
  /// A link to the S3 object in Markdown language that contains a more detailed
  /// description of the application and how it works.
  ///
  /// Maximum size 5 MB
  ///
  /// You can specify only one of readmeBody and readmeUrl; otherwise, an error
  /// results.
  ///
  /// Parameter [semanticVersion] :
  /// The semantic version of the application:
  ///
  ///
  /// <a href="https://semver.org/">https://semver.org/</a>
  ///
  ///
  /// Parameter [sourceCodeArchiveUrl] :
  /// A link to the S3 object that contains the ZIP archive of the source code
  /// for this version of your application.
  ///
  /// Maximum size 50 MB
  ///
  /// Parameter [sourceCodeUrl] :
  /// A link to a public repository for the source code of your application, for
  /// example the URL of a specific GitHub commit.
  ///
  /// Parameter [spdxLicenseId] :
  /// A valid identifier from <a
  /// href="https://spdx.org/licenses/">https://spdx.org/licenses/</a>.
  ///
  /// Parameter [templateBody] :
  /// The local raw packaged AWS SAM template file of your application.
  /// The file has the format file://&lt;path>/&lt;filename>.
  ///
  /// You can specify only one of templateBody and templateUrl; otherwise an
  /// error results.
  ///
  /// Parameter [templateUrl] :
  /// A link to the S3 object containing the packaged AWS SAM template of your
  /// application.
  ///
  /// You can specify only one of templateBody and templateUrl; otherwise an
  /// error results.
  Future<CreateApplicationResponse> createApplication({
    required String author,
    required String description,
    required String name,
    String? homePageUrl,
    List<String>? labels,
    String? licenseBody,
    String? licenseUrl,
    String? readmeBody,
    String? readmeUrl,
    String? semanticVersion,
    String? sourceCodeArchiveUrl,
    String? sourceCodeUrl,
    String? spdxLicenseId,
    String? templateBody,
    String? templateUrl,
  }) async {
    final $payload = <String, dynamic>{
      'author': author,
      'description': description,
      'name': name,
      if (homePageUrl != null) 'homePageUrl': homePageUrl,
      if (labels != null) 'labels': labels,
      if (licenseBody != null) 'licenseBody': licenseBody,
      if (licenseUrl != null) 'licenseUrl': licenseUrl,
      if (readmeBody != null) 'readmeBody': readmeBody,
      if (readmeUrl != null) 'readmeUrl': readmeUrl,
      if (semanticVersion != null) 'semanticVersion': semanticVersion,
      if (sourceCodeArchiveUrl != null)
        'sourceCodeArchiveUrl': sourceCodeArchiveUrl,
      if (sourceCodeUrl != null) 'sourceCodeUrl': sourceCodeUrl,
      if (spdxLicenseId != null) 'spdxLicenseId': spdxLicenseId,
      if (templateBody != null) 'templateBody': templateBody,
      if (templateUrl != null) 'templateUrl': templateUrl,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/applications',
      exceptionFnMap: _exceptionFns,
    );
    return CreateApplicationResponse.fromJson(response);
  }

  /// Creates an application version.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [applicationId] :
  /// The Amazon Resource Name (ARN) of the application.
  ///
  /// Parameter [semanticVersion] :
  /// The semantic version of the new version.
  ///
  /// Parameter [sourceCodeArchiveUrl] :
  /// A link to the S3 object that contains the ZIP archive of the source code
  /// for this version of your application.
  ///
  /// Maximum size 50 MB
  ///
  /// Parameter [sourceCodeUrl] :
  /// A link to a public repository for the source code of your application, for
  /// example the URL of a specific GitHub commit.
  ///
  /// Parameter [templateBody] :
  /// The raw packaged AWS SAM template of your application.
  ///
  /// Parameter [templateUrl] :
  /// A link to the packaged AWS SAM template of your application.
  Future<CreateApplicationVersionResponse> createApplicationVersion({
    required String applicationId,
    required String semanticVersion,
    String? sourceCodeArchiveUrl,
    String? sourceCodeUrl,
    String? templateBody,
    String? templateUrl,
  }) async {
    final $payload = <String, dynamic>{
      if (sourceCodeArchiveUrl != null)
        'sourceCodeArchiveUrl': sourceCodeArchiveUrl,
      if (sourceCodeUrl != null) 'sourceCodeUrl': sourceCodeUrl,
      if (templateBody != null) 'templateBody': templateBody,
      if (templateUrl != null) 'templateUrl': templateUrl,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/versions/${Uri.encodeComponent(semanticVersion)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateApplicationVersionResponse.fromJson(response);
  }

  /// Creates an AWS CloudFormation change set for the given application.
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [applicationId] :
  /// The Amazon Resource Name (ARN) of the application.
  ///
  /// Parameter [stackName] :
  /// This property corresponds to the parameter of the same name for the <i>AWS
  /// CloudFormation <a
  /// href="https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/CreateChangeSet">CreateChangeSet</a>
  /// </i> API.
  ///
  /// Parameter [capabilities] :
  /// A list of values that you must specify before you can deploy certain
  /// applications.
  /// Some applications might include resources that can affect permissions in
  /// your AWS
  /// account, for example, by creating new AWS Identity and Access Management
  /// (IAM) users.
  /// For those applications, you must explicitly acknowledge their capabilities
  /// by
  /// specifying this parameter.
  ///
  /// The only valid values are CAPABILITY_IAM, CAPABILITY_NAMED_IAM,
  /// CAPABILITY_RESOURCE_POLICY, and CAPABILITY_AUTO_EXPAND.
  ///
  /// The following resources require you to specify CAPABILITY_IAM or
  /// CAPABILITY_NAMED_IAM:
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html">AWS::IAM::Group</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html">AWS::IAM::InstanceProfile</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-policy.html">AWS::IAM::Policy</a>,
  /// and
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html">AWS::IAM::Role</a>.
  /// If the application contains IAM resources, you can specify either
  /// CAPABILITY_IAM
  /// or CAPABILITY_NAMED_IAM. If the application contains IAM resources
  /// with custom names, you must specify CAPABILITY_NAMED_IAM.
  ///
  /// The following resources require you to specify CAPABILITY_RESOURCE_POLICY:
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-lambda-permission.html">AWS::Lambda::Permission</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-policy.html">AWS::IAM:Policy</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-applicationautoscaling-scalingpolicy.html">AWS::ApplicationAutoScaling::ScalingPolicy</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-s3-policy.html">AWS::S3::BucketPolicy</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-sqs-policy.html">AWS::SQS::QueuePolicy</a>,
  /// and
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-sns-policy.html">AWS::SNS:TopicPolicy</a>.
  ///
  /// Applications that contain one or more nested applications require you to
  /// specify
  /// CAPABILITY_AUTO_EXPAND.
  ///
  /// If your application template contains any of the above resources, we
  /// recommend that you review
  /// all permissions associated with the application before deploying. If you
  /// don't specify
  /// this parameter for an application that requires capabilities, the call
  /// will fail.
  ///
  /// Parameter [changeSetName] :
  /// This property corresponds to the parameter of the same name for the <i>AWS
  /// CloudFormation <a
  /// href="https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/CreateChangeSet">CreateChangeSet</a>
  /// </i> API.
  ///
  /// Parameter [clientToken] :
  /// This property corresponds to the parameter of the same name for the <i>AWS
  /// CloudFormation <a
  /// href="https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/CreateChangeSet">CreateChangeSet</a>
  /// </i> API.
  ///
  /// Parameter [description] :
  /// This property corresponds to the parameter of the same name for the <i>AWS
  /// CloudFormation <a
  /// href="https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/CreateChangeSet">CreateChangeSet</a>
  /// </i> API.
  ///
  /// Parameter [notificationArns] :
  /// This property corresponds to the parameter of the same name for the <i>AWS
  /// CloudFormation <a
  /// href="https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/CreateChangeSet">CreateChangeSet</a>
  /// </i> API.
  ///
  /// Parameter [parameterOverrides] :
  /// A list of parameter values for the parameters of the application.
  ///
  /// Parameter [resourceTypes] :
  /// This property corresponds to the parameter of the same name for the <i>AWS
  /// CloudFormation <a
  /// href="https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/CreateChangeSet">CreateChangeSet</a>
  /// </i> API.
  ///
  /// Parameter [rollbackConfiguration] :
  /// This property corresponds to the parameter of the same name for the <i>AWS
  /// CloudFormation <a
  /// href="https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/CreateChangeSet">CreateChangeSet</a>
  /// </i> API.
  ///
  /// Parameter [semanticVersion] :
  /// The semantic version of the application:
  ///
  ///
  /// <a href="https://semver.org/">https://semver.org/</a>
  ///
  ///
  /// Parameter [tags] :
  /// This property corresponds to the parameter of the same name for the <i>AWS
  /// CloudFormation <a
  /// href="https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/CreateChangeSet">CreateChangeSet</a>
  /// </i> API.
  ///
  /// Parameter [templateId] :
  /// The UUID returned by CreateCloudFormationTemplate.
  ///
  /// Pattern:
  /// [0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}
  Future<CreateCloudFormationChangeSetResponse> createCloudFormationChangeSet({
    required String applicationId,
    required String stackName,
    List<String>? capabilities,
    String? changeSetName,
    String? clientToken,
    String? description,
    List<String>? notificationArns,
    List<ParameterValue>? parameterOverrides,
    List<String>? resourceTypes,
    RollbackConfiguration? rollbackConfiguration,
    String? semanticVersion,
    List<Tag>? tags,
    String? templateId,
  }) async {
    final $payload = <String, dynamic>{
      'stackName': stackName,
      if (capabilities != null) 'capabilities': capabilities,
      if (changeSetName != null) 'changeSetName': changeSetName,
      if (clientToken != null) 'clientToken': clientToken,
      if (description != null) 'description': description,
      if (notificationArns != null) 'notificationArns': notificationArns,
      if (parameterOverrides != null) 'parameterOverrides': parameterOverrides,
      if (resourceTypes != null) 'resourceTypes': resourceTypes,
      if (rollbackConfiguration != null)
        'rollbackConfiguration': rollbackConfiguration,
      if (semanticVersion != null) 'semanticVersion': semanticVersion,
      if (tags != null) 'tags': tags,
      if (templateId != null) 'templateId': templateId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/changesets',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCloudFormationChangeSetResponse.fromJson(response);
  }

  /// Creates an AWS CloudFormation template.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [applicationId] :
  /// The Amazon Resource Name (ARN) of the application.
  ///
  /// Parameter [semanticVersion] :
  /// The semantic version of the application:
  ///
  ///
  /// <a href="https://semver.org/">https://semver.org/</a>
  ///
  Future<CreateCloudFormationTemplateResponse> createCloudFormationTemplate({
    required String applicationId,
    String? semanticVersion,
  }) async {
    final $payload = <String, dynamic>{
      if (semanticVersion != null) 'semanticVersion': semanticVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/templates',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCloudFormationTemplateResponse.fromJson(response);
  }

  /// Deletes the specified application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [applicationId] :
  /// The Amazon Resource Name (ARN) of the application.
  Future<void> deleteApplication({
    required String applicationId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets the specified application.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [applicationId] :
  /// The Amazon Resource Name (ARN) of the application.
  ///
  /// Parameter [semanticVersion] :
  /// The semantic version of the application to get.
  Future<GetApplicationResponse> getApplication({
    required String applicationId,
    String? semanticVersion,
  }) async {
    final $query = <String, List<String>>{
      if (semanticVersion != null) 'semanticVersion': [semanticVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetApplicationResponse.fromJson(response);
  }

  /// Retrieves the policy for the application.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [applicationId] :
  /// The Amazon Resource Name (ARN) of the application.
  Future<GetApplicationPolicyResponse> getApplicationPolicy({
    required String applicationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return GetApplicationPolicyResponse.fromJson(response);
  }

  /// Gets the specified AWS CloudFormation template.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [applicationId] :
  /// The Amazon Resource Name (ARN) of the application.
  ///
  /// Parameter [templateId] :
  /// The UUID returned by CreateCloudFormationTemplate.
  ///
  /// Pattern:
  /// [0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}
  Future<GetCloudFormationTemplateResponse> getCloudFormationTemplate({
    required String applicationId,
    required String templateId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/templates/${Uri.encodeComponent(templateId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCloudFormationTemplateResponse.fromJson(response);
  }

  /// Retrieves the list of applications nested in the containing application.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [applicationId] :
  /// The Amazon Resource Name (ARN) of the application.
  ///
  /// Parameter [maxItems] :
  /// The total number of items to return.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating.
  ///
  /// Parameter [semanticVersion] :
  /// The semantic version of the application to get.
  Future<ListApplicationDependenciesResponse> listApplicationDependencies({
    required String applicationId,
    int? maxItems,
    String? nextToken,
    String? semanticVersion,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxItems != null) 'maxItems': [maxItems.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (semanticVersion != null) 'semanticVersion': [semanticVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/dependencies',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListApplicationDependenciesResponse.fromJson(response);
  }

  /// Lists versions for the specified application.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [applicationId] :
  /// The Amazon Resource Name (ARN) of the application.
  ///
  /// Parameter [maxItems] :
  /// The total number of items to return.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating.
  Future<ListApplicationVersionsResponse> listApplicationVersions({
    required String applicationId,
    int? maxItems,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxItems != null) 'maxItems': [maxItems.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListApplicationVersionsResponse.fromJson(response);
  }

  /// Lists applications owned by the requester.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [maxItems] :
  /// The total number of items to return.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating.
  Future<ListApplicationsResponse> listApplications({
    int? maxItems,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxItems',
      maxItems,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxItems != null) 'maxItems': [maxItems.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/applications',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListApplicationsResponse.fromJson(response);
  }

  /// Sets the permission policy for an application. For the list of actions
  /// supported for this operation, see
  /// <a
  /// href="https://docs.aws.amazon.com/serverlessrepo/latest/devguide/access-control-resource-based.html#application-permissions">Application
  /// Permissions</a>
  /// .
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [applicationId] :
  /// The Amazon Resource Name (ARN) of the application.
  ///
  /// Parameter [statements] :
  /// An array of policy statements applied to the application.
  Future<PutApplicationPolicyResponse> putApplicationPolicy({
    required String applicationId,
    required List<ApplicationPolicyStatement> statements,
  }) async {
    final $payload = <String, dynamic>{
      'statements': statements,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return PutApplicationPolicyResponse.fromJson(response);
  }

  /// Unshares an application from an AWS Organization.
  ///
  /// This operation can be called only from the organization's master account.
  ///
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  ///
  /// Parameter [applicationId] :
  /// The Amazon Resource Name (ARN) of the application.
  ///
  /// Parameter [organizationId] :
  /// The AWS Organization ID to unshare the application from.
  Future<void> unshareApplication({
    required String applicationId,
    required String organizationId,
  }) async {
    final $payload = <String, dynamic>{
      'organizationId': organizationId,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}/unshare',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the specified application.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalServerErrorException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [ConflictException].
  ///
  /// Parameter [applicationId] :
  /// The Amazon Resource Name (ARN) of the application.
  ///
  /// Parameter [author] :
  /// The name of the author publishing the app.
  ///
  /// Minimum length=1. Maximum length=127.
  ///
  /// Pattern "^[a-z0-9](([a-z0-9]|-(?!-))*[a-z0-9])?$";
  ///
  /// Parameter [description] :
  /// The description of the application.
  ///
  /// Minimum length=1. Maximum length=256
  ///
  /// Parameter [homePageUrl] :
  /// A URL with more information about the application, for example the
  /// location of your GitHub repository for the application.
  ///
  /// Parameter [labels] :
  /// Labels to improve discovery of apps in search results.
  ///
  /// Minimum length=1. Maximum length=127. Maximum number of labels: 10
  ///
  /// Pattern: "^[a-zA-Z0-9+\\-_:\\/@]+$";
  ///
  /// Parameter [readmeBody] :
  /// A text readme file in Markdown language that contains a more detailed
  /// description of the application and how it works.
  ///
  /// Maximum size 5 MB
  ///
  /// Parameter [readmeUrl] :
  /// A link to the readme file in Markdown language that contains a more
  /// detailed description of the application and how it works.
  ///
  /// Maximum size 5 MB
  Future<UpdateApplicationResponse> updateApplication({
    required String applicationId,
    String? author,
    String? description,
    String? homePageUrl,
    List<String>? labels,
    String? readmeBody,
    String? readmeUrl,
  }) async {
    final $payload = <String, dynamic>{
      if (author != null) 'author': author,
      if (description != null) 'description': description,
      if (homePageUrl != null) 'homePageUrl': homePageUrl,
      if (labels != null) 'labels': labels,
      if (readmeBody != null) 'readmeBody': readmeBody,
      if (readmeUrl != null) 'readmeUrl': readmeUrl,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateApplicationResponse.fromJson(response);
  }
}

/// A nested application summary.
class ApplicationDependencySummary {
  /// The Amazon Resource Name (ARN) of the nested application.
  final String applicationId;

  /// The semantic version of the nested application.
  final String semanticVersion;

  ApplicationDependencySummary({
    required this.applicationId,
    required this.semanticVersion,
  });

  factory ApplicationDependencySummary.fromJson(Map<String, dynamic> json) {
    return ApplicationDependencySummary(
      applicationId: json['applicationId'] as String,
      semanticVersion: json['semanticVersion'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final semanticVersion = this.semanticVersion;
    return {
      'applicationId': applicationId,
      'semanticVersion': semanticVersion,
    };
  }
}

/// Policy statement applied to the application.
class ApplicationPolicyStatement {
  /// For the list of actions supported for this operation, see <a
  /// href="https://docs.aws.amazon.com/serverlessrepo/latest/devguide/access-control-resource-based.html#application-permissions">Application
  /// Permissions</a>.
  final List<String> actions;

  /// An array of AWS account IDs, or * to make the application public.
  final List<String> principals;

  /// An array of PrinciplalOrgIDs, which corresponds to AWS IAM <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_condition-keys.html#principal-org-id">aws:PrincipalOrgID</a>
  /// global condition key.
  final List<String>? principalOrgIDs;

  /// A unique ID for the statement.
  final String? statementId;

  ApplicationPolicyStatement({
    required this.actions,
    required this.principals,
    this.principalOrgIDs,
    this.statementId,
  });

  factory ApplicationPolicyStatement.fromJson(Map<String, dynamic> json) {
    return ApplicationPolicyStatement(
      actions: (json['actions'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      principals: (json['principals'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      principalOrgIDs: (json['principalOrgIDs'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      statementId: json['statementId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final principals = this.principals;
    final principalOrgIDs = this.principalOrgIDs;
    final statementId = this.statementId;
    return {
      'actions': actions,
      'principals': principals,
      if (principalOrgIDs != null) 'principalOrgIDs': principalOrgIDs,
      if (statementId != null) 'statementId': statementId,
    };
  }
}

/// Summary of details about the application.
class ApplicationSummary {
  /// The application Amazon Resource Name (ARN).
  final String applicationId;

  /// The name of the author publishing the app.
  ///
  /// Minimum length=1. Maximum length=127.
  ///
  /// Pattern "^[a-z0-9](([a-z0-9]|-(?!-))*[a-z0-9])?$";
  final String author;

  /// The description of the application.
  ///
  /// Minimum length=1. Maximum length=256
  final String description;

  /// The name of the application.
  ///
  /// Minimum length=1. Maximum length=140
  ///
  /// Pattern: "[a-zA-Z0-9\\-]+";
  final String name;

  /// The date and time this resource was created.
  final String? creationTime;

  /// A URL with more information about the application, for example the location
  /// of your GitHub repository for the application.
  final String? homePageUrl;

  /// Labels to improve discovery of apps in search results.
  ///
  /// Minimum length=1. Maximum length=127. Maximum number of labels: 10
  ///
  /// Pattern: "^[a-zA-Z0-9+\\-_:\\/@]+$";
  final List<String>? labels;

  /// A valid identifier from <a
  /// href="https://spdx.org/licenses/">https://spdx.org/licenses/</a>.
  final String? spdxLicenseId;

  ApplicationSummary({
    required this.applicationId,
    required this.author,
    required this.description,
    required this.name,
    this.creationTime,
    this.homePageUrl,
    this.labels,
    this.spdxLicenseId,
  });

  factory ApplicationSummary.fromJson(Map<String, dynamic> json) {
    return ApplicationSummary(
      applicationId: json['applicationId'] as String,
      author: json['author'] as String,
      description: json['description'] as String,
      name: json['name'] as String,
      creationTime: json['creationTime'] as String?,
      homePageUrl: json['homePageUrl'] as String?,
      labels: (json['labels'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      spdxLicenseId: json['spdxLicenseId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final author = this.author;
    final description = this.description;
    final name = this.name;
    final creationTime = this.creationTime;
    final homePageUrl = this.homePageUrl;
    final labels = this.labels;
    final spdxLicenseId = this.spdxLicenseId;
    return {
      'applicationId': applicationId,
      'author': author,
      'description': description,
      'name': name,
      if (creationTime != null) 'creationTime': creationTime,
      if (homePageUrl != null) 'homePageUrl': homePageUrl,
      if (labels != null) 'labels': labels,
      if (spdxLicenseId != null) 'spdxLicenseId': spdxLicenseId,
    };
  }
}

/// Values that must be specified in order to deploy some applications.
enum Capability {
  capabilityIam,
  capabilityNamedIam,
  capabilityAutoExpand,
  capabilityResourcePolicy,
}

extension CapabilityValueExtension on Capability {
  String toValue() {
    switch (this) {
      case Capability.capabilityIam:
        return 'CAPABILITY_IAM';
      case Capability.capabilityNamedIam:
        return 'CAPABILITY_NAMED_IAM';
      case Capability.capabilityAutoExpand:
        return 'CAPABILITY_AUTO_EXPAND';
      case Capability.capabilityResourcePolicy:
        return 'CAPABILITY_RESOURCE_POLICY';
    }
  }
}

extension CapabilityFromString on String {
  Capability toCapability() {
    switch (this) {
      case 'CAPABILITY_IAM':
        return Capability.capabilityIam;
      case 'CAPABILITY_NAMED_IAM':
        return Capability.capabilityNamedIam;
      case 'CAPABILITY_AUTO_EXPAND':
        return Capability.capabilityAutoExpand;
      case 'CAPABILITY_RESOURCE_POLICY':
        return Capability.capabilityResourcePolicy;
    }
    throw Exception('$this is not known in enum Capability');
  }
}

class CreateApplicationResponse {
  /// The application Amazon Resource Name (ARN).
  final String? applicationId;

  /// The name of the author publishing the app.
  ///
  /// Minimum length=1. Maximum length=127.
  ///
  /// Pattern "^[a-z0-9](([a-z0-9]|-(?!-))*[a-z0-9])?$";
  final String? author;

  /// The date and time this resource was created.
  final String? creationTime;

  /// The description of the application.
  ///
  /// Minimum length=1. Maximum length=256
  final String? description;

  /// A URL with more information about the application, for example the location
  /// of your GitHub repository for the application.
  final String? homePageUrl;

  /// Whether the author of this application has been verified. This means means
  /// that AWS has made a good faith review, as a reasonable and prudent service
  /// provider, of the information provided by the requester and has confirmed
  /// that the requester's identity is as claimed.
  final bool? isVerifiedAuthor;

  /// Labels to improve discovery of apps in search results.
  ///
  /// Minimum length=1. Maximum length=127. Maximum number of labels: 10
  ///
  /// Pattern: "^[a-zA-Z0-9+\\-_:\\/@]+$";
  final List<String>? labels;

  /// A link to a license file of the app that matches the spdxLicenseID value of
  /// your application.
  ///
  /// Maximum size 5 MB
  final String? licenseUrl;

  /// The name of the application.
  ///
  /// Minimum length=1. Maximum length=140
  ///
  /// Pattern: "[a-zA-Z0-9\\-]+";
  final String? name;

  /// A link to the readme file in Markdown language that contains a more detailed
  /// description of the application and how it works.
  ///
  /// Maximum size 5 MB
  final String? readmeUrl;

  /// A valid identifier from https://spdx.org/licenses/.
  final String? spdxLicenseId;

  /// The URL to the public profile of a verified author. This URL is submitted by
  /// the author.
  final String? verifiedAuthorUrl;

  /// Version information about the application.
  final Version? version;

  CreateApplicationResponse({
    this.applicationId,
    this.author,
    this.creationTime,
    this.description,
    this.homePageUrl,
    this.isVerifiedAuthor,
    this.labels,
    this.licenseUrl,
    this.name,
    this.readmeUrl,
    this.spdxLicenseId,
    this.verifiedAuthorUrl,
    this.version,
  });

  factory CreateApplicationResponse.fromJson(Map<String, dynamic> json) {
    return CreateApplicationResponse(
      applicationId: json['applicationId'] as String?,
      author: json['author'] as String?,
      creationTime: json['creationTime'] as String?,
      description: json['description'] as String?,
      homePageUrl: json['homePageUrl'] as String?,
      isVerifiedAuthor: json['isVerifiedAuthor'] as bool?,
      labels: (json['labels'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      licenseUrl: json['licenseUrl'] as String?,
      name: json['name'] as String?,
      readmeUrl: json['readmeUrl'] as String?,
      spdxLicenseId: json['spdxLicenseId'] as String?,
      verifiedAuthorUrl: json['verifiedAuthorUrl'] as String?,
      version: json['version'] != null
          ? Version.fromJson(json['version'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final author = this.author;
    final creationTime = this.creationTime;
    final description = this.description;
    final homePageUrl = this.homePageUrl;
    final isVerifiedAuthor = this.isVerifiedAuthor;
    final labels = this.labels;
    final licenseUrl = this.licenseUrl;
    final name = this.name;
    final readmeUrl = this.readmeUrl;
    final spdxLicenseId = this.spdxLicenseId;
    final verifiedAuthorUrl = this.verifiedAuthorUrl;
    final version = this.version;
    return {
      if (applicationId != null) 'applicationId': applicationId,
      if (author != null) 'author': author,
      if (creationTime != null) 'creationTime': creationTime,
      if (description != null) 'description': description,
      if (homePageUrl != null) 'homePageUrl': homePageUrl,
      if (isVerifiedAuthor != null) 'isVerifiedAuthor': isVerifiedAuthor,
      if (labels != null) 'labels': labels,
      if (licenseUrl != null) 'licenseUrl': licenseUrl,
      if (name != null) 'name': name,
      if (readmeUrl != null) 'readmeUrl': readmeUrl,
      if (spdxLicenseId != null) 'spdxLicenseId': spdxLicenseId,
      if (verifiedAuthorUrl != null) 'verifiedAuthorUrl': verifiedAuthorUrl,
      if (version != null) 'version': version,
    };
  }
}

class CreateApplicationVersionResponse {
  /// The application Amazon Resource Name (ARN).
  final String? applicationId;

  /// The date and time this resource was created.
  final String? creationTime;

  /// An array of parameter types supported by the application.
  final List<ParameterDefinition>? parameterDefinitions;

  /// A list of values that you must specify before you can deploy certain
  /// applications.
  /// Some applications might include resources that can affect permissions in
  /// your AWS
  /// account, for example, by creating new AWS Identity and Access Management
  /// (IAM) users.
  /// For those applications, you must explicitly acknowledge their capabilities
  /// by
  /// specifying this parameter.
  ///
  /// The only valid values are CAPABILITY_IAM, CAPABILITY_NAMED_IAM,
  /// CAPABILITY_RESOURCE_POLICY, and CAPABILITY_AUTO_EXPAND.
  ///
  /// The following resources require you to specify CAPABILITY_IAM or
  /// CAPABILITY_NAMED_IAM:
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html">AWS::IAM::Group</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html">AWS::IAM::InstanceProfile</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-policy.html">AWS::IAM::Policy</a>,
  /// and
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html">AWS::IAM::Role</a>.
  /// If the application contains IAM resources, you can specify either
  /// CAPABILITY_IAM
  /// or CAPABILITY_NAMED_IAM. If the application contains IAM resources
  /// with custom names, you must specify CAPABILITY_NAMED_IAM.
  ///
  /// The following resources require you to specify CAPABILITY_RESOURCE_POLICY:
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-lambda-permission.html">AWS::Lambda::Permission</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-policy.html">AWS::IAM:Policy</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-applicationautoscaling-scalingpolicy.html">AWS::ApplicationAutoScaling::ScalingPolicy</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-s3-policy.html">AWS::S3::BucketPolicy</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-sqs-policy.html">AWS::SQS::QueuePolicy</a>,
  /// and
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-sns-policy.html">AWS::SNS::TopicPolicy</a>.
  ///
  /// Applications that contain one or more nested applications require you to
  /// specify
  /// CAPABILITY_AUTO_EXPAND.
  ///
  /// If your application template contains any of the above resources, we
  /// recommend that you review
  /// all permissions associated with the application before deploying. If you
  /// don't specify
  /// this parameter for an application that requires capabilities, the call will
  /// fail.
  final List<Capability>? requiredCapabilities;

  /// Whether all of the AWS resources contained in this application are supported
  /// in the region
  /// in which it is being retrieved.
  final bool? resourcesSupported;

  /// The semantic version of the application:
  ///
  ///
  /// <a href="https://semver.org/">https://semver.org/</a>
  ///
  final String? semanticVersion;

  /// A link to the S3 object that contains the ZIP archive of the source code for
  /// this version of your application.
  ///
  /// Maximum size 50 MB
  final String? sourceCodeArchiveUrl;

  /// A link to a public repository for the source code of your application, for
  /// example the URL of a specific GitHub commit.
  final String? sourceCodeUrl;

  /// A link to the packaged AWS SAM template of your application.
  final String? templateUrl;

  CreateApplicationVersionResponse({
    this.applicationId,
    this.creationTime,
    this.parameterDefinitions,
    this.requiredCapabilities,
    this.resourcesSupported,
    this.semanticVersion,
    this.sourceCodeArchiveUrl,
    this.sourceCodeUrl,
    this.templateUrl,
  });

  factory CreateApplicationVersionResponse.fromJson(Map<String, dynamic> json) {
    return CreateApplicationVersionResponse(
      applicationId: json['applicationId'] as String?,
      creationTime: json['creationTime'] as String?,
      parameterDefinitions: (json['parameterDefinitions'] as List?)
          ?.whereNotNull()
          .map((e) => ParameterDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      requiredCapabilities: (json['requiredCapabilities'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toCapability())
          .toList(),
      resourcesSupported: json['resourcesSupported'] as bool?,
      semanticVersion: json['semanticVersion'] as String?,
      sourceCodeArchiveUrl: json['sourceCodeArchiveUrl'] as String?,
      sourceCodeUrl: json['sourceCodeUrl'] as String?,
      templateUrl: json['templateUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final creationTime = this.creationTime;
    final parameterDefinitions = this.parameterDefinitions;
    final requiredCapabilities = this.requiredCapabilities;
    final resourcesSupported = this.resourcesSupported;
    final semanticVersion = this.semanticVersion;
    final sourceCodeArchiveUrl = this.sourceCodeArchiveUrl;
    final sourceCodeUrl = this.sourceCodeUrl;
    final templateUrl = this.templateUrl;
    return {
      if (applicationId != null) 'applicationId': applicationId,
      if (creationTime != null) 'creationTime': creationTime,
      if (parameterDefinitions != null)
        'parameterDefinitions': parameterDefinitions,
      if (requiredCapabilities != null)
        'requiredCapabilities':
            requiredCapabilities.map((e) => e.toValue()).toList(),
      if (resourcesSupported != null) 'resourcesSupported': resourcesSupported,
      if (semanticVersion != null) 'semanticVersion': semanticVersion,
      if (sourceCodeArchiveUrl != null)
        'sourceCodeArchiveUrl': sourceCodeArchiveUrl,
      if (sourceCodeUrl != null) 'sourceCodeUrl': sourceCodeUrl,
      if (templateUrl != null) 'templateUrl': templateUrl,
    };
  }
}

class CreateCloudFormationChangeSetResponse {
  /// The application Amazon Resource Name (ARN).
  final String? applicationId;

  /// The Amazon Resource Name (ARN) of the change set.
  ///
  /// Length constraints: Minimum length of 1.
  ///
  /// Pattern: ARN:[-a-zA-Z0-9:/]*
  final String? changeSetId;

  /// The semantic version of the application:
  ///
  ///
  /// <a href="https://semver.org/">https://semver.org/</a>
  ///
  final String? semanticVersion;

  /// The unique ID of the stack.
  final String? stackId;

  CreateCloudFormationChangeSetResponse({
    this.applicationId,
    this.changeSetId,
    this.semanticVersion,
    this.stackId,
  });

  factory CreateCloudFormationChangeSetResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateCloudFormationChangeSetResponse(
      applicationId: json['applicationId'] as String?,
      changeSetId: json['changeSetId'] as String?,
      semanticVersion: json['semanticVersion'] as String?,
      stackId: json['stackId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final changeSetId = this.changeSetId;
    final semanticVersion = this.semanticVersion;
    final stackId = this.stackId;
    return {
      if (applicationId != null) 'applicationId': applicationId,
      if (changeSetId != null) 'changeSetId': changeSetId,
      if (semanticVersion != null) 'semanticVersion': semanticVersion,
      if (stackId != null) 'stackId': stackId,
    };
  }
}

class CreateCloudFormationTemplateResponse {
  /// The application Amazon Resource Name (ARN).
  final String? applicationId;

  /// The date and time this resource was created.
  final String? creationTime;

  /// The date and time this template expires. Templates
  /// expire 1 hour after creation.
  final String? expirationTime;

  /// The semantic version of the application:
  ///
  ///
  /// <a href="https://semver.org/">https://semver.org/</a>
  ///
  final String? semanticVersion;

  /// Status of the template creation workflow.
  ///
  /// Possible values: PREPARING | ACTIVE | EXPIRED
  ///
  final Status? status;

  /// The UUID returned by CreateCloudFormationTemplate.
  ///
  /// Pattern:
  /// [0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}
  final String? templateId;

  /// A link to the template that can be used to deploy the application using
  /// AWS CloudFormation.
  final String? templateUrl;

  CreateCloudFormationTemplateResponse({
    this.applicationId,
    this.creationTime,
    this.expirationTime,
    this.semanticVersion,
    this.status,
    this.templateId,
    this.templateUrl,
  });

  factory CreateCloudFormationTemplateResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateCloudFormationTemplateResponse(
      applicationId: json['applicationId'] as String?,
      creationTime: json['creationTime'] as String?,
      expirationTime: json['expirationTime'] as String?,
      semanticVersion: json['semanticVersion'] as String?,
      status: (json['status'] as String?)?.toStatus(),
      templateId: json['templateId'] as String?,
      templateUrl: json['templateUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final creationTime = this.creationTime;
    final expirationTime = this.expirationTime;
    final semanticVersion = this.semanticVersion;
    final status = this.status;
    final templateId = this.templateId;
    final templateUrl = this.templateUrl;
    return {
      if (applicationId != null) 'applicationId': applicationId,
      if (creationTime != null) 'creationTime': creationTime,
      if (expirationTime != null) 'expirationTime': expirationTime,
      if (semanticVersion != null) 'semanticVersion': semanticVersion,
      if (status != null) 'status': status.toValue(),
      if (templateId != null) 'templateId': templateId,
      if (templateUrl != null) 'templateUrl': templateUrl,
    };
  }
}

class GetApplicationPolicyResponse {
  /// An array of policy statements applied to the application.
  final List<ApplicationPolicyStatement>? statements;

  GetApplicationPolicyResponse({
    this.statements,
  });

  factory GetApplicationPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetApplicationPolicyResponse(
      statements: (json['statements'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ApplicationPolicyStatement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final statements = this.statements;
    return {
      if (statements != null) 'statements': statements,
    };
  }
}

class GetApplicationResponse {
  /// The application Amazon Resource Name (ARN).
  final String? applicationId;

  /// The name of the author publishing the app.
  ///
  /// Minimum length=1. Maximum length=127.
  ///
  /// Pattern "^[a-z0-9](([a-z0-9]|-(?!-))*[a-z0-9])?$";
  final String? author;

  /// The date and time this resource was created.
  final String? creationTime;

  /// The description of the application.
  ///
  /// Minimum length=1. Maximum length=256
  final String? description;

  /// A URL with more information about the application, for example the location
  /// of your GitHub repository for the application.
  final String? homePageUrl;

  /// Whether the author of this application has been verified. This means means
  /// that AWS has made a good faith review, as a reasonable and prudent service
  /// provider, of the information provided by the requester and has confirmed
  /// that the requester's identity is as claimed.
  final bool? isVerifiedAuthor;

  /// Labels to improve discovery of apps in search results.
  ///
  /// Minimum length=1. Maximum length=127. Maximum number of labels: 10
  ///
  /// Pattern: "^[a-zA-Z0-9+\\-_:\\/@]+$";
  final List<String>? labels;

  /// A link to a license file of the app that matches the spdxLicenseID value of
  /// your application.
  ///
  /// Maximum size 5 MB
  final String? licenseUrl;

  /// The name of the application.
  ///
  /// Minimum length=1. Maximum length=140
  ///
  /// Pattern: "[a-zA-Z0-9\\-]+";
  final String? name;

  /// A link to the readme file in Markdown language that contains a more detailed
  /// description of the application and how it works.
  ///
  /// Maximum size 5 MB
  final String? readmeUrl;

  /// A valid identifier from https://spdx.org/licenses/.
  final String? spdxLicenseId;

  /// The URL to the public profile of a verified author. This URL is submitted by
  /// the author.
  final String? verifiedAuthorUrl;

  /// Version information about the application.
  final Version? version;

  GetApplicationResponse({
    this.applicationId,
    this.author,
    this.creationTime,
    this.description,
    this.homePageUrl,
    this.isVerifiedAuthor,
    this.labels,
    this.licenseUrl,
    this.name,
    this.readmeUrl,
    this.spdxLicenseId,
    this.verifiedAuthorUrl,
    this.version,
  });

  factory GetApplicationResponse.fromJson(Map<String, dynamic> json) {
    return GetApplicationResponse(
      applicationId: json['applicationId'] as String?,
      author: json['author'] as String?,
      creationTime: json['creationTime'] as String?,
      description: json['description'] as String?,
      homePageUrl: json['homePageUrl'] as String?,
      isVerifiedAuthor: json['isVerifiedAuthor'] as bool?,
      labels: (json['labels'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      licenseUrl: json['licenseUrl'] as String?,
      name: json['name'] as String?,
      readmeUrl: json['readmeUrl'] as String?,
      spdxLicenseId: json['spdxLicenseId'] as String?,
      verifiedAuthorUrl: json['verifiedAuthorUrl'] as String?,
      version: json['version'] != null
          ? Version.fromJson(json['version'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final author = this.author;
    final creationTime = this.creationTime;
    final description = this.description;
    final homePageUrl = this.homePageUrl;
    final isVerifiedAuthor = this.isVerifiedAuthor;
    final labels = this.labels;
    final licenseUrl = this.licenseUrl;
    final name = this.name;
    final readmeUrl = this.readmeUrl;
    final spdxLicenseId = this.spdxLicenseId;
    final verifiedAuthorUrl = this.verifiedAuthorUrl;
    final version = this.version;
    return {
      if (applicationId != null) 'applicationId': applicationId,
      if (author != null) 'author': author,
      if (creationTime != null) 'creationTime': creationTime,
      if (description != null) 'description': description,
      if (homePageUrl != null) 'homePageUrl': homePageUrl,
      if (isVerifiedAuthor != null) 'isVerifiedAuthor': isVerifiedAuthor,
      if (labels != null) 'labels': labels,
      if (licenseUrl != null) 'licenseUrl': licenseUrl,
      if (name != null) 'name': name,
      if (readmeUrl != null) 'readmeUrl': readmeUrl,
      if (spdxLicenseId != null) 'spdxLicenseId': spdxLicenseId,
      if (verifiedAuthorUrl != null) 'verifiedAuthorUrl': verifiedAuthorUrl,
      if (version != null) 'version': version,
    };
  }
}

class GetCloudFormationTemplateResponse {
  /// The application Amazon Resource Name (ARN).
  final String? applicationId;

  /// The date and time this resource was created.
  final String? creationTime;

  /// The date and time this template expires. Templates
  /// expire 1 hour after creation.
  final String? expirationTime;

  /// The semantic version of the application:
  ///
  ///
  /// <a href="https://semver.org/">https://semver.org/</a>
  ///
  final String? semanticVersion;

  /// Status of the template creation workflow.
  ///
  /// Possible values: PREPARING | ACTIVE | EXPIRED
  ///
  final Status? status;

  /// The UUID returned by CreateCloudFormationTemplate.
  ///
  /// Pattern:
  /// [0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}
  final String? templateId;

  /// A link to the template that can be used to deploy the application using
  /// AWS CloudFormation.
  final String? templateUrl;

  GetCloudFormationTemplateResponse({
    this.applicationId,
    this.creationTime,
    this.expirationTime,
    this.semanticVersion,
    this.status,
    this.templateId,
    this.templateUrl,
  });

  factory GetCloudFormationTemplateResponse.fromJson(
      Map<String, dynamic> json) {
    return GetCloudFormationTemplateResponse(
      applicationId: json['applicationId'] as String?,
      creationTime: json['creationTime'] as String?,
      expirationTime: json['expirationTime'] as String?,
      semanticVersion: json['semanticVersion'] as String?,
      status: (json['status'] as String?)?.toStatus(),
      templateId: json['templateId'] as String?,
      templateUrl: json['templateUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final creationTime = this.creationTime;
    final expirationTime = this.expirationTime;
    final semanticVersion = this.semanticVersion;
    final status = this.status;
    final templateId = this.templateId;
    final templateUrl = this.templateUrl;
    return {
      if (applicationId != null) 'applicationId': applicationId,
      if (creationTime != null) 'creationTime': creationTime,
      if (expirationTime != null) 'expirationTime': expirationTime,
      if (semanticVersion != null) 'semanticVersion': semanticVersion,
      if (status != null) 'status': status.toValue(),
      if (templateId != null) 'templateId': templateId,
      if (templateUrl != null) 'templateUrl': templateUrl,
    };
  }
}

class ListApplicationDependenciesResponse {
  /// An array of application summaries nested in the application.
  final List<ApplicationDependencySummary>? dependencies;

  /// The token to request the next page of results.
  final String? nextToken;

  ListApplicationDependenciesResponse({
    this.dependencies,
    this.nextToken,
  });

  factory ListApplicationDependenciesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListApplicationDependenciesResponse(
      dependencies: (json['dependencies'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ApplicationDependencySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dependencies = this.dependencies;
    final nextToken = this.nextToken;
    return {
      if (dependencies != null) 'dependencies': dependencies,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListApplicationVersionsResponse {
  /// The token to request the next page of results.
  final String? nextToken;

  /// An array of version summaries for the application.
  final List<VersionSummary>? versions;

  ListApplicationVersionsResponse({
    this.nextToken,
    this.versions,
  });

  factory ListApplicationVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListApplicationVersionsResponse(
      nextToken: json['nextToken'] as String?,
      versions: (json['versions'] as List?)
          ?.whereNotNull()
          .map((e) => VersionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final versions = this.versions;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (versions != null) 'versions': versions,
    };
  }
}

class ListApplicationsResponse {
  /// An array of application summaries.
  final List<ApplicationSummary>? applications;

  /// The token to request the next page of results.
  final String? nextToken;

  ListApplicationsResponse({
    this.applications,
    this.nextToken,
  });

  factory ListApplicationsResponse.fromJson(Map<String, dynamic> json) {
    return ListApplicationsResponse(
      applications: (json['applications'] as List?)
          ?.whereNotNull()
          .map((e) => ApplicationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applications = this.applications;
    final nextToken = this.nextToken;
    return {
      if (applications != null) 'applications': applications,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Parameters supported by the application.
class ParameterDefinition {
  /// The name of the parameter.
  final String name;

  /// A list of AWS SAM resources that use this parameter.
  final List<String> referencedByResources;

  /// A regular expression that represents the patterns to allow for String types.
  final String? allowedPattern;

  /// An array containing the list of values allowed for the parameter.
  final List<String>? allowedValues;

  /// A string that explains a constraint when the constraint is violated. For
  /// example, without a constraint description,
  /// a parameter that has an allowed pattern of [A-Za-z0-9]+ displays the
  /// following error message when the user
  /// specifies an invalid value:
  ///
  ///
  /// Malformed input-Parameter MyParameter must match pattern [A-Za-z0-9]+
  ///
  ///
  /// By adding a constraint description, such as "must contain only uppercase and
  /// lowercase letters and numbers," you can display
  /// the following customized error message:
  ///
  ///
  /// Malformed input-Parameter MyParameter must contain only uppercase and
  /// lowercase letters and numbers.
  ///
  final String? constraintDescription;

  /// A value of the appropriate type for the template to use if no value is
  /// specified when a stack is created.
  /// If you define constraints for the parameter, you must specify a value that
  /// adheres to those constraints.
  final String? defaultValue;

  /// A string of up to 4,000 characters that describes the parameter.
  final String? description;

  /// An integer value that determines the largest number of characters that you
  /// want to allow for String types.
  final int? maxLength;

  /// A numeric value that determines the largest numeric value that you want to
  /// allow for Number types.
  final int? maxValue;

  /// An integer value that determines the smallest number of characters that you
  /// want to allow for String types.
  final int? minLength;

  /// A numeric value that determines the smallest numeric value that you want to
  /// allow for Number types.
  final int? minValue;

  /// Whether to mask the parameter value whenever anyone makes a call that
  /// describes the stack. If you set the
  /// value to true, the parameter value is masked with asterisks (*****).
  final bool? noEcho;

  /// The type of the parameter.
  ///
  /// Valid values: String | Number | List&lt;Number> | CommaDelimitedList
  ///
  ///
  ///
  /// String: A literal string.
  ///
  /// For example, users can specify "MyUserName".
  ///
  ///
  /// Number: An integer or float. AWS CloudFormation validates the parameter
  /// value as a number. However, when you use the
  /// parameter elsewhere in your template (for example, by using the Ref
  /// intrinsic function), the parameter value becomes a string.
  ///
  /// For example, users might specify "8888".
  ///
  ///
  /// List&lt;Number>: An array of integers or floats that are separated by
  /// commas. AWS CloudFormation validates the parameter value as numbers.
  /// However, when
  /// you use the parameter elsewhere in your template (for example, by using the
  /// Ref intrinsic function), the parameter value becomes a list of strings.
  ///
  /// For example, users might specify "80,20", and then Ref results in
  /// ["80","20"].
  ///
  ///
  /// CommaDelimitedList: An array of literal strings that are separated by
  /// commas. The total number of strings should be one more than the total number
  /// of commas.
  /// Also, each member string is space-trimmed.
  ///
  /// For example, users might specify "test,dev,prod", and then Ref results in
  /// ["test","dev","prod"].
  final String? type;

  ParameterDefinition({
    required this.name,
    required this.referencedByResources,
    this.allowedPattern,
    this.allowedValues,
    this.constraintDescription,
    this.defaultValue,
    this.description,
    this.maxLength,
    this.maxValue,
    this.minLength,
    this.minValue,
    this.noEcho,
    this.type,
  });

  factory ParameterDefinition.fromJson(Map<String, dynamic> json) {
    return ParameterDefinition(
      name: json['name'] as String,
      referencedByResources: (json['referencedByResources'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      allowedPattern: json['allowedPattern'] as String?,
      allowedValues: (json['allowedValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      constraintDescription: json['constraintDescription'] as String?,
      defaultValue: json['defaultValue'] as String?,
      description: json['description'] as String?,
      maxLength: json['maxLength'] as int?,
      maxValue: json['maxValue'] as int?,
      minLength: json['minLength'] as int?,
      minValue: json['minValue'] as int?,
      noEcho: json['noEcho'] as bool?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final referencedByResources = this.referencedByResources;
    final allowedPattern = this.allowedPattern;
    final allowedValues = this.allowedValues;
    final constraintDescription = this.constraintDescription;
    final defaultValue = this.defaultValue;
    final description = this.description;
    final maxLength = this.maxLength;
    final maxValue = this.maxValue;
    final minLength = this.minLength;
    final minValue = this.minValue;
    final noEcho = this.noEcho;
    final type = this.type;
    return {
      'name': name,
      'referencedByResources': referencedByResources,
      if (allowedPattern != null) 'allowedPattern': allowedPattern,
      if (allowedValues != null) 'allowedValues': allowedValues,
      if (constraintDescription != null)
        'constraintDescription': constraintDescription,
      if (defaultValue != null) 'defaultValue': defaultValue,
      if (description != null) 'description': description,
      if (maxLength != null) 'maxLength': maxLength,
      if (maxValue != null) 'maxValue': maxValue,
      if (minLength != null) 'minLength': minLength,
      if (minValue != null) 'minValue': minValue,
      if (noEcho != null) 'noEcho': noEcho,
      if (type != null) 'type': type,
    };
  }
}

/// Parameter value of the application.
class ParameterValue {
  /// The key associated with the parameter. If you don't specify a key and value
  /// for a particular parameter, AWS CloudFormation
  /// uses the default value that is specified in your template.
  final String name;

  /// The input value associated with the parameter.
  final String value;

  ParameterValue({
    required this.name,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'name': name,
      'value': value,
    };
  }
}

class PutApplicationPolicyResponse {
  /// An array of policy statements applied to the application.
  final List<ApplicationPolicyStatement>? statements;

  PutApplicationPolicyResponse({
    this.statements,
  });

  factory PutApplicationPolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutApplicationPolicyResponse(
      statements: (json['statements'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ApplicationPolicyStatement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final statements = this.statements;
    return {
      if (statements != null) 'statements': statements,
    };
  }
}

/// This property corresponds to the <i>AWS CloudFormation <a
/// href="https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/RollbackConfiguration">RollbackConfiguration</a>
/// </i> Data Type.
class RollbackConfiguration {
  /// This property corresponds to the content of the same name for the <i>AWS
  /// CloudFormation <a
  /// href="https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/RollbackConfiguration">RollbackConfiguration</a>
  /// </i> Data Type.
  final int? monitoringTimeInMinutes;

  /// This property corresponds to the content of the same name for the <i>AWS
  /// CloudFormation <a
  /// href="https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/RollbackConfiguration">RollbackConfiguration</a>
  /// </i> Data Type.
  final List<RollbackTrigger>? rollbackTriggers;

  RollbackConfiguration({
    this.monitoringTimeInMinutes,
    this.rollbackTriggers,
  });

  Map<String, dynamic> toJson() {
    final monitoringTimeInMinutes = this.monitoringTimeInMinutes;
    final rollbackTriggers = this.rollbackTriggers;
    return {
      if (monitoringTimeInMinutes != null)
        'monitoringTimeInMinutes': monitoringTimeInMinutes,
      if (rollbackTriggers != null) 'rollbackTriggers': rollbackTriggers,
    };
  }
}

/// This property corresponds to the <i>AWS CloudFormation <a
/// href="https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/RollbackTrigger">RollbackTrigger</a>
/// </i> Data Type.
class RollbackTrigger {
  /// This property corresponds to the content of the same name for the <i>AWS
  /// CloudFormation <a
  /// href="https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/RollbackTrigger">RollbackTrigger</a>
  /// </i> Data Type.
  final String arn;

  /// This property corresponds to the content of the same name for the <i>AWS
  /// CloudFormation <a
  /// href="https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/RollbackTrigger">RollbackTrigger</a>
  /// </i> Data Type.
  final String type;

  RollbackTrigger({
    required this.arn,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final type = this.type;
    return {
      'arn': arn,
      'type': type,
    };
  }
}

enum Status {
  preparing,
  active,
  expired,
}

extension StatusValueExtension on Status {
  String toValue() {
    switch (this) {
      case Status.preparing:
        return 'PREPARING';
      case Status.active:
        return 'ACTIVE';
      case Status.expired:
        return 'EXPIRED';
    }
  }
}

extension StatusFromString on String {
  Status toStatus() {
    switch (this) {
      case 'PREPARING':
        return Status.preparing;
      case 'ACTIVE':
        return Status.active;
      case 'EXPIRED':
        return Status.expired;
    }
    throw Exception('$this is not known in enum Status');
  }
}

/// This property corresponds to the <i>AWS CloudFormation <a
/// href="https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/Tag">Tag</a>
/// </i> Data Type.
class Tag {
  /// This property corresponds to the content of the same name for the <i>AWS
  /// CloudFormation <a
  /// href="https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/Tag">Tag</a>
  /// </i> Data Type.
  final String key;

  /// This property corresponds to the content of the same name for the <i>AWS
  /// CloudFormation <a
  /// href="https://docs.aws.amazon.com/goto/WebAPI/cloudformation-2010-05-15/Tag">
  /// Tag</a>
  /// </i>
  /// Data Type.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
    };
  }
}

class UpdateApplicationResponse {
  /// The application Amazon Resource Name (ARN).
  final String? applicationId;

  /// The name of the author publishing the app.
  ///
  /// Minimum length=1. Maximum length=127.
  ///
  /// Pattern "^[a-z0-9](([a-z0-9]|-(?!-))*[a-z0-9])?$";
  final String? author;

  /// The date and time this resource was created.
  final String? creationTime;

  /// The description of the application.
  ///
  /// Minimum length=1. Maximum length=256
  final String? description;

  /// A URL with more information about the application, for example the location
  /// of your GitHub repository for the application.
  final String? homePageUrl;

  /// Whether the author of this application has been verified. This means means
  /// that AWS has made a good faith review, as a reasonable and prudent service
  /// provider, of the information provided by the requester and has confirmed
  /// that the requester's identity is as claimed.
  final bool? isVerifiedAuthor;

  /// Labels to improve discovery of apps in search results.
  ///
  /// Minimum length=1. Maximum length=127. Maximum number of labels: 10
  ///
  /// Pattern: "^[a-zA-Z0-9+\\-_:\\/@]+$";
  final List<String>? labels;

  /// A link to a license file of the app that matches the spdxLicenseID value of
  /// your application.
  ///
  /// Maximum size 5 MB
  final String? licenseUrl;

  /// The name of the application.
  ///
  /// Minimum length=1. Maximum length=140
  ///
  /// Pattern: "[a-zA-Z0-9\\-]+";
  final String? name;

  /// A link to the readme file in Markdown language that contains a more detailed
  /// description of the application and how it works.
  ///
  /// Maximum size 5 MB
  final String? readmeUrl;

  /// A valid identifier from https://spdx.org/licenses/.
  final String? spdxLicenseId;

  /// The URL to the public profile of a verified author. This URL is submitted by
  /// the author.
  final String? verifiedAuthorUrl;

  /// Version information about the application.
  final Version? version;

  UpdateApplicationResponse({
    this.applicationId,
    this.author,
    this.creationTime,
    this.description,
    this.homePageUrl,
    this.isVerifiedAuthor,
    this.labels,
    this.licenseUrl,
    this.name,
    this.readmeUrl,
    this.spdxLicenseId,
    this.verifiedAuthorUrl,
    this.version,
  });

  factory UpdateApplicationResponse.fromJson(Map<String, dynamic> json) {
    return UpdateApplicationResponse(
      applicationId: json['applicationId'] as String?,
      author: json['author'] as String?,
      creationTime: json['creationTime'] as String?,
      description: json['description'] as String?,
      homePageUrl: json['homePageUrl'] as String?,
      isVerifiedAuthor: json['isVerifiedAuthor'] as bool?,
      labels: (json['labels'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      licenseUrl: json['licenseUrl'] as String?,
      name: json['name'] as String?,
      readmeUrl: json['readmeUrl'] as String?,
      spdxLicenseId: json['spdxLicenseId'] as String?,
      verifiedAuthorUrl: json['verifiedAuthorUrl'] as String?,
      version: json['version'] != null
          ? Version.fromJson(json['version'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final author = this.author;
    final creationTime = this.creationTime;
    final description = this.description;
    final homePageUrl = this.homePageUrl;
    final isVerifiedAuthor = this.isVerifiedAuthor;
    final labels = this.labels;
    final licenseUrl = this.licenseUrl;
    final name = this.name;
    final readmeUrl = this.readmeUrl;
    final spdxLicenseId = this.spdxLicenseId;
    final verifiedAuthorUrl = this.verifiedAuthorUrl;
    final version = this.version;
    return {
      if (applicationId != null) 'applicationId': applicationId,
      if (author != null) 'author': author,
      if (creationTime != null) 'creationTime': creationTime,
      if (description != null) 'description': description,
      if (homePageUrl != null) 'homePageUrl': homePageUrl,
      if (isVerifiedAuthor != null) 'isVerifiedAuthor': isVerifiedAuthor,
      if (labels != null) 'labels': labels,
      if (licenseUrl != null) 'licenseUrl': licenseUrl,
      if (name != null) 'name': name,
      if (readmeUrl != null) 'readmeUrl': readmeUrl,
      if (spdxLicenseId != null) 'spdxLicenseId': spdxLicenseId,
      if (verifiedAuthorUrl != null) 'verifiedAuthorUrl': verifiedAuthorUrl,
      if (version != null) 'version': version,
    };
  }
}

/// Application version details.
class Version {
  /// The application Amazon Resource Name (ARN).
  final String applicationId;

  /// The date and time this resource was created.
  final String creationTime;

  /// An array of parameter types supported by the application.
  final List<ParameterDefinition> parameterDefinitions;

  /// A list of values that you must specify before you can deploy certain
  /// applications.
  /// Some applications might include resources that can affect permissions in
  /// your AWS
  /// account, for example, by creating new AWS Identity and Access Management
  /// (IAM) users.
  /// For those applications, you must explicitly acknowledge their capabilities
  /// by
  /// specifying this parameter.
  ///
  /// The only valid values are CAPABILITY_IAM, CAPABILITY_NAMED_IAM,
  /// CAPABILITY_RESOURCE_POLICY, and CAPABILITY_AUTO_EXPAND.
  ///
  /// The following resources require you to specify CAPABILITY_IAM or
  /// CAPABILITY_NAMED_IAM:
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-iam-group.html">AWS::IAM::Group</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-instanceprofile.html">AWS::IAM::InstanceProfile</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-policy.html">AWS::IAM::Policy</a>,
  /// and
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html">AWS::IAM::Role</a>.
  /// If the application contains IAM resources, you can specify either
  /// CAPABILITY_IAM
  /// or CAPABILITY_NAMED_IAM. If the application contains IAM resources
  /// with custom names, you must specify CAPABILITY_NAMED_IAM.
  ///
  /// The following resources require you to specify CAPABILITY_RESOURCE_POLICY:
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-lambda-permission.html">AWS::Lambda::Permission</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-policy.html">AWS::IAM:Policy</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-applicationautoscaling-scalingpolicy.html">AWS::ApplicationAutoScaling::ScalingPolicy</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-s3-policy.html">AWS::S3::BucketPolicy</a>,
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-sqs-policy.html">AWS::SQS::QueuePolicy</a>,
  /// and
  /// <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-sns-policy.html">AWS::SNS::TopicPolicy</a>.
  ///
  /// Applications that contain one or more nested applications require you to
  /// specify
  /// CAPABILITY_AUTO_EXPAND.
  ///
  /// If your application template contains any of the above resources, we
  /// recommend that you review
  /// all permissions associated with the application before deploying. If you
  /// don't specify
  /// this parameter for an application that requires capabilities, the call will
  /// fail.
  final List<Capability> requiredCapabilities;

  /// Whether all of the AWS resources contained in this application are supported
  /// in the region
  /// in which it is being retrieved.
  final bool resourcesSupported;

  /// The semantic version of the application:
  ///
  ///
  /// <a href="https://semver.org/">https://semver.org/</a>
  ///
  final String semanticVersion;

  /// A link to the packaged AWS SAM template of your application.
  final String templateUrl;

  /// A link to the S3 object that contains the ZIP archive of the source code for
  /// this version of your application.
  ///
  /// Maximum size 50 MB
  final String? sourceCodeArchiveUrl;

  /// A link to a public repository for the source code of your application, for
  /// example the URL of a specific GitHub commit.
  final String? sourceCodeUrl;

  Version({
    required this.applicationId,
    required this.creationTime,
    required this.parameterDefinitions,
    required this.requiredCapabilities,
    required this.resourcesSupported,
    required this.semanticVersion,
    required this.templateUrl,
    this.sourceCodeArchiveUrl,
    this.sourceCodeUrl,
  });

  factory Version.fromJson(Map<String, dynamic> json) {
    return Version(
      applicationId: json['applicationId'] as String,
      creationTime: json['creationTime'] as String,
      parameterDefinitions: (json['parameterDefinitions'] as List)
          .whereNotNull()
          .map((e) => ParameterDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      requiredCapabilities: (json['requiredCapabilities'] as List)
          .whereNotNull()
          .map((e) => (e as String).toCapability())
          .toList(),
      resourcesSupported: json['resourcesSupported'] as bool,
      semanticVersion: json['semanticVersion'] as String,
      templateUrl: json['templateUrl'] as String,
      sourceCodeArchiveUrl: json['sourceCodeArchiveUrl'] as String?,
      sourceCodeUrl: json['sourceCodeUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final creationTime = this.creationTime;
    final parameterDefinitions = this.parameterDefinitions;
    final requiredCapabilities = this.requiredCapabilities;
    final resourcesSupported = this.resourcesSupported;
    final semanticVersion = this.semanticVersion;
    final templateUrl = this.templateUrl;
    final sourceCodeArchiveUrl = this.sourceCodeArchiveUrl;
    final sourceCodeUrl = this.sourceCodeUrl;
    return {
      'applicationId': applicationId,
      'creationTime': creationTime,
      'parameterDefinitions': parameterDefinitions,
      'requiredCapabilities':
          requiredCapabilities.map((e) => e.toValue()).toList(),
      'resourcesSupported': resourcesSupported,
      'semanticVersion': semanticVersion,
      'templateUrl': templateUrl,
      if (sourceCodeArchiveUrl != null)
        'sourceCodeArchiveUrl': sourceCodeArchiveUrl,
      if (sourceCodeUrl != null) 'sourceCodeUrl': sourceCodeUrl,
    };
  }
}

/// An application version summary.
class VersionSummary {
  /// The application Amazon Resource Name (ARN).
  final String applicationId;

  /// The date and time this resource was created.
  final String creationTime;

  /// The semantic version of the application:
  ///
  ///
  /// <a href="https://semver.org/">https://semver.org/</a>
  ///
  final String semanticVersion;

  /// A link to a public repository for the source code of your application, for
  /// example the URL of a specific GitHub commit.
  final String? sourceCodeUrl;

  VersionSummary({
    required this.applicationId,
    required this.creationTime,
    required this.semanticVersion,
    this.sourceCodeUrl,
  });

  factory VersionSummary.fromJson(Map<String, dynamic> json) {
    return VersionSummary(
      applicationId: json['applicationId'] as String,
      creationTime: json['creationTime'] as String,
      semanticVersion: json['semanticVersion'] as String,
      sourceCodeUrl: json['sourceCodeUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final creationTime = this.creationTime;
    final semanticVersion = this.semanticVersion;
    final sourceCodeUrl = this.sourceCodeUrl;
    return {
      'applicationId': applicationId,
      'creationTime': creationTime,
      'semanticVersion': semanticVersion,
      if (sourceCodeUrl != null) 'sourceCodeUrl': sourceCodeUrl,
    };
  }
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String? type, String? message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String? type, String? message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'ForbiddenException': (type, message) =>
      ForbiddenException(type: type, message: message),
  'InternalServerErrorException': (type, message) =>
      InternalServerErrorException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
};
